@implementation ActivityAlertClient

- (_TtP18ActivityUIServices27ActivityAlertClientDelegate_)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC18ActivityUIServices19ActivityAlertClient_delegate;
  swift_beginAccess();
  return (_TtP18ActivityUIServices27ActivityAlertClientDelegate_ *)(id)MEMORY[0x22E31826C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_TtC18ActivityUIServices19ActivityAlertClient)init
{
  return (_TtC18ActivityUIServices19ActivityAlertClient *)ActivityAlertClient.init()();
}

- (void).cxx_destruct
{

  sub_22D817714((uint64_t)self + OBJC_IVAR____TtC18ActivityUIServices19ActivityAlertClient_delegate);
}

@end
