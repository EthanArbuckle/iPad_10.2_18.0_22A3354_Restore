@implementation GMFooterUtility

- (_TtC24AssistantSettingsSupport15GMFooterUtility)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GMFooterUtility();
  return -[GMFooterUtility init](&v3, sel_init);
}

- (void)updateFooterWithSpecifier:(id)a3
{
  id v4;
  _TtC24AssistantSettingsSupport15GMFooterUtility *v5;

  v4 = a3;
  v5 = self;
  sub_21541CCC8(v4);

}

- (id)openStorageManagement
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id result;
  void *v12;
  void *v13;
  uint64_t v14;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC2FF8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_215429EC4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254DC2DE8 != -1)
    swift_once();
  v7 = sub_21542A0D4();
  __swift_project_value_buffer(v7, (uint64_t)qword_254DC4030);
  v8 = sub_21542A0BC();
  v9 = sub_21542A350();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2153F2000, v8, v9, "openStorageManagement being called", v10, 2u);
    MEMORY[0x2199E17B0](v10, -1, -1);
  }

  sub_215429EB8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
    return (id)sub_21541ACA0((uint64_t)v2, &qword_254DC2FF8);
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  result = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (result)
  {
    v12 = result;
    v13 = (void *)sub_215429EAC();
    objc_msgSend(v12, sel_openSensitiveURL_withOptions_, v13, 0);

    return (id)(*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end
