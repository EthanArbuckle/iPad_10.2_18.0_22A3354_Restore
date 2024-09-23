@implementation InstallProgressLayer

+ (BOOL)needsDisplayForKey:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t ObjCClassMetadata;
  unint64_t v8;
  unsigned __int8 v9;
  void *ObjCClassFromMetadata;
  NSString v12;
  objc_super v13;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  if (v4 == 0x73736572676F7270 && v6 == 0xE800000000000000)
  {
    v8 = 0xE800000000000000;
  }
  else
  {
    if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x73736572676F7270, 0xE800000000000000, v4, v6, 0) & 1) == 0)
    {
      if (v4 == 0x6F72507265746E65 && v6 == 0xED00007373657267)
      {
        v8 = 0xED00007373657267;
        goto LABEL_9;
      }
      if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6F72507265746E65, 0xED00007373657267, v4, v6, 0) & 1) == 0)
      {
        if (v4 == 0x676F725074697865 && v6 == 0xEC00000073736572)
        {
          v8 = 0xEC00000073736572;
          goto LABEL_9;
        }
        if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x676F725074697865, 0xEC00000073736572, v4, v6, 0) & 1) == 0)
        {
          ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(ObjCClassMetadata);
          v12 = String._bridgeToObjectiveC()();
          v13.receiver = ObjCClassFromMetadata;
          v13.super_class = (Class)&OBJC_METACLASS____TtC22SubscribePageExtension20InstallProgressLayer;
          v9 = objc_msgSendSuper2(&v13, "needsDisplayForKey:", v12);
          swift_bridgeObjectRelease(v6);

          return v9;
        }
      }
    }
    v8 = v6;
  }
LABEL_9:
  swift_bridgeObjectRelease(v8);
  return 1;
}

- (id)actionForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC22SubscribePageExtension20InstallProgressLayer *v7;
  id v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = sub_1001FA1AC(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (void)drawInContext:(CGContext *)a3
{
  CGContext *v4;
  _TtC22SubscribePageExtension20InstallProgressLayer *v5;

  v4 = a3;
  v5 = self;
  sub_1001FA460(v4);

}

- (_TtC22SubscribePageExtension20InstallProgressLayer)init
{
  return (_TtC22SubscribePageExtension20InstallProgressLayer *)sub_1001FABA4();
}

- (_TtC22SubscribePageExtension20InstallProgressLayer)initWithLayer:(id)a3
{
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  return (_TtC22SubscribePageExtension20InstallProgressLayer *)sub_1001FAC8C(v5);
}

- (_TtC22SubscribePageExtension20InstallProgressLayer)initWithCoder:(id)a3
{
  return (_TtC22SubscribePageExtension20InstallProgressLayer *)sub_1001FADDC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20InstallProgressLayer_stageColor));
}

@end
