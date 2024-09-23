@implementation AMLClientDonations

- (MLFeatureProvider)featureProvider
{
  return (MLFeatureProvider *)(id)sub_235F81F84();
}

- (MLBatchProvider)batchProvider
{
  return (MLBatchProvider *)(id)sub_235F81FB0();
}

- (MLArrayBatchProvider)arrayProvider
{
  id v2;

  sub_235F81FDC();
  return (MLArrayBatchProvider *)v2;
}

- (AMLFeaturesConfiguration)featuresConfiguration
{
  id v2;

  sub_235F82020();
  return (AMLFeaturesConfiguration *)v2;
}

- (AMLFeaturesDonationMetadata)metadata
{
  id v2;

  sub_235F82064();
  return (AMLFeaturesDonationMetadata *)v2;
}

- (NSString)donationTime
{
  uint64_t v2;
  void *v3;

  sub_235F820CC();
  if (v2)
  {
    v3 = (void *)sub_235F9B3F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (AMLClientDonations)initWithFeaturesConfiguration:(id)a3 featureProvider:(id)a4 batchProvider:(id)a5 arrayProvider:(id)a6 metadata:(id)a7 donationTime:(id)a8
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;

  if (a8)
  {
    v13 = sub_235F9B3FC();
    v15 = v14;
  }
  else
  {
    v13 = 0;
    v15 = 0;
  }
  v16 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v17 = a6;
  v18 = a7;
  return (AMLClientDonations *)AMLClientDonations.init(featuresConfiguration:featureProvider:batchProvider:arrayProvider:metadata:donationTime:)((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, v13, v15);
}

- (id)copyWithZone:(void *)a3
{
  AMLClientDonations *v3;
  void *v4;
  uint64_t v6[4];

  v3 = self;
  AMLClientDonations.copy(with:)((uint64_t)v3, v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_235F9B6B4();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  AMLClientDonations *v5;

  v4 = a3;
  v5 = self;
  AMLClientDonations.encode(with:)((NSCoder)v4);

}

- (AMLClientDonations)initWithCoder:(id)a3
{
  return (AMLClientDonations *)AMLClientDonations.init(coder:)(a3);
}

- (AMLClientDonations)init
{
  AMLClientDonations.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_28_3(OBJC_IVAR___AMLClientDonations_arrayProvider);
  OUTLINED_FUNCTION_28_3(OBJC_IVAR___AMLClientDonations_featuresConfiguration);
  OUTLINED_FUNCTION_28_3(OBJC_IVAR___AMLClientDonations_metadata);
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  AMLClientDonations *v2;
  void *v3;

  v2 = self;
  AMLClientDonations.description.getter((uint64_t)v2);

  v3 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
