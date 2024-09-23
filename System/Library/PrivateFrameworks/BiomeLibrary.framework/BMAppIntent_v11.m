@implementation BMAppIntent_v11

- (int)handlingStatus
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMAppIntent_v11;
  v2 = -[BMAppIntent handlingStatus](&v4, sel_handlingStatus);
  if (v2 < 7)
    return v2 + 1;
  else
    return 0;
}

@end
