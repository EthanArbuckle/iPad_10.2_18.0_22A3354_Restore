@implementation CKTapbackLegacyView

- (double)attributionScaleFactor
{
  return 0.9;
}

- (UIEdgeInsets)platterEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackLegacyView_platterEdgeInsets);
  v3 = *(double *)((char *)&self->super.super.super._responderFlags + OBJC_IVAR___CKTapbackLegacyView_platterEdgeInsets);
  v4 = *(double *)((char *)&self->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR___CKTapbackLegacyView_platterEdgeInsets);
  v5 = *(double *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR___CKTapbackLegacyView_platterEdgeInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CKTapbackViewDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___CKTapbackLegacyView_delegate;
  swift_beginAccess();
  return (CKTapbackViewDelegate *)(id)MEMORY[0x193FF501C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (BOOL)isSelected
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKTapbackLegacyView_isSelected;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSelected:(BOOL)a3
{
  CKTapbackLegacyView *v4;

  v4 = self;
  sub_18E53B9A8(a3);

}

- (void)layoutSubviews
{
  char *v2;
  double x;
  double y;
  double width;
  CGFloat height;
  double v7;
  double v8;
  void *v9;
  objc_super v10;
  CGRect v11;
  CGRect v12;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TapbackLegacyView();
  v2 = (char *)v10.receiver;
  -[CKTapbackLegacyView layoutSubviews](&v10, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v10.receiver, v10.super_class);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v7 = CGRectGetWidth(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v8 = CGRectGetHeight(v12);
  v9 = *(void **)&v2[OBJC_IVAR___CKTapbackLegacyView_glyphView];
  if (v9)
  {
    if (v8 >= v7)
      v8 = v7;
    objc_msgSend(v9, sel_setFrame_, CGSizeCenteredInRect(v8, v8, x, y, width));
  }

}

- (CKTapbackLegacyView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _OWORD *v8;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackLegacyView_attributionScaleFactor) = (Class)0x3FECCCCCCCCCCCCDLL;
  v8 = (_OWORD *)((char *)self + OBJC_IVAR___CKTapbackLegacyView_platterEdgeInsets);
  __asm
  {
    FMOV            V0.2D, #1.0
    FMOV            V1.2D, #-1.0
  }
  *v8 = _Q0;
  v8[1] = _Q1;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackLegacyView_glyphView) = 0;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackLegacyView_isSelected) = 0;
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for TapbackLegacyView();
  return -[TapbackView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
}

- (CKTapbackLegacyView)initWithCoder:(id)a3
{
  return (CKTapbackLegacyView *)TapbackLegacyView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKTapbackLegacyView_delegate);

}

- (void)configureForTapback:(id)a3 isSelected:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  CKTapbackLegacyView *v11;

  v4 = a4;
  v6 = a3;
  v11 = self;
  v7 = CKMessageAcknowledgmentTypeFromIMAssociatedMessageType((uint64_t)objc_msgSend(v6, sel_associatedMessageType));
  if (v7 == 2000)
    v8 = 3;
  else
    v8 = 4;
  if (v4)
    v9 = v8;
  else
    v9 = 0xFFFFFFFFLL;
  v10 = objc_msgSend((id)objc_opt_self(), sel_glyphViewForAcknowledgmentType_glyphColor_, v7, v9);
  sub_18E53B7F4(v10);

}

@end
