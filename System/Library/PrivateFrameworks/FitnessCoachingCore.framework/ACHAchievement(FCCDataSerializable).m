@implementation ACHAchievement(FCCDataSerializable)

- (uint64_t)initWithTransportData:()FCCDataSerializable
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CF5008];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

  v7 = objc_msgSend(a1, "initWithCodable:", v6);
  return v7;
}

- (id)transportData
{
  void *v0;
  void *v1;

  ACHCodableFromAchievement();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "data");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
