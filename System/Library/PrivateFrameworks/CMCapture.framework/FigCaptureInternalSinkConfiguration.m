@implementation FigCaptureInternalSinkConfiguration

- (int)sinkType
{
  return 14;
}

- (FigCaptureInternalSinkConfiguration)initWithSinkSubType:(int)a3
{
  FigCaptureInternalSinkConfiguration *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigCaptureInternalSinkConfiguration;
  result = -[FigCaptureInternalSinkConfiguration init](&v5, sel_init);
  if (result)
    result->_subType = a3;
  return result;
}

- (int)subType
{
  return self->_subType;
}

@end
