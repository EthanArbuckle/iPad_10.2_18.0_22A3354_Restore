@implementation LayerTarget._UILayerTarget

- (BOOL)isEqual:(id)a3
{
  _TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget *v4;
  _TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23A70D60C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_23A7017A8((uint64_t)v8);

  sub_23A6E6768((uint64_t)v8);
  return v6 & 1;
}

- (BOOL)matchesLayer:(id)a3
{
  id v4;
  _TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_23A7018F8(v4);

  return self & 1;
}

- (_TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget)init
{
  _TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget *result;

  result = (_TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
