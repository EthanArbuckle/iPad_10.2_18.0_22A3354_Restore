@implementation LimitedAccessContactPickerView.ControllerCoordinator

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  sub_1000146F4((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCV23LimitedAccessPromptView30LimitedAccessContactPickerView21ControllerCoordinator_completion);
}

- (void)contactPicker:(id)a3 didGoBackWithSelectedContacts:(id)a4
{
  sub_1000146F4((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCV23LimitedAccessPromptView30LimitedAccessContactPickerView21ControllerCoordinator_goBackBlock);
}

- (_TtCV23LimitedAccessPromptView30LimitedAccessContactPickerView21ControllerCoordinator)init
{
  _TtCV23LimitedAccessPromptView30LimitedAccessContactPickerView21ControllerCoordinator *result;

  result = (_TtCV23LimitedAccessPromptView30LimitedAccessContactPickerView21ControllerCoordinator *)_swift_stdlib_reportUnimplementedInitializer("LimitedAccessPromptView.ControllerCoordinator", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->completion[OBJC_IVAR____TtCV23LimitedAccessPromptView30LimitedAccessContactPickerView21ControllerCoordinator_completion]);
  swift_release(*(_QWORD *)&self->completion[OBJC_IVAR____TtCV23LimitedAccessPromptView30LimitedAccessContactPickerView21ControllerCoordinator_goBackBlock]);
}

@end
