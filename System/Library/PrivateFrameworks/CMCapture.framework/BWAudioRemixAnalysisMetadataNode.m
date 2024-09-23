@implementation BWAudioRemixAnalysisMetadataNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWAudioRemixAnalysisMetadataNode)init
{
  char *v2;
  BWAudioRemixAnalysisMetadataNode *v3;
  _QWORD *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  BWNodeInput *v8;
  BWNodeInput *v9;
  BWNodeOutput *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFArray *v13;
  BWNodeOutput *v14;
  BWNodeOutput *v15;
  AudioRemixSessionManager *v16;
  objc_super v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)BWAudioRemixAnalysisMetadataNode;
  v2 = -[BWNode init](&v18, sel_init);
  v3 = (BWAudioRemixAnalysisMetadataNode *)v2;
  if (v2)
  {
    v4 = v2 + 168;
    *((_QWORD *)v2 + 21) = 0;
    *((_QWORD *)v2 + 12) = 0;
    v2[104] = 0;
    *((_QWORD *)v2 + 14) = 0;
    v5 = MEMORY[0x1E0CA2E18];
    v6 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v2 + 120) = *MEMORY[0x1E0CA2E18];
    v7 = *(_QWORD *)(v5 + 16);
    *((_QWORD *)v2 + 17) = v7;
    *((_OWORD *)v2 + 9) = v6;
    *((_QWORD *)v2 + 20) = v7;
    v8 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1936684398, v2);
    if (v8)
    {
      v9 = v8;
      -[BWNodeInputMediaConfiguration setPassthroughMode:](-[BWNodeInput primaryMediaConfiguration](v8, "primaryMediaConfiguration"), "setPassthroughMode:", 1);
      -[BWNodeInput setName:](v9, "setName:", CFSTR("AudioRemixAnalysisPassthroughInput"));
      -[BWNode addInput:](v3, "addInput:", v9);

      v10 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1936684398, v3);
      -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v10, "setIndexOfInputWhichDrivesThisOutput:", 0);
      -[BWNodeOutputMediaConfiguration setPassthroughMode:](-[BWNodeOutput primaryMediaConfiguration](v10, "primaryMediaConfiguration"), "setPassthroughMode:", 1);
      -[BWNodeOutput setName:](v10, "setName:", CFSTR("AudioRemixAnalysisPassthroughOutput"));
      -[BWNode addOutput:](v3, "addOutput:", v10);

      v3->_metadataOutput = 0;
      v11 = *MEMORY[0x1E0CA2518];
      v22[0] = *MEMORY[0x1E0CA2528];
      v22[1] = v11;
      v12 = *MEMORY[0x1E0CA2440];
      v23[0] = CFSTR("mdta/com.apple.quicktime.cinematic-audio");
      v23[1] = v12;
      v22[2] = *MEMORY[0x1E0CA2538];
      v20 = *MEMORY[0x1E0CA2540];
      v21 = *MEMORY[0x1E0C9AE40];
      v23[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v19 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
      v13 = (const __CFArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
      if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x6D656278u, v13, &v3->_audioMetadataFormatDescription)|| (v14 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1835365473, v3)) == 0)
      {
        FigDebugAssert3();
LABEL_10:

        return 0;
      }
      v15 = v14;
      -[BWNodeOutput setName:](v14, "setName:", CFSTR("AudioRemixAnalysisMetadataOutput"));
      -[BWNodeOutput setFormat:](v15, "setFormat:", +[BWMetadataFormat formatWithMetadataFormatDescription:](BWMetadataFormat, "formatWithMetadataFormatDescription:", *v4));
      -[BWNode addOutput:](v3, "addOutput:", v15);
      v3->_metadataOutput = v15;

      v16 = -[AudioRemixSessionManager initWithNodeMetadataOutput:]([AudioRemixSessionManager alloc], "initWithNodeMetadataOutput:", v3->_metadataOutput);
      v3->_movieRemixSessionManager = v16;
      if (v16)
        return v3;
    }
    FigSignalErrorAt();
    goto LABEL_10;
  }
  return v3;
}

