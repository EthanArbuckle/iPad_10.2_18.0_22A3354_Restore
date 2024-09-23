@implementation AsynchronousOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isCancelled
{
  _TtC16HealthExperience21AsynchronousOperation *v2;
  BOOL v4;

  v2 = self;
  sub_1BC9335A0();

  return v4;
}

- (BOOL)isExecuting
{
  _TtC16HealthExperience21AsynchronousOperation *v2;
  char v3;
  char v5;

  v2 = self;
  sub_1BC9335A0();
  if (v5 && v5 == 1)
    v3 = 1;
  else
    v3 = sub_1BC934A04();

  swift_bridgeObjectRelease();
  return v3 & 1;
}

- (BOOL)isFinished
{
  _TtC16HealthExperience21AsynchronousOperation *v2;
  char v3;

  v2 = self;
  v3 = sub_1BC86D3D0();

  return v3 & 1;
}

- (void)start
{
  _TtC16HealthExperience21AsynchronousOperation *v3;

  sub_1BC933210();
  sub_1BC86B51C();
  v3 = self;
  swift_retain();
  sub_1BC933648();

  swift_release();
}

- (void)cancel
{
  _TtC16HealthExperience21AsynchronousOperation *v3;

  sub_1BC933210();
  sub_1BC86B51C();
  v3 = self;
  swift_retain();
  sub_1BC933648();

  swift_release();
}

- (void)main
{
  _TtC16HealthExperience21AsynchronousOperation *v2;

  v2 = self;
  sub_1BC93462C();
  swift_bridgeObjectRelease();
  sub_1BC9347DC();
  __break(1u);
}

- (NSString)description
{
  _TtC16HealthExperience21AsynchronousOperation *v2;
  void *v3;

  v2 = self;
  sub_1BC86DC74();

  v3 = (void *)sub_1BC933E88();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC16HealthExperience21AsynchronousOperation)init
{
  uint64_t v3;
  _TtC16HealthExperience21AsynchronousOperation *v4;
  uint64_t v5;
  objc_super v7;
  int v8;

  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC16HealthExperience21AsynchronousOperation__autoFinishesOnCancel) = 1;
  v3 = OBJC_IVAR____TtC16HealthExperience21AsynchronousOperation_operationState;
  sub_1BC86DE64();
  v8 = 0;
  swift_allocObject();
  v4 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)sub_1BC9335C4();
  v5 = OBJC_IVAR____TtC16HealthExperience21AsynchronousOperation_workLock;
  sub_1BC933210();
  swift_allocObject();
  *(Class *)((char *)&v4->super.super.isa + v5) = (Class)sub_1BC933204();

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AsynchronousOperation();
  return -[AsynchronousOperation init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
