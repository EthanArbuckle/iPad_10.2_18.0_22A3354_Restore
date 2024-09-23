@implementation CKRichCardCarouselBalloonView

- (void)configureForMessagePart:(id)a3
{
  id v5;
  CKRichCardCarouselBalloonView *v6;

  v5 = a3;
  v6 = self;
  sub_18E573598(a3);

}

- (void)prepareForReuse
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RichCardCarouselBalloonView();
  v2 = (char *)v4.receiver;
  -[CKBalloonView prepareForReuse](&v4, sel_prepareForReuse);
  v3 = *(void **)&v2[OBJC_IVAR___CKRichCardCarouselBalloonView_richCards];
  *(_QWORD *)&v2[OBJC_IVAR___CKRichCardCarouselBalloonView_richCards] = 0;

}

- (CKRichCardCarouselBalloonView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___CKRichCardCarouselBalloonView_richCards) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RichCardCarouselBalloonView();
  return -[CKCarouselBalloonView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (CKRichCardCarouselBalloonView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___CKRichCardCarouselBalloonView_richCards) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RichCardCarouselBalloonView();
  return -[CKCarouselBalloonView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___CKRichCardCarouselBalloonView_richCards));
}

- (void)openAppFromNotificationExtensionWith:(id)a3
{
  id v4;
  CKRichCardCarouselBalloonView *v5;
  CKBalloonViewDelegate *v6;
  CKBalloonViewDelegate *v7;

  v4 = a3;
  v5 = self;
  v6 = -[CKBalloonView delegate](v5, sel_delegate);
  if (v6)
  {
    v7 = v6;
    if ((-[CKBalloonViewDelegate respondsToSelector:](v6, sel_respondsToSelector_, sel_didTapChipListFromNotificationExtensionWithBalloonView_) & 1) != 0)-[CKBalloonViewDelegate didTapChipListFromNotificationExtensionWithBalloonView:](v7, sel_didTapChipListFromNotificationExtensionWithBalloonView_, v5);

    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)chatBotActionButton:(id)a3 didSelectChipAction:(id)a4
{
  id v6;
  CKRichCardCarouselBalloonView *v7;
  CKBalloonViewDelegate *v8;
  CKBalloonViewDelegate *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = self;
  v8 = -[CKBalloonView delegate](v7, sel_delegate);
  if (v8)
  {
    v9 = v8;
    if ((-[CKBalloonViewDelegate respondsToSelector:](v8, sel_respondsToSelector_, sel_balloonView_selectedChipAction_) & 1) != 0)-[CKBalloonViewDelegate balloonView:selectedChipAction:](v9, sel_balloonView_selectedChipAction_, v7, v6);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

@end
