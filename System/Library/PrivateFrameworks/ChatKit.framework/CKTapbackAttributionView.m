@implementation CKTapbackAttributionView

- (CKMessagePartChatItem)messagePartChatItem
{
  return (CKMessagePartChatItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                          + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_messagePartChatItem));
}

- (_TtP7ChatKit32CKTapbackAttributionViewDelegate_)delegate
{
  swift_beginAccess();
  return (_TtP7ChatKit32CKTapbackAttributionViewDelegate_ *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC7ChatKit24CKTapbackAttributionView)initWithMessagePartChatItem:(id)a3
{
  return (_TtC7ChatKit24CKTapbackAttributionView *)CKTapbackAttributionView.init(messagePartChatItem:)(a3);
}

- (_TtC7ChatKit24CKTapbackAttributionView)initWithCoder:(id)a3
{
  id v4;
  _TtC7ChatKit24CKTapbackAttributionView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_delegate) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_hostedView) = 0;
  v4 = a3;

  result = (_TtC7ChatKit24CKTapbackAttributionView *)sub_18E769320();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC7ChatKit24CKTapbackAttributionView *v2;

  v2 = self;
  sub_18E72BF98();

}

- (void)present
{
  sub_18E72C2A8(self, (uint64_t)a2, "Presenting tapback attribution view.", (void (*)(void))sub_18E57FF50);
}

- (void)dismiss
{
  sub_18E72C2A8(self, (uint64_t)a2, "Dismissing tapback attribution view.", (void (*)(void))sub_18E5805D0);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC7ChatKit24CKTapbackAttributionView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_18E72C3A8((uint64_t)a4, x, y);

  return v10;
}

- (_TtC7ChatKit24CKTapbackAttributionView)initWithFrame:(CGRect)a3
{
  _TtC7ChatKit24CKTapbackAttributionView *result;

  result = (_TtC7ChatKit24CKTapbackAttributionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_messagePartChatItem));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_hostedView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_transitionController));
}

- (void)tapbackAttributionViewModel:(id)a3 didTapToSaveSticker:(id)a4
{
  id *v6;

  v6 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_delegate);
  swift_beginAccess();
  if (*v6)
    objc_msgSend(*v6, sel_tapbackAttributionView_didTapToSaveSticker_, self, a4);
}

- (CGSize)estimatedAttributionViewDismissalSizeForAnimationController:(id)a3
{
  id v4;
  _TtC7ChatKit24CKTapbackAttributionView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v4 = a3;
  v5 = self;
  sub_18E72CA48();
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

@end
