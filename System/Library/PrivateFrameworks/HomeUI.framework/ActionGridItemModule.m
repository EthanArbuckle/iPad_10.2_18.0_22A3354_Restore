@implementation ActionGridItemModule

- (id)buildItemProviders
{
  _TtC6HomeUI20ActionGridItemModule *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1B900AB10();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E930);
    sub_1B8E23178((unint64_t *)&qword_1ED57E940, (uint64_t *)&unk_1ED57E930, MEMORY[0x1E0DEFCF8]);
    v4 = (void *)sub_1B93EE0D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)actionSetValueSource:(id)a3 didUpdateValuesForActionBuilders:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC6HomeUI20ActionGridItemModule *v8;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF208250);
  sub_1B8E23178((unint64_t *)&qword_1EF20F380, (uint64_t *)&unk_1EF208250, MEMORY[0x1E0DEFCF8]);
  v6 = sub_1B93EE0FC();
  if (MEMORY[0x1BCCC1DA8]((char *)self + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_delegate))
  {
    v7 = a3;
    v8 = self;
    sub_1B8E78E1C(v6);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_actionBuilderContainer);
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_delegate);
}

@end
