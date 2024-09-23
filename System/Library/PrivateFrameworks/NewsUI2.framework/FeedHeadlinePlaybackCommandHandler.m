@implementation FeedHeadlinePlaybackCommandHandler

- (_TtC7NewsUI234FeedHeadlinePlaybackCommandHandler)init
{
  _TtC7NewsUI234FeedHeadlinePlaybackCommandHandler *result;

  result = (_TtC7NewsUI234FeedHeadlinePlaybackCommandHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI234FeedHeadlinePlaybackCommandHandler_readingHistory));
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI234FeedHeadlinePlaybackCommandHandler_commandCenter);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI234FeedHeadlinePlaybackCommandHandler_audioPlaybackContext);
  swift_release();
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC7NewsUI234FeedHeadlinePlaybackCommandHandler *v8;

  sub_1D5F75020();
  v6 = sub_1D6E267D4();
  v7 = a3;
  v8 = self;
  sub_1D6C30F08(v6);

  swift_bridgeObjectRelease();
}

@end
