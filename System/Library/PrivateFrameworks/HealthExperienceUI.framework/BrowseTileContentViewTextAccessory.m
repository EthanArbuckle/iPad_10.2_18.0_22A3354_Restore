@implementation BrowseTileContentViewTextAccessory

- (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17134BrowseTileContentViewTextAccessory)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17134BrowseTileContentViewTextAccessory *v7;
  id v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17134BrowseTileContentViewTextAccessory____lazy_storage___label) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for BrowseTileContentViewTextAccessory();
  v7 = -[BrowseTileContentViewBase initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  v8 = sub_1A980BFAC();
  -[BrowseTileContentViewTextAccessory addSubview:](v7, sel_addSubview_, v8);

  return v7;
}

- (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17134BrowseTileContentViewTextAccessory)initWithCoder:(id)a3
{
  id v4;
  _TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17134BrowseTileContentViewTextAccessory *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17134BrowseTileContentViewTextAccessory____lazy_storage___label) = 0;
  v4 = a3;

  result = (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17134BrowseTileContentViewTextAccessory *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for BrowseTileContentViewTextAccessory();
  v2 = v14.receiver;
  -[BrowseTileContentViewBase layoutSubviews](&v14, sel_layoutSubviews);
  v3 = sub_1A980BFAC();
  objc_msgSend(v2, sel_bounds, v14.receiver, v14.super_class);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v2, sel_directionalLayoutMargins);
  v13 = v12;
  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  v16 = CGRectInset(v15, 16.0, v13);
  objc_msgSend(v3, sel_setFrame_, v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17134BrowseTileContentViewTextAccessory *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1A980CA6C((uint64_t (*)(_QWORD))sub_1A980BFAC, width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (NSString)description
{
  return (NSString *)sub_1A980CC7C(self, (uint64_t)a2, (void (*)(void))sub_1A980C37C);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17134BrowseTileContentViewTextAccessory____lazy_storage___label));
}

@end