- (void)dealloc
{
  opaqueCMFormatDescription *audioMetadataFormatDescription;
  objc_super v4;

  audioMetadataFormatDescription = self->_audioMetadataFormatDescription;
  if (audioMetadataFormatDescription)
    CFRelease(audioMetadataFormatDescription);
  v4.receiver = self;
  v4.super_class = (Class)BWAudioRemixAnalysisMetadataNode;
  -[BWNode dealloc](&v4, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("AudioRemixAnalysisMetadata");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  const AudioStreamBasicDescription *StreamBasicDescription;
  AudioRemixSessionManager *movieRemixSessionManager;
  double mSampleRate;
  double v10;
  UInt32 mChannelsPerFrame;

  -[BWNodeOutput makeConfiguredFormatLive](self->super._output, "makeConfiguredFormatLive", a3, a4, a5);
  -[BWNodeOutput makeConfiguredFormatLive](self->_metadataOutput, "makeConfiguredFormatLive");
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription((CMAudioFormatDescriptionRef)objc_msgSend(a4, "audioFormatDescription"));
  movieRemixSessionManager = self->_movieRemixSessionManager;
  if (movieRemixSessionManager)
  {
    mSampleRate = StreamBasicDescription->mSampleRate;
    -[AudioRemixSessionManager sampleRate](movieRemixSessionManager, "sampleRate");
    if (mSampleRate != v10
      || (mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame,
          mChannelsPerFrame != -[AudioRemixSessionManager channelCount](self->_movieRemixSessionManager, "channelCount")))
    {
      -[AudioRemixSessionManager setFormatSampleRate:andChannelCount:](self->_movieRemixSessionManager, "setFormatSampleRate:andChannelCount:", StreamBasicDescription->mChannelsPerFrame, StreamBasicDescription->mSampleRate);
      -[AudioRemixSessionManager startNewSessionBlocking](self->_movieRemixSessionManager, "startNewSessionBlocking");
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_currentPTS;
  AudioRemixSessionManager *movieRemixSessionManager;
  uint64_t v6;
  __int128 v7;
  int64_t v8;
  __int128 v9;
  int64_t v10;
  __int128 v11;
  int64_t epoch;

  p_currentPTS = &self->_currentPTS;
  if ((self->_currentPTS.flags & 1) != 0)
  {
    movieRemixSessionManager = self->_movieRemixSessionManager;
    v11 = *(_OWORD *)&self->_startRecordingPTS.value;
    epoch = self->_startRecordingPTS.epoch;
    v9 = *(_OWORD *)&p_currentPTS->value;
    v10 = p_currentPTS->epoch;
    -[AudioRemixSessionManager finishAndGetResultsBlockingWithStartingPTS:andEndingPTS:](movieRemixSessionManager, "finishAndGetResultsBlockingWithStartingPTS:andEndingPTS:", &v11, &v9);
    v6 = MEMORY[0x1E0CA2E18];
    v7 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)&self->_startRecordingPTS.value = *MEMORY[0x1E0CA2E18];
    v8 = *(_QWORD *)(v6 + 16);
    self->_startRecordingPTS.epoch = v8;
    *(_OWORD *)&p_currentPTS->value = v7;
    p_currentPTS->epoch = v8;
  }
  -[AudioRemixSessionManager abortSessionIfNeeded](self->_movieRemixSessionManager, "abortSessionIfNeeded", a3);
  -[AudioRemixSessionManager setFormatSampleRate:andChannelCount:](self->_movieRemixSessionManager, "setFormatSampleRate:andChannelCount:", 0, 0.0);
  -[BWNodeOutput markEndOfLiveOutput](self->super._output, "markEndOfLiveOutput");
  -[BWNodeOutput markEndOfLiveOutput](self->_metadataOutput, "markEndOfLiveOutput");
}

- (void)_emitCopyOfMarkerBuffer:(void *)a3 onOutput:(int)a4 isStartMarkerBuffer:
{
  uint64_t *v8;
  uint64_t v9;
  CMTime v10;
  CMTime v11;
  CMSampleBufferRef sampleBufferOut;

  if (a1 && a3)
  {
    sampleBufferOut = 0;
    memset(&v11, 0, sizeof(v11));
    CMSampleBufferGetPresentationTimeStamp(&v11, sbuf);
    if (CMSampleBufferCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], sbuf, &sampleBufferOut))
    {
      if (*(void **)(a1 + 112) == a3)
        v8 = &BWDroppedSampleReasonCinematicVideoMetadataFailure;
      else
        v8 = (uint64_t *)BWDroppedSampleReasonCinematicAudioMetadataFailure;
      v9 = *v8;
      v10 = v11;
      objc_msgSend(a3, "emitDroppedSample:", +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", v9, &v10));
    }
    else
    {
      if (a4 && *(void **)(a1 + 112) == a3)
        CMSetAttachment(sampleBufferOut, CFSTR("TrackFormatDescription"), *(CFTypeRef *)(a1 + 168), 1u);
      objc_msgSend(a3, "emitSampleBuffer:", sampleBufferOut);
      if (sampleBufferOut)
        CFRelease(sampleBufferOut);
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  CFTypeRef v7;
  int v8;
  int v9;
  const opaqueCMFormatDescription *FormatDescription;
  const AudioStreamBasicDescription *StreamBasicDescription;
  AudioStreamBasicDescription *v12;
  void *v13;
  CMItemCount NumSamples;
  OSStatus v15;
  int v16;
  const opaqueCMFormatDescription *v17;
  int v18;
  BOOL v19;
  AudioRemixSessionManager *movieRemixSessionManager;
  uint64_t v21;
  __int128 v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  CMTime v26;
  __int128 v27;
  int64_t epoch;
  CMTime v29;

  memset(&v29, 0, sizeof(v29));
  CMSampleBufferGetPresentationTimeStamp(&v29, a3);
  self->_currentPTS = ($95D729B680665BEAEFA1D6FCA8238556)v29;
  if (!BWSampleBufferIsMarkerBuffer(a3))
  {
    if (!self->_shouldSendData
      || !-[AudioRemixSessionManager sessionReady](self->_movieRemixSessionManager, "sessionReady"))
    {
      goto LABEL_15;
    }
    if (a3)
    {
      FormatDescription = CMSampleBufferGetFormatDescription(a3);
      StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
      if (!FormatDescription)
      {
        v16 = FigSignalErrorAt();
        v17 = 0;
        v12 = 0;
        goto LABEL_12;
      }
      v12 = (AudioStreamBasicDescription *)StreamBasicDescription;
      if (StreamBasicDescription)
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89A58]), "initWithLayoutTag:", StreamBasicDescription->mChannelsPerFrame | 0x930000);
        v12 = (AudioStreamBasicDescription *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initWithStreamDescription:channelLayout:", v12, v13);

        NumSamples = CMSampleBufferGetNumSamples(a3);
        FormatDescription = (const opaqueCMFormatDescription *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AC0]), "initWithPCMFormat:frameCapacity:", v12, NumSamples);
        -[opaqueCMFormatDescription setFrameLength:](FormatDescription, "setFrameLength:", NumSamples);
        v15 = CMSampleBufferCopyPCMDataIntoAudioBufferList(a3, 0, NumSamples, (AudioBufferList *)-[opaqueCMFormatDescription mutableAudioBufferList](FormatDescription, "mutableAudioBufferList"));
        v16 = v15;
        if (v15)
        {
          v25 = v4;
          LODWORD(v24) = v15;
          FigDebugAssert3();
          v17 = 0;
        }
        else
        {
          v17 = FormatDescription;
        }
        goto LABEL_12;
      }
      v16 = FigSignalErrorAt();
      v17 = 0;
    }
    else
    {
      v16 = FigSignalErrorAt();
      v17 = 0;
      v12 = 0;
    }
    FormatDescription = 0;
