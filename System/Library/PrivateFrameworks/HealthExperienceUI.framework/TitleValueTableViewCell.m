@implementation TitleValueTableViewCell

- (_TtC18HealthExperienceUI23TitleValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  char *v5;
  void *v6;
  char *v7;
  _TtC18HealthExperienceUI23TitleValueTableViewCell *v8;
  objc_super v10;

  if (a4)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23TitleValueTableViewCell_item;
    *(_OWORD *)v5 = 0u;
    *((_OWORD *)v5 + 1) = 0u;
    *((_QWORD *)v5 + 4) = 0;
    v6 = (void *)sub_1A9A9580C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
    v7 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23TitleValueTableViewCell_item;
    *(_OWORD *)v7 = 0u;
    *((_OWORD *)v7 + 1) = 0u;
    *((_QWORD *)v7 + 4) = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TitleValueTableViewCell();
  v8 = -[TitleValueTableViewCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, 1, v6);

  return v8;
}

- (_TtC18HealthExperienceUI23TitleValueTableViewCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI23TitleValueTableViewCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23TitleValueTableViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI23TitleValueTableViewCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TitleValueTableViewCell();
  v2 = v6.receiver;
  -[TitleValueTableViewCell tintColorDidChange](&v6, sel_tintColorDidChange);
  v3 = objc_msgSend(v2, sel_detailTextLabel, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, sel_tintColor);
    objc_msgSend(v4, sel_setTextColor_, v5);

    v2 = v4;
  }

}

- (void).cxx_destruct
{
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI23TitleValueTableViewCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
}

@end
