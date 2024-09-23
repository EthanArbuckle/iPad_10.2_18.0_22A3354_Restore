@implementation BrowseTileContentViewBase

- (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17125BrowseTileContentViewBase)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17125BrowseTileContentViewBase *)sub_1A980BAAC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17125BrowseTileContentViewBase)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A980E310();
}

- (void)layoutSubviews
{
  _TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17125BrowseTileContentViewBase *v2;

  v2 = self;
  sub_1A980BC90();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17125BrowseTileContentViewBase_previousAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17125BrowseTileContentViewBase____lazy_storage___separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17125BrowseTileContentViewBase____lazy_storage___disclosureImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17125BrowseTileContentViewBase____lazy_storage___activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17125BrowseTileContentViewBase_accessoryView));
}

@end
