@implementation IdentityLivenessConfig

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EFBC0BA0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EFBC0BA0 = a3;
}

- (_TtC13CoreIDVShared22IdentityLivenessConfig)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC13CoreIDVShared22IdentityLivenessConfig *v7;
  _TtC13CoreIDVShared22IdentityLivenessConfig *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for IdentityActiveLivenessConfig();
  v6 = a3;
  v7 = self;
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC13CoreIDVShared22IdentityLivenessConfig_active) = (Class)sub_1CFB02118();
  type metadata accessor for IdentityPassiveLivenessConfig();
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC13CoreIDVShared22IdentityLivenessConfig_passive) = (Class)sub_1CFB02118();

  v10.receiver = v7;
  v10.super_class = ObjectType;
  v8 = -[IdentityLivenessConfig init](&v10, sel_init);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC13CoreIDVShared22IdentityLivenessConfig *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared22IdentityLivenessConfig_active);
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1CFB01A04();
  objc_msgSend(v5, sel_encodeObject_forKey_, v4, v7);

  v8 = *(uint64_t *)((char *)&v6->super.isa + OBJC_IVAR____TtC13CoreIDVShared22IdentityLivenessConfig_passive);
  v9 = (id)sub_1CFB01A04();
  objc_msgSend(v5, sel_encodeObject_forKey_, v8, v9);

}

- (_TtC13CoreIDVShared22IdentityLivenessConfig)init
{
  _TtC13CoreIDVShared22IdentityLivenessConfig *result;

  result = (_TtC13CoreIDVShared22IdentityLivenessConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
