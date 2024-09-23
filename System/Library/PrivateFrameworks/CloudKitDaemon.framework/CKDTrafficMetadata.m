@implementation CKDTrafficMetadata

- (NSDate)timestamp
{
  return (NSDate *)sub_1BEA0396C((uint64_t)self, (uint64_t)a2, (uint64_t *)&unk_1EF570DB0, (void (*)(void))sub_1BEA038C0, (uint64_t)MEMORY[0x1E0CB0870], MEMORY[0x1E0CB06B8]);
}

- (void)setTimestamp:(id)a3
{
  sub_1BEA03AC0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t *)&unk_1EF570DB0, (void (*)(uint64_t))MEMORY[0x1E0CB07E8], (uint64_t)MEMORY[0x1E0CB0870], sub_1BEA038F8);
}

- (NSURL)url
{
  return (NSURL *)sub_1BEA0396C((uint64_t)self, (uint64_t)a2, &qword_1EF5709C8, (void (*)(void))sub_1BEA03A0C, (uint64_t)MEMORY[0x1E0CAFFF8], (uint64_t (*)(void))MEMORY[0x1E0CAFE38]);
}

- (void)setUrl:(id)a3
{
  sub_1BEA03AC0(self, (uint64_t)a2, (uint64_t)a3, &qword_1EF5709C8, (void (*)(uint64_t))MEMORY[0x1E0CAFF00], (uint64_t)MEMORY[0x1E0CAFFF8], sub_1BEA03B5C);
}

- (NSString)method
{
  return (NSString *)sub_1BEA03FB4((uint64_t)self, (uint64_t)a2, sub_1BEA03CAC);
}

- (void)setMethod:(id)a3
{
  sub_1BEA0405C(self, (uint64_t)a2, (uint64_t)a3, sub_1BEA03CC4);
}

- (int64_t)status
{
  int64_t result;

  sub_1BEA03D2C();
  return result;
}

- (void)setStatus:(int64_t)a3
{
  sub_1BEA03D88(a3);
}

- (NSDictionary)headers
{
  uint64_t v2;
  NSDictionary v3;

  sub_1BEA03E58();
  if (v2)
  {
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v3.super.isa = 0;
  }
  return (NSDictionary *)v3.super.isa;
}

- (void)setHeaders:(id)a3
{
  uint64_t v4;
  CKDTrafficMetadata *v5;

  if (a3)
    v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  else
    v4 = 0;
  v5 = self;
  sub_1BEA03F00(v4);

}

- (NSString)requestClassName
{
  return (NSString *)sub_1BEA03FB4((uint64_t)self, (uint64_t)a2, sub_1BEA03FF8);
}

- (void)setRequestClassName:(id)a3
{
  sub_1BEA0405C(self, (uint64_t)a2, (uint64_t)a3, sub_1BEA040CC);
}

- (BOOL)parsingStandaloneMessage
{
  return sub_1BEA041C0() & 1;
}

- (void)setParsingStandaloneMessage:(BOOL)a3
{
  sub_1BEA04224(a3);
}

- (CKDTrafficMetadata)init
{
  return (CKDTrafficMetadata *)TrafficMetadata.init()();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  self;
  sub_1BEA04450();
}

- (CKDTrafficMetadata)initWithCoder:(id)a3
{
  TrafficMetadata.init(coder:)((uint64_t)a3);
}

- (void).cxx_destruct
{
  sub_1BE9BEF00((uint64_t)self + OBJC_IVAR___CKDTrafficMetadata_timestamp, (uint64_t *)&unk_1EF570DB0);
  sub_1BE9BEF00((uint64_t)self + OBJC_IVAR___CKDTrafficMetadata_url, &qword_1EF5709C8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
