@implementation PreferencePane

+ (_TtC12NanoUniverse14PreferencePane)aegirRenderingPreferencePane
{
  if (qword_253F00840 != -1)
    swift_once();
  return (_TtC12NanoUniverse14PreferencePane *)(id)qword_253F00818;
}

- (id)fractionValueForOption:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC12NanoUniverse14PreferencePane *v7;
  double v8;
  char v9;
  id v10;

  v4 = sub_2134D9004();
  v6 = v5;
  v7 = self;
  v8 = COERCE_DOUBLE(sub_2134C4BDC(v4, v6));
  if ((v9 & 1) != 0)
    v10 = 0;
  else
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v8 / 100.0);

  swift_bridgeObjectRelease();
  return v10;
}

+ (_TtC12NanoUniverse14PreferencePane)calliopeRenderingPreferencePane
{
  if (qword_253F00698 != -1)
    swift_once();
  return (_TtC12NanoUniverse14PreferencePane *)(id)qword_253F00688;
}

- (NSString)name
{
  _TtC12NanoUniverse14PreferencePane *v3;
  void *v4;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_2134D8F14();
  swift_release();
  swift_release();

  v4 = (void *)sub_2134D8FE0();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (void)setName:(id)a3
{
  _TtC12NanoUniverse14PreferencePane *v4;

  sub_2134D9004();
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_2134D8F20();
}

- (NSArray)panes
{
  _TtC12NanoUniverse14PreferencePane *v3;
  void *v4;
  uint64_t v6;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_2134D8F14();
  swift_release();
  swift_release();

  if (!v6)
    return (NSArray *)0;
  type metadata accessor for PreferencePane();
  v4 = (void *)sub_2134D9034();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

- (void)setPanes:(id)a3
{
  _TtC12NanoUniverse14PreferencePane *v4;

  if (a3)
  {
    type metadata accessor for PreferencePane();
    sub_2134D9040();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_2134D8F20();
}

- (unsigned)changeSequence
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_changeSequence);
  swift_beginAccess();
  return *v2;
}

- (void)setChangeSequence:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_changeSequence);
  swift_beginAccess();
  *v4 = a3;
}

- (NSArray)sliders
{
  return (NSArray *)sub_2134C31BC();
}

- (void)setSliders:(id)a3
{
  sub_2134C3238((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_sliders);
}

- (NSArray)toggles
{
  return (NSArray *)sub_2134C31BC();
}

- (void)setToggles:(id)a3
{
  sub_2134C3238((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_toggles);
}

- (NSArray)pickersSelections
{
  return (NSArray *)sub_2134C31BC();
}

- (void)setPickersSelections:(id)a3
{
  sub_2134C3238((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickersSelections);
}

- (NSDictionary)defaultSliders
{
  return (NSDictionary *)sub_2134C3410();
}

- (void)setDefaultSliders:(id)a3
{
  sub_2134C34E8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x24BEE13C8], &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultSliders);
}

- (NSDictionary)defaultToggles
{
  return (NSDictionary *)sub_2134C3410();
}

- (void)setDefaultToggles:(id)a3
{
  sub_2134C34E8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x24BEE1328], &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultToggles);
}

- (NSDictionary)defaultPickersSelections
{
  return (NSDictionary *)sub_2134C3410();
}

- (void)setDefaultPickersSelections:(id)a3
{
  sub_2134C34E8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x24BEE0D00], &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultPickersSelections);
}

- (NSDictionary)pickerOptions
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickerOptions);
  swift_beginAccess();
  if (!*v2)
    return (NSDictionary *)0;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9EF20);
  v3 = (void *)sub_2134D8FB0();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (void)setPickerOptions:(id)a3
{
  uint64_t v3;
  uint64_t *v5;

  v3 = (uint64_t)a3;
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B9EF20);
    v3 = sub_2134D8FBC();
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickerOptions);
  swift_beginAccess();
  *v5 = v3;
  swift_bridgeObjectRelease();
}

- (_TtP12NanoUniverse22PreferencePaneDelegate_)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_delegate;
  swift_beginAccess();
  return (_TtP12NanoUniverse22PreferencePaneDelegate_ *)(id)MEMORY[0x2199B519C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_TtC12NanoUniverse14PreferencePane)initWithName:(id)a3 panes:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = sub_2134D9004();
  v6 = v5;
  type metadata accessor for PreferencePane();
  v7 = sub_2134D9040();
  return (_TtC12NanoUniverse14PreferencePane *)PreferencePane.init(name:panes:)(v4, v6, v7);
}

- (_TtC12NanoUniverse14PreferencePane)initWithName:(id)a3 userDefaults:(id)a4 sliders:(id)a5 toggles:(id)a6 pickerOptions:(id)a7 pickerSelections:(id)a8
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v9 = sub_2134D9004();
  v11 = v10;
  v12 = sub_2134D8FBC();
  v13 = sub_2134D8FBC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9EF20);
  v14 = sub_2134D8FBC();
  v15 = sub_2134D8FBC();
  v16 = a4;
  return (_TtC12NanoUniverse14PreferencePane *)PreferencePane.init(name:userDefaults:sliders:toggles:pickerOptions:pickerSelections:)(v9, v11, a4, v12, v13, v14, v15);
}

- (id)getValueForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC12NanoUniverse14PreferencePane *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _QWORD v15[3];
  uint64_t v16;

  v4 = sub_2134D9004();
  v6 = v5;
  v7 = self;
  sub_2134C5030(v4, v6, (uint64_t)v15);

  swift_bridgeObjectRelease();
  v8 = v16;
  if (!v16)
    return 0;
  v9 = __swift_project_boxed_opaque_existential_0(v15, v16);
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v9, v9);
  v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v12);
  v13 = (void *)sub_2134D922C();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  return v13;
}

- (void)set:(id)a3 forKey:(id)a4
{
  id v6;
  _TtC12NanoUniverse14PreferencePane *v7;
  id v8;
  _TtC12NanoUniverse14PreferencePane *v9;
  _OWORD v10[2];

  if (a3)
  {
    v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_2134D9160();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v8 = a4;
    v9 = self;
  }
  sub_2134D9004();

  sub_2134C5480((uint64_t)v10);
  swift_bridgeObjectRelease();

  sub_2134C52FC((uint64_t)v10);
}

- (void)preferencePaneDidChangeWithPreference:(id)a3
{
  char *v5;
  void *v6;
  id v7;
  _TtC12NanoUniverse14PreferencePane *v8;
  _DWORD *v9;

  v5 = (char *)self + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_delegate;
  swift_beginAccess();
  v6 = (void *)MEMORY[0x2199B519C](v5);
  v7 = a3;
  v8 = self;
  if (v6)
  {
    objc_msgSend(v6, sel_preferencePaneDidChangeWithPreference_, v7);
    swift_unknownObjectRelease();
  }
  v9 = (_DWORD *)((char *)v8 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_changeSequence);
  swift_beginAccess();
  ++*v9;

}

- (void)reset
{
  _TtC12NanoUniverse14PreferencePane *v2;

  v2 = self;
  sub_2134C584C();

}

- (_TtC12NanoUniverse14PreferencePane)init
{
  _TtC12NanoUniverse14PreferencePane *result;

  result = (_TtC12NanoUniverse14PreferencePane *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC12NanoUniverse14PreferencePane__name;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9EF10);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC12NanoUniverse14PreferencePane__panes;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F00778);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2134C6AC8((uint64_t)self + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_delegate);

}

@end
