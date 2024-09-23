@implementation _EXHostConfiguration

- (void).cxx_destruct
{

  sub_190C2FC70(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_interruptionHandler));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_190C38990((uint64_t)self + OBJC_IVAR____EXHostConfiguration_networkApplicationID, &qword_1ECD98D60);
}

- (_EXHostConfiguration)init
{
  return (_EXHostConfiguration *)sub_190C77CC8();
}

- (_EXHostConfiguration)initWithExtensionIdentity:(id)a3
{
  id v4;
  id v5;
  _EXHostConfiguration *v6;

  v4 = objc_allocWithZone((Class)type metadata accessor for _EXHostConfiguration());
  v5 = a3;
  v6 = (_EXHostConfiguration *)sub_190C39EB8(v5, 0);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

- (_EXHostConfiguration)initWithExtensionIdentity:(id)a3 instanceIdentifier:(id)a4
{
  id v5;
  id v6;
  _EXHostConfiguration *v7;

  v5 = a3;
  v6 = a4;
  v7 = (_EXHostConfiguration *)sub_190C39EB8(v5, v6);

  return v7;
}

- (_EXExtensionIdentity)extensionIdentity
{
  return (_EXExtensionIdentity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR____EXHostConfiguration__extensionIdentity));
}

- (void)setExtensionIdentity:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration__extensionIdentity);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration__extensionIdentity) = (Class)a3;
  v3 = a3;

}

- (id)interruptionHandler
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  if (!*(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_interruptionHandler))
    return 0;
  v2 = *(_QWORD *)&self->_extensionIdentity[OBJC_IVAR____EXHostConfiguration_interruptionHandler];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_interruptionHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 1107296256;
  v5[2] = sub_190C2A3B4;
  v5[3] = &block_descriptor_2;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (void)setInterruptionHandler:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;

  v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v5;
    v6 = sub_190C45C28;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____EXHostConfiguration_interruptionHandler);
  v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_interruptionHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_190C2FC70(v8);
}

- (_EXExtensionInstanceIdentifier)instanceIdentifier
{
  return (_EXExtensionInstanceIdentifier *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____EXHostConfiguration_instanceIdentifier));
}

- (void)setInstanceIdentifier:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_instanceIdentifier);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_instanceIdentifier) = (Class)a3;
  v3 = a3;

}

- (NSArray)preferredLanguages
{
  void *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_preferredLanguages))
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
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_preferredLanguages) = v4;
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
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_additionalEnvironmentVariables) = (Class)sub_190CA859C();
  swift_bridgeObjectRelease();
}

- (NSString)sandboxProfileName
{
  void *v2;

  if (*(_QWORD *)&self->_extensionIdentity[OBJC_IVAR____EXHostConfiguration_sandboxProfileName])
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
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____EXHostConfiguration_sandboxProfileName);
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease();
}

- (_EXPersona)launchPersona
{
  return (_EXPersona *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR____EXHostConfiguration_launchPersona));
}

- (void)setLaunchPersona:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_launchPersona);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_launchPersona) = (Class)a3;
  v3 = a3;

}

- (NSArray)assertionAttributes
{
  void *v2;

  sub_190C7953C();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_190CA86B0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setAssertionAttributes:(id)a3
{
  sub_190C7953C();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_assertionAttributes) = (Class)sub_190CA86BC();
  swift_bridgeObjectRelease();
}

- (BOOL)requireInvalidation
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_requireInvalidation);
}

- (void)setRequireInvalidation:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_requireInvalidation) = a3;
}

- (id)copyWithZone:(void *)a3
{
  _EXHostConfiguration *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_190C787EC(v6);

  __swift_project_boxed_opaque_existential_2Tm(v6, v6[3]);
  v4 = (void *)sub_190CA8BC0();
  __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v6);
  return v4;
}

- (NSString)description
{
  _EXHostConfiguration *v2;
  void *v3;

  v2 = self;
  sub_190C78A94();

  v3 = (void *)sub_190CA85D8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (RBSProcessIdentity)rbsProcessIdentity
{
  _EXHostConfiguration *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_190C78C7C();

  return (RBSProcessIdentity *)v3;
}

- (_EXHostConfiguration)initWithExtension:(id)a3
{
  swift_unknownObjectRetain();
  return (_EXHostConfiguration *)sub_190C78F84();
}

- (_EXHostConfiguration)initWithExtension:(id)a3 instanceIdentifier:(id)a4
{
  _EXHostConfiguration *v6;

  swift_unknownObjectRetain();
  v6 = (_EXHostConfiguration *)sub_190C79410((uint64_t)a3, a4);
  swift_unknownObjectRelease();
  return v6;
}

- (_EXExtensionRepresenting)extension
{
  _EXExtensionRepresenting *result;

  result = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration__extensionIdentity);
  if (result)
    return result;
  __break(1u);
  return result;
}

- (void)setExtension:(id)a3
{
  _EXHostConfiguration *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_190C791C4();

}

@end
