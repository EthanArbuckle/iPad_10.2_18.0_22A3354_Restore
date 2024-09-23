@implementation HUTileCell

- (UICellConfigurationState)_bridgedConfigurationState
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  HUTileCell *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1B93ECD34();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1B8E2C2CC((uint64_t)v6);

  v8 = (void *)sub_1B93ECD1C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (UICellConfigurationState *)v8;
}

- (HUTileCell)initWithFrame:(CGRect)a3
{
  return (HUTileCell *)TileCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  HUTileCell *v8;
  uint64_t v9;

  v4 = sub_1B93ECD34();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93ECD28();
  v8 = self;
  sub_1B8E2471C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (double)backgroundCornerRadius
{
  HUTileCell *v2;
  double v3;

  v2 = self;
  v3 = TileCell.backgroundCornerRadius()();

  return v3;
}

- (HFItem)item
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HUTileCell_item);
  swift_beginAccess();
  return (HFItem *)*v2;
}

- (void)setRearranging:(BOOL)a3
{
  HUTileCell *v4;

  v4 = self;
  sub_1B8E33DD8(a3);

}

- (void)setReorderable:(BOOL)a3
{
  HUTileCell *v4;

  v4 = self;
  sub_1B8E341B4(a3);

}

- (void)setGridSize:(HUGridSize)a3
{
  HUGridSize *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  BOOL v7;

  v3 = (HUGridSize *)((char *)self + OBJC_IVAR___HUTileCell__gridSize);
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HUTileCell__gridSize);
  v5 = *(_QWORD *)((char *)&self->super.super.super.super._responderFlags + OBJC_IVAR___HUTileCell__gridSize);
  v6 = *((_BYTE *)&self->super.super.super.super.__layeringSceneIdentity + OBJC_IVAR___HUTileCell__gridSize);
  *v3 = a3;
  LOBYTE(v3[1].rowsDown) = 0;
  if ((v6 & 1) != 0 || (a3.rowsDown == v4 ? (v7 = a3.columnsAcross == v5) : (v7 = 0), !v7))
    -[HUTileCell setNeedsUpdateConfiguration](self, sel_setNeedsUpdateConfiguration);
}

- (void)setBackgroundEffectGrouper:(id)a3
{
  id *v5;
  HUTileCell *v6;

  v5 = (id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HUTileCell_backgroundEffectGrouper);
  swift_beginAccess();
  *v5 = a3;
  swift_unknownObjectRetain_n();
  v6 = self;
  swift_unknownObjectRelease();
  -[HUTileCell setNeedsUpdateConfiguration](v6, sel_setNeedsUpdateConfiguration);

  swift_unknownObjectRelease();
}

- (void)setToggleable:(BOOL)a3
{
  sub_1B8E34428((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___HUTileCell_toggleable);
}

- (void)setItem:(id)a3
{
  id v5;
  HUTileCell *v6;

  v5 = a3;
  v6 = self;
  sub_1B8F87FB0(a3);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  -[HUTileCell setNeedsUpdateConfiguration](self, sel_setNeedsUpdateConfiguration, a3);
}

- (void)setBackgroundColor:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  HUTileCell *v12;
  uint64_t v13;
  HUTileCell *v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E7E0);
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v15 - v9;
  v11 = a3;
  v12 = self;
  MEMORY[0x1BCCC00E0]();
  v13 = sub_1B93ECDD0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48))(v10, 1, v13))
  {
    sub_1B8E5E6E0((uint64_t)v10, (uint64_t)v8);
    MEMORY[0x1BCCC00EC](v8);

    sub_1B8E26870((uint64_t)v10, &qword_1ED57E7E0);
  }
  else
  {
    v14 = (HUTileCell *)v11;
    sub_1B93ECDA0();
    MEMORY[0x1BCCC00EC](v10);

    v12 = v14;
  }

}

- (BOOL)showPrefixLabel
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUTileCell_showPrefixLabel;
  swift_beginAccess();
  return *v2;
}

