@implementation AVAsynchronousVideoCompositionRequest

- (void)_willDeallocOrFinalize
{
  AVAsynchronousVideoCompositionRequestInternal *internal;
  id v4;
  OpaqueFigVideoCompositorFrame *v5;
  AVAsynchronousVideoCompositionRequestInternal *v6;

  internal = self->_internal;
  if (internal)
  {
    if (!-[AVAsynchronousVideoCompositionRequestInternal isFinished](internal, "isFinished"))
    {
      NSLog(&CFSTR("unfinished AVAsynchronousVideoCompositionRequest deallocated - should have called finishWithComposedVideoFr"
                   "ame:, finishWithError: or finishCancelledRequest").isa);
      v4 = -[AVWeakReference referencedObject](-[AVAsynchronousVideoCompositionRequestInternal session](self->_internal, "session"), "referencedObject");
      v5 = -[AVAsynchronousVideoCompositionRequestInternal compositionFrame](self->_internal, "compositionFrame");
      objc_msgSend(v4, "compositionFrame:didFinishWithError:", v5, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AVFoundationErrorDomain"), -11841, 0));
    }
    v6 = self->_internal;
    if (v6)
      CFRelease(v6);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[AVAsynchronousVideoCompositionRequest _willDeallocOrFinalize](self, "_willDeallocOrFinalize");

  v3.receiver = self;
  v3.super_class = (Class)AVAsynchronousVideoCompositionRequest;
  -[AVAsynchronousVideoCompositionRequest dealloc](&v3, sel_dealloc);
}

- (AVVideoCompositionRenderContext)renderContext
{
  return -[AVAsynchronousVideoCompositionRequestInternal renderContext](self->_internal, "renderContext");
}

- (CMTime)compositionTime
{
  CMTime *result;

  result = (CMTime *)self->_internal;
  if (result)
    return (CMTime *)-[CMTime compositionTime](result, "compositionTime");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (NSArray)sourceTrackIDs
{
  return -[AVAsynchronousVideoCompositionRequestInternal sourceTrackIDsInClientOrder](self->_internal, "sourceTrackIDsInClientOrder");
}

- (NSArray)sourceSampleDataTrackIDs
{
  return -[AVAsynchronousVideoCompositionRequestInternal sourceSampleBufferTrackIDsInClientOrder](self->_internal, "sourceSampleBufferTrackIDsInClientOrder");
}

- (id)videoCompositionInstruction
{
  return -[AVAsynchronousVideoCompositionRequestInternal instruction](self->_internal, "instruction");
}

- (CVPixelBufferRef)sourceFrameByTrackID:(CMPersistentTrackID)trackID
{
  uint64_t v3;
  NSDictionary *v5;
  CVPixelBufferRef result;
  AVAsynchronousVideoCompositionRequestInternal *internal;

  v3 = *(_QWORD *)&trackID;
  v5 = -[AVAsynchronousVideoCompositionRequestInternal sourceVideoFrameTimedSamplesByTrackID](self->_internal, "sourceVideoFrameTimedSamplesByTrackID");
  result = -[NSDictionary objectForKey:](v5, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3));
  if (result)
  {
    internal = self->_internal;
    if (internal)
      -[AVAsynchronousVideoCompositionRequestInternal compositionTime](internal, "compositionTime");
    FigVCPGetTimedSampleAtTimeFromOrderedArray();
    FigVCPTimedSampleGetPixelBuffer();
    return 0;
  }
  return result;
}

- (CMSampleBufferRef)sourceSampleBufferByTrackID:(CMPersistentTrackID)trackID
{
  uint64_t v3;
  NSDictionary *v5;
  CMSampleBufferRef result;
  AVAsynchronousVideoCompositionRequestInternal *internal;

  v3 = *(_QWORD *)&trackID;
  v5 = -[AVAsynchronousVideoCompositionRequestInternal sourceSampleBufferTimedSamplesByTrackID](self->_internal, "sourceSampleBufferTimedSamplesByTrackID");
  result = -[NSDictionary objectForKey:](v5, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3));
  if (result)
  {
    internal = self->_internal;
    if (internal)
      -[AVAsynchronousVideoCompositionRequestInternal compositionTime](internal, "compositionTime");
    FigVCPGetTimedSampleAtTimeFromOrderedArray();
    FigVCPTimedSampleGetSampleBuffer();
    return 0;
  }
  return result;
}

- (AVTimedMetadataGroup)sourceTimedMetadataByTrackID:(CMPersistentTrackID)trackID
{
  AVTimedMetadataGroup *result;

  result = -[AVAsynchronousVideoCompositionRequest sourceSampleBufferByTrackID:](self, "sourceSampleBufferByTrackID:", *(_QWORD *)&trackID);
  if (result)
    return -[AVTimedMetadataGroup initWithSampleBuffer:]([AVTimedMetadataGroup alloc], "initWithSampleBuffer:", result);
  return result;
}

- (void)finishWithComposedVideoFrame:(CVPixelBufferRef)composedVideoFrame
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v10;
  uint64_t v11;

  if (!composedVideoFrame)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("finishWithComposedVideoFrame requires a CVPixelBuffer"), v3, v4, v5, v6, v7, v11), 0);
    objc_exception_throw(v10);
  }
  if (-[AVAsynchronousVideoCompositionRequestInternal isFinished](self->_internal, "isFinished"))
  {
    NSLog(CFSTR("ignored -[AVAsynchronousVideoCompositionRequest finishWithComposedVideoFrame:] because already finished"));
  }
  else
  {
    -[AVAsynchronousVideoCompositionRequestInternal setIsFinished:](self->_internal, "setIsFinished:", 1);
    objc_msgSend(-[AVWeakReference referencedObject](-[AVAsynchronousVideoCompositionRequestInternal session](self->_internal, "session"), "referencedObject"), "compositionFrame:didFinishWithComposedPixelBuffer:", -[AVAsynchronousVideoCompositionRequestInternal compositionFrame](self->_internal, "compositionFrame"), composedVideoFrame);
  }
}

