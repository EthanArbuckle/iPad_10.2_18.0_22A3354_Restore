@implementation iOSPeoplePickerAddButtonHandler

- (_TtC15ConversationKit31iOSPeoplePickerAddButtonHandler)init
{
  return (_TtC15ConversationKit31iOSPeoplePickerAddButtonHandler *)iOSPeoplePickerAddButtonHandler.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit31iOSPeoplePickerAddButtonHandler_presenterViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit31iOSPeoplePickerAddButtonHandler_contactsSearchViewController));
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15ConversationKit31iOSPeoplePickerAddButtonHandler_addToken));
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  CNContactPickerViewController *v6;
  id v7;
  _TtC15ConversationKit31iOSPeoplePickerAddButtonHandler *v8;

  v6 = (CNContactPickerViewController *)a3;
  v7 = a4;
  v8 = self;
  iOSPeoplePickerAddButtonHandler.contactPicker(_:didSelect:)(v6, (CNContactProperty)v7);

}

- (void)contactPickerDidCancel:(id)a3
{
  CNContactPickerViewController *v4;
  _TtC15ConversationKit31iOSPeoplePickerAddButtonHandler *v5;

  v4 = (CNContactPickerViewController *)a3;
  v5 = self;
  iOSPeoplePickerAddButtonHandler.contactPickerDidCancel(_:)(v4);

}

@end
