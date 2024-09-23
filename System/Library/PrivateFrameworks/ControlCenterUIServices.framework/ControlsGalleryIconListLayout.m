@implementation ControlsGalleryIconListLayout

- (unint64_t)numberOfColumnsForOrientation:(int64_t)a3
{
  return 4;
}

- (unint64_t)numberOfRowsForOrientation:(int64_t)a3
{
  return -1;
}

- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  UIEdgeInsetsMakeWithEdges();
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (SBIconImageInfo)iconImageInfo
{
  _TtC23ControlCenterUIServices29ControlsGalleryIconListLayout *v3;
  __CFString *v4;
  SBIconImageInfo *result;

  v3 = self;
  v4 = (id)SBHIconGridSizeClassForCCUIGridSizeClass(0);
  sub_2384F7EB8(v4);

  return result;
}

- (CGSize)iconSpacingForOrientation:(int64_t)a3
{
  _TtC23ControlCenterUIServices29ControlsGalleryIconListLayout *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = self;
  sub_2384F814C();
  v5 = v4;

  v6 = v5;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes
{
  void *v3;
  _TtC23ControlCenterUIServices29ControlsGalleryIconListLayout *v4;
  id v5;
  _TtC23ControlCenterUIServices29ControlsGalleryIconListLayout *v6;
  id v7;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_sharedApplication);
  v6 = (_TtC23ControlCenterUIServices29ControlsGalleryIconListLayout *)objc_msgSend(v5, sel_preferredContentSizeCategory);

  if ((sub_238506C74() & 1) != 0)
  {
    v7 = sub_2384F9194((uint64_t)sub_2384F7DDC, 0);

  }
  else
  {

    v7 = objc_retain(*(id *)((char *)&v4->super.isa
                           + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout_realIconGridSizeClassSizes));
    v6 = v4;
  }

  return (SBHIconGridSizeClassSizeMap *)v7;
}

- (SBHIconGridSizeClassSet)supportedIconGridSizeClasses
{
  void *v3;
  _TtC23ControlCenterUIServices29ControlsGalleryIconListLayout *v4;
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
  _TtC23ControlCenterUIServices29ControlsGalleryIconListLayout *v6;
  SBIconImageInfo *result;

  v5 = a4;
  v6 = self;
  sub_2384F7EB8(v5);

  return result;
}

- (_TtC23ControlCenterUIServices29ControlsGalleryIconListLayout)init
{
  uint64_t v3;
  _TtC23ControlCenterUIServices29ControlsGalleryIconListLayout *v4;
  char *v5;
  char *v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout_realIconGridSizeClassSizes;
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_2384F9194((uint64_t)nullsub_1, 0);
  v5 = (char *)v4
     + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout____lazy_storage___displayScale;
  *(_QWORD *)v5 = 0;
  v5[8] = 1;
  v6 = (char *)v4
     + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout____lazy_storage___gridGeometryInfo;
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  *(Class *)((char *)&v4->super.isa
           + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout____lazy_storage___defaultRootListLayout) = 0;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for ControlsGalleryIconListLayout();
  return -[ControlsGalleryIconListLayout init](&v8, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout_realIconGridSizeClassSizes));
  swift_unknownObjectRelease();
}

@end
