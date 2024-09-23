@implementation MCLECv3EncryptedDataContainer

- (NSString)data
{
  MCLECv3EncryptedDataContainer *v2;
  id v5;

  v2 = self;
  sub_21CAC0F80();

  v5 = (id)sub_21CAC5B20();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (MCLECv3Params)params
{
  MCLECv3EncryptedDataContainer *v2;
  id v5;

  v2 = self;
  v5 = sub_21CAC1010();

  return (MCLECv3Params *)v5;
}

- (MCLECv3EncryptedDataContainer)init
{
  return (MCLECv3EncryptedDataContainer *)MCLECv3Encryption.ECV3EncryptedDataContainer.init()();
}

- (void).cxx_destruct
{
  sub_21CAAE53C();

}

@end
