@implementation MCLECv3KeyAgreement

- (NSString)sender
{
  MCLECv3KeyAgreement *v2;
  id v5;

  v2 = self;
  sub_21CAC11AC();

  v5 = (id)sub_21CAC5B20();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSString)recipientFingerprint
{
  MCLECv3KeyAgreement *v2;
  id v5;

  v2 = self;
  sub_21CAC125C();

  v5 = (id)sub_21CAC5B20();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (MCLECv3KeyAgreement)init
{
  return (MCLECv3KeyAgreement *)MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement.init()();
}

- (void).cxx_destruct
{
  sub_21CAAE53C();
  sub_21CAAE53C();
}

@end
