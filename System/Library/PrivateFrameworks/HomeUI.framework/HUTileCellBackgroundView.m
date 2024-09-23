@implementation HUTileCellBackgroundView

- (void)layoutSubviews
{
  id v2;
  id v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TileCellBackgroundView();
  v2 = v6.receiver;
  -[HUTileCellBackgroundView layoutSubviews](&v6, sel_layoutSubviews);
  v3 = sub_1B8E5F2A4();
  objc_msgSend(v2, sel_bounds, v6.receiver, v6.super_class);
  objc_msgSend(v3, sel_setFrame_);

  v4 = sub_1B8FF6EC0();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v2, sel_bounds);
    objc_msgSend(v5, sel_setFrame_);

    v2 = v5;
  }

}

- (HUTileCellBackgroundView)initWithFrame:(CGRect)a3
{
  return (HUTileCellBackgroundView *)TileCellBackgroundView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (HUBackgroundEffectViewGrouping)effectGrouper
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___HUTileCellBackgroundView_effectGrouper;
  swift_beginAccess();
  return (HUBackgroundEffectViewGrouping *)(id)MEMORY[0x1BCCC1DA8](v2);
}

- (void)setEffectGrouper:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (HUTileCellBackgroundView)initWithEffectIdentifier:(id)a3 effectGrouper:(id)a4 materialStyle:(int64_t)a5
{
  id v7;
  HUTileCellBackgroundView *v8;
  uint64_t v9;
  void *v10;
  HUTileCellBackgroundView *v11;

  v7 = a3;
  swift_unknownObjectRetain();
  v8 = -[HUTileCellBackgroundView initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  swift_beginAccess();
  v9 = swift_unknownObjectWeakAssign();
  v10 = (void *)MEMORY[0x1BCCC1DA8](v9);
  v11 = v8;
  sub_1B8FF7888(v7, v10, a5);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v11;
}

- (HUTileCellBackgroundView)initWithCoder:(id)a3
{
  return (HUTileCellBackgroundView *)TileCellBackgroundView.init(coder:)(a3);
}

- (void)dealloc
{
  HUTileCellBackgroundView *v2;
  id v3;
  id v4;
  id v5;
  objc_super v6;

  v2 = self;
  v3 = sub_1B8E5F2A4();
  v4 = objc_msgSend(v3, sel__captureSource);

  if (v4)
  {
    v5 = sub_1B8E5F2A4();
    objc_msgSend(v4, sel__removeCaptureDependent_, v5);

  }
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for TileCellBackgroundView();
  -[HUTileCellBackgroundView dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HUTileCellBackgroundView_currentEffectIdentifier));
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUTileCellBackgroundView_effectGrouper);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HUTileCellBackgroundView____lazy_storage___visualEffectView));

  sub_1B8E5F3FC(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR___HUTileCellBackgroundView____lazy_storage___controlCenterMaterialView));
}

- (void)prepareForReuse
{
  HUTileCellBackgroundView *v2;
  id v3;
  id v4;
  id v5;
  void **v6;
  void *v7;

  v2 = self;
  v3 = sub_1B8E5F2A4();
  v4 = objc_msgSend(v3, sel__captureSource);

  if (v4)
  {
    v5 = sub_1B8E5F2A4();
    objc_msgSend(v4, sel__removeCaptureDependent_, v5);

  }
  v6 = (void **)((char *)&v2->super.super.super.isa + OBJC_IVAR___HUTileCellBackgroundView_currentEffectIdentifier);
  swift_beginAccess();
  v7 = *v6;
  *v6 = 0;

}

- (void)updateWithEffectIdentifier:(id)a3 materialStyle:(int64_t)a4
{
  char *v7;
  void *v8;
  id v9;
  HUTileCellBackgroundView *v10;

  v7 = (char *)self + OBJC_IVAR___HUTileCellBackgroundView_effectGrouper;
  swift_beginAccess();
  v8 = (void *)MEMORY[0x1BCCC1DA8](v7);
  v9 = a3;
  v10 = self;
  sub_1B8FF7888(v9, v8, a4);

  swift_unknownObjectRelease();
}

@end
