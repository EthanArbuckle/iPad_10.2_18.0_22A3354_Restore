@implementation EmojiCollectionViewCell

- (_TtC11EmojiPoster23EmojiCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster23EmojiCollectionViewCell *)sub_1DD2DBD80(a3);
}

- (_TtC11EmojiPoster23EmojiCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC11EmojiPoster23EmojiCollectionViewCell *v10;
  _TtC11EmojiPoster23EmojiCollectionViewCell *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC11EmojiPoster23EmojiCollectionViewCell_emojiView;
  v9 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for EmojiCollectionViewCell();
  v11 = -[EmojiCollectionViewCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  sub_1DD2DBF0C();

  return v11;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster23EmojiCollectionViewCell_emojiView));
}

@end