- (void)finishWithError:(NSError *)error
{
  if (-[AVAsynchronousVideoCompositionRequestInternal isFinished](self->_internal, "isFinished"))
  {
    NSLog(CFSTR("ignored -[AVAsynchronousVideoCompositionRequest finishWithError:] because already finished"));
  }
  else
  {
    -[AVAsynchronousVideoCompositionRequestInternal setIsFinished:](self->_internal, "setIsFinished:", 1);
    objc_msgSend(-[AVWeakReference referencedObject](-[AVAsynchronousVideoCompositionRequestInternal session](self->_internal, "session"), "referencedObject"), "compositionFrame:didFinishWithError:", -[AVAsynchronousVideoCompositionRequestInternal compositionFrame](self->_internal, "compositionFrame"), error);
  }
}

- (void)finishCancelledRequest
{
  if (-[AVAsynchronousVideoCompositionRequestInternal isFinished](self->_internal, "isFinished"))
  {
    NSLog(CFSTR("ignored -[AVAsynchronousVideoCompositionRequest finishCancelledRequest:] because already finished"));
  }
  else
  {
    -[AVAsynchronousVideoCompositionRequestInternal setIsFinished:](self->_internal, "setIsFinished:", 1);
    objc_msgSend(-[AVWeakReference referencedObject](-[AVAsynchronousVideoCompositionRequestInternal session](self->_internal, "session"), "referencedObject"), "compositionFrameDidCancel:", -[AVAsynchronousVideoCompositionRequestInternal compositionFrame](self->_internal, "compositionFrame"));
  }
}

