@implementation BalanceWidgetSchedulingManager

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager *, _UNKNOWN **, uint64_t, uint64_t);
  _TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager *v7;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(_QWORD *)&self->widgetReloader[OBJC_IVAR____TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager_changeProvider];
  v5 = swift_getObjectType();
  v6 = *(void (**)(_TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager *, _UNKNOWN **, uint64_t, uint64_t))(v4 + 16);
  v7 = self;
  swift_unknownObjectRetain();
  v6(v7, &off_250E95160, v5, v4);
  swift_unknownObjectRelease();

  v8.receiver = v7;
  v8.super_class = ObjectType;
  -[BalanceWidgetSchedulingManager dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager_widgetReloader);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager_queue));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager_reloadOperation));
  sub_23DC97390(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager_didBecomeReady));
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4;
  _TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager *v5;

  v4 = a3;
  v5 = self;
  sub_23DCAC67C(v4);

}

- (_TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager)init
{
  _TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager *result;

  result = (_TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
