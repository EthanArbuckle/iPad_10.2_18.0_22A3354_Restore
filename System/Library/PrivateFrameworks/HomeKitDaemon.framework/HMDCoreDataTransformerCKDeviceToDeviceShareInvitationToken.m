@implementation HMDCoreDataTransformerCKDeviceToDeviceShareInvitationToken

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

- (id)transformedValue:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "shareTokenFromKeyedArchiveData:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  void *v4;

  if (a3)
  {
    v3 = a3;
    objc_msgSend((id)objc_opt_class(), "keyedArchiveToken:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
