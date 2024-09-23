@implementation HSFairPlaySetupRequest

- (HSFairPlaySetupRequest)init
{
  HSFairPlaySetupRequest *v2;
  HSFairPlaySetupRequest *v3;

  v2 = -[HSRequest initWithAction:](self, "initWithAction:", CFSTR("fp-setup"));
  v3 = v2;
  if (v2)
    -[HSRequest setMethod:](v2, "setMethod:", 1);
  return v3;
}

@end
