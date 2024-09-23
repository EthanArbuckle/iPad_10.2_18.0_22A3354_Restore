@implementation swift_DaemonRecord

- (NSString)bundleIdentifier
{
  void *v2;

  DaemonRecord.bundleIdentifier.getter();
  v2 = (void *)sub_19AB82650();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setBundleIdentifier:(id)a3
{
  swift_DaemonRecord *v4;

  sub_19AB82674();
  v4 = self;
  DaemonRecord.bundleIdentifier.setter();

}

+ (NSArray)enumerated
{
  void *v2;

  swift_getObjCClassMetadata();
  static DaemonRecord.enumerated.getter();
  v2 = (void *)sub_19AB827D0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

+ (void)setEnumerated:(id)a3
{
  swift_getObjCClassMetadata();
  sub_19AB827DC();
  static DaemonRecord.enumerated.setter();
}

+ (id)fromBundleIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = sub_19AB82674();
  v5 = static DaemonRecord.from(bundleIdentifier:)(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (swift_DaemonRecord)init
{
  DaemonRecord.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
