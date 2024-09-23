@implementation NotificationSettingsSharingCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC18HealthExperienceUI31NotificationSettingsSharingCell *v8;
  uint64_t v9;

  v4 = sub_1A9A93DB4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A93D9C();
  v8 = self;
  sub_1A96C470C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC18HealthExperienceUI31NotificationSettingsSharingCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI31NotificationSettingsSharingCell_item;
  v9 = (objc_class *)type metadata accessor for NotificationSettingsSharingCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[NotificationSettingsSharingCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI31NotificationSettingsSharingCell)initWithCoder:(id)a3
{
  char *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI31NotificationSettingsSharingCell_item;
  v6 = (objc_class *)type metadata accessor for NotificationSettingsSharingCell();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[NotificationSettingsSharingCell initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1A96C6BDC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI31NotificationSettingsSharingCell_item, (uint64_t)&qword_1ED27B9E0, (uint64_t)MEMORY[0x1E0DEB940], (uint64_t (*)(_QWORD))sub_1A96C6C18);
}

@end
