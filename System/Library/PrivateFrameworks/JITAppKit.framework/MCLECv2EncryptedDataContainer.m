@implementation MCLECv2EncryptedDataContainer

- (NSString)_encryptionVersion
{
  MCLECv2EncryptedDataContainer *v2;
  id v5;

  v2 = self;
  sub_21CAB4360();

  v5 = (id)sub_21CAC5B20();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (MCLECv2EncryptedData)_encryptedData
{
  MCLECv2EncryptedDataContainer *v2;
  id v5;

  v2 = self;
  v5 = sub_21CAB43F0();

  return (MCLECv2EncryptedData *)v5;
}

- (id)toDictionary
{
  MCLECv2EncryptedDataContainer *v2;
  id v5;

  v2 = self;
  sub_21CAB55C4();

  v5 = (id)sub_21CAC5AD8();
  swift_bridgeObjectRelease();
  return v5;
}

- (NSString)_publicKeyHash
{
  MCLECv2EncryptedDataContainer *v2;
  id v5;

  v2 = self;
  sub_21CAB5B10();

  v5 = (id)sub_21CAC5B20();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (MCLECv2EncryptedDataContainer)init
{
  return (MCLECv2EncryptedDataContainer *)MCLECv2Encryption.ECv2EncryptedDataContainer.init()();
}

- (void).cxx_destruct
{
  sub_21CAAE53C();

  sub_21CAAE53C();
}

@end
