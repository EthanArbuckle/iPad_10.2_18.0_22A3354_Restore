@implementation ARCoachingStateSpring

- (ARCoachingStateSpring)initWithValue:(double)a3
{
  ARCoachingStateSpring *v3;
  ARCoachingStateSpring *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARCoachingStateSpring;
  v3 = -[ARFLSpring initWithValue:](&v6, sel_initWithValue_, a3);
  v4 = v3;
  if (v3)
    -[ARFLSpring setParameters:](v3, "setParameters:", 0.9, 0.08, 0.9, 0.08);
  return v4;
}

@end
