@implementation LARatchetStateValueArmed

- (double)duration
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LARatchetStateValueArmed;
  -[LARatchetStateValue duration](&v3, sel_duration);
  return result;
}

@end
