@implementation BackgroundActivityProgressMicaView

- (_TtC18ActivityProgressUI34BackgroundActivityProgressMicaView)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  _TtC18ActivityProgressUI34BackgroundActivityProgressMicaView *result;

  v5 = OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress;
  v6 = (void *)objc_opt_self(NSProgress);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "progressWithTotalUnitCount:", 1000);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_isTouchingDownButton) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_didPostAccessibilityLayoutChangeNotification) = 0;

  result = (_TtC18ActivityProgressUI34BackgroundActivityProgressMicaView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100039BF0, "ActivityProgressUI/BackgroundActivityProgressMicaView.swift", 59, 2, 103, 0);
  __break(1u);
  return result;
}

- (void)touchedDownCancelButton
{
  _TtC18ActivityProgressUI34BackgroundActivityProgressMicaView *v2;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_isTouchingDownButton) = 1;
  v2 = self;
  sub_10000B9C4();

}

- (void)touchedUpCancelButton
{
  _TtC18ActivityProgressUI34BackgroundActivityProgressMicaView *v2;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_isTouchingDownButton) = 0;
  v2 = self;
  sub_10000B9C4();

}

- (_TtC18ActivityProgressUI34BackgroundActivityProgressMicaView)init
{
  _TtC18ActivityProgressUI34BackgroundActivityProgressMicaView *result;

  result = (_TtC18ActivityProgressUI34BackgroundActivityProgressMicaView *)_swift_stdlib_reportUnimplementedInitializer("ActivityProgressUI.BackgroundActivityProgressMicaView", 53, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progressMicaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton));
}

@end
