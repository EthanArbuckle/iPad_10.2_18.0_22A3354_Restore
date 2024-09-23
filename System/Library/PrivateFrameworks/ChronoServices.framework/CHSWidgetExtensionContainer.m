@implementation CHSWidgetExtensionContainer

- (BOOL)isEqual:(id)a3
{
  CHSWidgetExtensionContainer *v4;
  CHSWidgetExtensionContainer *v5;
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
  v6 = CHSWidgetExtensionContainer.isEqual(_:)((uint64_t)v8);

  sub_18FB1F7C4((uint64_t)v8);
  return v6 & 1;
}

- (NSSet)allExtensions
{
  unint64_t v2;
  void *v3;

  v2 = swift_bridgeObjectRetain();
  sub_18FB820D8(v2, (unint64_t *)&qword_1EE189E10, (uint64_t)off_1E2A568B0, (unint64_t *)&qword_1EE189E20, (void (*)(id *, uint64_t))sub_18FB1F34C);
  swift_bridgeObjectRelease();
  sub_18FB1F254(0, (unint64_t *)&qword_1EE189E10);
  sub_18FB8270C((unint64_t *)&qword_1EE189E20, (unint64_t *)&qword_1EE189E10);
  v3 = (void *)sub_18FBCD310();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (CHSWidgetExtensionContainer)init
{
  id v3;
  CHSWidgetExtensionContainer *v4;
  objc_class *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSWidgetExtensionContainer_storage) = (Class)MEMORY[0x1E0DEE9D8];
  v3 = objc_allocWithZone((Class)CHSIconResolver);
  v4 = self;
  v5 = (objc_class *)objc_msgSend(v3, sel_init);
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR___CHSWidgetExtensionContainer_iconResolver) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)CHSWidgetExtensionContainer;
  return -[CHSWidgetExtensionContainer init](&v7, sel_init);
}

- (NSString)containerBundleIdentifier
{
  CHSWidgetExtensionContainer *v2;
  void *v3;
  char *v4;
  char *v5;
  NSString *result;
  void *v7;

  v2 = self;
  v3 = (void *)sub_18FB7CB90();
  v4 = (char *)objc_msgSend(v3, sel_identity);

  v5 = &v4[OBJC_IVAR___CHSExtensionIdentity_containerBundleIdentifier];
  result = (NSString *)swift_beginAccess();
  if (*((_QWORD *)v5 + 1))
  {
    swift_bridgeObjectRetain();

    v7 = (void *)sub_18FBCD0B8();
    swift_bridgeObjectRelease();
    return (NSString *)v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSString)localizedContainerDisplayName
{
  CHSWidgetExtensionContainer *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = self;
  v3 = (void *)sub_18FB7CB90();
  v4 = objc_msgSend(v3, sel_containerBundleLocalizedDisplayName);

  sub_18FBCD0DC();
  v5 = (void *)sub_18FBCD0B8();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSArray)localExtensions
{
  CHSWidgetExtensionContainer *v2;
  void *v3;

  v2 = self;
  CHSWidgetExtensionContainer.localExtensions.getter();

  sub_18FB1F254(0, (unint64_t *)&qword_1EE189E10);
  v3 = (void *)sub_18FBCD280();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (NSDictionary)remoteExtensionsByDeviceIdentifier
{
  CHSWidgetExtensionContainer *v2;
  void *v3;

  v2 = self;
  CHSWidgetExtensionContainer.remoteExtensionsByDeviceIdentifier.getter();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE18B3D8);
  v3 = (void *)sub_18FBCD040();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (NSString)iconVersion
{
  CHSWidgetExtensionContainer *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  CHSWidgetExtensionContainer.iconVersion.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_18FBCD0B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)getIconWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  CHSWidgetExtensionContainer *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  CHSWidgetExtensionContainer.getIcon(completion:)((uint64_t)sub_18FB8267C, v5);

  swift_release();
}

- (id)extensionForExtensionIdentity:(id)a3
{
  id v4;
  CHSWidgetExtensionContainer *v5;
  unint64_t v6;
  void *v7;

  v4 = a3;
  v5 = self;
  v6 = swift_bridgeObjectRetain();
  v7 = sub_18FB81F44(v6);

  swift_bridgeObjectRelease();
  return v7;
}

- (NSString)description
{
  CHSWidgetExtensionContainer *v2;
  NSString *result;
  NSString *v4;
  id v5;
  void *v6;

  v2 = self;
  result = (NSString *)_sSo27CHSWidgetExtensionContainerC14ChronoServicesE18descriptionBuilder19withMultilinePrefixSo013BSDescriptionG0CSgSSSg_tF_0();
  if (result)
  {
    v4 = result;
    v5 = -[NSString build](result, sel_build);

    if (v5)
    {
      sub_18FBCD0DC();

      v6 = (void *)sub_18FBCD0B8();
      swift_bridgeObjectRelease();
      return (NSString *)v6;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (CHSWidgetExtensionContainer)initWithExtensions:(id)a3 iconResolver:(id)a4
{
  unint64_t v5;

  sub_18FB1F254(0, (unint64_t *)&qword_1EE189E10);
  v5 = sub_18FBCD28C();
  swift_unknownObjectRetain();
  return (CHSWidgetExtensionContainer *)sub_18FB7E294(v5, (uint64_t)a4);
}

@end
