@implementation BMTextInputSession_v0

- (int)sessionInput
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMTextInputSession_v0;
  v2 = -[BMTextInputSession sessionInput](&v4, sel_sessionInput);
  if (v2 < 4)
    return v2 + 1;
  else
    return 0;
}

@end
