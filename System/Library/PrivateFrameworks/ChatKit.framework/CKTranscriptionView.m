@implementation CKTranscriptionView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit19CKTranscriptionView_textView), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC7ChatKit19CKTranscriptionView)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit19CKTranscriptionView *)sub_18E57AE74(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7ChatKit19CKTranscriptionView)initWithCoder:(id)a3
{
  return (_TtC7ChatKit19CKTranscriptionView *)sub_18E57AFF8(a3);
}

- (void)layoutSubviews
{
  _TtC7ChatKit19CKTranscriptionView *v2;

  v2 = self;
  sub_18E57BBCC();

}

- (void)didToggleLineCountChange:(id)a3
{
  id v4;
  _TtC7ChatKit19CKTranscriptionView *v5;

  v4 = a3;
  v5 = self;
  sub_18E57C6A4();

}

- (void)didMoveToSuperview
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for CKTranscriptionView();
  -[CKTranscriptionView didMoveToSuperview](&v2, sel_didMoveToSuperview);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit19CKTranscriptionView_expansionButton));
  sub_18E011A40(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC7ChatKit19CKTranscriptionView_didTapExpansionButton));
  sub_18E011A40(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC7ChatKit19CKTranscriptionView_didResize));
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit19CKTranscriptionView_collapsedButtonColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit19CKTranscriptionView_expandedButtonColor));
}

@end
