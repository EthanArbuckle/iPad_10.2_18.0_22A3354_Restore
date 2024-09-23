@implementation AAClient

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (AAClient)initWithIdentifier:(id)a3 name:(id)a4 version:(id)a5 buildNumber:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  objc_super v23;

  v7 = sub_1A5F64130();
  v9 = v8;
  v10 = sub_1A5F64130();
  v12 = v11;
  v13 = sub_1A5F64130();
  v15 = v14;
  v16 = sub_1A5F64130();
  v17 = (uint64_t *)((char *)self + OBJC_IVAR___AAClient_identifier);
  *v17 = v7;
  v17[1] = v9;
  v18 = (uint64_t *)((char *)self + OBJC_IVAR___AAClient_name);
  *v18 = v10;
  v18[1] = v12;
  v19 = (uint64_t *)((char *)self + OBJC_IVAR___AAClient_version);
  *v19 = v13;
  v19[1] = v15;
  v20 = (uint64_t *)((char *)self + OBJC_IVAR___AAClient_buildNumber);
  *v20 = v16;
  v20[1] = v21;
  v23.receiver = self;
  v23.super_class = (Class)type metadata accessor for Client();
  return -[AAClient init](&v23, sel_init);
}

- (NSString)identifier
{
  return (NSString *)sub_1A5F0DAF8();
}

- (NSString)name
{
  return (NSString *)sub_1A5F0DAF8();
}

- (NSString)version
{
  return (NSString *)sub_1A5F0DAF8();
}

- (int64_t)build
{
  AAClient *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1A5F0D950();

  return v3;
}

- (NSString)buildNumber
{
  return (NSString *)sub_1A5F0DAF8();
}

- (NSString)fullVersion
{
  AAClient *v2;
  void *v3;

  v2 = self;
  swift_bridgeObjectRetain();
  sub_1A5F641B4();
  swift_bridgeObjectRetain();
  sub_1A5F641B4();

  swift_bridgeObjectRelease();
  v3 = (void *)sub_1A5F6410C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (AAClient)initWithBundle:(id)a3
{
  AAClient *result;

  Client.init(bundle:)(a3);
  return result;
}

- (AAClient)initWithIdentifier:(id)a3 name:(id)a4 version:(id)a5 build:(int64_t)a6
{
  sub_1A5F64130();
  sub_1A5F64130();
  sub_1A5F64130();
  return (AAClient *)Client.init(identifier:name:version:build:)();
}

- (AAClient)init
{
  AAClient *result;

  result = (AAClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
