@implementation TextWithIconCell

- (_TtC15HealthRecordsUI16TextWithIconCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_1BC62C680();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC15HealthRecordsUI16TextWithIconCell *)sub_1BC4DB060(a3, (uint64_t)a4, v6);
}

- (_TtC15HealthRecordsUI16TextWithIconCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC15HealthRecordsUI16TextWithIconCell *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI16TextWithIconCell____lazy_storage___iconView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI16TextWithIconCell____lazy_storage___titleLabel) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC15HealthRecordsUI16TextWithIconCell_baseAccessibilityIdentifier);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC15HealthRecordsUI16TextWithIconCell *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  id v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TextWithIconCell();
  v2 = v5.receiver;
  -[TextWithIconCell prepareForReuse](&v5, sel_prepareForReuse);
  v3 = sub_1BC4DACD0();
  objc_msgSend(v3, sel_setImage_, 0, v5.receiver, v5.super_class);

  v4 = sub_1BC4DAD68();
  objc_msgSend(v4, sel_setText_, 0);

}

- (void)layoutSubviews
{
  id v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for TextWithIconCell();
  v2 = v15.receiver;
  -[TextWithIconCell layoutSubviews](&v15, sel_layoutSubviews);
  v3 = sub_1BC4DAD68();
  objc_msgSend(v3, sel_bounds, v15.receiver, v15.super_class);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = sub_1BC4DAD68();
  objc_msgSend(v2, sel_convertRect_fromCoordinateSpace_, v12, v5, v7, v9, v11);
  v14 = v13;

  objc_msgSend(v2, sel_setSeparatorInset_, 0.0, v14, 0.0, 0.0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI16TextWithIconCell____lazy_storage___iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI16TextWithIconCell____lazy_storage___titleLabel));
  swift_bridgeObjectRelease();
}

@end