- (int64_t)numberOfSourceFramesInWindowForTrackID:(int)a3
{
  uint64_t v3;
  NSDictionary *v4;

  v3 = *(_QWORD *)&a3;
  v4 = -[AVAsynchronousVideoCompositionRequestInternal sourceVideoFrameTimedSamplesByTrackID](self->_internal, "sourceVideoFrameTimedSamplesByTrackID");
  return objc_msgSend(-[NSDictionary objectForKey:](v4, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3)), "count");
}

- (int64_t)numberOfSourceSampleBuffersInWindowForTrackID:(int)a3
{
  uint64_t v3;
  NSDictionary *v4;

  v3 = *(_QWORD *)&a3;
  v4 = -[AVAsynchronousVideoCompositionRequestInternal sourceSampleBufferTimedSamplesByTrackID](self->_internal, "sourceSampleBufferTimedSamplesByTrackID");
  return objc_msgSend(-[NSDictionary objectForKey:](v4, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3)), "count");
}

- (__CVBuffer)sourceFrameByTrackID:(int)a3 atIndexInWindow:(int64_t)a4 presentationTimeStamp:(id *)a5
{
  uint64_t v7;
  NSDictionary *v8;
  id v9;
  void *v10;
  int PixelBuffer;
  __int128 v13;
  int64_t v14;

  if ((a4 & 0x8000000000000000) == 0)
  {
    v7 = *(_QWORD *)&a3;
    if (a5)
      *a5 = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    v8 = -[AVAsynchronousVideoCompositionRequestInternal sourceVideoFrameTimedSamplesByTrackID](self->_internal, "sourceVideoFrameTimedSamplesByTrackID");
    v9 = -[NSDictionary objectForKey:](v8, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7));
    if (v9)
    {
      v10 = v9;
      if (objc_msgSend(v9, "count") > (unint64_t)a4)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
        PixelBuffer = FigVCPTimedSampleGetPixelBuffer();
        if (a5)
        {
          if (!PixelBuffer)
          {
            FigVCPTimedSampleGetPTS();
            *(_OWORD *)&a5->var0 = v13;
            a5->var3 = v14;
          }
        }
      }
    }
  }
  return 0;
}

- (opaqueCMSampleBuffer)sourceSampleBufferByTrackID:(int)a3 atIndexInWindow:(int64_t)a4 presentationTimeStamp:(id *)a5
{
  uint64_t v7;
  NSDictionary *v8;
  id v9;
  void *v10;
  int SampleBuffer;
  __int128 v13;
  int64_t v14;

  if ((a4 & 0x8000000000000000) == 0)
  {
    v7 = *(_QWORD *)&a3;
    if (a5)
      *a5 = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    v8 = -[AVAsynchronousVideoCompositionRequestInternal sourceSampleBufferTimedSamplesByTrackID](self->_internal, "sourceSampleBufferTimedSamplesByTrackID");
    v9 = -[NSDictionary objectForKey:](v8, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7));
    if (v9)
    {
      v10 = v9;
      if (objc_msgSend(v9, "count") > (unint64_t)a4)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
        SampleBuffer = FigVCPTimedSampleGetSampleBuffer();
        if (a5)
        {
          if (!SampleBuffer)
          {
            FigVCPTimedSampleGetPTS();
            *(_OWORD *)&a5->var0 = v13;
            a5->var3 = v14;
          }
        }
      }
    }
  }
  return 0;
}

- (id)sourceTimedMetadataByTrackID:(int)a3 atIndexInWindow:(int64_t)a4 presentationTimeStamp:(id *)a5
{
  id result;

  result = -[AVAsynchronousVideoCompositionRequest sourceSampleBufferByTrackID:atIndexInWindow:presentationTimeStamp:](self, "sourceSampleBufferByTrackID:atIndexInWindow:presentationTimeStamp:", *(_QWORD *)&a3, a4, a5);
  if (result)
    return -[AVTimedMetadataGroup initWithSampleBuffer:]([AVTimedMetadataGroup alloc], "initWithSampleBuffer:", result);
  return result;
}

