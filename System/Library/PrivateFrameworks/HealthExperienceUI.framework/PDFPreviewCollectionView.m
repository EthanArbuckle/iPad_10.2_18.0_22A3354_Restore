@implementation PDFPreviewCollectionView

- (void)preferredContentSizeCategoryDidChange
{
  _TtC18HealthExperienceUI24PDFPreviewCollectionView *v2;

  v2 = self;
  sub_1A97E255C();

}

- (_TtC18HealthExperienceUI24PDFPreviewCollectionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A97E31F8();
}

- (_TtC18HealthExperienceUI24PDFPreviewCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4;
  _TtC18HealthExperienceUI24PDFPreviewCollectionView *result;

  v4 = a4;
  result = (_TtC18HealthExperienceUI24PDFPreviewCollectionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24PDFPreviewCollectionView____lazy_storage___spinnerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24PDFPreviewCollectionView____lazy_storage___noDataLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24PDFPreviewCollectionView____lazy_storage___spinnerContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24PDFPreviewCollectionView_spinnerToContainerTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24PDFPreviewCollectionView_spinnerToContainerCenterYConstraint));
}

@end
