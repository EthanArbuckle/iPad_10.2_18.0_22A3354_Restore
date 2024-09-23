@implementation IdentityProofingFeatureEnablementConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig *v7;
  void *v8;
  unsigned __int8 v9;
  _TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = a3;
  v7 = self;
  v8 = (void *)sub_1CFB01A04();
  v9 = objc_msgSend(v6, sel_decodeBoolForKey_, v8);

  *((_BYTE *)&v7->super.isa
  + OBJC_IVAR____TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig_isFedStatsOptinEnabled) = v9;

  v12.receiver = v7;
  v12.super_class = ObjectType;
  v10 = -[IdentityProofingFeatureEnablementConfig init](&v12, sel_init);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig *v6;
  id v7;

  v4 = *((unsigned __int8 *)&self->super.isa
       + OBJC_IVAR____TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig_isFedStatsOptinEnabled);
  v5 = a3;
  v6 = self;
  v7 = (id)sub_1CFB01A04();
  objc_msgSend(v5, sel_encodeBool_forKey_, v4, v7);

}

- (_TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig)init
{
  _TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig *result;

  result = (_TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
