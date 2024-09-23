@implementation HandsKitUtils

+ (__n128)inverseExtrinsics::
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  __int128 v4;

  v0 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v1 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  specialized static HandsKitUtils.inverseExtrinsics(_:_:)(v0, v1);
  v4 = v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (__n128)v4;
}

+ (void)downScaleIntrinsics:(float32x4_t)a1
{
  simd_mul(a1, a2);
  __asm { FMOV            V3.4S, #1.0 }
}

- (_TtC5Hands13HandsKitUtils)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HandsKitUtils();
  return -[HandsKitUtils init](&v3, sel_init);
}

@end
