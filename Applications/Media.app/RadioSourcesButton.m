@implementation RadioSourcesButton

- (_TtC5Media18RadioSourcesButton)initWithCoder:(id)a3
{
  id v4;
  objc_class *v5;
  _TtC5Media18RadioSourcesButton *result;

  v4 = a3;
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0
    && _CocoaArrayWrapper.endIndex.getter(_swiftEmptyArrayStorage))
  {
    v5 = (objc_class *)sub_100005B84((uint64_t)_swiftEmptyArrayStorage);
  }
  else
  {
    v5 = (objc_class *)&_swiftEmptySetSingleton;
  }
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Media18RadioSourcesButton_subscriptions) = v5;
  swift_weakInit((char *)self + OBJC_IVAR____TtC5Media18RadioSourcesButton_nowPlayingObserver, 0);

  result = (_TtC5Media18RadioSourcesButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010007E630, "Media/RadioSourcesButton.swift", 30, 2, 44, 0);
  __break(1u);
  return result;
}

- (void)invalidate
{
  uint64_t *v2;
  uint64_t v3;
  _BYTE v4[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Media18RadioSourcesButton_subscriptions);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Media18RadioSourcesButton_subscriptions, v4, 1, 0);
  v3 = *v2;
  *v2 = (uint64_t)&_swiftEmptySetSingleton;
  swift_bridgeObjectRelease(v3);
}

- (_TtC5Media18RadioSourcesButton)initWithFrame:(CGRect)a3
{
  _TtC5Media18RadioSourcesButton *result;

  result = (_TtC5Media18RadioSourcesButton *)_swift_stdlib_reportUnimplementedInitializer("Media.RadioSourcesButton", 24, "init(frame:)", 12, 0, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Media18RadioSourcesButton_subscriptions));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC5Media18RadioSourcesButton_nowPlayingObserver);
}

@end
