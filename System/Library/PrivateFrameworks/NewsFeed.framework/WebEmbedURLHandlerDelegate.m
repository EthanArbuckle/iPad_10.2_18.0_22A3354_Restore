@implementation WebEmbedURLHandlerDelegate

- (void)URLHandler:(id)a3 wantsToPresentViewController:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  _TtC8NewsFeed26WebEmbedURLHandlerDelegate *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_1BAABED1C((uint64_t)v9, a5);

}

- (void)URLHandler:(id)a3 willOpenURL:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8NewsFeed26WebEmbedURLHandlerDelegate *v11;
  uint64_t v12;

  v6 = sub_1BB86C67C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86C5EC();
  v10 = a3;
  v11 = self;
  sub_1BAABEE10((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC8NewsFeed26WebEmbedURLHandlerDelegate)init
{
  _TtC8NewsFeed26WebEmbedURLHandlerDelegate *result;

  result = (_TtC8NewsFeed26WebEmbedURLHandlerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed26WebEmbedURLHandlerDelegate_webEmbedCoordinator);
}

@end
