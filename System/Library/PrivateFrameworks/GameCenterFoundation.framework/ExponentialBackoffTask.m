@implementation ExponentialBackoffTask

- (_TtP20GameCenterFoundation30ExponentialBackoffTaskDelegate_)delegate
{
  sub_1BCEE1C20();
}

- (void)setDelegate:(id)a3
{
  _TtC20GameCenterFoundation22ExponentialBackoffTask *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1BCEE1CAC();

}

- (_TtC20GameCenterFoundation22ExponentialBackoffTask)initWithName:(id)a3 queue:(id)a4 initialDelay:(double)a5 maxDelay:(double)a6 maxRetryCount:(int64_t)a7
{
  uint64_t v11;
  uint64_t v12;

  v11 = sub_1BCF15628();
  return (_TtC20GameCenterFoundation22ExponentialBackoffTask *)ExponentialBackoffTask.init(name:queue:initialDelay:maxDelay:maxRetryCount:)(v11, v12, a4, a7, a5, a6);
}

- (void)startWithTask:(id)a3 successCondition:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC20GameCenterFoundation22ExponentialBackoffTask *v10;

  v6 = _Block_copy(a3);
  v7 = _Block_copy(a4);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = self;
  sub_1BCEE204C((uint64_t)sub_1BCEE3B5C, v8, (uint64_t)sub_1BCEE3B64, v9);

  swift_release();
  swift_release();
}

- (void)cancel
{
  _TtC20GameCenterFoundation22ExponentialBackoffTask *v2;

  v2 = self;
  sub_1BCEE32F8();

}

- (_TtC20GameCenterFoundation22ExponentialBackoffTask)init
{
  ExponentialBackoffTask.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_1BCEB8864((uint64_t)self + OBJC_IVAR____TtC20GameCenterFoundation22ExponentialBackoffTask_delegate);
}

@end
