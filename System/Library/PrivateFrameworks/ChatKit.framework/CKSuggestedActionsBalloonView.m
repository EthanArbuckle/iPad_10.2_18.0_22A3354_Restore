@implementation CKSuggestedActionsBalloonView

- (CKSuggestedActionsBalloonView)initWithFrame:(CGRect)a3
{
  return (CKSuggestedActionsBalloonView *)sub_18E704228(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CKSuggestedActionsBalloonView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  CKSuggestedActionsBalloonView *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___CKSuggestedActionsBalloonView_actions) = (Class)MEMORY[0x1E0DEE9D8];
  v5 = OBJC_IVAR___CKSuggestedActionsBalloonView_titleLabel;
  v6 = objc_allocWithZone(MEMORY[0x1E0CEA700]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR___CKSuggestedActionsBalloonView_subtitleLabel;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA700]), sel_init);

  result = (CKSuggestedActionsBalloonView *)sub_18E769320();
  __break(1u);
  return result;
}

- (void)setWithActions:(id)a3 chatBotName:(id)a4
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  CKSuggestedActionsBalloonView *v9;

  sub_18E768D20();
  v6 = sub_18E768AE0();
  if (a4)
  {
    v7 = sub_18E768984();
    a4 = v8;
  }
  else
  {
    v7 = 0;
  }
  v9 = self;
  sub_18E7045A0(v6, v7, (unint64_t)a4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  CKSuggestedActionsBalloonView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = self;
  v7 = sub_18E704F8C(width, height);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  CKSuggestedActionsBalloonView *v2;

  v2 = self;
  sub_18E704B80();

}

- (void)configureForMessagePart:(id)a3
{
  id v5;
  CKSuggestedActionsBalloonView *v6;

  v5 = a3;
  v6 = self;
  sub_18E704D44(a3);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___CKSuggestedActionsBalloonView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___CKSuggestedActionsBalloonView_subtitleLabel));
}

@end
