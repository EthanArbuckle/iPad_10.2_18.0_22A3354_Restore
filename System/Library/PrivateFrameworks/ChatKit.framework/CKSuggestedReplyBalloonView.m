@implementation CKSuggestedReplyBalloonView

- (_TtC7ChatKit27CKSuggestedReplyBalloonView)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit27CKSuggestedReplyBalloonView_view) = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC7ChatKit27CKSuggestedReplyBalloonView_preferredBalloonSize);
  v9 = (objc_class *)type metadata accessor for CKSuggestedReplyBalloonView();
  *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[CKImageBalloonView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKit27CKSuggestedReplyBalloonView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC7ChatKit27CKSuggestedReplyBalloonView *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit27CKSuggestedReplyBalloonView_view) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC7ChatKit27CKSuggestedReplyBalloonView_preferredBalloonSize);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC7ChatKit27CKSuggestedReplyBalloonView *)sub_18E769320();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  _TtC7ChatKit27CKSuggestedReplyBalloonView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = self;
  sub_18E68B840(width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)configureForMessagePart:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  _TtC7ChatKit27CKSuggestedReplyBalloonView *v8;
  id v9;
  objc_super v10;

  type metadata accessor for CKSuggestedReplyMessagePartChatItem();
  v5 = swift_dynamicCastClass();
  if (v5)
  {
    v6 = v5;
    v10.receiver = self;
    v10.super_class = (Class)type metadata accessor for CKSuggestedReplyBalloonView();
    v7 = a3;
    v8 = self;
    -[CKImageBalloonView configureForMessagePart:](&v10, sel_configureForMessagePart_, v6);
    v9 = *(id *)(v6 + OBJC_IVAR____TtC7ChatKit35CKSuggestedReplyMessagePartChatItem_suggestedReply);
    sub_18E68B460(v9);

    -[CKSuggestedReplyBalloonView setNeedsLayout](v8, sel_setNeedsLayout, v10.receiver, v10.super_class);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit27CKSuggestedReplyBalloonView_view));
}

@end
