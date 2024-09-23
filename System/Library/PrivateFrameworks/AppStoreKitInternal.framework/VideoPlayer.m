@implementation VideoPlayer

- (void)play
{
  _TtC19AppStoreKitInternal11VideoPlayer *v2;

  v2 = self;
  sub_1D8397DE8();

}

- (void)dealloc
{
  _TtC19AppStoreKitInternal11VideoPlayer *v2;

  v2 = self;
  VideoPlayer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_1D83371E4((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal11VideoPlayer_videoUrl, &qword_1EDA3B650);

  sub_1D83371E4((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal11VideoPlayer_failure, &qword_1EDA3A848);
  swift_unknownObjectRelease();
  sub_1D8374F48((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal11VideoPlayer_delegate);
}

- (void)pause
{
  char *v2;
  char *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for VideoPlayer();
  v2 = (char *)v4.receiver;
  -[VideoPlayer pause](&v4, sel_pause);
  v3 = &v2[OBJC_IVAR____TtC19AppStoreKitInternal11VideoPlayer_shouldBePlaying];
  swift_beginAccess();
  *v3 = 0;

}

- (_TtC19AppStoreKitInternal11VideoPlayer)init
{
  _TtC19AppStoreKitInternal11VideoPlayer *result;

  result = (_TtC19AppStoreKitInternal11VideoPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19AppStoreKitInternal11VideoPlayer)initWithURL:(id)a3
{
  uint64_t v3;
  _TtC19AppStoreKitInternal11VideoPlayer *result;

  v3 = sub_1D892773C();
  MEMORY[0x1E0C80A78](v3);
  sub_1D892770C();
  result = (_TtC19AppStoreKitInternal11VideoPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19AppStoreKitInternal11VideoPlayer)initWithPlayerItem:(id)a3
{
  id v3;
  _TtC19AppStoreKitInternal11VideoPlayer *result;

  v3 = a3;
  result = (_TtC19AppStoreKitInternal11VideoPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
