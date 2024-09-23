@implementation CameraPicker

- (_TtC16ContinuityCamera12CameraPicker)init
{
  return (_TtC16ContinuityCamera12CameraPicker *)sub_10000799C();
}

- (_TtC16ContinuityCamera12CameraPicker)initWithCoder:(id)a3
{
  sub_100007C48();
}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  id v7;
  _TtC16ContinuityCamera12CameraPicker *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _TtC16ContinuityCamera12CameraPicker *v15;
  _OWORD v16[2];

  if (!a3)
  {
    memset(v16, 0, sizeof(v16));
    v14 = a4;
    v15 = self;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    v13 = 0;
    goto LABEL_6;
  }
  v7 = a4;
  v8 = self;
  v10 = swift_unknownObjectRetain(a3, v9);
  _bridgeAnyObjectToAny(_:)(v16, v10);
  swift_unknownObjectRelease(a3);
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;

LABEL_6:
  sub_100007CAC((uint64_t)v16, v11, v13);

  swift_bridgeObjectRelease(v13);
  sub_100008878((uint64_t)v16);
}

- (int64_t)sourceType
{
  return 1;
}

- (void)setSourceType:(int64_t)a3
{
  _TtC16ContinuityCamera12CameraPicker *v3;

  v3 = self;
  sub_100007F34();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC16ContinuityCamera12CameraPicker *v4;

  v4 = self;
  sub_100007F70(a3);

}

@end
