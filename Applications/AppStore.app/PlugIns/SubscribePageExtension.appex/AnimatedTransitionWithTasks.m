@implementation AnimatedTransitionWithTasks

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (_TtC22SubscribePageExtension27AnimatedTransitionWithTasks)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC22SubscribePageExtension27AnimatedTransitionWithTasks_tasks) = (Class)_swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AnimatedTransitionWithTasks();
  return -[AnimatedTransitionWithTasks init](&v3, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension27AnimatedTransitionWithTasks_tasks));
}

@end
