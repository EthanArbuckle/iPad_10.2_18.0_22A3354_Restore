@implementation AMLSpotlightStorage

+ (id)featuresConfigurationForConfigurationId:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = sub_235F9B3FC();
  v5 = static AMLSpotlightStorage.featuresConfiguration(forConfigurationId:)(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)metadataForPhotoId:(id)a3 aroundTime:(double)a4
{
  return sub_235F6ABF8(a4, (uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, double))static AMLSpotlightStorage.metadata(forPhotoId:aroundTime:));
}

+ (id)metadataForSession:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = sub_235F9B3FC();
  static AMLSpotlightStorage.metadata(forSession:)(v3, v4);
  v5 = swift_bridgeObjectRelease();
  type metadata accessor for AMLStorageMetadata(v5);
  v6 = (void *)sub_235F9B444();
  swift_bridgeObjectRelease();
  return v6;
}

+ (id)featuresForSpotlightId:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = sub_235F9B3FC();
  v5 = (void *)static AMLSpotlightStorage.features(forSpotlightId:)(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)clientDonationsForSession:(id)a3
{
  void *v3;

  sub_235F9B3FC();
  swift_getObjCClassMetadata();
  sub_235F6A390();
  swift_bridgeObjectRelease();
  type metadata accessor for AMLClientDonations(0);
  v3 = (void *)sub_235F9B444();
  swift_bridgeObjectRelease();
  return v3;
}

+ (id)clientDonationForPhotoId:(id)a3 aroundTime:(double)a4
{
  return sub_235F6ABF8(a4, (uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, double))sub_235F6A8B4);
}

- (AMLSpotlightStorage)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return (AMLSpotlightStorage *)AMLSpotlightStorage.init()((uint64_t)self, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

@end
