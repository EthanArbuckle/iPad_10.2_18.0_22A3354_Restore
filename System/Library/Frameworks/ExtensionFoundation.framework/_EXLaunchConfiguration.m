@implementation _EXLaunchConfiguration

- (int64_t)hash
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____EXLaunchConfiguration_instanceIdentifier))
    return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____EXLaunchConfiguration_instanceIdentifier), sel_hash);
  else
    return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____EXLaunchConfiguration__extensionIdentity), sel_hash);
}

+ (BOOL)configureRBInfoOnLaunchContext:(id)a3 error:(id *)a4
{
}

- (NSString)description
{
  _EXLaunchConfiguration *v2;
  void *v3;

  v2 = self;
  sub_190C2A0E4();

  v3 = (void *)sub_190CA85D8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _EXLaunchConfiguration *v5;

  v4 = a3;
  v5 = self;
  sub_190C30D10(v4);

}

- (BOOL)isEqual:(id)a3
{
  _EXLaunchConfiguration *v4;
  _EXLaunchConfiguration *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_190CA8908();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_190C35BC0((uint64_t)v8);

  sub_190C38990((uint64_t)v8, &qword_1ECD98D20);
  return v6 & 1;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_190C38990((uint64_t)self + OBJC_IVAR____EXLaunchConfiguration_networkApplicationID, &qword_1ECD98D60);
}

- (_EXLaunchConfiguration)initWithCoder:(id)a3
{
  id v3;
  _EXLaunchConfiguration *v4;

  v3 = a3;
  v4 = (_EXLaunchConfiguration *)sub_190C81130((uint64_t)v3);

  return v4;
}

- (id)rbsProcessIdentityWithHost:(id)a3
{
  id v4;
  _EXLaunchConfiguration *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_190C31CC8((uint64_t)v4);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)configureLaunchContext:(id)a3 error:(id *)a4
{
}

- (_EXExtensionIdentity)extensionIdentity
{
  return (_EXExtensionIdentity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR____EXLaunchConfiguration__extensionIdentity));
}

- (_EXExtensionInstanceIdentifier)instanceIdentifier
{
  return (_EXExtensionInstanceIdentifier *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____EXLaunchConfiguration_instanceIdentifier));
}

- (void)setInstanceIdentifier:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXLaunchConfiguration_instanceIdentifier);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXLaunchConfiguration_instanceIdentifier) = (Class)a3;
  v3 = a3;

}

- (NSArray)preferredLanguages
{
  void *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____EXLaunchConfiguration_preferredLanguages))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_190CA86B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)setPreferredLanguages:(id)a3
{
  objc_class *v4;

  if (a3)
    v4 = (objc_class *)sub_190CA86BC();
  else
    v4 = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXLaunchConfiguration_preferredLanguages) = v4;
  swift_bridgeObjectRelease();
}

- (NSString)sandboxProfileName
{
  void *v2;

  if (*(_QWORD *)&self->_extensionIdentity[OBJC_IVAR____EXLaunchConfiguration_sandboxProfileName])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_190CA85D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setSandboxProfileName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  if (a3)
  {
    v4 = sub_190CA85F0();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____EXLaunchConfiguration_sandboxProfileName);
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease();
}

- (NSDictionary)additionalEnvironmentVariables
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_190CA8590();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setAdditionalEnvironmentVariables:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXLaunchConfiguration_additionalEnvironmentVariables) = (Class)sub_190CA859C();
  swift_bridgeObjectRelease();
}

- (_EXPersona)launchPersona
{
  return (_EXPersona *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR____EXLaunchConfiguration_launchPersona));
}

- (void)setLaunchPersona:(id)a3
{
  id v5;
  _EXLaunchConfiguration *v6;

  v5 = a3;
  v6 = self;
  sub_190C7FFE0(a3);

}

- (NSArray)assertionAttributes
{
  void *v2;

  sub_190C2B30C(0, (unint64_t *)&qword_1EE20A2C8);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_190CA86B0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setAssertionAttributes:(id)a3
{
  sub_190C2B30C(0, (unint64_t *)&qword_1EE20A2C8);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXLaunchConfiguration_assertionAttributes) = (Class)sub_190CA86BC();
  swift_bridgeObjectRelease();
}

- (_EXLaunchConfiguration)initWithExtensionIdentity:(id)a3
{
  id v3;
  _EXLaunchConfiguration *v4;

  v3 = a3;
  v4 = (_EXLaunchConfiguration *)sub_190C356E8(v3);

  return v4;
}

- (BOOL)isLaunchConfigurationEqual:(id)a3
{
  id v4;
  _EXLaunchConfiguration *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_190C35CDC((uint64_t)v4);

  return self & 1;
}

- (_EXLaunchConfiguration)init
{
  _EXLaunchConfiguration *result;

  result = (_EXLaunchConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
