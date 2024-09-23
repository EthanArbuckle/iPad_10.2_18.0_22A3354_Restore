@implementation AMLStorageMetadata

- (AMLFeaturesDonationMetadata)donationMetadata
{
  return (AMLFeaturesDonationMetadata *)sub_235F66318();
}

- (NSString)donationTime
{
  void *v2;

  sub_235F66360();
  v2 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (AMLStorageMetadata)initWithDonationMetadata:(id)a3 donationTime:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = sub_235F9B3FC();
  v7 = v6;
  v8 = a3;
  return (AMLStorageMetadata *)AMLStorageMetadata.init(donationMetadata:donationTime:)((uint64_t)v8, v5, v7, v9, v10, v11, v12, v13);
}

- (AMLStorageMetadata)init
{
  AMLStorageMetadata.init()();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
