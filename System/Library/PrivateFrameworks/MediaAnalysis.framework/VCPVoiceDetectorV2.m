@implementation VCPVoiceDetectorV2

- (VCPVoiceDetectorV2)init
{
  VCPVoiceDetectorV2 *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VCPVoiceDetectorV2;
  result = -[VCPVoiceDetector init](&v3, sel_init);
  if (result)
    *(_QWORD *)&result->_voiceActivityNew = 0;
  return result;
}

- (void)dealloc
{
  OpaqueAudioComponentInstance *v3;
  objc_super v4;

  v3 = *(OpaqueAudioComponentInstance **)&self->_voiceActivityNew;
  if (v3)
    AudioComponentInstanceDispose(v3);
  v4.receiver = self;
  v4.super_class = (Class)VCPVoiceDetectorV2;
  -[VCPVoiceDetectorV2 dealloc](&v4, sel_dealloc);
}

- (int)setupWithAudioStream:(const AudioStreamBasicDescription *)a3
{
  BOOL *p_voiceActivityNew;
  OpaqueAudioComponentInstance *v5;
  int result;
  OpaqueAudioComponent *Next;
  NSMutableArray **p_musicDetections;
  AudioComponentDescription inDesc;

  p_voiceActivityNew = &self->_voiceActivityNew;
  v5 = *(OpaqueAudioComponentInstance **)&self->_voiceActivityNew;
  if (v5)
  {
    result = AudioUnitReset(v5, 0, 0);
    if (result)
      return result;
    return 0;
  }
  BYTE1(inDesc.componentFlags) = 0;
  HIWORD(inDesc.componentFlags) = 0;
  inDesc.componentFlagsMask = 0;
  strcpy((char *)&inDesc, "xfua2vpelppa");
  Next = AudioComponentFindNext(0, &inDesc);
  if (!Next)
    return -23;
  result = AudioComponentInstanceNew(Next, (AudioComponentInstance *)p_voiceActivityNew);
  if (!result)
  {
    result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 8u, 1u, 0, a3, 0x28u);
    if (!result)
    {
      result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 8u, 2u, 0, a3, 0x28u);
      if (!result)
      {
        result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xEu, 2u, 0, &self->super._sampleBatchSize, 4u);
        if (!result)
        {
          result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA0Au, 0, 0, self->super._model, 8u);
          if (!result)
          {
            result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA1Bu, 0, 0, &kEDLStartWaitTimeSec, 4u);
            if (!result)
            {
              result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA1Cu, 0, 0, &-[VCPVoiceDetectorV2 setupWithAudioStream:]::kEDLInterspeechWaitTimeSec, 4u);
              if (!result)
              {
                result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA1Du, 0, 0, &kEDLSpeechStartAdjustSec, 4u);
                if (!result)
                {
                  result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA1Eu, 0, 0, &kEDLSpeechEndAdjustSec, 4u);
                  if (!result)
                  {
                    result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA1Au, 0, 0, &-[VCPVoiceDetectorV2 setupWithAudioStream:]::kSmoothingWindowLenSec, 4u);
                    if (!result)
                    {
                      result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA1Fu, 0, 0, &-[VCPVoiceDetectorV2 setupWithAudioStream:]::kEDLSpeechFraction, 4u);
                      if (!result)
                      {
                        result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA20u, 0, 0, &-[VCPVoiceDetectorV2 setupWithAudioStream:]::kEDLNonspeechFraction, 4u);
                        if (!result)
                        {
                          result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA16u, 0, 0, &kRealtimeOperationMode, 1u);
                          if (!result)
                          {
                            result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA19u, 0, 0, &kDecoderLatency, 4u);
                            if (!result)
                            {
                              p_musicDetections = &self->super._musicDetections;
                              result = AudioUnitAddPropertyListener(*(AudioUnit *)p_voiceActivityNew, 0xFA21u, (AudioUnitPropertyListenerProc)SpeechStartListener, p_musicDetections);
                              if (!result)
                              {
                                result = AudioUnitAddPropertyListener(*(AudioUnit *)p_voiceActivityNew, 0xFA22u, (AudioUnitPropertyListenerProc)SpeechEndListener, p_musicDetections);
                                if (!result)
                                {
                                  result = AudioUnitInitialize(*(AudioUnit *)p_voiceActivityNew);
                                  if (!result)
                                    return 0;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (int)loadModel
{
  void *v3;
  void *v4;
  NSDictionary *v5;
  NSDictionary *model;

  if (self->super._model)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/Library/Audio/Tunings/Generic/AU/aufx-epv2-mediaanalysis-appl.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithContentsOfURL:", v4);
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  model = self->super._model;
  self->super._model = v5;

  if (self->super._model)
    return 0;
  else
    return -23;
}

- (int)processAudioSamples:(AudioBufferList *)a3 timestamp:(AudioTimeStamp *)a4
{
  int result;
  BOOL *p_voiceActivity;
  CMTime v7;
  double v8;
  UInt32 ioDataSize;
  double outData[5];
  AudioUnitRenderActionFlags ioActionFlags;
  AudioBufferList *ioOutputBufferLists;
  AudioBufferList *inInputBufferLists[2];

  inInputBufferLists[1] = *(AudioBufferList **)MEMORY[0x1E0C80C00];
  ioActionFlags = 512;
  ioOutputBufferLists = a3;
  inInputBufferLists[0] = a3;
  result = AudioUnitProcessMultiple(*(AudioUnit *)&self->_voiceActivityNew, &ioActionFlags, a4, self->super._sampleBatchSize, 1u, (const AudioBufferList **)inInputBufferLists, 1u, &ioOutputBufferLists);
  if (!result)
  {
    if (LOBYTE(self->super._musicDetections) == BYTE4(self->super._trackStart.epoch))
    {
      return 0;
    }
    else
    {
      ioDataSize = 40;
      result = AudioUnitGetProperty(*(AudioUnit *)&self->_voiceActivityNew, 8u, 2u, 0, outData, &ioDataSize);
      if (!result)
      {
        v8 = 0.0;
        ioDataSize = 8;
        result = AudioUnitGetProperty(*(AudioUnit *)&self->_voiceActivityNew, 0xFA26u, 0, 0, &v8, &ioDataSize);
        if (!result)
        {
          memset(&v7, 0, sizeof(v7));
          CMTimeMake(&v7, (uint64_t)(v8 * outData[0]), (int)outData[0]);
          p_voiceActivity = &self->super._voiceActivity;
          if (LOBYTE(self->super._musicDetections))
          {
            *(_OWORD *)p_voiceActivity = *(_OWORD *)&v7.value;
            *(_QWORD *)&self->super._voiceStart.timescale = v7.epoch;
          }
          else
          {
            -[VCPVoiceDetector addDetectionFromTime:toTime:result:](self, "addDetectionFromTime:toTime:result:", p_voiceActivity, &v7, self->super._voiceStart.epoch);
          }
          result = 0;
          BYTE4(self->super._trackStart.epoch) = self->super._musicDetections;
        }
      }
    }
  }
  return result;
}

- (int)finalizeAnalysisAtTime:(id *)a3
{
  if (BYTE4(self->super._trackStart.epoch))
    -[VCPVoiceDetector addDetectionFromTime:toTime:result:](self, "addDetectionFromTime:toTime:result:", &self->super._voiceActivity, a3, self->super._voiceStart.epoch);
  return 0;
}

- (id)results
{
  int64_t epoch;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  epoch = self->super._voiceStart.epoch;
  if (epoch)
  {
    v5 = CFSTR("VoiceResults");
    v6[0] = epoch;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
