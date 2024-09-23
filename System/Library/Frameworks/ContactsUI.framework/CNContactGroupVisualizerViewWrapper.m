@implementation CNContactGroupVisualizerViewWrapper

- (UIViewController)hostingController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC10ContactsUI35CNContactGroupVisualizerViewWrapper_hostingController));
}

- (_TtC10ContactsUI35CNContactGroupVisualizerViewWrapper)initWithType:(int64_t)a3 contacts:(id)a4 limitContactsCount:(int64_t)a5
{
  unint64_t v7;

  if (a4)
  {
    sub_18ACF5E38();
    v7 = sub_18AF4FD34();
  }
  else
  {
    v7 = 0;
  }
  return (_TtC10ContactsUI35CNContactGroupVisualizerViewWrapper *)CNContactGroupVisualizerViewWrapper.init(type:contacts:limitContactsCount:)(a3, v7, a5);
}

- (_TtC10ContactsUI35CNContactGroupVisualizerViewWrapper)initWithType:(int64_t)a3 contacts:(id)a4
{
  void *v4;
  _TtC10ContactsUI35CNContactGroupVisualizerViewWrapper *v7;

  v4 = a4;
  if (a4)
  {
    sub_18ACF5E38();
    sub_18AF4FD34();
    v4 = (void *)sub_18AF4FD28();
    swift_bridgeObjectRelease();
  }
  v7 = -[CNContactGroupVisualizerViewWrapper initWithType:contacts:limitContactsCount:](self, sel_initWithType_contacts_limitContactsCount_, a3, v4, -1);

  return v7;
}

- (_TtC10ContactsUI35CNContactGroupVisualizerViewWrapper)init
{
  _TtC10ContactsUI35CNContactGroupVisualizerViewWrapper *result;

  result = (_TtC10ContactsUI35CNContactGroupVisualizerViewWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI35CNContactGroupVisualizerViewWrapper_hostingController));
}

@end
