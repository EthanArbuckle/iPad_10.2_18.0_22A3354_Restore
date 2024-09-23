@implementation ColorPickerView.ColorPickerCoordinator

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  id v7;
  id v8;
  _TtCV13CalendarUIKit15ColorPickerView22ColorPickerCoordinator *v9;

  v7 = a4;
  v8 = a3;
  v9 = self;
  MEMORY[0x1BCCB5F78](v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1BC840);
  sub_1B8B9BF48();

}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  id v4;
  _TtCV13CalendarUIKit15ColorPickerView22ColorPickerCoordinator *v5;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_dismissViewControllerAnimated_completion_, 1, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1BC830);
  sub_1B8B9BF48();

}

- (_TtCV13CalendarUIKit15ColorPickerView22ColorPickerCoordinator)init
{
  _TtCV13CalendarUIKit15ColorPickerView22ColorPickerCoordinator *result;

  result = (_TtCV13CalendarUIKit15ColorPickerView22ColorPickerCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

@end
