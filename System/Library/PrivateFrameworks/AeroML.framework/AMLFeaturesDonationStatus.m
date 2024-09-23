@implementation AMLFeaturesDonationStatus

- (NSString)metadataDonationId
{
  return (NSString *)sub_235F6EFB8((uint64_t)self, (uint64_t)a2, sub_235F6EEE0);
}

- (void)setMetadataDonationId:(id)a3
{
  sub_235F6EF4C(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___AMLFeaturesDonationStatus_metadataDonationId);
}

- (NSString)featuresDonationId
{
  return (NSString *)sub_235F6EFB8((uint64_t)self, (uint64_t)a2, sub_235F6EF1C);
}

- (void)setFeaturesDonationId:(id)a3
{
  sub_235F6EF4C(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___AMLFeaturesDonationStatus_featuresDonationId);
}

- (NSString)configurationDonationId
{
  return (NSString *)sub_235F6EFB8((uint64_t)self, (uint64_t)a2, sub_235F6EFEC);
}

- (void)setConfigurationDonationId:(id)a3
{
  sub_235F6EF4C(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___AMLFeaturesDonationStatus_configurationDonationId);
}

- (OS_dispatch_group)group
{
  return (OS_dispatch_group *)sub_235F6F054();
}

- (void)setGroup:(id)a3
{
  id v4;
  AMLFeaturesDonationStatus *v5;

  v4 = a3;
  v5 = self;
  sub_235F6F0A8((uint64_t)v4);

}

- (AMLFeaturesDonationStatus)initWithMetadataDonationId:(id)a3 featuresDonationId:(id)a4 configurationDonationId:(id)a5 group:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = sub_235F9B3FC();
  v9 = v8;
  v10 = sub_235F9B3FC();
  v12 = v11;
  v13 = sub_235F9B3FC();
  return (AMLFeaturesDonationStatus *)AMLFeaturesDonationStatus.init(metadataDonationId:featuresDonationId:configurationDonationId:group:)(v7, v9, v10, v12, v13, v14, (uint64_t)a6);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_235F6F5C0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr))AMLFeaturesDonationStatus.copy(with:));
}

- (AMLFeaturesDonationStatus)init
{
  AMLFeaturesDonationStatus.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_77();
  OUTLINED_FUNCTION_77();

}

@end
