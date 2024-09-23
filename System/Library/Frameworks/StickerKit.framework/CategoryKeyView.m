@implementation CategoryKeyView

- (void)setEmojiKeyManager:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10StickerKit15CategoryKeyView__emojiKeyManager) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC10StickerKit15CategoryKeyView)init
{
  return (_TtC10StickerKit15CategoryKeyView *)sub_2346D0B08();
}

- (void)dealloc
{
  _TtC10StickerKit15CategoryKeyView *v2;

  v2 = self;
  sub_2346D0F20();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

- (void)updateToIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC10StickerKit15CategoryKeyView *v8;
  uint64_t v9;

  v4 = sub_234715B64();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234715B1C();
  v8 = self;
  sub_2346D1050();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
