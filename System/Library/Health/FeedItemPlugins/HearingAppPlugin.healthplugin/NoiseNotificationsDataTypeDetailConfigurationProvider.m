@implementation NoiseNotificationsDataTypeDetailConfigurationProvider

- (_TtC16HearingAppPlugin53NoiseNotificationsDataTypeDetailConfigurationProvider)init
{
  uint64_t v3;
  void *v4;
  _TtC16HearingAppPlugin53NoiseNotificationsDataTypeDetailConfigurationProvider *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC16HearingAppPlugin53NoiseNotificationsDataTypeDetailConfigurationProvider_dataType;
  sub_23129DC7C();
  v4 = (void *)*MEMORY[0x24BDD28D8];
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)MEMORY[0x2348D92BC](v4);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for NoiseNotificationsDataTypeDetailConfigurationProvider();
  return -[NoiseNotificationsDataTypeDetailConfigurationProvider init](&v7, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HearingAppPlugin53NoiseNotificationsDataTypeDetailConfigurationProvider_dataType));
}

@end
