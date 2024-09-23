@implementation BMSiriExecution_v2

- (int)taskStep
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMSiriExecution_v2;
  v2 = -[BMSiriExecution taskStep](&v4, sel_taskStep);
  if (v2 < 0x5E)
    return v2 + 1;
  else
    return 0;
}

@end
