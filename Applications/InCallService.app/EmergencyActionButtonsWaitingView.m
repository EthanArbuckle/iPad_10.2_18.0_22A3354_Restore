@implementation EmergencyActionButtonsWaitingView

- (_TtC13InCallService33EmergencyActionButtonsWaitingView)initWithType:(int64_t)a3
{
  return (_TtC13InCallService33EmergencyActionButtonsWaitingView *)sub_10016FC44(a3);
}

- (_TtC13InCallService33EmergencyActionButtonsWaitingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10016FD24();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC13InCallService33EmergencyActionButtonsWaitingView *v6;

  v5 = a3;
  v6 = self;
  sub_100170478((uint64_t)a3);

}

- (void)continueButtonTapped
{
  _TtC13InCallService33EmergencyActionButtonsWaitingView *v2;

  v2 = self;
  sub_100170604();

}

- (void)cancelButtonTapped
{
  _TtC13InCallService33EmergencyActionButtonsWaitingView *v2;

  v2 = self;
  sub_1001709FC();

}

- (_TtC13InCallService33EmergencyActionButtonsWaitingView)initWithFrame:(CGRect)a3
{
  sub_100170ED0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService33EmergencyActionButtonsWaitingView____lazy_storage___continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService33EmergencyActionButtonsWaitingView____lazy_storage___spinnerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService33EmergencyActionButtonsWaitingView____lazy_storage___cancelButton));
  sub_100123A08((uint64_t)self + OBJC_IVAR____TtC13InCallService33EmergencyActionButtonsWaitingView_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC13InCallService33EmergencyActionButtonsWaitingView_horizontalLayouts));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC13InCallService33EmergencyActionButtonsWaitingView_verticalLayouts));
}

@end
