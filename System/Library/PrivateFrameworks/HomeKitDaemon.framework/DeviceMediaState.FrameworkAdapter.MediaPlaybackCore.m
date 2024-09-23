@implementation DeviceMediaState.FrameworkAdapter.MediaPlaybackCore

- (void)didFinishLoadingRequestForController:(id)a3
{
  id v4;
  _TtCOO13HomeKitDaemon16DeviceMediaState16FrameworkAdapter17MediaPlaybackCore *v5;

  v4 = a3;
  v5 = self;
  sub_22194C600(v4);

}

- (_TtCOO13HomeKitDaemon16DeviceMediaState16FrameworkAdapter17MediaPlaybackCore)init
{
  _TtCOO13HomeKitDaemon16DeviceMediaState16FrameworkAdapter17MediaPlaybackCore *result;

  result = (_TtCOO13HomeKitDaemon16DeviceMediaState16FrameworkAdapter17MediaPlaybackCore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_221949590((uint64_t)self+ OBJC_IVAR____TtCOO13HomeKitDaemon16DeviceMediaState16FrameworkAdapter17MediaPlaybackCore_updateStream);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCOO13HomeKitDaemon16DeviceMediaState16FrameworkAdapter17MediaPlaybackCore_controller));
}

@end
