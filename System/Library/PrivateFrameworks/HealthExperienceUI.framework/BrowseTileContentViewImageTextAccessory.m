@implementation BrowseTileContentViewImageTextAccessory

- (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17139BrowseTileContentViewImageTextAccessory)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17139BrowseTileContentViewImageTextAccessory *)sub_1A980C6CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17139BrowseTileContentViewImageTextAccessory)initWithCoder:(id)a3
{
  id v4;
  _TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17139BrowseTileContentViewImageTextAccessory *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17139BrowseTileContentViewImageTextAccessory____lazy_storage___categoryView) = 0;
  v4 = a3;

  result = (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17139BrowseTileContentViewImageTextAccessory *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17139BrowseTileContentViewImageTextAccessory *v2;

  v2 = self;
  sub_1A980C8D8();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17139BrowseTileContentViewImageTextAccessory *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1A980CA6C((uint64_t (*)(_QWORD))sub_1A980C478, width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (NSString)description
{
  return (NSString *)sub_1A980CC7C(self, (uint64_t)a2, (void (*)(void))sub_1A980CCD4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17139BrowseTileContentViewImageTextAccessory____lazy_storage___categoryView));
}

@end
