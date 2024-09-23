@implementation SnapshotPageTraitEnvironment

- (UIEdgeInsets)pageMarginInsets
{
  _TtC8AppStore28SnapshotPageTraitEnvironment *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v2 = self;
  sub_100074840();
  v4 = v3;

  v5 = 0.0;
  v6 = 0.0;
  v7 = v4;
  v8 = v4;
  result.right = v8;
  result.bottom = v6;
  result.left = v7;
  result.top = v5;
  return result;
}

- (UITraitCollection)traitCollection
{
  return (UITraitCollection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC8AppStore28SnapshotPageTraitEnvironment_traitCollection));
}

- (CGSize)pageContainerSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8AppStore28SnapshotPageTraitEnvironment_pageContainerSize);
  v3 = *(double *)&self->traitCollection[OBJC_IVAR____TtC8AppStore28SnapshotPageTraitEnvironment_pageContainerSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC8AppStore28SnapshotPageTraitEnvironment)init
{
  _TtC8AppStore28SnapshotPageTraitEnvironment *result;

  result = (_TtC8AppStore28SnapshotPageTraitEnvironment *)_swift_stdlib_reportUnimplementedInitializer("AppStore.SnapshotPageTraitEnvironment", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
