@implementation DebugInspectorContainerViewControllerFactory

+ (id)inspectorViewControllerForConversations:(id)a3
{
  id v3;

  sub_18E00F31C(0, (unint64_t *)&unk_1EE0F5020);
  sub_18E768AE0();
  v3 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE10D7B8));
  return (id)sub_18E7675EC();
}

+ (id)inspectorViewControllerForMessage:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10D7C0);
  sub_18E768210();
  v4 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE10D7C8));
  v5 = (void *)sub_18E7675EC();

  return v5;
}

+ (id)inspectorViewControllerForChatItems:(id)a3 parallelIndexes:(id)a4
{
  unint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;

  sub_18E00F31C(0, (unint64_t *)&qword_1EE0FA970);
  v4 = sub_18E768AE0();
  sub_18E00F31C(0, (unint64_t *)&qword_1EE0FB940);
  v5 = sub_18E768AE0();
  sub_18E62811C(v4, v5);
  v6 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE10D7D0));
  v7 = (void *)sub_18E7675EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

+ (id)debugMenuViewController
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  id v9;
  uint64_t v11;

  v2 = type metadata accessor for DebugMenuView();
  MEMORY[0x1E0C80A78](v2);
  v4 = (uint64_t *)((char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - v6;
  *v4 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10CA20);
  swift_storeEnumTagMultiPayload();
  v8 = (char *)v4 + *(int *)(v2 + 20);
  *(_QWORD *)v8 = sub_18E5CBA58;
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = 0;
  sub_18E565E94((uint64_t)v4, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for DebugMenuView);
  v9 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE10D7D8));
  return (id)sub_18E7675EC();
}

- (_TtC7ChatKit44DebugInspectorContainerViewControllerFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DebugInspectorContainerViewControllerFactory();
  return -[DebugInspectorContainerViewControllerFactory init](&v3, sel_init);
}

@end
