@implementation HUAccessoryTileCell

- (HUAccessoryTileCell)initWithFrame:(CGRect)a3
{
  return (HUAccessoryTileCell *)AccessoryTileCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)updateConstraints
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AccessoryTileCell();
  v2 = v3.receiver;
  -[HUAccessoryTileCell updateConstraints](&v3, sel_updateConstraints);
  sub_1B8E23F28();

}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (HUAccessoryTileCellDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___HUAccessoryTileCell_delegate;
  swift_beginAccess();
  return (HUAccessoryTileCellDelegate *)(id)MEMORY[0x1BCCC1DA8](v2);
}

- (BOOL)showsSizeChangeButton
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUAccessoryTileCell_showsSizeChangeButton;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsSizeChangeButton:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HUAccessoryTileCell_showsSizeChangeButton;
  swift_beginAccess();
  *v4 = a3;
}

- (void)prepareForReuse
{
  HUAccessoryTileCell *v2;

  v2 = self;
  sub_1B8F142DC();

}

- (void)setShowsSizeChangeButton:(BOOL)a3 animated:(BOOL)a4
{
  HUAccessoryTileCell *v6;

  v6 = self;
  sub_1B8F14758(a3, a4);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  HUAccessoryTileCell *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_1B8F1490C((uint64_t)a4, x, y);

  return v10;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4;
  double y;
  double x;
  id v8;
  HUAccessoryTileCell *v9;

  v4 = (uint64_t)a4;
  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  LOBYTE(v4) = sub_1B8F14A5C(v4, x, y);

  return v4 & 1;
}

- (void)updateSizeChangeButton
{
  HUAccessoryTileCell *v2;

  v2 = self;
  sub_1B8F14BA0();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  HUAccessoryTileCell *v6;

  v5 = a3;
  v6 = self;
  sub_1B8F14DA8((uint64_t)a3);

}

- (void)tileSizeButtonTappedWithSender:(id)a3
{
  HUAccessoryTileCell *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  sub_1B8F14F7C();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (NSString)description
{
  HUAccessoryTileCell *v2;
  void *v3;

  v2 = self;
  sub_1B8F15138();

  v3 = (void *)sub_1B93EDD84();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (HUAccessoryTileCell)initWithCoder:(id)a3
{
  return (HUAccessoryTileCell *)AccessoryTileCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUAccessoryTileCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUAccessoryTileCell_sizeChangeButton));
  swift_release();
  swift_release();
}

@end
