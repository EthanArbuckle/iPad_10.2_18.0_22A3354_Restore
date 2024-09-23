@implementation MCLECv3Params

- (MCLECv3KeyAgreement)keyAgreement
{
  MCLECv3Params *v2;
  id v5;

  v2 = self;
  v5 = sub_21CAC1108();

  return (MCLECv3KeyAgreement *)v5;
}

- (MCLECv3Params)init
{
  return (MCLECv3Params *)MCLECv3Encryption.ECV3EncryptedDataContainer.Params.init()();
}

- (void).cxx_destruct
{
  sub_21CAAE53C();

}

@end
