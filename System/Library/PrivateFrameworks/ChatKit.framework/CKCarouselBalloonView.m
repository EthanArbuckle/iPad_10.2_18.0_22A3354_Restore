@implementation CKCarouselBalloonView

- (CKCarouselBalloonView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CKCarouselBalloonView_carouselStackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CKCarouselBalloonView_dataSource) = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___CKCarouselBalloonView_preferredBalloonSize);
  v9 = (objc_class *)type metadata accessor for CarouselBalloonView();
  *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[CKBalloonView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (CKCarouselBalloonView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  CKCarouselBalloonView *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CKCarouselBalloonView_carouselStackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CKCarouselBalloonView_dataSource) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___CKCarouselBalloonView_preferredBalloonSize);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (CKCarouselBalloonView *)sub_18E769320();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CarouselBalloonView();
  v2 = (char *)v5.receiver;
  -[CKBalloonView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR___CKCarouselBalloonView_carouselStackView];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, sel_frame, v5.receiver, v5.super_class);
    objc_msgSend(v4, sel_frame);
    objc_msgSend(v4, sel_setFrame_);

    v2 = v4;
  }

}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = CGSizeScaledToFit(a3.width, a3.height, *(double *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR___CKCarouselBalloonView_preferredBalloonSize), *(double *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR___CKCarouselBalloonView_preferredBalloonSize));
  result.height = v5;
  result.width = v4;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CKCarouselBalloonView_carouselStackView));

}

- (void)carousel:(id)a3 didScrollToIndex:(int64_t)a4
{
  id v6;
  CKCarouselBalloonView *v7;
  CKBalloonViewDelegate *v8;
  CKBalloonViewDelegate *v9;

  v6 = a3;
  v7 = self;
  v8 = -[CKBalloonView delegate](v7, sel_delegate);
  if (v8)
  {
    v9 = v8;
    if ((-[CKBalloonViewDelegate respondsToSelector:](v8, sel_respondsToSelector_, sel_balloonView_carouselScrolledToIndex_) & 1) != 0)-[CKBalloonViewDelegate balloonView:carouselScrolledToIndex:](v9, sel_balloonView_carouselScrolledToIndex_, v7, a4);

    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

@end