LABEL_12:

    if (v16)
    {
      v25 = v4;
      LODWORD(v24) = v16;
      FigDebugAssert3();
    }
    else if (v17)
    {
      -[AudioRemixSessionManager submitAudioBuffer:](self->_movieRemixSessionManager, "submitAudioBuffer:", v17);

    }
    else
    {
      FigSignalErrorAt();
    }
    goto LABEL_15;
  }
  v7 = CMGetAttachment(a3, CFSTR("FileWriterAction"), 0);
  v8 = CFEqual(v7, CFSTR("Start"));
  v9 = CFEqual(v7, CFSTR("Stop"));
  if (v7)
  {
    if (v8)
    {
      self->_startRecordingPTS = ($95D729B680665BEAEFA1D6FCA8238556)v29;
LABEL_17:
      v19 = 1;
LABEL_18:
      self->_shouldSendData = v19;
      goto LABEL_19;
    }
    v18 = v9;
    if (CFEqual(v7, CFSTR("Resume")))
      goto LABEL_17;
    if (!v18)
    {
      if (!CFEqual(v7, CFSTR("Terminate")) && !CFEqual(v7, CFSTR("Pause")))
        goto LABEL_19;
      v19 = 0;
      goto LABEL_18;
    }
    self->_shouldSendData = 0;
    v26 = v29;
    movieRemixSessionManager = self->_movieRemixSessionManager;
    v27 = *(_OWORD *)&self->_startRecordingPTS.value;
    epoch = self->_startRecordingPTS.epoch;
    -[AudioRemixSessionManager finishAndGetResultsBlockingWithStartingPTS:andEndingPTS:](movieRemixSessionManager, "finishAndGetResultsBlockingWithStartingPTS:andEndingPTS:", &v27, &v26);
    v21 = MEMORY[0x1E0CA2E18];
    v22 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)&self->_startRecordingPTS.value = *MEMORY[0x1E0CA2E18];
    v23 = *(_QWORD *)(v21 + 16);
    self->_startRecordingPTS.epoch = v23;
    *(_OWORD *)&self->_currentPTS.value = v22;
    self->_currentPTS.epoch = v23;
    if (!-[AudioRemixSessionManager startNewSessionBlocking](self->_movieRemixSessionManager, "startNewSessionBlocking"))goto LABEL_19;
LABEL_15:
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, v24, v25);
    return;
  }
LABEL_19:
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
  -[BWAudioRemixAnalysisMetadataNode _emitCopyOfMarkerBuffer:onOutput:isStartMarkerBuffer:]((uint64_t)self, a3, self->_metadataOutput, v8 != 0);
}

- (BWNodeOutput)metadataOutput
{
  return self->_metadataOutput;
}

@end
