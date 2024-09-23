@implementation DarwinNotificationHelper

- (void)dealloc
{
  _TtC26IntelligentRoutingServices24DarwinNotificationHelper *v2;

  v2 = self;
  DarwinNotificationHelper.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_queue));
}

- (_TtC26IntelligentRoutingServices24DarwinNotificationHelper)init
{
  return (_TtC26IntelligentRoutingServices24DarwinNotificationHelper *)DarwinNotificationHelper.init()();
}

@end
