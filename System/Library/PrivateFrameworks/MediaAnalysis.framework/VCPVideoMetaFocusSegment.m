@implementation VCPVideoMetaFocusSegment

- (VCPVideoMetaFocusSegment)initWithFocusStatus:(int64_t)a3 atTime:(id *)a4
{
  VCPVideoMetaFocusSegment *v6;
  VCPVideoMetaFocusSegment *v7;
  VCPVideoMetaFocusSegment *v8;
  __int128 v10;
  int64_t var3;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VCPVideoMetaFocusSegment;
  v6 = -[VCPMetaSegment init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v10 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[VCPVideoMetaFocusSegment resetSegment:atTime:](v6, "resetSegment:atTime:", a3, &v10);
    v8 = v7;
  }

  return v7;
}

- (void)updateSegment:(int64_t)a3 atTime:(id *)a4
{
  objc_super v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a4;
  v6.receiver = self;
  v6.super_class = (Class)VCPVideoMetaFocusSegment;
  -[VCPMetaSegment updateSegment:](&v6, sel_updateSegment_, &v7);
  self->_focusStatus = a3;
}

- (void)resetSegment:(int64_t)a3 atTime:(id *)a4
{
  objc_super v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a4;
  v6.receiver = self;
  v6.super_class = (Class)VCPVideoMetaFocusSegment;
  -[VCPMetaSegment resetSegment:](&v6, sel_resetSegment_, &v7);
  self->_focusStatus = a3;
}

- (int64_t)focusStatus
{
  return self->_focusStatus;
}

- (void)setFocusStatus:(int64_t)a3
{
  self->_focusStatus = a3;
}

@end
