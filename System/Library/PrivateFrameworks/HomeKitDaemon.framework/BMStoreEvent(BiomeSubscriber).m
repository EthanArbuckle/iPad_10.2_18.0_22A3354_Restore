@implementation BMStoreEvent(BiomeSubscriber)

- (id)descriptionWithLocalizedTimestamp
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x24BDBCE60]);
  objc_msgSend(a1, "timestamp");
  v3 = (void *)objc_msgSend(v2, "initWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "hmf_localTimeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
