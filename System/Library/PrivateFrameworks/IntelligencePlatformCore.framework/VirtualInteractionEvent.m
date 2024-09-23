@implementation VirtualInteractionEvent

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = sub_1C106AC18();
  v7 = v6;

  swift_getObjCClassMetadata();
  sub_1C0F1A8CC();
  v9 = v8;
  sub_1C07B3374(v5, v7);
  return v9;
}

- (id)serialize
{
  _TtC24IntelligencePlatformCore23VirtualInteractionEvent *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1C0F1AB98();
  v5 = v4;

  if (v5 >> 60 == 15)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sub_1C106ABF4();
    sub_1C07B33B8(v3, v5);
  }
  return v6;
}

- (_TtC24IntelligencePlatformCore23VirtualInteractionEvent)init
{
  sub_1C0F1AE08();
}

- (void).cxx_destruct
{
  sub_1C07B1F90((uint64_t)self + OBJC_IVAR____TtC24IntelligencePlatformCore23VirtualInteractionEvent_virtualInteraction, type metadata accessor for VirtualInteraction);
}

@end
