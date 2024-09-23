@implementation CKVisionTranscriptionView

- (void)layoutSubviews
{
  _TtC7ChatKit25CKVisionTranscriptionView *v2;

  v2 = self;
  sub_18E6AD378();

}

- (_TtC7ChatKit25CKVisionTranscriptionView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC7ChatKit25CKVisionTranscriptionView *v10;
  uint64_t v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC7ChatKit25CKVisionTranscriptionView_textViewTrailingAnchorConstraintToExpansionButton;
  v9 = objc_allocWithZone(MEMORY[0x1E0CB3718]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  v11 = OBJC_IVAR____TtC7ChatKit25CKVisionTranscriptionView_textViewTrailingAnchorConstraintToContainer;
  *(Class *)((char *)&v10->super.super.super.super.isa + v11) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3718]), sel_init);

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for CKVisionTranscriptionView();
  return -[CKTranscriptionView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKit25CKVisionTranscriptionView)initWithCoder:(id)a3
{
  return (_TtC7ChatKit25CKVisionTranscriptionView *)sub_18E6ADA24(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKVisionTranscriptionView_textViewTrailingAnchorConstraintToExpansionButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKVisionTranscriptionView_textViewTrailingAnchorConstraintToContainer));
}

@end
