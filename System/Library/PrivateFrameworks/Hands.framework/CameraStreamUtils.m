@implementation CameraStreamUtils

+ (id)getCameraKeysForCalibration:(id)a3
{
  id v3;
  Class isa;

  v3 = a3;
  specialized static CameraStreamUtils.getCameraKeysForCalibration(_:)(v3);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

+ (BOOL)matchStreams:(id)a3 :(id)a4
{
  char v4;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = specialized static CameraStreamUtils.matchStreams(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

@end
