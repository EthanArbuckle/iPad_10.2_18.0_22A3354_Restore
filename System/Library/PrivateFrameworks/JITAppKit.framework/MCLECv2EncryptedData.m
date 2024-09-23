@implementation MCLECv2EncryptedData

- (NSString)ephemeralPublicKey
{
  MCLECv2EncryptedData *v2;
  id v5;

  v2 = self;
  sub_21CAB4494();

  v5 = (id)sub_21CAC5B20();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSString)gcmEncryptedData
{
  MCLECv2EncryptedData *v2;
  id v5;

  v2 = self;
  sub_21CAB4544();

  v5 = (id)sub_21CAC5B20();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSString)gcmTag
{
  MCLECv2EncryptedData *v2;
  id v5;

  v2 = self;
  sub_21CAB45F4();

  v5 = (id)sub_21CAC5B20();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (MCLECv2EncryptedData)init
{
  return (MCLECv2EncryptedData *)MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData.init()();
}

- (void).cxx_destruct
{
  sub_21CAAE53C();
  sub_21CAAE53C();
  sub_21CAAE53C();
}

@end
