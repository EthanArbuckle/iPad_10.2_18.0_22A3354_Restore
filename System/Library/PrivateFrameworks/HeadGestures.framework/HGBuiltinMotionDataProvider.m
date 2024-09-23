@implementation HGBuiltinMotionDataProvider

- (NSString)description
{
  _TtC12HeadGestures27HGBuiltinMotionDataProvider *v2;
  void *v3;

  v2 = self;
  sub_23DA9A86C();

  v3 = (void *)sub_23DA9BAA0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC12HeadGestures27HGBuiltinMotionDataProvider)init
{
  uint64_t v3;
  id v4;
  _TtC12HeadGestures27HGBuiltinMotionDataProvider *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC12HeadGestures27HGBuiltinMotionDataProvider_cmMotionManager;
  v4 = objc_allocWithZone(MEMORY[0x24BDC1400]);
  v5 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  *(Class *)((char *)&v5->super.super.isa + OBJC_IVAR____TtC12HeadGestures27HGBuiltinMotionDataProvider_samplingRate) = (Class)0x4039000000000000;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for HGBuiltinMotionDataProvider();
  return -[HGMotionDataProvider init](&v7, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12HeadGestures27HGBuiltinMotionDataProvider_cmMotionManager));
}

@end