- (id)initUsingSession:(id)a3 withRenderContext:(id)a4 compositionFrame:(OpaqueFigVideoCompositorFrame *)a5 atTime:(id *)a6 usingSources:(id)a7 instruction:(id)a8 withSampleBuffers:(id)a9
{
  AVAsynchronousVideoCompositionRequest *v15;
  AVAsynchronousVideoCompositionRequestInternal *v16;
  AVAsynchronousVideoCompositionRequestInternal *internal;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  int64_t var3;
  objc_super v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v43.receiver = self;
  v43.super_class = (Class)AVAsynchronousVideoCompositionRequest;
  v15 = -[AVAsynchronousVideoCompositionRequest init](&v43, sel_init);
  if (v15)
  {
    v16 = objc_alloc_init(AVAsynchronousVideoCompositionRequestInternal);
    v15->_internal = v16;
    CFRetain(v16);
    -[AVAsynchronousVideoCompositionRequestInternal setSession:](v15->_internal, "setSession:", -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3));
    -[AVAsynchronousVideoCompositionRequestInternal setRenderContext:](v15->_internal, "setRenderContext:", a4);
    -[AVAsynchronousVideoCompositionRequestInternal setCompositionFrame:](v15->_internal, "setCompositionFrame:", a5);
    internal = v15->_internal;
    v41 = *(_OWORD *)&a6->var0;
    var3 = a6->var3;
    -[AVAsynchronousVideoCompositionRequestInternal setCompositionTime:](internal, "setCompositionTime:", &v41);
    -[AVAsynchronousVideoCompositionRequestInternal setSourceVideoFrameTimedSamplesByTrackID:](v15->_internal, "setSourceVideoFrameTimedSamplesByTrackID:", a7);
    -[AVAsynchronousVideoCompositionRequestInternal setSourceSampleBufferTimedSamplesByTrackID:](v15->_internal, "setSourceSampleBufferTimedSamplesByTrackID:", a9);
    -[AVAsynchronousVideoCompositionRequestInternal setInstruction:](v15->_internal, "setInstruction:", a8);
    if (objc_msgSend(a8, "requiredSourceTrackIDs"))
    {
      v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(a8, "requiredSourceTrackIDs"), "count"));
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v19 = (void *)objc_msgSend(a8, "requiredSourceTrackIDs");
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v38 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
            if (objc_msgSend(a7, "objectForKey:", v24))
              objc_msgSend(v18, "addObject:", v24);
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        }
        while (v21);
      }
    }
    else
    {
      v18 = (void *)objc_msgSend(a7, "allKeys");
    }
    -[AVAsynchronousVideoCompositionRequestInternal setSourceTrackIDsInClientOrder:](v15->_internal, "setSourceTrackIDsInClientOrder:", v18);
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(a8, "requiredSourceSampleDataTrackIDs"))
    {
      v25 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(a8, "requiredSourceSampleDataTrackIDs"), "count"));
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v26 = (void *)objc_msgSend(a8, "requiredSourceSampleDataTrackIDs", 0);
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v34 != v29)
              objc_enumerationMutation(v26);
            v31 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
            if (objc_msgSend(a9, "objectForKey:", v31))
              objc_msgSend(v25, "addObject:", v31);
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
        }
        while (v28);
      }
    }
    else
    {
      v25 = (void *)objc_msgSend(a9, "allKeys");
    }
    -[AVAsynchronousVideoCompositionRequestInternal setSourceSampleBufferTrackIDsInClientOrder:](v15->_internal, "setSourceSampleBufferTrackIDsInClientOrder:", v25);
  }
  return v15;
}

- (OpaqueFigVideoCompositorFrame)compositionFrame
{
  return -[AVAsynchronousVideoCompositionRequestInternal compositionFrame](self->_internal, "compositionFrame");
}

@end
