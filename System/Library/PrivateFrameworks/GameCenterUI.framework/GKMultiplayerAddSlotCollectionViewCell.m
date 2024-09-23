@implementation GKMultiplayerAddSlotCollectionViewCell

+ (NSString)reuseIdentifier
{
  void *v2;

  static GKMultiplayerAddSlotCollectionViewCell.reuseIdentifier.getter();
  v2 = (void *)sub_1AB7DAF60();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell *)sub_1AB6F2354(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB6F2D58();
}

- (id)addSlotActionHandler
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v2 = GKMultiplayerAddSlotCollectionViewCell.addSlotActionHandler.getter();
  if (!v2)
    return 0;
  v6[4] = v2;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1AB46A8B4;
  v6[3] = &block_descriptor_82;
  v4 = _Block_copy(v6);
  swift_release();
  return v4;
}

- (void)setAddSlotActionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1AB46D734;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  GKMultiplayerAddSlotCollectionViewCell.addSlotActionHandler.setter((uint64_t)v4, v5);

}

- (int64_t)maximumAdditionalPlayers
{
  return GKMultiplayerAddSlotCollectionViewCell.maximumAdditionalPlayers.getter();
}

- (void)setMaximumAdditionalPlayers:(int64_t)a3
{
  _TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell *v4;

  v4 = self;
  GKMultiplayerAddSlotCollectionViewCell.maximumAdditionalPlayers.setter(a3);

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  JUMeasurements result;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v6 = self;
  v7 = sub_1AB6F4634((uint64_t)a4, (uint64_t)v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_unknownObjectRelease();

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = GKMultiplayerAddSlotCollectionViewCell.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell *v2;

  v2 = self;
  GKMultiplayerAddSlotCollectionViewCell.layoutSubviews()();

}

- (UIButton)accessibilityAddSlotButton
{
  return (UIButton *)sub_1AB6F3A70();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  Class isa;
  UITraitCollection_optional v6;

  v4 = a3;
  v6.value.super.isa = (Class)self;
  isa = v6.value.super.isa;
  GKMultiplayerAddSlotCollectionViewCell.traitCollectionDidChange(_:)(v6);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell_contentBackgroundView));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell_vibrancyHost);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell_addSlotLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell_addSlotButton);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell_addSlotImageView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell_focusGuide);
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell_addSlotActionHandler));
}

@end
