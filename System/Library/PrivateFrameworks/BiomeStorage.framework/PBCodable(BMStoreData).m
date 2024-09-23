@implementation PBCodable(BMStoreData)

- (uint64_t)dataVersion
{
  return 0;
}

+ (id)eventWithData:()BMStoreData dataVersion:
{
  void *v4;
  id v6;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v6 = a3;
    v4 = (void *)objc_msgSend([a1 alloc], "initWithData:", v6);

  }
  return v4;
}

@end
