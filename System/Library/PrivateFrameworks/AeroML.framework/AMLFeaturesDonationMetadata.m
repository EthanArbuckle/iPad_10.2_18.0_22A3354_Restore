@implementation AMLFeaturesDonationMetadata

- (NSString)description
{
  return (NSString *)sub_235F72234(self, (uint64_t)a2, (void (*)(void))AMLFeaturesDonationMetadata.description.getter);
}

- (NSString)sessionId
{
  return (NSString *)sub_235F6EFB8((uint64_t)self, (uint64_t)a2, sub_235F87B00);
}

- (void)setSessionId:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  AMLFeaturesDonationMetadata *v7;

  v4 = sub_235F9B3FC();
  v6 = v5;
  v7 = self;
  sub_235F87B80(v4, v6);

}

- (NSDictionary)metadata
{
  void *v2;

  if (sub_235F87BF8())
  {
    v2 = (void *)sub_235F9B3C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (void)setMetadata:(id)a3
{
  uint64_t v4;
  AMLFeaturesDonationMetadata *v5;

  if (a3)
    v4 = sub_235F9B3CC();
  else
    v4 = 0;
  v5 = self;
  sub_235F87C7C(v4);

}

- (AMLFeaturesDonationMetadata)initWithSessionId:(id)a3 metadata:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = sub_235F9B3FC();
  v7 = v6;
  if (a4)
    v8 = sub_235F9B3CC();
  else
    v8 = 0;
  return (AMLFeaturesDonationMetadata *)AMLFeaturesDonationMetadata.init(sessionId:metadata:)(v5, v7, v8);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_235F6F5C0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr))sub_235F87DF4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  AMLFeaturesDonationMetadata *v5;

  v4 = a3;
  v5 = self;
  sub_235F87E98((uint64_t)v4);

}

- (AMLFeaturesDonationMetadata)initWithCoder:(id)a3
{
  return (AMLFeaturesDonationMetadata *)AMLFeaturesDonationMetadata.init(coder:)(a3);
}

- (AMLFeaturesDonationMetadata)init
{
  AMLFeaturesDonationMetadata.init()();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_28_5();
}

@end
