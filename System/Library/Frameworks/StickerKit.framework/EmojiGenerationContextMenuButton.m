@implementation EmojiGenerationContextMenuButton

- (_TtC10StickerKitP33_17C3615B74430FC4A97D6DD9F19A71D032EmojiGenerationContextMenuButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC10StickerKitP33_17C3615B74430FC4A97D6DD9F19A71D032EmojiGenerationContextMenuButton_delegate) = 0;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for EmojiGenerationContextMenuButton();
  return -[EmojiGenerationContextMenuButton initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC10StickerKitP33_17C3615B74430FC4A97D6DD9F19A71D032EmojiGenerationContextMenuButton)initWithCoder:(id)a3
{
  id v5;
  _TtC10StickerKitP33_17C3615B74430FC4A97D6DD9F19A71D032EmojiGenerationContextMenuButton *result;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC10StickerKitP33_17C3615B74430FC4A97D6DD9F19A71D032EmojiGenerationContextMenuButton_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC10StickerKitP33_17C3615B74430FC4A97D6DD9F19A71D032EmojiGenerationContextMenuButton *)sub_2347180B4();
  __break(1u);
  return result;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  _TtC10StickerKitP33_17C3615B74430FC4A97D6DD9F19A71D032EmojiGenerationContextMenuButton *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_2346575B4();

  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  sub_2345B0C20((uint64_t)self+ OBJC_IVAR____TtC10StickerKitP33_17C3615B74430FC4A97D6DD9F19A71D032EmojiGenerationContextMenuButton_delegate);
}

@end
