@implementation DuplicatesUIHelper

- (_TtC10ContactsUI18DuplicatesUIHelper)initWithDelegate:(id)a3
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI18DuplicatesUIHelper_delegate) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DuplicatesUIHelper();
  swift_unknownObjectRetain();
  return -[DuplicatesUIHelper init](&v4, sel_init);
}

- (id)duplicateContactsListViewController:(BOOL)a3
{
  _TtC10ContactsUI18DuplicatesUIHelper *v4;
  void *v5;

  v4 = self;
  v5 = (void *)sub_18AD04044(a3);

  return v5;
}

- (_TtC10ContactsUI18DuplicatesUIHelper)init
{
  _TtC10ContactsUI18DuplicatesUIHelper *result;

  result = (_TtC10ContactsUI18DuplicatesUIHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
