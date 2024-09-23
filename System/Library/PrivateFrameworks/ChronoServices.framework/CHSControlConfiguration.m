@implementation CHSControlConfiguration

- (NSArray)controlItems
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for CHSControlConfigurationItem(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_18FBCD280();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setControlItems:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for CHSControlConfigurationItem(0);
  v4 = sub_18FBCD28C();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___CHSControlConfiguration_controlItems);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (CHSControlConfiguration)initWithControlItems:(id)a3
{
  objc_super v5;

  type metadata accessor for CHSControlConfigurationItem(0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSControlConfiguration_controlItems) = (Class)sub_18FBCD28C();
  v5.receiver = self;
  v5.super_class = (Class)CHSControlConfiguration;
  return -[CHSControlConfiguration init](&v5, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  CHSControlConfiguration *v4;
  CHSControlConfiguration *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_18FBCD478();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = CHSControlConfiguration.isEqual(_:)((uint64_t)v8);

  sub_18FB1F7C4((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  CHSControlConfiguration *v3;
  NSArray *v4;
  unint64_t v5;
  int64_t v6;
  _OWORD v8[4];
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  sub_18FBCD898();
  v3 = self;
  v4 = -[CHSControlConfiguration controlItems](v3, sel_controlItems);
  type metadata accessor for CHSControlConfigurationItem(0);
  v5 = sub_18FBCD28C();

  sub_18FB731D0((uint64_t)v8, v5);
  swift_bridgeObjectRelease();
  v12 = v8[2];
  v13 = v8[3];
  v14 = v9;
  v10 = v8[0];
  v11 = v8[1];
  v6 = sub_18FBCD880();

  return v6;
}

- (NSString)description
{
  CHSControlConfiguration *v2;
  void *v3;

  v2 = self;
  CHSControlConfiguration.description.getter();

  v3 = (void *)sub_18FBCD0B8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (CHSControlConfiguration)init
{
  CHSControlConfiguration *result;

  result = (CHSControlConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CHSControlConfiguration *v5;
  NSArray *v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = -[CHSControlConfiguration controlItems](v5, sel_controlItems);
  if (!v6)
  {
    type metadata accessor for CHSControlConfigurationItem(0);
    sub_18FBCD28C();
    v6 = (NSArray *)sub_18FBCD280();
    swift_bridgeObjectRelease();
  }
  v7 = (id)sub_18FBCD0B8();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);

}

- (CHSControlConfiguration)initWithCoder:(id)a3
{
  return (CHSControlConfiguration *)CHSControlConfiguration.init(coder:)(a3);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  CHSControlConfiguration *v7;
  Swift::String_optional v8;
  void *object;
  void *v10;

  if (a3)
  {
    v4 = sub_18FBCD0DC();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  object = CHSControlConfiguration.description(withMultilinePrefix:)(v8).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    v10 = (void *)sub_18FBCD0B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  CHSControlConfiguration *v4;
  id v5;

  if (a3)
    sub_18FBCD0DC();
  v4 = self;
  v5 = _sSo23CHSControlConfigurationC14ChronoServicesE18descriptionBuilder19withMultilinePrefixSo013BSDescriptionF0CSgSSSg_tF_0();

  swift_bridgeObjectRelease();
  return v5;
}

- (id)succinctDescription
{
  CHSControlConfiguration *v2;
  id result;
  id v4;
  id v5;
  void *v6;

  v2 = self;
  result = -[CHSControlConfiguration succinctDescriptionBuilder](v2, sel_succinctDescriptionBuilder);
  if (result)
  {
    v4 = result;
    v5 = objc_msgSend(result, sel_build);

    if (v5)
    {
      sub_18FBCD0DC();

      v6 = (void *)sub_18FBCD0B8();
      swift_bridgeObjectRelease();
    }
    else
    {

      v6 = 0;
    }
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)succinctDescriptionBuilder
{
  CHSControlConfiguration *v2;
  id v3;

  v2 = self;
  v3 = CHSControlConfiguration.succinctDescriptionBuilder()();

  return v3;
}

@end
