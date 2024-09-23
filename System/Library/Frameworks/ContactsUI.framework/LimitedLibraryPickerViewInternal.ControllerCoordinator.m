@implementation LimitedLibraryPickerViewInternal.ControllerCoordinator

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  unint64_t v6;
  id v7;
  _TtCV10ContactsUI32LimitedLibraryPickerViewInternal21ControllerCoordinator *v8;

  sub_18ACF5E38();
  v6 = sub_18AF4FD34();
  v7 = a3;
  v8 = self;
  sub_18ACF5A50(v6);

  swift_bridgeObjectRelease();
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4;

  v4 = a3;
  self;
  sub_18ACF5D54();
}

- (_TtCV10ContactsUI32LimitedLibraryPickerViewInternal21ControllerCoordinator)init
{
  _TtCV10ContactsUI32LimitedLibraryPickerViewInternal21ControllerCoordinator *result;

  result = (_TtCV10ContactsUI32LimitedLibraryPickerViewInternal21ControllerCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18ACEE8F4();
}

@end
