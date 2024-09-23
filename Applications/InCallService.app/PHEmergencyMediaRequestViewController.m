@implementation PHEmergencyMediaRequestViewController

- (PHEmergencyMediaRequestViewController)init
{
  return (PHEmergencyMediaRequestViewController *)sub_10019889C();
}

- (PHEmergencyMediaRequestViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100198E64();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PHEmergencyMediaRequestViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_100199EE0();
}

- (void).cxx_destruct
{
  sub_100123A08((uint64_t)self + OBJC_IVAR___PHEmergencyMediaRequestViewController_delegate);
  sub_100135FA0(OBJC_IVAR___PHEmergencyMediaRequestViewController_toolBarViewController);
  sub_100135FA0(OBJC_IVAR___PHEmergencyMediaRequestViewController_actionButtonsWaitingView);
  sub_100135FA0(OBJC_IVAR___PHEmergencyMediaRequestViewController_photoPickerViewController);
  sub_100135FA0(OBJC_IVAR___PHEmergencyMediaRequestViewController_waitingStateTitlelabel);
  sub_100135FA0(OBJC_IVAR___PHEmergencyMediaRequestViewController_waitingStateSubtitlelabel);
  sub_100135FA0(OBJC_IVAR___PHEmergencyMediaRequestViewController_photoImageView);
  sub_100135FA0(OBJC_IVAR___PHEmergencyMediaRequestViewController_titleLabelScrollView);
  sub_100135FA0(OBJC_IVAR___PHEmergencyMediaRequestViewController_titleLabelScrollViewContentView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHEmergencyMediaRequestViewController_viewControllerWaitingStateHeightConstraint));
}

- (void)requestCancel
{
  PHEmergencyMediaRequestViewController *v2;

  v2 = self;
  sub_100199FF4();

}

- (void)requestContinue
{
  PHEmergencyMediaRequestViewController *v2;

  v2 = self;
  sub_10019A0D8();

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  PHEmergencyMediaRequestViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10019A1C0();

}

@end
