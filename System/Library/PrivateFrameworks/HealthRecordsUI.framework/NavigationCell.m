@implementation NavigationCell

- (_TtC15HealthRecordsUI14NavigationCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI14NavigationCell *)sub_1BC473EC8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI14NavigationCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI14NavigationCell *)sub_1BC47404C(a3);
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NavigationCell();
  v2 = v4.receiver;
  -[NavigationCell layoutSubviews](&v4, sel_layoutSubviews);
  sub_1BC62A988();
  v3 = (id)*MEMORY[0x1E0CD2A68];
  sub_1BC62CDF4();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15HealthRecordsUI14NavigationCell *v6;

  v5 = a3;
  v6 = self;
  sub_1BC474330(a3);

}

- (void)showDetailViewController:(id)a3 viewController:(id)a4
{
  id v6;
  _TtC15HealthRecordsUI14NavigationCell *v7;
  id v8;
  _TtC15HealthRecordsUI14NavigationCell *v9;
  _OWORD v10[2];

  if (a3)
  {
    v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1BC62D088();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v8 = a4;
    v9 = self;
  }
  sub_1BC474CBC();

  sub_1BC39BD2C((uint64_t)v10);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI14NavigationCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI14NavigationCell____lazy_storage___disclosureImageView));
  sub_1BC37AE60((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI14NavigationCell_item);
}

@end
