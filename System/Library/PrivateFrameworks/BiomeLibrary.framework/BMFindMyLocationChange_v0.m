@implementation BMFindMyLocationChange_v0

- (int)stateChange
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMFindMyLocationChange_v0;
  v2 = -[BMFindMyLocationChange stateChange](&v4, sel_stateChange);
  if (v2 < 3)
    return v2 + 1;
  else
    return 0;
}

@end
