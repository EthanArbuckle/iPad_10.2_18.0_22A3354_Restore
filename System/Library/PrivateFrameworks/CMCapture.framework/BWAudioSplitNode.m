@implementation BWAudioSplitNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWAudioSplitNode)initWithInputChannelLayoutTag:(unsigned int)a3 output1ChannelLayoutTag:(unsigned int)a4 output2ChannelLayoutTag:(unsigned int)a5
{
  BWAudioSplitNode *v8;
  BWAudioSplitNode *v9;
  BWNodeInput *v10;
  BWNodeInput *v11;
  BWNodeOutput *v12;
  BWNodeOutput *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BWAudioSplitNode;
  v8 = -[BWNode init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_splitAtIndex = (unsigned __int16)a4;
    v8->_inputNumberOfChannels = (unsigned __int16)a3;
    v8->_inputChannelLayoutTag = a3;
    v8->_output1ChannelLayoutTag = a4;
    v8->_output2ChannelLayoutTag = a5;
    if (v8->_inputNumberOfChannels == (unsigned __int16)a5 + (unsigned __int16)a4
      && (v10 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1936684398, v8)) != 0)
    {
      v11 = v10;
      -[BWNode addInput:](v9, "addInput:", v10);
      v9->_input = v11;

      v12 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1936684398, v9);
      -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v12, "setIndexOfInputWhichDrivesThisOutput:", 0);
      -[BWNode addOutput:](v9, "addOutput:", v12);
      v9->_output1 = v12;

      v13 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1936684398, v9);
      -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v13, "setIndexOfInputWhichDrivesThisOutput:", 0);
      -[BWNode addOutput:](v9, "addOutput:", v13);
      v9->_output2 = v13;

      -[BWNode setSupportsLiveReconfiguration:](v9, "setSupportsLiveReconfiguration:", 0);
    }
    else if (FigSignalErrorAt())
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BWAudioSplitNode;
  -[BWNode dealloc](&v2, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Demuxer");
}

