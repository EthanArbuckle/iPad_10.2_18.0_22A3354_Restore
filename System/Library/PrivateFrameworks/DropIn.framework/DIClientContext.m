@implementation DIClientContext

- (DIClientContext)initWithHomeIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  DIClientContext *result;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D4B90);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_23A769334();
    v7 = sub_23A76934C();
    v8 = 0;
  }
  else
  {
    v7 = sub_23A76934C();
    v8 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v6, v8, 1, v7);
  ClientContext.init(homeIdentifier:)();
  return result;
}

- (BOOL)isEqual:(id)a3
{
  DIClientContext *v4;
  DIClientContext *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23A7696E8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = ClientContext.isEqual(_:)();

  sub_23A764FC4((uint64_t)v8, &qword_2542D4880);
  return v6 & 1;
}

- (NSString)description
{
  DIClientContext *v2;
  void *v3;

  v2 = self;
  ClientContext.description.getter();

  v3 = (void *)sub_23A769478();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  DIClientContext *v5;

  v4 = a3;
  v5 = self;
  ClientContext.encode(with:)((NSCoder)v4);

}

- (DIClientContext)initWithCoder:(id)a3
{
  return (DIClientContext *)ClientContext.init(coder:)(a3);
}

- (DIClientContext)init
{
  ClientContext.init()();
}

- (void).cxx_destruct
{
  sub_23A764FC4((uint64_t)self + OBJC_IVAR___DIClientContext_homeIdentifier, (uint64_t *)&unk_2542D4B90);
}

@end
