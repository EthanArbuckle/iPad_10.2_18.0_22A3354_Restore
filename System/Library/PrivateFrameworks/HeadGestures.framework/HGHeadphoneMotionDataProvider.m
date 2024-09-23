@implementation HGHeadphoneMotionDataProvider

- (NSString)description
{
  _TtC12HeadGestures29HGHeadphoneMotionDataProvider *v2;
  void *v3;

  v2 = self;
  sub_23DA71C0C();

  v3 = (void *)sub_23DA9BAA0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)headphoneMotionManagerDidConnect:(id)a3
{
  id v4;
  _TtC12HeadGestures29HGHeadphoneMotionDataProvider *v5;

  v4 = a3;
  v5 = self;
  sub_23DA727A0();

}

- (void)headphoneMotionManagerDidDisconnect:(id)a3
{
  id v4;
  _TtC12HeadGestures29HGHeadphoneMotionDataProvider *v5;

  v4 = a3;
  v5 = self;
  sub_23DA72924();

}

- (_TtC12HeadGestures29HGHeadphoneMotionDataProvider)init
{
  uint64_t v3;
  id v4;
  _TtC12HeadGestures29HGHeadphoneMotionDataProvider *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC12HeadGestures29HGHeadphoneMotionDataProvider_cmMotionManager;
  v4 = objc_allocWithZone(MEMORY[0x24BDC13E0]);
  v5 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  *((_BYTE *)&v5->super.super.isa + OBJC_IVAR____TtC12HeadGestures29HGHeadphoneMotionDataProvider_headphoneConnected) = 0;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for HGHeadphoneMotionDataProvider();
  return -[HGMotionDataProvider init](&v7, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12HeadGestures29HGHeadphoneMotionDataProvider_cmMotionManager));
}

@end