- (id)nodeSubType
{
  return CFSTR("AudioSplitNode");
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (self->_input)
  {
    -[BWNodeOutput makeConfiguredFormatLive](self->_output1, "makeConfiguredFormatLive", a3, a4, a5);
    -[BWNodeOutput makeConfiguredFormatLive](self->_output2, "makeConfiguredFormatLive");
  }
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  uint64_t splitAtIndex;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int output2ChannelLayoutTag;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unsigned int output1ChannelLayoutTag;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[7];

  v24[5] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    splitAtIndex = self->_splitAtIndex;
    v10 = self->_inputNumberOfChannels - splitAtIndex;
    v17 = 0;
    v19 = 0;
    v18 = 0;
    v20 = 0;
    output1ChannelLayoutTag = self->_output1ChannelLayoutTag;
    v8 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &output1ChannelLayoutTag, 32, a5);
    v24[0] = &unk_1E49F9270;
    v23[0] = 0x1E4930B38;
    v23[1] = 0x1E4930B78;
    v24[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", splitAtIndex);
    v24[2] = MEMORY[0x1E0C9AAA0];
    v23[2] = 0x1E4930BF8;
    v23[3] = 0x1E4930BD8;
    v23[4] = 0x1E4930CB8;
    v24[3] = MEMORY[0x1E0C9AAB0];
    v24[4] = v8;
    -[BWNodeOutput setFormat:](self->_output1, "setFormat:", +[BWAudioFormat formatForAVAudioSettings:inputFormat:](BWAudioFormat, "formatForAVAudioSettings:inputFormat:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5), a3));
    v13 = 0;
    v12 = 0;
    v15 = 0;
    v14 = 0;
    output2ChannelLayoutTag = self->_output2ChannelLayoutTag;
    v9 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &output2ChannelLayoutTag, 32);
    v22[0] = &unk_1E49F9270;
    v21[0] = 0x1E4930B38;
    v21[1] = 0x1E4930B78;
    v22[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
    v22[2] = MEMORY[0x1E0C9AAA0];
    v21[2] = 0x1E4930BF8;
    v21[3] = 0x1E4930BD8;
    v21[4] = 0x1E4930CB8;
    v22[3] = MEMORY[0x1E0C9AAB0];
    v22[4] = v9;
    -[BWNodeOutput setFormat:](self->_output2, "setFormat:", +[BWAudioFormat formatForAVAudioSettings:inputFormat:](BWAudioFormat, "formatForAVAudioSettings:inputFormat:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5), a3));
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (uint64_t)_createSplitAndInterleaveFromSampleBuffer:(const opaqueCMFormatDescription *)a3 outputFormat1:(CMSampleBufferRef *)a4 outputBuffer1:(const opaqueCMFormatDescription *)a5 outputFormat2:(CMSampleBufferRef *)a6 outputBuffer2:
{
  uint64_t SampleTimingInfo;
  const opaqueCMFormatDescription *v12;
  const AudioStreamBasicDescription *StreamBasicDescription;
  uint64_t mChannelsPerFrame;
  size_t mBytesPerFrame;
  const AudioStreamBasicDescription *v16;
  size_t v17;
  uint64_t v18;
  const AudioStreamBasicDescription *v19;
  uint64_t v20;
  size_t v21;
  AudioBufferList *v22;
  uint64_t AudioBufferListWithRetainedBlockBuffer;
  CMItemCount NumSamples;
  const __CFAllocator *v25;
  uint64_t DataPointer;
  uint64_t v27;
  uint64_t v28;
  void **p_mData;
  uint64_t v30;
  size_t v31;
  char *v32;
  void **v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const opaqueCMFormatDescription *formatDescription;
  const __CFAllocator *allocator;
  CMSampleBufferRef *v45;
  const opaqueCMFormatDescription *v46;
  CMSampleBufferRef *v47;
  AudioBufferList *v48;
  char *v49;
  char *dataPointerOut;
  CMSampleTimingInfo timingInfoOut;
  size_t v52;
  size_t sampleSizeArray;
  CMBlockBufferRef v54;
  CMBlockBufferRef v55;
  CMBlockBufferRef blockBufferOut;

  if (!a1)
    return 0;
  v55 = 0;
  blockBufferOut = 0;
  sampleSizeArray = 0;
  v54 = 0;
  v52 = 0;
  memset(&timingInfoOut, 0, sizeof(timingInfoOut));
  if (!sbuf || !a3 || !a4 || !a5 || !a6)
  {
    fig_log_get_emitter();
LABEL_42:
    FigDebugAssert3();
    v41 = 0;
    goto LABEL_43;
  }
  SampleTimingInfo = CMSampleBufferGetSampleTimingInfo(sbuf, 0, &timingInfoOut);
  if ((_DWORD)SampleTimingInfo)
  {
    v41 = SampleTimingInfo;
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_43:
    v22 = 0;
    goto LABEL_31;
  }
  v12 = CMSampleBufferGetFormatDescription(sbuf);
  if (!v12)
    goto LABEL_41;
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v12);
  if (!StreamBasicDescription)
    goto LABEL_41;
  mBytesPerFrame = StreamBasicDescription->mBytesPerFrame;
  mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
  v16 = CMAudioFormatDescriptionGetStreamBasicDescription(a3);
  if (!v16
    || (v47 = a4,
        v17 = v16->mBytesPerFrame,
        v18 = v16->mChannelsPerFrame,
        (v19 = CMAudioFormatDescriptionGetStreamBasicDescription(a5)) == 0)
    || (v46 = a3, v20 = v19->mChannelsPerFrame, v20 + v18 != mChannelsPerFrame))
  {
LABEL_41:
    fig_log_get_emitter();
    goto LABEL_42;
  }
  v45 = a6;
  v21 = v19->mBytesPerFrame;
  v22 = (AudioBufferList *)malloc_type_malloc((16 * mChannelsPerFrame) | 8, 0xA126E253uLL);
  if (!v22)
    goto LABEL_46;
  AudioBufferListWithRetainedBlockBuffer = CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(sbuf, 0, v22, (16 * mChannelsPerFrame) | 8, 0, 0, 1u, &blockBufferOut);
  if ((_DWORD)AudioBufferListWithRetainedBlockBuffer)
  {
LABEL_47:
    v41 = AudioBufferListWithRetainedBlockBuffer;
    fig_log_get_emitter();
LABEL_52:
    FigDebugAssert3();
    goto LABEL_31;
  }
  if (v22->mNumberBuffers != (_DWORD)mChannelsPerFrame)
  {
LABEL_46:
    fig_log_get_emitter();
    FigDebugAssert3();
    v41 = 0;
    goto LABEL_31;
  }
  NumSamples = CMSampleBufferGetNumSamples(sbuf);
  v52 = v21;
  sampleSizeArray = v17;
  v25 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  AudioBufferListWithRetainedBlockBuffer = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, NumSamples * v17, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, NumSamples * v17, 1u, &v55);
  if ((_DWORD)AudioBufferListWithRetainedBlockBuffer)
    goto LABEL_47;
  AudioBufferListWithRetainedBlockBuffer = CMBlockBufferCreateWithMemoryBlock(v25, 0, NumSamples * v21, v25, 0, 0, NumSamples * v21, 1u, &v54);
  if ((_DWORD)AudioBufferListWithRetainedBlockBuffer)
    goto LABEL_47;
  v49 = 0;
  dataPointerOut = 0;
  DataPointer = CMBlockBufferGetDataPointer(v55, 0, 0, 0, &dataPointerOut);
  if ((_DWORD)DataPointer)
  {
    v41 = DataPointer;
    fig_log_get_emitter();
    goto LABEL_52;
  }
  v27 = CMBlockBufferGetDataPointer(v54, 0, 0, 0, &v49);
  if ((_DWORD)v27)
  {
    v41 = v27;
    fig_log_get_emitter();
    goto LABEL_52;
  }
  formatDescription = a5;
  allocator = v25;
  v48 = v22;
  if (NumSamples)
  {
    v28 = 0;
    p_mData = &v22->mBuffers[0].mData;
    v30 = (uint64_t)&v22->mBuffers[v18].mData;
    do
    {
      v31 = v28 * mBytesPerFrame;
      if ((_DWORD)v18)
      {
        v32 = dataPointerOut;
        v33 = p_mData;
        v34 = v18;
        do
        {
          v35 = (char *)*v33;
          v33 += 2;
          memcpy(v32, &v35[v31], mBytesPerFrame);
          v32 = &dataPointerOut[mBytesPerFrame];
          dataPointerOut += mBytesPerFrame;
          --v34;
        }
        while (v34);
      }
      if ((_DWORD)v20)
      {
        v36 = v49;
        v37 = (uint64_t *)v30;
        v38 = v20;
        do
        {
          v39 = *v37;
          v37 += 2;
          memcpy(v36, (const void *)(v39 + v31), mBytesPerFrame);
          v36 = &v49[mBytesPerFrame];
          v49 += mBytesPerFrame;
          --v38;
        }
        while (v38);
      }
      ++v28;
    }
    while (v28 != NumSamples);
  }
  v40 = CMSampleBufferCreate(allocator, v55, 1u, 0, 0, v46, NumSamples, 1, &timingInfoOut, 1, &sampleSizeArray, v47);
  if ((_DWORD)v40)
  {
    v41 = v40;
    fig_log_get_emitter();
    FigDebugAssert3();
    v22 = v48;
    goto LABEL_31;
  }
  v41 = CMSampleBufferCreate(allocator, v54, 1u, 0, 0, formatDescription, NumSamples, 1, &timingInfoOut, 1, &v52, v45);
  v22 = v48;
  if ((_DWORD)v41)
  {
    fig_log_get_emitter();
    goto LABEL_52;
  }
LABEL_31:
  if (blockBufferOut)
    CFRelease(blockBufferOut);
  if (v55)
    CFRelease(v55);
  if (v54)
    CFRelease(v54);
  free(v22);
  return v41;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  CFTypeRef v5;
  CFTypeRef cf;

  v5 = 0;
  cf = 0;
  if (-[BWAudioSplitNode _createSplitAndInterleaveFromSampleBuffer:outputFormat1:outputBuffer1:outputFormat2:outputBuffer2:]((uint64_t)self, a3, -[BWFormat formatDescription](-[BWNodeOutput format](self->_output1, "format", a3, a4), "formatDescription"), (CMSampleBufferRef *)&cf, -[BWFormat formatDescription](-[BWNodeOutput format](self->_output2, "format"), "formatDescription"), (CMSampleBufferRef *)&v5))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    -[BWNodeOutput emitSampleBuffer:](self->_output1, "emitSampleBuffer:", cf);
    -[BWNodeOutput emitSampleBuffer:](self->_output2, "emitSampleBuffer:", v5);
  }
  if (cf)
    CFRelease(cf);
  if (v5)
    CFRelease(v5);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  -[BWNodeOutput markEndOfLiveOutput](self->_output1, "markEndOfLiveOutput", a3);
  -[BWNodeOutput markEndOfLiveOutput](self->_output2, "markEndOfLiveOutput");
}

@end
