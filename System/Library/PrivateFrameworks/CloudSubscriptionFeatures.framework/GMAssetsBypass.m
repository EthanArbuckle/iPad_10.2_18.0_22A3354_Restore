@implementation GMAssetsBypass

+ (BOOL)gmAssetsBypass
{
  void *v2;
  void *v3;

  if ((sub_1A5BBE504() & 1) == 0)
    return 0;
  if (qword_1ED110780 != -1)
    swift_once();
  v2 = (void *)qword_1ED110778;
  v3 = (void *)sub_1A5BC9B3C();
  LOBYTE(v2) = objc_msgSend(v2, sel_BOOLForKey_, v3);

  return (char)v2;
}

+ (void)setGMEligibilityBypass:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  if ((sub_1A5BBE504() & 1) != 0)
  {
    if (qword_1ED110780 != -1)
      swift_once();
    v4 = (void *)qword_1ED110778;
    v5 = (id)sub_1A5BC9B3C();
    objc_msgSend(v4, sel_setBool_forKey_, v3, v5);

  }
}

- (_TtC25CloudSubscriptionFeatures14GMAssetsBypass)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GMAssetsBypass();
  return -[GMAssetsBypass init](&v3, sel_init);
}

@end
