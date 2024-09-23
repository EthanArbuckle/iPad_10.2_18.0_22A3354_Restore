@implementation TapbackAssetView

- (double)attributionScaleFactor
{
  return 1.0;
}

- (UIEdgeInsets)platterEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_platterEdgeInsets);
  v3 = *(double *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_platterEdgeInsets);
  v4 = *(double *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_platterEdgeInsets);
  v5 = *(double *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_platterEdgeInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CKTapbackViewDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_delegate;
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

  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_isSelected;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSelected:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_isSelected;
  swift_beginAccess();
  *v4 = a3;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TapbackAssetView();
  v2 = (char *)v5.receiver;
  -[TapbackAssetView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC7ChatKit16TapbackAssetView_tapbackAssetLayer];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, sel_center, v5.receiver, v5.super_class);
    objc_msgSend(v4, sel_setPosition_);

    v2 = v4;
  }

}

- (_TtC7ChatKit16TapbackAssetView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _OWORD *v8;
  __int128 v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_attributionScaleFactor) = (Class)0x3FF0000000000000;
  v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_platterEdgeInsets);
  v9 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
  *v8 = *MEMORY[0x1E0CEB4B0];
  v8[1] = v9;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_tapbackAssetLayer) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_isSelected) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_stateController) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TapbackAssetView();
  return -[TapbackAssetView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKit16TapbackAssetView)initWithCoder:(id)a3
{
  return (_TtC7ChatKit16TapbackAssetView *)TapbackAssetView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_tapbackAssetLayer));

}

- (void)configureForTapback:(id)a3 isSelected:(BOOL)a4
{
  id v5;
  _TtC7ChatKit16TapbackAssetView *v6;

  v5 = a3;
  v6 = self;
  objc_msgSend(v5, sel_associatedMessageType);
  _s7ChatKit16TapbackAssetViewC04loadD024forAssociatedMessageTypeySo012IMAssociatediJ0V_tF_0();

}

- (void)performViewControllerAppearingAnimation
{
  void *v2;

  if (*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_tapbackAssetLayer))
  {
    v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_stateController);
    if (v2)
      objc_msgSend(v2, sel_setInitialStatesOfLayer_);
  }
}

- (void)performViewControllerDismissingAnimation
{
  _TtC7ChatKit16TapbackAssetView *v2;

  v2 = self;
  TapbackAssetView.performViewControllerDismissingAnimation()();

}

@end
