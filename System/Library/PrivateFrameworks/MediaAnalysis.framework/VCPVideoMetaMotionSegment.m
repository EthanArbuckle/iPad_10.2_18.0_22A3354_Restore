@implementation VCPVideoMetaMotionSegment

- (VCPVideoMetaMotionSegment)initWithAbsMotion:(float)a3 atTime:(id *)a4
{
  VCPVideoMetaMotionSegment *v6;
  VCPVideoMetaMotionSegment *v7;
  VCPVideoMetaMotionSegment *v8;
  __int128 v10;
  int64_t var3;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VCPVideoMetaMotionSegment;
  v6 = -[VCPMetaSegment init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v10 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[VCPVideoMetaMotionSegment resetSegment:atTime:](v6, "resetSegment:atTime:", &v10, COERCE_DOUBLE(__PAIR64__(DWORD1(v10), LODWORD(a3))));
    v8 = v7;
  }

  return v7;
}

- (void)resetSegment:(float)a3 atTime:(id *)a4
{
  objc_super v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a4;
  v6.receiver = self;
  v6.super_class = (Class)VCPVideoMetaMotionSegment;
  -[VCPMetaSegment resetSegment:](&v6, sel_resetSegment_, &v7);
  self->_absMotion = a3;
  self->_stabilityScore = expf(a3 * -0.1);
}

- (void)updateSegment:(float)a3 atTime:(id *)a4
{
  objc_super v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a4;
  v6.receiver = self;
  v6.super_class = (Class)VCPVideoMetaMotionSegment;
  -[VCPMetaSegment updateSegment:](&v6, sel_updateSegment_, &v7);
  self->_absMotion = self->_absMotion + a3;
  self->_stabilityScore = expf(a3 * -0.1) + self->_stabilityScore;
}

- (void)finalizeAtTime:(id *)a3
{
  float v4;
  objc_super v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v6 = *a3;
  v5.receiver = self;
  v5.super_class = (Class)VCPVideoMetaMotionSegment;
  -[VCPMetaSegment finalizeAtTime:](&v5, sel_finalizeAtTime_, &v6);
  v4 = self->_absMotion / (float)(int)-[VCPMetaSegment numOfFrames](self, "numOfFrames");
  self->_absMotion = v4;
  self->_stabilityScore = expf(v4 * -0.1);
}

- (void)mergeSegment:(id)a3
{
  id v4;
  float v5;
  float v6;
  unint64_t v7;
  float absMotion;
  unint64_t v9;
  uint64_t v10;
  float v11;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "absMotion");
  v6 = v5;
  v7 = objc_msgSend(v4, "numOfFrames");
  absMotion = self->_absMotion;
  v9 = -[VCPMetaSegment numOfFrames](self, "numOfFrames");
  v10 = objc_msgSend(v4, "numOfFrames");
  v11 = (float)((float)(absMotion * (float)v9) + (float)(v6 * (float)v7))
      / (float)(-[VCPMetaSegment numOfFrames](self, "numOfFrames") + v10);
  self->_absMotion = v11;
  self->_stabilityScore = expf(v11 * -0.1);
  v12.receiver = self;
  v12.super_class = (Class)VCPVideoMetaMotionSegment;
  -[VCPMetaSegment mergeSegment:](&v12, sel_mergeSegment_, v4);

}

- (float)absMotion
{
  return self->_absMotion;
}

- (void)setAbsMotion:(float)a3
{
  self->_absMotion = a3;
}

- (float)stabilityScore
{
  return self->_stabilityScore;
}

- (void)setStabilityScore:(float)a3
{
  self->_stabilityScore = a3;
}

@end
