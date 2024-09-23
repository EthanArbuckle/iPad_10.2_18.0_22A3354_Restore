@implementation CHSWidgetExtensionSet

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (id)copyWithZone:(void *)a3
{
  CHSWidgetExtensionSet *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_18FBB0F6C(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_18FBCD7B4();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
  return v4;
}

- (NSArray)widgetExtensionContainers
{
  void *v2;

  type metadata accessor for CHSWidgetExtensionContainer(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_18FBCD280();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setWidgetExtensionContainers:(id)a3
{
  type metadata accessor for CHSWidgetExtensionContainer(0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSWidgetExtensionSet_widgetExtensionContainers) = (Class)sub_18FBCD28C();
  swift_bridgeObjectRelease();
}

- (NSSet)allExtensions
{
  void *v2;

  sub_18FB1F254(0, (unint64_t *)&qword_1EE189E10);
  sub_18FB1F28C();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_18FBCD310();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (void)setAllExtensions:(id)a3
{
  sub_18FB1F254(0, (unint64_t *)&qword_1EE189E10);
  sub_18FB1F28C();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSWidgetExtensionSet_allExtensions) = (Class)sub_18FBCD31C();
  swift_bridgeObjectRelease();
}

- (CHSWidgetExtensionSet)init
{
  return (CHSWidgetExtensionSet *)sub_18FBB0B38();
}

- (CHSWidgetExtensionSet)initWithExtensions:(id)a3 equivalentBundleIdentifierResolver:(id)a4 iconResolver:(id)a5
{
  uint64_t v7;

  sub_18FB1F254(0, (unint64_t *)&qword_1EE189E10);
  sub_18FB1F28C();
  v7 = sub_18FBCD31C();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (CHSWidgetExtensionSet *)sub_18FBB0C6C(v7, a4, (uint64_t)a5);
}

- (id)widgetExtensionContainerForContainerBundleIdentifier:(id)a3
{
  return sub_18FBB0EAC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_18FBB17A4);
}

- (id)widgetExtensionContainerForExtensionBundleIdentifier:(id)a3
{
  return sub_18FBB0EAC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_18FBB1AA8);
}

- (id)widgetExtensionForExtensionIdentity:(id)a3
{
  id v4;
  CHSWidgetExtensionSet *v5;
  NSArray *v6;
  unint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = self;
  v6 = -[CHSWidgetExtensionSet widgetExtensionContainers](v5, sel_widgetExtensionContainers);
  type metadata accessor for CHSWidgetExtensionContainer(0);
  v7 = sub_18FBCD28C();

  v8 = v4;
  v9 = sub_18FBB1D8C(v7, v8);
  swift_bridgeObjectRelease();

  v10 = objc_msgSend(v9, sel_extensionForExtensionIdentity_, v8);
  return v10;
}

@end
