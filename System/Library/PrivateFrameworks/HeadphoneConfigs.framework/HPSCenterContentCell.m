@implementation HPSCenterContentCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  _TtC16HeadphoneConfigs20HPSCenterContentCell *v5;

  v4 = a3;
  v5 = self;
  sub_1DB3A0EBC();

}

- (void)addSubview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HPSCenterContentCell();
  -[HPSCenterContentCell addSubview:](&v4, sel_addSubview_, a3);
}

- (_TtC16HeadphoneConfigs20HPSCenterContentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (a4)
  {
    v7 = sub_1DB3BC340();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = a5;
  return (_TtC16HeadphoneConfigs20HPSCenterContentCell *)sub_1DB39DB84(a3, v7, v9, a5);
}

- (_TtC16HeadphoneConfigs20HPSCenterContentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC16HeadphoneConfigs20HPSCenterContentCell *v9;
  void *v10;
  _TtC16HeadphoneConfigs20HPSCenterContentCell *v11;
  objc_super v13;

  if (a4)
  {
    sub_1DB3BC340();
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_label;
  v9 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)sub_1DB39D9CC();
  *(Class *)((char *)&v9->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_headphoneDevice) = 0;

  if (v7)
  {
    v10 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = v9;
  v13.super_class = (Class)type metadata accessor for HPSCenterContentCell();
  v11 = -[HPSCenterContentCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, v10);

  return v11;
}

- (_TtC16HeadphoneConfigs20HPSCenterContentCell)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC16HeadphoneConfigs20HPSCenterContentCell *v6;
  _TtC16HeadphoneConfigs20HPSCenterContentCell *v7;
  objc_super v9;

  v4 = OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_label;
  v5 = a3;
  v6 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)sub_1DB39D9CC();
  *(Class *)((char *)&v6->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_headphoneDevice) = 0;

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for HPSCenterContentCell();
  v7 = -[HPSCenterContentCell initWithCoder:](&v9, sel_initWithCoder_, v5);

  return v7;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_headphoneDevice));
}

@end
