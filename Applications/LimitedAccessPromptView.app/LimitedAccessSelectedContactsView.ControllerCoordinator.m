@implementation LimitedAccessSelectedContactsView.ControllerCoordinator

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  sub_1000146F4((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCV23LimitedAccessPromptView33LimitedAccessSelectedContactsView21ControllerCoordinator_completion);
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->completion[OBJC_IVAR____TtCV23LimitedAccessPromptView33LimitedAccessSelectedContactsView21ControllerCoordinator_completion]);
}

@end
