@implementation MultiValueView

- (_TtC15HealthRecordsUI14MultiValueView)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI14MultiValueView *)MultiValueView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI14MultiValueView)initWithCoder:(id)a3
{
  id v4;
  _TtC15HealthRecordsUI14MultiValueView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI14MultiValueView_viewData) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI14MultiValueView____lazy_storage___stackView) = 0;
  v4 = a3;

  result = (_TtC15HealthRecordsUI14MultiValueView *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI14MultiValueView____lazy_storage___stackView));
}

@end
