@implementation BMUserFocusSleepMode_v2

- (int)state
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMUserFocusSleepMode_v2;
  v2 = -[BMUserFocusSleepMode state](&v4, sel_state);
  if (v2 < 3)
    return v2 + 1;
  else
    return 0;
}

@end
