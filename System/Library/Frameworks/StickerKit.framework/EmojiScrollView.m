@implementation EmojiScrollView

- (_TtC10StickerKit15EmojiScrollView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC10StickerKit15EmojiScrollView *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC10StickerKit15EmojiScrollView_emojiDelegate) = 0;
  swift_unknownObjectWeakInit();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for EmojiScrollView();
  v8 = -[EmojiScrollView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  -[EmojiScrollView setDelegate:](v8, sel_setDelegate_, v8);
  return v8;
}

- (_TtC10StickerKit15EmojiScrollView)initWithCoder:(id)a3
{
  return (_TtC10StickerKit15EmojiScrollView *)sub_234665D10(a3);
}

- (void).cxx_destruct
{
  sub_2345B0C20((uint64_t)self + OBJC_IVAR____TtC10StickerKit15EmojiScrollView_emojiDelegate);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC10StickerKit15EmojiScrollView *v5;

  v4 = a3;
  v5 = self;
  sub_234665F64();

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v8;
  _TtC10StickerKit15EmojiScrollView *v9;

  if (MEMORY[0x234944A84]((char *)self + OBJC_IVAR____TtC10StickerKit15EmojiScrollView_emojiDelegate, a2, (__n128)a4, *(__n128 *)&a4.y))
  {
    v8 = a3;
    v9 = self;
    sub_2345B09C4(v9, &a5->x);

    swift_unknownObjectRelease();
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v5;
  _TtC10StickerKit15EmojiScrollView *v6;

  if (MEMORY[0x234944A84]((char *)self + OBJC_IVAR____TtC10StickerKit15EmojiScrollView_emojiDelegate, a2))
  {
    v5 = a3;
    v6 = self;
    sub_2345ACE34();

    swift_unknownObjectRelease();
  }
}

@end
