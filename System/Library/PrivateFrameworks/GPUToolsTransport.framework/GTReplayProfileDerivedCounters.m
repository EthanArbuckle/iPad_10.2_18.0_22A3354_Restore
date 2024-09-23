@implementation GTReplayProfileDerivedCounters

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayProfileDerivedCounters)initWithCoder:(id)a3
{
  GTReplayProfileDerivedCounters *v3;
  GTReplayProfileDerivedCounters *v4;
  GTReplayProfileDerivedCounters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GTReplayProfileDerivedCounters;
  v3 = -[GTReplayProfileRequest initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTReplayProfileDerivedCounters;
  -[GTReplayProfileRequest encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

@end
