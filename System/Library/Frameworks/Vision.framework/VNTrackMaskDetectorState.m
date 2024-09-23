@implementation VNTrackMaskDetectorState

- (VNTrackMaskDetectorState)init
{
  VNTrackMaskDetectorState *result;
  uint64_t v3;
  __int128 v4;
  int64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNTrackMaskDetectorState;
  result = -[VNTrackMaskDetectorState init](&v6, sel_init);
  if (result)
  {
    result->_firstFrame = 1;
    v3 = MEMORY[0x1E0CA2E68];
    v4 = *MEMORY[0x1E0CA2E68];
    *(_OWORD *)&result->_frameUpdateSpacing.value = *MEMORY[0x1E0CA2E68];
    v5 = *(_QWORD *)(v3 + 16);
    result->_frameUpdateSpacing.epoch = v5;
    *(_OWORD *)&result->_lastUpdatePTS.value = v4;
    result->_lastUpdatePTS.epoch = v5;
    *(_OWORD *)&result->_lastProcessedPTS.value = v4;
    result->_lastProcessedPTS.epoch = v5;
    result->_confidence = 0.0;
  }
  return result;
}

- (VNTrackMaskDetectorState)initWithFrameUpdateSpacing:(id *)a3 mask:(__CVBuffer *)a4
{
  VNTrackMaskDetectorState *v6;
  VNTrackMaskDetectorState *v7;
  __int128 v8;

  v6 = -[VNTrackMaskDetectorState init](self, "init");
  v7 = v6;
  if (v6)
  {
    v8 = *(_OWORD *)&a3->var0;
    v6->_frameUpdateSpacing.epoch = a3->var3;
    *(_OWORD *)&v6->_frameUpdateSpacing.value = v8;
    v6->_inititalMask = CVPixelBufferRetain(a4);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_inititalMask);
  self->_inititalMask = 0;
  v3.receiver = self;
  v3.super_class = (Class)VNTrackMaskDetectorState;
  -[VNTrackMaskDetectorState dealloc](&v3, sel_dealloc);
}

- ($FD4688982923A924290ECB669CAF1EC2)getKeyBuffer
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)&self->keyBuffer;
}

- ($FD4688982923A924290ECB669CAF1EC2)getValueBuffer
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)&self->valueBuffer;
}

- ($FD4688982923A924290ECB669CAF1EC2)getHiddenMaskBuffer
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)&self->hiddenMaskBuffer;
}

- ($FD4688982923A924290ECB669CAF1EC2)getOutputMaskBuffer
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)&self->outputMaskBuffer;
}

- (BOOL)firstFrame
{
  return self->_firstFrame;
}

- (void)setFirstFrame:(BOOL)a3
{
  self->_firstFrame = a3;
}

- (__CVBuffer)inititalMask
{
  return self->_inititalMask;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameUpdateSpacing
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_frameUpdateSpacing, 24, 1, 0);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastUpdatePTS
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_lastUpdatePTS, 24, 1, 0);
  return result;
}

- (void)setLastUpdatePTS:(id *)a3
{
  objc_copyStruct(&self->_lastUpdatePTS, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastProcessedPTS
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_lastProcessedPTS, 24, 1, 0);
  return result;
}

- (void)setLastProcessedPTS:(id *)a3
{
  objc_copyStruct(&self->_lastProcessedPTS, a3, 24, 1, 0);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

@end
