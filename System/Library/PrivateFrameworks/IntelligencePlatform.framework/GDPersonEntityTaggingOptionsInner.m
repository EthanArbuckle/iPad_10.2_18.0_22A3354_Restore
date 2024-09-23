@implementation GDPersonEntityTaggingOptionsInner

- (GDPersonEntityTaggingOptionsInner)initWithTagNameThresholds:(id)a3
{
  uint64_t v3;
  GDPersonEntityTaggingOptionsInner *result;

  v3 = sub_1AE925C5C();
  PersonEntityTaggingService.PersonEntityTaggingOptions.init(tagNameThresholds:)(v3);
  return result;
}

- (NSDictionary)tagNameThresholds
{
  GDPersonEntityTaggingOptionsInner *v2;
  void *v3;

  v2 = self;
  sub_1AE6311F8();

  v3 = (void *)sub_1AE925C44();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (GDPersonEntityTaggingOptionsInner)init
{
  PersonEntityTaggingService.PersonEntityTaggingOptions.init()();
}

- (void).cxx_destruct
{
  sub_1AE640730();
}

@end
