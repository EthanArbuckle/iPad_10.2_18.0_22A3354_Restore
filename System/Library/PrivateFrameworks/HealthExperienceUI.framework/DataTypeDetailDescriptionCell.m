@implementation DataTypeDetailDescriptionCell

- (_TtC18HealthExperienceUI29DataTypeDetailDescriptionCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI29DataTypeDetailDescriptionCell *)sub_1A979E90C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI29DataTypeDetailDescriptionCell)initWithCoder:(id)a3
{
  _OWORD *v4;
  char *v10;
  id v11;
  _TtC18HealthExperienceUI29DataTypeDetailDescriptionCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI29DataTypeDetailDescriptionCell____lazy_storage___textView) = 0;
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC18HealthExperienceUI29DataTypeDetailDescriptionCell_textInsets);
  __asm { FMOV            V0.2D, #16.0 }
  *v4 = _Q0;
  v4[1] = _Q0;
  v10 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI29DataTypeDetailDescriptionCell_item;
  *((_QWORD *)v10 + 4) = 0;
  *(_OWORD *)v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  v11 = a3;

  result = (_TtC18HealthExperienceUI29DataTypeDetailDescriptionCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DataTypeDetailDescriptionCell();
  v2 = v8.receiver;
  -[DataTypeDetailDescriptionCell layoutSubviews](&v8, sel_layoutSubviews);
  sub_1A979E610();
  v4 = v3;
  v5 = objc_msgSend(v2, sel_contentView, v8.receiver, v8.super_class);
  objc_msgSend(v5, sel_bounds);
  v7 = v6;

  objc_msgSend(v4, sel_setFrame_, UIEdgeInsetsInsetRect_0(v7));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  _TtC18HealthExperienceUI29DataTypeDetailDescriptionCell *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  v4 = a3.width + -16.0 + -16.0;
  if (v4 < 0.0)
    v5 = 0.0;
  else
    v5 = v4;
  v6 = self;
  sub_1A979E610();
  v8 = v7;
  v9 = sub_1A98570E0(v5);

  v10 = ceil(v9 + 16.0 + 16.0);
  v11 = width;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29DataTypeDetailDescriptionCell____lazy_storage___textView));
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29DataTypeDetailDescriptionCell_item);
}

- (NSString)description
{
  _TtC18HealthExperienceUI29DataTypeDetailDescriptionCell *v2;
  void *v3;

  v2 = self;
  DataTypeDetailDescriptionCell.description.getter();

  v3 = (void *)sub_1A9A9580C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
