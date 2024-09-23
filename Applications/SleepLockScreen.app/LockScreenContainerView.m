@implementation LockScreenContainerView

- (_TtC15SleepLockScreen23LockScreenContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100006B18();
}

- (void)layoutSubviews
{
  _TtC15SleepLockScreen23LockScreenContainerView *v2;

  v2 = self;
  sub_100005E54();

}

- (void)didPan:(id)a3
{
  id v4;
  _TtC15SleepLockScreen23LockScreenContainerView *v5;

  v4 = a3;
  v5 = self;
  sub_10000671C(v4);

}

- (_TtC15SleepLockScreen23LockScreenContainerView)initWithFrame:(CGRect)a3
{
  _TtC15SleepLockScreen23LockScreenContainerView *result;

  result = (_TtC15SleepLockScreen23LockScreenContainerView *)_swift_stdlib_reportUnimplementedInitializer("SleepLockScreen.LockScreenContainerView", 39, "init(frame:)", 12, 0, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->debugIdentifier[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugIdentifier]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugSafeContentBoundsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugActualContentBoundsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_model));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_modelSubscriber));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_alarmSheetSubscriber));
  sub_100006BF8((uint64_t)self + OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_contentView));
}

@end