- (void)setShowPrefixLabel:(BOOL)a3
{
  sub_1B8E34428((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___HUTileCell_showPrefixLabel);
}

- (BOOL)toggleable
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUTileCell_toggleable;
  swift_beginAccess();
  return *v2;
}

- (BOOL)useMutedIconOffColors
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUTileCell_useMutedIconOffColors;
  swift_beginAccess();
  return *v2;
}

- (void)setUseMutedIconOffColors:(BOOL)a3
{
  sub_1B8E34428((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___HUTileCell_useMutedIconOffColors);
}

- (HUBackgroundEffectViewGrouping)backgroundEffectGrouper
{
  swift_beginAccess();
  return (HUBackgroundEffectViewGrouping *)(id)swift_unknownObjectRetain();
}

- (unint64_t)backgroundDisplayStyle
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___HUTileCell_backgroundDisplayStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setBackgroundDisplayStyle:(unint64_t)a3
{
  unint64_t *v5;
  unint64_t v6;

  v5 = (unint64_t *)((char *)self + OBJC_IVAR___HUTileCell_backgroundDisplayStyle);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  if (v6 != a3)
    -[HUTileCell setNeedsUpdateConfiguration](self, sel_setNeedsUpdateConfiguration);
}

- (HUGridSize)gridSize
{
  uint64_t *v2;
  HUTileCell *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  HUGridSize result;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___HUTileCell__gridSize);
  if (*((_BYTE *)&self->super.super.super.super.__layeringSceneIdentity + OBJC_IVAR___HUTileCell__gridSize) == 1)
  {
    v3 = self;
    v4 = sub_1B8F89FD8(v3);
    v6 = v5;

  }
  else
  {
    v4 = *v2;
    v6 = v2[1];
  }
  v7 = v4;
  v8 = v6;
  result.columnsAcross = v8;
  result.rowsDown = v7;
  return result;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TileCell();
  -[HUTileCell bounds](&v6, sel_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  HUTileCell *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_1B8F8A33C(x, y, width, height);

}

- (id)tappableAreaForPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  HUTileCell *v5;
  __CFString *v6;

  y = a3.y;
  x = a3.x;
  v5 = self;
  v6 = sub_1B8F89324(x, y);

  return v6;
}

- (void)animateIconTouchDown
{
  sub_1B8F8A48C(self, (uint64_t)a2, sub_1B8FA94CC);
}

- (void)animateIconTouchUp
{
  sub_1B8F8A48C(self, (uint64_t)a2, sub_1B8FA96CC);
}

- (void)prepareForReuse
{
  HUTileCell *v2;

  v2 = self;
  sub_1B8F8A520();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TileCell();
  v4 = a3;
  v5 = v6.receiver;
  -[HUTileCell traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v5, sel_setNeedsUpdateConfiguration, v6.receiver, v6.super_class);

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

- (void)layoutSubviews
{
  HUTileCell *v2;

  v2 = self;
  sub_1B8F8A948();

}

- (HUTileCell)initWithCoder:(id)a3
{
  return (HUTileCell *)TileCell.init(coder:)(a3);
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUTileCell_dynamicGridSizeCalculator);
}

- (void)configureDragItem:(id)a3
{
  id v4;
  HUTileCell *v5;

  v4 = a3;
  v5 = self;
  TileCell.configureDragItem(_:)((UIDragItem)v4);

}

+ (double)minimumDescriptionScaleFactor
{
  return 0.8;
}

- (id)prefixString
{
  return sub_1B8F5BDB8(self, (uint64_t)a2, (void (*)(void))TileCell.prefixString());
}

- (id)primaryString
{
  return sub_1B8F5BDB8(self, (uint64_t)a2, (void (*)(void))TileCell.primaryString());
}

- (id)secondaryString
{
  return sub_1B8F5BDB8(self, (uint64_t)a2, (void (*)(void))TileCell.secondaryString());
}

- (id)secondaryAttributedString
{
  HUTileCell *v2;
  void *v3;

  v2 = self;
  v3 = (void *)TileCell.secondaryAttributedString()();

  return v3;
}

