@implementation PuzzleProgressMessageHandler

- (_TtC8NewsFeed28PuzzleProgressMessageHandler)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&self->delegate[OBJC_IVAR____TtC8NewsFeed28PuzzleProgressMessageHandler_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[PuzzleProgressMessageHandler init](&v5, sel_init);
}

- (void).cxx_destruct
{
  sub_1BA8FD860((uint64_t)self + OBJC_IVAR____TtC8NewsFeed28PuzzleProgressMessageHandler_delegate);
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  _TtC8NewsFeed28PuzzleProgressMessageHandler *v6;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  sub_1BA92C67C(a3);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

@end
