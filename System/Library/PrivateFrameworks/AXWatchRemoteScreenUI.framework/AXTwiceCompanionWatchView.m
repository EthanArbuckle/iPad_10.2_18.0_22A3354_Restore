@implementation AXTwiceCompanionWatchView

- (_TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView)initWithFrame:(CGRect)a3
{
  return (_TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView *)sub_21EC6AD84(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21EC6F34C();
}

- (void)dealloc
{
  _TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView *v2;
  __CFNotificationCenter *v3;
  objc_super v4;

  v2 = self;
  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(v3, v2);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for AXTwiceCompanionWatchView();
  -[AXTwiceCompanionWatchView dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightContraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButtonTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButtonHorizontalConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeUpCrownGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeDownCrownGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButtonTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButtonHorizontalConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewLeftConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewRightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_mirroringLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButtonTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButtonHorizontalConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton));
}

- (void)digitalCrownButtonTappedWithSender:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView *v5;

  v4 = a3;
  v5 = self;
  sub_21EC6FCC4(0xD000000000000021, 0x800000021EC7F5A0, (SEL *)&selRef_crownButtonPressed);

}

- (void)doubleCrownButtonTappedWithSender:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView *v5;

  v4 = a3;
  v5 = self;
  sub_21EC6FCC4(0xD000000000000020, 0x800000021EC7F570, (SEL *)&selRef_doubleCrownButtonPressed);

}

- (void)tripleCrownButtonTappedWithSender:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView *v5;

  v4 = a3;
  v5 = self;
  sub_21EC6FCC4(0xD000000000000020, 0x800000021EC7F540, (SEL *)&selRef_tripleCrownButtonPressed);

}

- (void)digitalCrownSwipeUpWithGesture:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView *v5;

  v4 = a3;
  v5 = self;
  sub_21EC6FCC4(0xD00000000000001DLL, 0x800000021EC7F520, (SEL *)&selRef_crownButtonScrollUp);

}

- (void)digitalCrownSwipeDownWithGesture:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView *v5;

  v4 = a3;
  v5 = self;
  sub_21EC6FCC4(0xD00000000000001FLL, 0x800000021EC7F500, (SEL *)&selRef_crownButtonScrollDown);

}

- (void)digitalCrownLongPressedWithGesture:(id)a3
{
  sub_21EC6E00C(self, (uint64_t)a2, a3, (SEL *)&selRef_crownButtonLongPressed);
}

- (void)sideButtonTappedWithSender:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView *v5;

  v4 = a3;
  v5 = self;
  sub_21EC6FCC4(0xD000000000000019, 0x800000021EC7F4E0, (SEL *)&selRef_sideButtonPressed);

}

- (void)sideButtonLongPressedWithGesture:(id)a3
{
  sub_21EC6E00C(self, (uint64_t)a2, a3, (SEL *)&selRef_sideButtonLongPressed);
}

- (void)handleLongPressGestureWithGesture:(id)a3 endBlock:(id)a4
{
  void *v6;
  id v7;
  _TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_21EC6F918(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)stingButtonTappedWithSender:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView *v5;

  v4 = a3;
  v5 = self;
  sub_21EC6FCC4(0xD00000000000001ALL, 0x800000021EC7F4C0, (SEL *)&selRef_stingButtonPressed);

}

- (void)stingButtonLongPressedWithGesture:(id)a3
{
  sub_21EC6E00C(self, (uint64_t)a2, a3, (SEL *)&selRef_stingButtonLongPressed);
}

- (BOOL)doubleDigitalCrownButtonTapped:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_21EC700C4(0xD000000000000022, 0x800000021EC7F460, (SEL *)&selRef_doubleCrownButtonPressed);

  return self & 1;
}

- (BOOL)tripleDigitalCrownButtonTapped:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_21EC700C4(0xD000000000000022, 0x800000021EC7F430, (SEL *)&selRef_tripleCrownButtonPressed);

  return self & 1;
}

- (BOOL)digitalCrownButtonScrollUp:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_21EC700C4(0xD00000000000001ELL, 0x800000021EC7F410, (SEL *)&selRef_crownButtonScrollUp);

  return self & 1;
}

- (BOOL)digitalCrownButtonScrollDown:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_21EC700C4(0xD000000000000020, 0x800000021EC7F3E0, (SEL *)&selRef_crownButtonScrollDown);

  return self & 1;
}

- (BOOL)digitalCrownAXLongPressed:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_21EC700C4(0xD00000000000001DLL, 0x800000021EC7F3C0, (SEL *)&selRef_crownButtonLongPressed);

  return self & 1;
}

- (BOOL)digitalCrownDirectTouch:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_21EC6FEB0();

  return self & 1;
}

- (BOOL)sideButtonAXLongPressed:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_21EC700C4(0xD00000000000001BLL, 0x800000021EC7F350, (SEL *)&selRef_sideButtonLongPressed);

  return self & 1;
}

- (BOOL)stingButtonAXLongPressed:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_21EC700C4(0xD00000000000001CLL, 0x800000021EC7F330, (SEL *)&selRef_stingButtonLongPressed);

  return self & 1;
}

- (BOOL)stingButtonAXKeycord:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_21EC700C4(0xD000000000000018, 0x800000021EC7F310, (SEL *)&selRef_stingButtonKeycord);

  return self & 1;
}

@end
