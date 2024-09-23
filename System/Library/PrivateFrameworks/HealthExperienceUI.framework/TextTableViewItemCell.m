@implementation TextTableViewItemCell

- (_TtC18HealthExperienceUI21TextTableViewItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t ObjectType;
  uint64_t v7;
  void *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  _TtC18HealthExperienceUI21TextTableViewItemCell *v12;
  _TtC18HealthExperienceUI21TextTableViewItemCell *v13;
  objc_super v15;

  ObjectType = swift_getObjectType();
  v7 = ObjectType;
  if (a4)
  {
    ObjectType = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    a4 = v8;
  }
  v9 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI21TextTableViewItemCell_item;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_QWORD *)v9 + 4) = 0;
  v10 = (*(uint64_t (**)(uint64_t))(v7 + 88))(ObjectType);
  if (a4)
  {
    v11 = (void *)sub_1A9A9580C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for TextTableViewItemCell();
  v12 = -[TextTableViewItemCell initWithStyle:reuseIdentifier:](&v15, sel_initWithStyle_reuseIdentifier_, v10, v11);

  v13 = v12;
  sub_1A985AD1C();

  return v13;
}

- (_TtC18HealthExperienceUI21TextTableViewItemCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI21TextTableViewItemCell *v6;
  _TtC18HealthExperienceUI21TextTableViewItemCell *v7;
  _TtC18HealthExperienceUI21TextTableViewItemCell *v8;
  objc_super v10;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI21TextTableViewItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TextTableViewItemCell();
  v5 = a3;
  v6 = -[TextTableViewItemCell initWithCoder:](&v10, sel_initWithCoder_, v5);
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    sub_1A985AD1C();

  }
  return v7;
}

- (void)prepareForReuse
{
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TextTableViewItemCell();
  v2 = v7.receiver;
  -[TextTableViewItemCell prepareForReuse](&v7, sel_prepareForReuse);
  v3 = objc_msgSend(v2, sel_textLabel, v7.receiver, v7.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_setText_, 0);

  }
  v5 = objc_msgSend(v2, sel_detailTextLabel);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setText_, 0);

    v2 = v6;
  }

}

- (void).cxx_destruct
{
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI21TextTableViewItemCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
}

@end
