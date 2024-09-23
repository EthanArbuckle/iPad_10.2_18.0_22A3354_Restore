@implementation ContentConfigurationTableViewCell

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  objc_class *v10;
  _TtC18HealthExperienceUI33ContentConfigurationTableViewCell *v11;
  uint64_t v12;
  objc_super v13;

  v4 = a4;
  v5 = a3;
  sub_1A9778DD8();
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (objc_class *)type metadata accessor for ContentConfigurationTableViewCell();
  v13.receiver = self;
  v13.super_class = v10;
  v11 = self;
  -[ContentConfigurationTableViewCell setSelected:animated:](&v13, sel_setSelected_animated_, v5, v4);
  sub_1A98DBA84(v5, (int)-[ContentConfigurationTableViewCell isHighlighted](v11, sel_isHighlighted), (uint64_t)v9);
  v12 = sub_1A9A93E38();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 0, 1, v12);
  MEMORY[0x1AF41AC98](v9);

}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  objc_class *v10;
  _TtC18HealthExperienceUI33ContentConfigurationTableViewCell *v11;
  uint64_t v12;
  objc_super v13;

  v4 = a4;
  v5 = a3;
  sub_1A9778DD8();
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (objc_class *)type metadata accessor for ContentConfigurationTableViewCell();
  v13.receiver = self;
  v13.super_class = v10;
  v11 = self;
  -[ContentConfigurationTableViewCell setHighlighted:animated:](&v13, sel_setHighlighted_animated_, v5, v4);
  sub_1A98DBA84((char)-[ContentConfigurationTableViewCell isSelected](v11, sel_isSelected), v5, (uint64_t)v9);
  v12 = sub_1A9A93E38();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 0, 1, v12);
  MEMORY[0x1AF41AC98](v9);

}

- (_TtC18HealthExperienceUI33ContentConfigurationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  char *v6;
  void *v7;
  char *v8;
  _TtC18HealthExperienceUI33ContentConfigurationTableViewCell *v9;
  objc_super v11;

  if (a4)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v6 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33ContentConfigurationTableViewCell_item;
    *(_OWORD *)v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    *((_QWORD *)v6 + 4) = 0;
    v7 = (void *)sub_1A9A9580C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
    v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33ContentConfigurationTableViewCell_item;
    *(_OWORD *)v8 = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    *((_QWORD *)v8 + 4) = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ContentConfigurationTableViewCell();
  v9 = -[ContentConfigurationTableViewCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, v7);

  return v9;
}

- (_TtC18HealthExperienceUI33ContentConfigurationTableViewCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI33ContentConfigurationTableViewCell *)sub_1A98DC050((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC18HealthExperienceUI33ContentConfigurationTableViewCell_item, type metadata accessor for ContentConfigurationTableViewCell);
}

- (void).cxx_destruct
{
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI33ContentConfigurationTableViewCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
}

@end
