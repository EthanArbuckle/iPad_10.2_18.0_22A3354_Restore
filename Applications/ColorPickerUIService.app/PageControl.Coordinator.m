@implementation PageControl.Coordinator

- (void)valueChanged:(id)a3
{
  uint64_t v4;
  id v5;
  _TtCV20ColorPickerUIService11PageControl11Coordinator *v6;
  id v7;
  uint64_t KeyPath;
  uint64_t v9;
  id v10;
  char v11;

  v4 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV20ColorPickerUIService11PageControl11Coordinator_parent];
  v5 = a3;
  v6 = self;
  swift_retain(v4);
  v7 = objc_msgSend(v5, "currentPage");
  KeyPath = swift_getKeyPath(&unk_100044898);
  v9 = swift_getKeyPath(&unk_1000448C0);
  v10 = v7;
  v11 = 0;
  static Published.subscript.setter(&v10, v4, KeyPath, v9);

}

- (_TtCV20ColorPickerUIService11PageControl11Coordinator)init
{
  _TtCV20ColorPickerUIService11PageControl11Coordinator *result;

  result = (_TtCV20ColorPickerUIService11PageControl11Coordinator *)_swift_stdlib_reportUnimplementedInitializer("ColorPickerUIService.Coordinator", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->parent[OBJC_IVAR____TtCV20ColorPickerUIService11PageControl11Coordinator_parent]);
}

@end
