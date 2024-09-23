@implementation INInteraction(MTUtilities)

- (void)mtSetIntentDonorFromSource:()MTUtilities
{
  void *v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "processName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_setDonatedBySiri:", objc_msgSend(v4, "isEqualToString:", CFSTR("assistant_service")));

  }
}

@end
