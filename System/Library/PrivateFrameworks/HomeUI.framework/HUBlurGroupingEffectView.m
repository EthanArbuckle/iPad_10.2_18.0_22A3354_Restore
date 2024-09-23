@implementation HUBlurGroupingEffectView

- (HUBlurGroupingEffectView)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HUBlurGroupingEffectView_visualEffectViews) = (Class)MEMORY[0x1E0DEE9E0];
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for BlurGroupingEffectView();
  return -[HUBlurGroupingEffectView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BlurGroupingEffectView();
  v2 = v5.receiver;
  -[HUBlurGroupingEffectView layoutSubviews](&v5, sel_layoutSubviews);
  swift_beginAccess();
  v3 = v2;
  v4 = sub_1B93ECF74();
  sub_1B8E460A0(v4, v3);
  swift_bridgeObjectRelease();

}

- (void)backgroundEffectAddCaptureDependent:(id)a3 forBackgroundEffectIdentifier:(id)a4
{
  id v6;
  id v7;
  HUBlurGroupingEffectView *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8E5F6CC(v6, v7);

}

- (void)backgroundEffectRemoveCaptureDependent:(id)a3 forBackgroundEffectIdentifier:(id)a4
{
  id v6;
  id v7;
  HUBlurGroupingEffectView *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8ECDB18(v6, v7);

}

- (HUBlurGroupingEffectView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HUBlurGroupingEffectView_visualEffectViews) = (Class)MEMORY[0x1E0DEE9E0];
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BlurGroupingEffectView();
  return -[HUBlurGroupingEffectView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
