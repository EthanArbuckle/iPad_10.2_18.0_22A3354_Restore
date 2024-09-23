@implementation HPSAdaptiveVolumeSliderCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  _TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1DB386818(a3);

}

- (_TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
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
  return (_TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell *)sub_1DB387574(a3, v7, v9, a5);
}

- (_TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell *v9;
  objc_super v11;

  if (a4)
  {
    sub_1DB3BC340();
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_listeners) = (Class)MEMORY[0x1E0DEE9E8];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice) = 0;
  if (v7)
  {
    v8 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for HPSAdaptiveVolumeSliderCell();
  v9 = -[HPSAdaptiveVolumeSliderCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, v8);

  return v9;
}

- (_TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_listeners) = (Class)MEMORY[0x1E0DEE9E8];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HPSAdaptiveVolumeSliderCell();
  return -[HPSAdaptiveVolumeSliderCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice));
}

@end
