@implementation FollowingCommandHandler

- (_TtC8NewsFeed23FollowingCommandHandler)init
{
  _TtC8NewsFeed23FollowingCommandHandler *result;

  result = (_TtC8NewsFeed23FollowingCommandHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8NewsFeed23FollowingCommandHandler_subscriptionController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed23FollowingCommandHandler_followingManager);
  sub_1BA8FD860((uint64_t)self + OBJC_IVAR____TtC8NewsFeed23FollowingCommandHandler_commandCenter);

}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  id v13;
  _TtC8NewsFeed23FollowingCommandHandler *v14;

  if (a4)
  {
    sub_1BB873030();
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a5)
LABEL_3:
    sub_1BB873030();
LABEL_4:
  if (a6)
    sub_1BB873030();
  if (a7)
    sub_1BB873030();
  v13 = a3;
  v14 = self;
  if (MEMORY[0x1BCCE5D40]((char *)v14 + OBJC_IVAR____TtC8NewsFeed23FollowingCommandHandler_commandCenter))
  {
    swift_getObjectType();
    if (qword_1ED3BA900 != -1)
      swift_once();
    sub_1BB86FF1C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
