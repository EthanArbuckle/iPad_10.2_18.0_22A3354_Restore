@implementation PuzzleEmbedMenuDismissMessageHandler

- (_TtC7NewsUI236PuzzleEmbedMenuDismissMessageHandler)init
{
  _TtC7NewsUI236PuzzleEmbedMenuDismissMessageHandler *result;

  result = (_TtC7NewsUI236PuzzleEmbedMenuDismissMessageHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI236PuzzleEmbedMenuDismissMessageHandler_delegate);
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  _TtC7NewsUI236PuzzleEmbedMenuDismissMessageHandler *v7;

  v5 = MEMORY[0x1D82919D4]((char *)self + OBJC_IVAR____TtC7NewsUI236PuzzleEmbedMenuDismissMessageHandler_delegate, a2);
  if (v5)
  {
    v6 = v5;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    v7 = self;
    sub_1D63C2AAC(v6);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
}

@end
