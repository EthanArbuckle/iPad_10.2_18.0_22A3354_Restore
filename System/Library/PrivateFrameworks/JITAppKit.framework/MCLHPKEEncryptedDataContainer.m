@implementation MCLHPKEEncryptedDataContainer

- (NSString)encapsulatedKey
{
  MCLHPKEEncryptedDataContainer *v2;
  id v5;

  v2 = self;
  sub_21CABC2C4();

  v5 = (id)sub_21CAC5B20();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSString)cipher
{
  MCLHPKEEncryptedDataContainer *v2;
  id v5;

  v2 = self;
  sub_21CABC374();

  v5 = (id)sub_21CAC5B20();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (MCLHPKEEncryptedDataContainer)init
{
  return (MCLHPKEEncryptedDataContainer *)sub_21CABC52C();
}

- (void).cxx_destruct
{
  sub_21CAAE53C();
  sub_21CAAE53C();
}

@end
