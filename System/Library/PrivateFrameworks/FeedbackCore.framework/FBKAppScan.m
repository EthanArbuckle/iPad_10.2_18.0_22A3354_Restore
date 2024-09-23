@implementation FBKAppScan

+ (id)allInstalledApps
{
  void *v2;

  swift_getObjCClassMetadata();
  static FBKAppScan.allInstalledApps()();
  sub_21DA3FF38();
  v2 = (void *)sub_21DAC4960();
  swift_bridgeObjectRelease();
  return v2;
}

+ (id)thirdPartyInstalledApps
{
  unint64_t v2;
  void *v3;

  swift_getObjCClassMetadata();
  v2 = static FBKAppScan.allInstalledApps()();
  sub_21DA3FDB4(v2);
  swift_bridgeObjectRelease();
  sub_21DA3FF38();
  v3 = (void *)sub_21DAC4960();
  swift_bridgeObjectRelease();
  return v3;
}

- (_TtC12FeedbackCore10FBKAppScan)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBKAppScan();
  return -[FBKAppScan init](&v3, sel_init);
}

@end
