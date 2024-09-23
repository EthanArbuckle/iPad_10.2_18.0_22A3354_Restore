@implementation CHSControlConfigurationItem

- (NSString)uniqueIdentifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_18FBCD0B8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CHSControlIdentity)controlIdentity
{
  return (CHSControlIdentity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___CHSControlConfigurationItem__controlIdentity));
}

- (int64_t)location
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___CHSControlConfigurationItem_location);
}

- (unint64_t)pushPolicy
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___CHSControlConfigurationItem__pushPolicy);
}

- (CHSControlConfigurationItem)initWithUniqueIdentifier:(id)a3 controlIdentity:(id)a4 location:(int64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  CHSControlConfigurationItem *v11;

  v7 = sub_18FBCD0DC();
  v9 = v8;
  v10 = a4;
  v11 = (CHSControlConfigurationItem *)sub_18FB76A94(v7, v9, v10, a5);

  return v11;
}

- (BOOL)canAppearInSecureEnvironment
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CHSControlConfigurationItem__canAppearInSecureEnvironment);
}

- (BOOL)supportsLowLuminance
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CHSControlConfigurationItem__supportsLowLuminance);
}

- (unint64_t)supportedColorSchemes
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___CHSControlConfigurationItem__supportedColorSchemes);
}

- (BOOL)isEqual:(id)a3
{
  CHSControlConfigurationItem *v4;
  CHSControlConfigurationItem *v5;
  BOOL v6;
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
  v6 = CHSControlConfigurationItem.isEqual(_:)((uint64_t)v8);

  sub_18FB1F7C4((uint64_t)v8);
  return v6;
}

- (int64_t)hash
{
  CHSControlConfigurationItem *v2;
  int64_t v3;

  v2 = self;
  v3 = CHSControlConfigurationItem.hash.getter();

  return v3;
}

- (NSString)description
{
  CHSControlConfigurationItem *v2;
  void *v3;

  v2 = self;
  CHSControlConfigurationItem.description.getter();

  v3 = (void *)sub_18FBCD0B8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (CHSControlConfigurationItem)initWithUniqueIdentifier:(id)a3 controlIdentity:(id)a4
{
  id v6;
  void *v7;
  CHSControlConfigurationItem *v8;

  sub_18FBCD0DC();
  v6 = a4;
  v7 = (void *)sub_18FBCD0B8();
  swift_bridgeObjectRelease();
  v8 = -[CHSControlConfigurationItem initWithUniqueIdentifier:controlIdentity:location:](self, sel_initWithUniqueIdentifier_controlIdentity_location_, v7, v6, 0);

  return v8;
}

- (CHSControlConfigurationItem)init
{
  CHSControlConfigurationItem *result;

  result = (CHSControlConfigurationItem *)_swift_stdlib_reportUnimplementedInitializer();
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
  CHSControlConfigurationItem *v5;

  v4 = a3;
  v5 = self;
  CHSControlConfigurationItem.encode(with:)((NSCoder)v4);

}

- (CHSControlConfigurationItem)initWithCoder:(id)a3
{
  return (CHSControlConfigurationItem *)CHSControlConfigurationItem.init(coder:)(a3);
}

@end
