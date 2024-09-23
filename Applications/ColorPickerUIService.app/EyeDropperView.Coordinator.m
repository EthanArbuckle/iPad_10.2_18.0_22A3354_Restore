@implementation EyeDropperView.Coordinator

- (void)buttonPressed:(id)a3
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtCV20ColorPickerUIServiceP33_DBD1622CFBB2996DAF9D1081F3537E2A14EyeDropperView11Coordinator *v12;
  char v13;

  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCV20ColorPickerUIServiceP33_DBD1622CFBB2996DAF9D1081F3537E2A14EyeDropperView11Coordinator_parent);
  if (v3)
  {
    KeyPath = swift_getKeyPath(&unk_100043C08);
    v5 = swift_getKeyPath(&unk_100043C30);
    v13 = 1;
    swift_retain(v3);
    static Published.subscript.setter(&v13, v3, KeyPath, v5);
  }
  else
  {
    v6 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV20ColorPickerUIServiceP33_DBD1622CFBB2996DAF9D1081F3537E2A14EyeDropperView11Coordinator_parent];
    v9 = type metadata accessor for ColorPickerState(0);
    v10 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    v11 = a3;
    v12 = self;
    EnvironmentObject.error()(0, v6, v9, v10);
    __break(1u);
  }
}

- (void)buttonUp:(id)a3
{
  id v4;
  _TtCV20ColorPickerUIServiceP33_DBD1622CFBB2996DAF9D1081F3537E2A14EyeDropperView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_10000C600();

}

- (_TtCV20ColorPickerUIServiceP33_DBD1622CFBB2996DAF9D1081F3537E2A14EyeDropperView11Coordinator)init
{
  _TtCV20ColorPickerUIServiceP33_DBD1622CFBB2996DAF9D1081F3537E2A14EyeDropperView11Coordinator *result;

  result = (_TtCV20ColorPickerUIServiceP33_DBD1622CFBB2996DAF9D1081F3537E2A14EyeDropperView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer("ColorPickerUIService.Coordinator", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCV20ColorPickerUIServiceP33_DBD1622CFBB2996DAF9D1081F3537E2A14EyeDropperView11Coordinator_parent));
}

@end
