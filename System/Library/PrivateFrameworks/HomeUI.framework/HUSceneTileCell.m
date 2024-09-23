@implementation HUSceneTileCell

- (void)updateUIWithAnimation:(BOOL)a3
{
  HUSceneTileCell *v3;

  v3 = self;
  -[HUSceneTileCell setNeedsUpdateConfiguration](v3, sel_setNeedsUpdateConfiguration);
  sub_1B8E58830();

}

- (HUSceneTileCell)initWithFrame:(CGRect)a3
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
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR___HUSceneTileCell_dimsWhenReorderingAndNotReorderable) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___HUSceneTileCell__executeActionSetFuture) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___HUSceneTileCell_executeActionSetFuture) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SceneTileCell();
  return -[HUTileCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (void)setRearranging:(BOOL)a3
{
  HUSceneTileCell *v4;

  v4 = self;
  sub_1B8E73144(a3);

}

- (void)setReorderable:(BOOL)a3
{
  HUSceneTileCell *v4;

  v4 = self;
  sub_1B8E732B4(a3);

}

- (id)executeActionSetFuture
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___HUSceneTileCell_executeActionSetFuture);
  swift_beginAccess();
  return *v2;
}

- (void)setExecuteActionSetFuture:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  HUSceneTileCell *v8;

  v5 = (void **)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR___HUSceneTileCell_executeActionSetFuture);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_1B8F61D94();
}

- (id)tappableAreaForPoint:(CGPoint)a3
{
  return CFSTR("HUTileCellTappableAreaGeneralToggleArea");
}

- (BOOL)isRearranging
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUTileCell_isRearranging;
  swift_beginAccess();
  return *v2;
}

- (BOOL)reorderable
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUTileCell_reorderable;
  swift_beginAccess();
  return *v2;
}

- (HUSceneTileCell)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR___HUSceneTileCell_dimsWhenReorderingAndNotReorderable) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___HUSceneTileCell__executeActionSetFuture) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___HUSceneTileCell_executeActionSetFuture) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SceneTileCell();
  return -[HUTileCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUSceneTileCell__executeActionSetFuture));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUSceneTileCell_executeActionSetFuture));
}

@end
