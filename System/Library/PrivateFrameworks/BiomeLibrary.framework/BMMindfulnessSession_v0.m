@implementation BMMindfulnessSession_v0

- (int)sessionMode
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMMindfulnessSession_v0;
  v2 = -[BMMindfulnessSession sessionMode](&v4, sel_sessionMode);
  if (v2 < 3)
    return v2 + 1;
  else
    return 0;
}

@end
