@implementation CAFNowPlayingObservable

- (NSString)description
{
  _TtC10CAFCombine23CAFNowPlayingObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFNowPlayingObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine23CAFNowPlayingObservable *v2;

  v2 = self;
  CAFNowPlayingObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_0();
}

- (_TtC10CAFCombine23CAFNowPlayingObservable)init
{
  CAFNowPlayingObservable.init()();
}

- (void)nowPlayingService:(id)a3 didUpdateCurrentMediaSourceIdentifier:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFNowPlayingObservable.nowPlayingService(_:didUpdateCurrentMediaSourceIdentifier:));
}

- (void)nowPlayingService:(id)a3 didUpdateTitle:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFNowPlayingObservable.nowPlayingService(_:didUpdateTitle:));
}

- (void)nowPlayingService:(id)a3 didUpdateArtist:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFNowPlayingObservable.nowPlayingService(_:didUpdateArtist:));
}

- (void)nowPlayingService:(id)a3 didUpdateAlbum:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFNowPlayingObservable.nowPlayingService(_:didUpdateAlbum:));
}

- (void)nowPlayingService:(id)a3 didUpdateUserVisibleDescription:(id)a4
{
  id v6;
  _TtC10CAFCombine23CAFNowPlayingObservable *v7;

  if (a4)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  CAFNowPlayingObservable.nowPlayingService(_:didUpdateUserVisibleDescription:)();

  swift_bridgeObjectRelease();
}

- (void)nowPlayingService:(id)a3 didUpdateArtwork:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC10CAFCombine23CAFNowPlayingObservable *v11;

  v6 = a3;
  v7 = a4;
  v11 = self;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;

  CAFNowPlayingObservable.nowPlayingService(_:didUpdateArtwork:)();
  outlined consume of Data._Representation(v8, v10);

}

- (void)nowPlayingService:(id)a3 didUpdateJumpBackwardInterval:(id)a4
{
  @objc CAFNowPlayingObservable.nowPlayingService(_:didUpdateJumpBackwardInterval:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFNowPlayingObservable.nowPlayingService(_:didUpdateJumpBackwardInterval:));
}

- (void)nowPlayingService:(id)a3 didUpdateJumpForwardInterval:(id)a4
{
  @objc CAFNowPlayingObservable.nowPlayingService(_:didUpdateJumpBackwardInterval:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFNowPlayingObservable.nowPlayingService(_:didUpdateJumpForwardInterval:));
}

- (void)nowPlayingService:(id)a3 didUpdatePlaybackState:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine23CAFNowPlayingObservable *v6;

  v5 = a3;
  v6 = self;
  CAFNowPlayingObservable.nowPlayingService(_:didUpdatePlaybackState:)();

}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine23CAFNowPlayingObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFNowPlayingObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine23CAFNowPlayingObservable *v7;

  v6 = a3;
  v7 = self;
  CAFNowPlayingObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine23CAFNowPlayingObservable *v5;

  v4 = a3;
  v5 = self;
  CAFNowPlayingObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
