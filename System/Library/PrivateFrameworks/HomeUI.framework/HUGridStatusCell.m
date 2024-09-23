@implementation HUGridStatusCell

+ (Class)layoutOptionsClass
{
  sub_1B90080D8();
  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)areCellContentsHidden
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUGridStatusCell_areCellContentsHidden;
  swift_beginAccess();
  return *v2;
}

- (void)setCellContentsHidden:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HUGridStatusCell_areCellContentsHidden;
  swift_beginAccess();
  *v4 = a3;
}

- (HUGridCellLayoutOptions)layoutOptions
{
  return (HUGridCellLayoutOptions *)sub_1B8E34318((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUGridStatusCell_layoutOptions);
}

- (void)setLayoutOptions:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HUGridStatusCell_layoutOptions);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (HFItem)item
{
  return (HFItem *)sub_1B8E34318((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUGridStatusCell_item);
}

- (void)setItem:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  HUGridStatusCell *v8;

  v5 = (void **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HUGridStatusCell_item);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  -[HUGridStatusCell setNeedsUpdateConfiguration](v8, sel_setNeedsUpdateConfiguration);
}

- (HUGridStatusCell)initWithFrame:(CGRect)a3
{
  return (HUGridStatusCell *)GridStatusCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (HUGridStatusCell)initWithCoder:(id)a3
{
  id v4;
  HUGridStatusCell *result;

  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR___HUGridStatusCell_areCellContentsHidden) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HUGridStatusCell_layoutOptions) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HUGridStatusCell_item) = 0;
  v4 = a3;

  result = (HUGridStatusCell *)sub_1B93EE9CC();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  _BYTE *v3;
  objc_super v4;

  v3 = (char *)self + OBJC_IVAR___HUGridStatusCell_areCellContentsHidden;
  swift_beginAccess();
  *v3 = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for GridStatusCell();
  -[HUGridStatusCell prepareForReuse](&v4, sel_prepareForReuse);
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  -[HUGridStatusCell setNeedsUpdateConfiguration](self, sel_setNeedsUpdateConfiguration, a3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  HUGridStatusCell *v8;
  uint64_t v9;

  v4 = sub_1B93ECD34();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93ECD28();
  v8 = self;
  sub_1B9008990((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{

}

- (id)prefixString
{
  return 0;
}

- (id)primaryString
{
  return 0;
}

- (id)secondaryString
{
  return 0;
}

- (id)secondaryAttributedString
{
  return 0;
}

- (CGRect)iconViewTileFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)prefixLabelTileFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)primaryLabelTileFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)secondaryLabelTileFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)prefixLabelShouldFeather
{
  return 0;
}

- (BOOL)primaryLabelShouldFeather
{
  return 0;
}

- (BOOL)secondaryLabelShouldFeather
{
  return 0;
}

- (id)prefixLabelFont
{
  return 0;
}

- (id)primaryLabelFont
{
  return 0;
}

- (id)secondaryLabelFont
{
  return 0;
}

- (id)prefixLabelTextColor
{
  return 0;
}

- (id)primaryLabelTextColor
{
  return 0;
}

- (id)secondaryLabelTextColor
{
  return 0;
}

- (CGRect)tileFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[HUGridStatusCell frame](self, sel_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)backgroundCornerRadius
{
  return 0.0;
}

- (unint64_t)backgroundDisplayStyle
{
  return 0;
}

- (id)createBackgroundBlurView
{
  return 0;
}

- (BOOL)recognizeDoubleClickGesture
{
  return 1;
}

- (id)baseIconViewConfiguration
{
  HUGridStatusCell *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD v11[3];
  uint64_t v12;

  v2 = self;
  GridStatusCell.baseIconViewConfiguration()((uint64_t)v11);

  v3 = v12;
  if (!v12)
    return 0;
  v4 = __swift_project_boxed_opaque_existential_1(v11, v12);
  v5 = *(_QWORD *)(v3 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v5 + 16))(v8, v6);
  v9 = (void *)sub_1B93EEAF8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  return v9;
}

@end
