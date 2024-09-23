@implementation GTCaptureQueryCapturables

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureQueryCapturables)initWithCoder:(id)a3
{
  GTCaptureQueryCapturables *v3;
  GTCaptureQueryCapturables *v4;
  GTCaptureQueryCapturables *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GTCaptureQueryCapturables;
  v3 = -[GTCaptureRequest initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTCaptureQueryCapturables;
  -[GTCaptureRequest encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

@end
