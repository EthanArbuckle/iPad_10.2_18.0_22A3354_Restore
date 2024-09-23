@implementation AVAsynchronousVideoCompositionRequestInternal

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAsynchronousVideoCompositionRequestInternal;
  -[AVAsynchronousVideoCompositionRequestInternal dealloc](&v3, sel_dealloc);
}

- (AVWeakReference)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (AVVideoCompositionRenderContext)renderContext
{
  return self->_renderContext;
}

- (void)setRenderContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (OpaqueFigVideoCompositorFrame)compositionFrame
{
  return self->_compositionFrame;
}

- (void)setCompositionFrame:(OpaqueFigVideoCompositorFrame *)a3
{
  self->_compositionFrame = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)compositionTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setCompositionTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_compositionTime.epoch = a3->var3;
  *(_OWORD *)&self->_compositionTime.value = v3;
}

- (NSDictionary)sourceVideoFrameTimedSamplesByTrackID
{
  return self->_sourceVideoFrameTimedSamplesByTrackID;
}

- (void)setSourceVideoFrameTimedSamplesByTrackID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSArray)sourceTrackIDsInClientOrder
{
  return self->_sourceTrackIDsInClientOrder;
}

- (void)setSourceTrackIDsInClientOrder:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSDictionary)sourceSampleBufferTimedSamplesByTrackID
{
  return self->_sourceSampleBufferTimedSamplesByTrackID;
}

- (void)setSourceSampleBufferTimedSamplesByTrackID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSArray)sourceSampleBufferTrackIDsInClientOrder
{
  return self->_sourceSampleBufferTrackIDsInClientOrder;
}

- (void)setSourceSampleBufferTrackIDsInClientOrder:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (AVVideoCompositionInstruction)instruction
{
  return self->_instruction;
}

- (void)setInstruction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

@end
