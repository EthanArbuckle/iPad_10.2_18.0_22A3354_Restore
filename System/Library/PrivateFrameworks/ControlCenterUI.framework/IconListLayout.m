@implementation IconListLayout

- (unint64_t)numberOfColumnsForOrientation:(int64_t)a3
{
  _BOOL4 IsLandscape;
  _TtC15ControlCenterUI14IconListLayout *v5;
  unint64_t *v6;
  unint64_t v7;

  IsLandscape = UIInterfaceOrientationIsLandscape(a3);
  v5 = self;
  v6 = (unint64_t *)((char *)v5 + OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_portraitGridDimensions);
  if (IsLandscape)
    v6 = (unint64_t *)&v5->iconGridSizeClassSizes[OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_portraitGridDimensions];
  v7 = *v6;

  return v7;
}

- (unint64_t)numberOfRowsForOrientation:(int64_t)a3
{
  _BOOL4 IsLandscape;
  _TtC15ControlCenterUI14IconListLayout *v5;
  unint64_t *v6;
  unint64_t v7;

  IsLandscape = UIInterfaceOrientationIsLandscape(a3);
  v5 = self;
  v6 = (unint64_t *)((char *)v5 + OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_portraitGridDimensions);
  if (!IsLandscape)
    v6 = (unint64_t *)&v5->iconGridSizeClassSizes[OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_portraitGridDimensions];
  v7 = *v6;

  return v7;
}

- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = CCUILayoutEdgeInsetsForInterfaceOrientation(a3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (SBIconImageInfo)iconImageInfo
{
  _TtC15ControlCenterUI14IconListLayout *v3;
  id v4;
  SBIconImageInfo *result;

  v3 = self;
  v4 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
  sub_1CFBEFF88(v4);

  return result;
}

- (CGSize)iconSpacingForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_fixedIconSpacing);
  v4 = *(double *)&self->iconGridSizeClassSizes[OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_fixedIconSpacing];
  result.height = v4;
  result.width = v3;
  return result;
}

- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes
{
  return (SBHIconGridSizeClassSizeMap *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_iconGridSizeClassSizes));
}

- (SBHIconGridSizeClassSet)supportedIconGridSizeClasses
{
  void *v3;
  _TtC15ControlCenterUI14IconListLayout *v4;
  id v5;
  id v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_controlCenterDomain);
  v6 = objc_msgSend(v5, sel_allNonDefaultGridSizeClasses);

  return (SBHIconGridSizeClassSet *)v6;
}

- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3
{
  id v5;
  _TtC15ControlCenterUI14IconListLayout *v6;
  SBIconImageInfo *result;

  v5 = a4;
  v6 = self;
  sub_1CFBEFF88(v5);

  return result;
}

- (_TtC15ControlCenterUI14IconListLayout)init
{
  uint64_t v3;
  _TtC15ControlCenterUI14IconListLayout *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  objc_super v11;

  v3 = OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_iconGridSizeClassSizes;
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1CFBEFC20();
  v5 = (uint64_t *)((char *)v4 + OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_portraitGridDimensions);
  v6 = CCUICompactModuleColumns();
  v7 = CCUICompactModuleRows();
  *v5 = v6;
  v5[1] = v7;
  v8 = (Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_fixedIconSpacing);
  CCUILayoutGutter();
  *v8 = v9;
  v8[1] = v9;

  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for IconListLayout();
  return -[IconListLayout init](&v11, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_iconGridSizeClassSizes));
}

@end
