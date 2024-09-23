@implementation LARatchetStateValueExpired

- (double)duration
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LARatchetStateValueExpired;
  -[LARatchetStateValue duration](&v3, sel_duration);
  return result;
}

@end
