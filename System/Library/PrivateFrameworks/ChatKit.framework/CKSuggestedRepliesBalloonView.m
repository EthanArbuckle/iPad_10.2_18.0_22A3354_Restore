@implementation CKSuggestedRepliesBalloonView

- (_TtC7ChatKit29CKSuggestedRepliesBalloonView)initWithFrame:(CGRect)a3
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
           + OBJC_IVAR____TtC7ChatKit29CKSuggestedRepliesBalloonView_view) = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC7ChatKit29CKSuggestedRepliesBalloonView_preferredBalloonSize);
  v9 = (objc_class *)type metadata accessor for CKSuggestedRepliesBalloonView();
  *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[CKImageBalloonView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKit29CKSuggestedRepliesBalloonView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC7ChatKit29CKSuggestedRepliesBalloonView *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit29CKSuggestedRepliesBalloonView_view) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC7ChatKit29CKSuggestedRepliesBalloonView_preferredBalloonSize);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC7ChatKit29CKSuggestedRepliesBalloonView *)sub_18E769320();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  _TtC7ChatKit29CKSuggestedRepliesBalloonView *v6;
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
  sub_18E53F444(width, height);
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
  id v4;
  _TtC7ChatKit29CKSuggestedRepliesBalloonView *v5;

  v4 = a3;
  v5 = self;
  sub_18E53EED4(v4);

}

- (void)prepareForReuse
{
  char *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CKSuggestedRepliesBalloonView();
  v2 = (char *)v6.receiver;
  -[CKImageBalloonView prepareForReuse](&v6, sel_prepareForReuse);
  v3 = OBJC_IVAR____TtC7ChatKit29CKSuggestedRepliesBalloonView_view;
  v4 = *(void **)&v2[OBJC_IVAR____TtC7ChatKit29CKSuggestedRepliesBalloonView_view];
  if (v4)
  {
    objc_msgSend(v4, sel_removeFromSuperview, v6.receiver, v6.super_class);
    v5 = *(void **)&v2[v3];
  }
  else
  {
    v5 = 0;
  }
  *(_QWORD *)&v2[v3] = 0;

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit29CKSuggestedRepliesBalloonView_view));
}

@end
