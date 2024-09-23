@implementation ProfileGradientViewWithImage

- (_TtC18HealthExperienceUI28ProfileGradientViewWithImage)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A97DE630();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ProfileGradientViewWithImage();
  v4 = a3;
  v5 = v6.receiver;
  -[ProfileGradientViewWithImage traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  sub_1A97DAA18();

}

- (_TtC18HealthExperienceUI28ProfileGradientViewWithImage)initWithFrame:(CGRect)a3
{
  sub_1A97DD110();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28ProfileGradientViewWithImage_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28ProfileGradientViewWithImage_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28ProfileGradientViewWithImage_profileImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28ProfileGradientViewWithImage____lazy_storage___disclosureIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28ProfileGradientViewWithImage____lazy_storage___watchIconImage));
  swift_bridgeObjectRelease();
}

@end