- (CGRect)iconViewTileFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_1B9012310(self, (uint64_t)a2, &OBJC_IVAR____TtC6HomeUI19TileCellContentView_iconView);
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

  v2 = sub_1B9012310(self, (uint64_t)a2, &OBJC_IVAR____TtC6HomeUI19TileCellContentView_prefixLabel);
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

  v2 = sub_1B9012310(self, (uint64_t)a2, &OBJC_IVAR____TtC6HomeUI19TileCellContentView_titleLabel);
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

  v2 = sub_1B9012310(self, (uint64_t)a2, &OBJC_IVAR____TtC6HomeUI19TileCellContentView_descriptionLabel);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)prefixLabelShouldFeather
{
  HUTileCell *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = TileCell.prefixLabelShouldFeather()();

  return v3;
}

- (BOOL)primaryLabelShouldFeather
{
  HUTileCell *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = TileCell.primaryLabelShouldFeather()();

  return v3;
}

- (BOOL)secondaryLabelShouldFeather
{
  HUTileCell *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = TileCell.secondaryLabelShouldFeather()();

  return v3;
}

- (id)prefixLabelFont
{
  HUTileCell *v2;
  void *v3;

  v2 = self;
  v3 = (void *)TileCell.prefixLabelFont()();

  return v3;
}

- (id)primaryLabelFont
{
  HUTileCell *v2;
  void *v3;

  v2 = self;
  v3 = (void *)TileCell.primaryLabelFont()();

  return v3;
}

- (id)secondaryLabelFont
{
  HUTileCell *v2;
  void *v3;

  v2 = self;
  v3 = (void *)TileCell.secondaryLabelFont()();

  return v3;
}

- (id)prefixLabelTextColor
{
  HUTileCell *v2;
  void *v3;

  v2 = self;
  v3 = (void *)TileCell.prefixLabelTextColor()();

  return v3;
}

- (id)primaryLabelTextColor
{
  HUTileCell *v2;
  void *v3;

  v2 = self;
  v3 = (void *)TileCell.primaryLabelTextColor()();

  return v3;
}

- (id)secondaryLabelTextColor
{
  HUTileCell *v2;
  void *v3;

  v2 = self;
  v3 = (void *)TileCell.secondaryLabelTextColor()();

  return v3;
}

- (id)primaryLabelOnTextColor
{
  return sub_1B90132DC(self, (uint64_t)a2, 1);
}

- (id)primaryLabelOffTextColor
{
  return sub_1B90132DC(self, (uint64_t)a2, 0);
}

- (id)prefixLabelOnTextColor
{
  return sub_1B901346C(self, (uint64_t)a2, 1);
}

- (id)prefixLabelOffTextColor
{
  return sub_1B901346C(self, (uint64_t)a2, 0);
}

- (id)secondaryLabelOnTextColor
{
  return sub_1B90135FC(self, (uint64_t)a2, 1);
}

- (id)secondaryLabelOffTextColor
{
  return sub_1B90135FC(self, (uint64_t)a2, 0);
}

- (UIColor)backgroundColor
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  HUTileCell *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E7E0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  MEMORY[0x1BCCC00E0]();
  v7 = sub_1B93ECDD0();
  v8 = 0;
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7))
    v8 = (void *)sub_1B93ECD94();
  sub_1B8E26870((uint64_t)v5, &qword_1ED57E7E0);

  return (UIColor *)v8;
}

- (CGRect)tileFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[HUTileCell bounds](self, sel_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)createBackgroundBlurView
{
  HUTileCell *v2;
  UIView_optional *v3;
  void *v4;
  void *v5;

  v2 = self;
  TileCell.createBackgroundBlurView()(v3);
  v5 = v4;

  return v5;
}

- (BOOL)recognizeDoubleClickGesture
{
  return objc_msgSend((id)objc_opt_self(), sel_isAnIPad);
}

- (id)baseIconViewConfiguration
{
  HUTileCell *v2;
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
  TileCell.baseIconViewConfiguration()((uint64_t)v11);

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
