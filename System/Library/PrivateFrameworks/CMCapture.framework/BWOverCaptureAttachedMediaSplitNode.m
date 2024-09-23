@implementation BWOverCaptureAttachedMediaSplitNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWOverCaptureAttachedMediaSplitNode)initWithBackPressureExtraRetainBufferCount:(int)a3
{
  uint64_t v5;
  BWOverCaptureAttachedMediaSplitNode *v6;
  BWOverCaptureAttachedMediaSplitNode *v7;
  id v8;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("PrimaryFormat");
  v11[1] = CFSTR("SynchronizedSlaveFrame");
  v5 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v10.receiver = self;
  v10.super_class = (Class)BWOverCaptureAttachedMediaSplitNode;
  v6 = -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:attachedMediaToPropagateToPrimaryOutput:](&v10, sel_initWithAttachedMediaKeys_attachedMediaToPropagateToPrimaryOutput_, v5, MEMORY[0x1E0C9AA60]);
  v7 = v6;
  if (v6)
  {
    v6->_primaryFrameOutput = (BWNodeOutput *)-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v6, "outputs"), "objectAtIndexedSubscript:", 0);
    v7->_synchronizedSlaveFrameOutput = (BWNodeOutput *)-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v7, "outputs"), "objectAtIndexedSubscript:", 1);
    -[BWNodeInput setRetainedBufferCount:](v7->super.super.super._input, "setRetainedBufferCount:", -[BWNodeInput retainedBufferCount](v7->super.super.super._input, "retainedBufferCount") + a3);
    v8 = -[BWNodeInput mediaConfigurationForAttachedMediaKey:](v7->super.super.super._input, "mediaConfigurationForAttachedMediaKey:", CFSTR("SynchronizedSlaveFrame"));
    objc_msgSend(v8, "setRetainedBufferCount:", objc_msgSend(v8, "retainedBufferCount") + a3);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BWOverCaptureAttachedMediaSplitNode;
  -[BWAttachedMediaSplitNode dealloc](&v2, sel_dealloc);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  uint64_t AttachedMedia;
  opaqueCMSampleBuffer *v9;
  __int128 v10;
  __int128 v11;
  OSStatus SampleTimingInfoArray;
  OSStatus v13;
  OSStatus v14;
  OSStatus v15;
  OSStatus v16;
  uint64_t v17;
  objc_super v18;
  CMTime time1;
  CMTime time2;
  CMSampleTimingInfo timingArrayOut;

  -[BWOverCaptureAttachedMediaSplitNode _updateSynchronizedSlaveFrameEnabledWithSampleBuffer:](self, a3);
  if (BWSampleBufferIsMarkerBuffer(a3) && CMGetAttachment(a3, CFSTR("IrisMovieRequest"), 0))
  {
    -[BWOverCaptureAttachedMediaSplitNode _handleIrisMovieRequestForInput:sbuf:](self, (uint64_t)a4, (uint64_t)a3);
    return;
  }
  AttachedMedia = BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("SynchronizedSlaveFrame"));
  if (AttachedMedia)
  {
    v9 = (opaqueCMSampleBuffer *)AttachedMedia;
    v10 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
    *(_OWORD *)&timingArrayOut.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
    *(_OWORD *)&timingArrayOut.decodeTimeStamp.value = v10;
    timingArrayOut.decodeTimeStamp.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
    v11 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
    *(_OWORD *)&timingArrayOut.duration.value = *MEMORY[0x1E0CA2E90];
    *(_OWORD *)&timingArrayOut.duration.epoch = v11;
    SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(a3, 1, &timingArrayOut, 0);
    if (SampleTimingInfoArray)
    {
      v14 = SampleTimingInfoArray;
      fig_log_get_emitter();
      v17 = v4;
      v16 = v14;
      goto LABEL_12;
    }
    CMSampleBufferGetPresentationTimeStamp(&time2, v9);
    time1 = timingArrayOut.presentationTimeStamp;
    if (CMTimeCompare(&time1, &time2))
    {
      time1.value = 0;
      v13 = CMSampleBufferCreateCopyWithNewTiming((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v9, 1, &timingArrayOut, (CMSampleBufferRef *)&time1);
      if (!v13)
      {
        BWSampleBufferSetAttachedMedia(a3, (uint64_t)CFSTR("SynchronizedSlaveFrame"), time1.value);
        CFRelease((CFTypeRef)time1.value);
        goto LABEL_9;
      }
      v15 = v13;
      fig_log_get_emitter();
      v17 = v4;
      v16 = v15;
LABEL_12:
      FigDebugAssert3();
    }
  }
LABEL_9:
  v18.receiver = self;
  v18.super_class = (Class)BWOverCaptureAttachedMediaSplitNode;
  -[BWAttachedMediaSplitNode renderSampleBuffer:forInput:](&v18, sel_renderSampleBuffer_forInput_, a3, a4, v16, v17);
}

- (id)_updateSynchronizedSlaveFrameEnabledWithSampleBuffer:(id)result
{
  void *v3;
  objc_super v4;

  if (result)
  {
    v3 = result;
    result = (id)BWSampleBufferIsMarkerBuffer(a2);
    if ((_DWORD)result)
    {
      result = (id)CMGetAttachment(a2, CFSTR("RecordingSettings"), 0);
      if (result)
      {
        v4.receiver = v3;
        v4.super_class = (Class)BWOverCaptureAttachedMediaSplitNode;
        return objc_msgSendSuper2(&v4, sel_setOutputRenderingEnabled_forAttachedMediaKey_, objc_msgSend(result, "spatialOverCaptureMovieURL") != 0, CFSTR("SynchronizedSlaveFrame"));
      }
    }
  }
  return result;
}

- (id)_handleIrisMovieRequestForInput:(uint64_t)a3 sbuf:
{
  void *v5;
  objc_super v6;

  if (result)
  {
    v5 = result;
    if (objc_msgSend((id)objc_msgSend(result, "outputs"), "count") != 2)
      -[BWOverCaptureAttachedMediaSplitNode _handleIrisMovieRequestForInput:sbuf:].cold.1();
    if (objc_msgSend(v5, "isOutputRenderingEnabledForAttachedMediaKey:", CFSTR("SynchronizedSlaveFrame")))
    {
      v6.receiver = v5;
      v6.super_class = (Class)BWOverCaptureAttachedMediaSplitNode;
      return objc_msgSendSuper2(&v6, sel_renderSampleBuffer_forInput_, a3, a2);
    }
    else
    {
      return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "outputs"), "objectAtIndexedSubscript:", 0), "emitSampleBuffer:", a3);
    }
  }
  return result;
}

- (BWNodeOutput)primaryFrameOutput
{
  return self->_primaryFrameOutput;
}

- (BWNodeOutput)synchronizedSlaveFrameOutput
{
  return self->_synchronizedSlaveFrameOutput;
}

- (void)_handleIrisMovieRequestForInput:sbuf:.cold.1()
{
  __assert_rtn("-[BWOverCaptureAttachedMediaSplitNode _handleIrisMovieRequestForInput:sbuf:]", "BWOverCaptureAttachedMediaSplitNode.m", 123, "self.outputs.count == 2");
}

@end
