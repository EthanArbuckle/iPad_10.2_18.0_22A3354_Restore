@implementation WatchFaceSettingsManager

- (void)faceCollectionDidLoad:(id)a3
{
  id v4;
  _TtC15FocusSettingsUI24WatchFaceSettingsManager *v5;

  v4 = a3;
  v5 = self;
  sub_2155CB1D0();

}

- (_TtC15FocusSettingsUI24WatchFaceSettingsManager)init
{
  return (_TtC15FocusSettingsUI24WatchFaceSettingsManager *)sub_2155C960C();
}

- (void).cxx_destruct
{

  sub_215505AD4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15FocusSettingsUI24WatchFaceSettingsManager_onLoad));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUI24WatchFaceSettingsManager____lazy_storage___watchNPSManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUI24WatchFaceSettingsManager__watchFaceDomainAccessor));
}

@end
