@implementation PageControl.Coordinator

- (void)updateCurrentPageWithSender:(id)a3
{
  id v5;
  _TtCV10ContactsUI11PageControl11Coordinator *v6;

  swift_retain();
  swift_retain();
  v5 = a3;
  v6 = self;
  objc_msgSend(v5, sel_currentPage);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF988E0);
  sub_18AF4F8B4();

  swift_release();
  swift_release();
}

- (_TtCV10ContactsUI11PageControl11Coordinator)init
{
  _TtCV10ContactsUI11PageControl11Coordinator *result;

  result = (_TtCV10ContactsUI11PageControl11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
