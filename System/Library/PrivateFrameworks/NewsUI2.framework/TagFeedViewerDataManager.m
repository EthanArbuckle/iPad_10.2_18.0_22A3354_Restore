@implementation TagFeedViewerDataManager

- (_TtC7NewsUI224TagFeedViewerDataManager)init
{
  _TtC7NewsUI224TagFeedViewerDataManager *result;

  result = (_TtC7NewsUI224TagFeedViewerDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI224TagFeedViewerDataManager_delegate);

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI224TagFeedViewerDataManager_issueModelFactory);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI224TagFeedViewerDataManager_subscriptionController));
  swift_release();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI224TagFeedViewerDataManager_sportsGraphManager);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)privateChannelMembershipController:(id)a3 didAddMemberships:(id)a4 changedMemberships:(id)a5 removedMemberships:(id)a6
{
  id v7;
  _TtC7NewsUI224TagFeedViewerDataManager *v8;

  v7 = a3;
  v8 = self;
  sub_1D6C4056C();

}

@end
