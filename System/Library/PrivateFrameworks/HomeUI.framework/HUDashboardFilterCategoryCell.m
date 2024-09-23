@implementation HUDashboardFilterCategoryCell

- (HUDashboardFilterCategoryCell)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___HUDashboardFilterCategoryCell_layoutOptions) = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR___HUDashboardFilterCategoryCell_areCellContentsHidden) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___HUDashboardFilterCategoryCell_item) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___HUDashboardFilterCategoryCell_backgroundDisplayStyle) = (Class)1;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___HUDashboardFilterCategoryCell_backgroundEffectGrouper) = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___HUDashboardFilterCategoryCell_isRearranging) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DashboardFilterCategoryCell();
  return -[HUDashboardFilterCategoryCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (UICellConfigurationState)_bridgedConfigurationState
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  HUDashboardFilterCategoryCell *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1B93ECD34();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1B8E234EC();

  v8 = (void *)sub_1B93ECD1C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (UICellConfigurationState *)v8;
}

- (HFItem)item
{
  return (HFItem *)sub_1B8E34318((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUDashboardFilterCategoryCell_item);
}

- (void)setRearranging:(BOOL)a3
{
  HUDashboardFilterCategoryCell *v4;

  v4 = self;
  sub_1B8E35428(a3);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  -[HUDashboardFilterCategoryCell setNeedsUpdateConfiguration](self, sel_setNeedsUpdateConfiguration, a3);
}

- (void)setItem:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  HUDashboardFilterCategoryCell *v8;

  v5 = (void **)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___HUDashboardFilterCategoryCell_item);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  -[HUDashboardFilterCategoryCell setNeedsUpdateConfiguration](v8, sel_setNeedsUpdateConfiguration);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  HUDashboardFilterCategoryCell *v8;
  void *v9;
  objc_class *v10;
  objc_super v11;

  v4 = sub_1B93ECD34();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93ECD28();
  v8 = self;
  v9 = (void *)sub_1B93ECD1C();
  v10 = (objc_class *)type metadata accessor for DashboardFilterCategoryCell();
  v11.receiver = v8;
  v11.super_class = v10;
  -[HUDashboardFilterCategoryCell _bridgedUpdateConfigurationUsingState:](&v11, sel__bridgedUpdateConfigurationUsingState_, v9);

  sub_1B8E5E07C((uint64_t)v7);
  sub_1B8E3AE68(v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)prepareForReuse
{
  HUDashboardFilterCategoryCell *v2;

  v2 = self;
  sub_1B8EA934C();

}

- (HUGridCellLayoutOptions)layoutOptions
{
  return (HUGridCellLayoutOptions *)sub_1B8E34318((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUDashboardFilterCategoryCell_layoutOptions);
}

- (void)setLayoutOptions:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR___HUDashboardFilterCategoryCell_layoutOptions);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BOOL)areCellContentsHidden
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUDashboardFilterCategoryCell_areCellContentsHidden;
  swift_beginAccess();
  return *v2;
}

- (void)setCellContentsHidden:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HUDashboardFilterCategoryCell_areCellContentsHidden;
  swift_beginAccess();
  *v4 = a3;
}

- (unint64_t)backgroundDisplayStyle
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___HUDashboardFilterCategoryCell_backgroundDisplayStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setBackgroundDisplayStyle:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self + OBJC_IVAR___HUDashboardFilterCategoryCell_backgroundDisplayStyle);
  swift_beginAccess();
  *v4 = a3;
}

- (HUBackgroundEffectViewGrouping)backgroundEffectGrouper
{
  swift_beginAccess();
  return (HUBackgroundEffectViewGrouping *)(id)swift_unknownObjectRetain();
}

- (void)setBackgroundEffectGrouper:(id)a3
{
  HUDashboardFilterCategoryCell *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1B8E35EC4((uint64_t)a3);

}

- (BOOL)isRearranging
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUDashboardFilterCategoryCell_isRearranging;
  swift_beginAccess();
  return *v2;
}

- (HUDashboardFilterCategoryCell)initWithCoder:(id)a3
{
  return (HUDashboardFilterCategoryCell *)DashboardFilterCategoryCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUDashboardFilterCategoryCell_layoutOptions));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUDashboardFilterCategoryCell_item));
  swift_unknownObjectRelease();
}

+ (Class)layoutOptionsClass
{
  sub_1B8EAA1A4();
  return (Class)swift_getObjCClassFromMetadata();
}

@end
