@implementation HKHeartbeatSeriesSample(HDCodingSupport)

- (HDCodableBinarySample)codableRepresentationForSync
{
  HDCodableBinarySample *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = objc_alloc_init(HDCodableBinarySample);
  v6.receiver = a1;
  v6.super_class = (Class)&off_1EF222BE8;
  objc_msgSendSuper2(&v6, sel_codableRepresentationForSync);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableBinarySample setSample:](v2, "setSample:", v3);

  objc_msgSend(a1, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableBinarySample setPayload:](v2, "setPayload:", v4);

  return v2;
}

@end
