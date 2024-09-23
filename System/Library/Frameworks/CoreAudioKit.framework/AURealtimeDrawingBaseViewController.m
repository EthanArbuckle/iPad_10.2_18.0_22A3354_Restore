@implementation AURealtimeDrawingBaseViewController

- (void)viewDidLoad
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AURealtimeDrawingBaseViewController();
  v2 = (char *)v3.receiver;
  -[AUAppleViewControllerBase viewDidLoad](&v3, sel_viewDidLoad);
  *(_QWORD *)&v2[OBJC_IVAR____TtC12CoreAudioKit25AUAppleViewControllerBase_realtimeDrawingInterval] = 0x3FA999999999999ALL;

}

- (void)checkLastRenderedTime
{
  _TtC12CoreAudioKit35AURealtimeDrawingBaseViewController *v2;

  v2 = self;
  sub_2131E1174();

}

- (_TtC12CoreAudioKit35AURealtimeDrawingBaseViewController)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit35AURealtimeDrawingBaseViewController_renderingPollingInterval) = (Class)1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit35AURealtimeDrawingBaseViewController_numChannels) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit35AURealtimeDrawingBaseViewController_meterTimer) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit35AURealtimeDrawingBaseViewController____lazy_storage___decimalFormatter) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AURealtimeDrawingBaseViewController();
  return -[AUAppleViewControllerBase init](&v3, sel_init);
}

- (_TtC12CoreAudioKit35AURealtimeDrawingBaseViewController)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit35AURealtimeDrawingBaseViewController *)sub_2131E1654(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit35AURealtimeDrawingBaseViewController_meterTimer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit35AURealtimeDrawingBaseViewController____lazy_storage___decimalFormatter));
}

@end
