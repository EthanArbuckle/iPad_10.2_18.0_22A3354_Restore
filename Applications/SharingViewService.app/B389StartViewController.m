@implementation B389StartViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService23B389StartViewController *v4;

  v4 = self;
  sub_1000498E4(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC18SharingViewService23B389StartViewController *v4;

  v4 = self;
  sub_10004C568(a3);

}

- (void)transitionOutOfMulti
{
  _TtC18SharingViewService23B389StartViewController *v2;

  v2 = self;
  sub_10004C7F4();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC18SharingViewService23B389StartViewController *v4;

  v4 = self;
  sub_10004DBC0(a3);

}

- (void)dismissPressed
{
  uint64_t v2;
  _TtC18SharingViewService23B389StartViewController *v3;

  v3 = self;
  sub_10004DD84((uint64_t)v3, v2);

}

- (void)continuePressed
{
  _TtC18SharingViewService23B389StartViewController *v2;

  v2 = self;
  sub_10004DDC0();

}

- (void)handleTapOutside
{
  uint64_t v2;
  _TtC18SharingViewService23B389StartViewController *v3;

  v3 = self;
  sub_10004E184((uint64_t)v3, v2);

}

- (_TtC18SharingViewService23B389StartViewController)initWithMainController:(id)a3
{
  id v3;
  _TtC18SharingViewService23B389StartViewController *v4;

  v3 = a3;
  v4 = (_TtC18SharingViewService23B389StartViewController *)sub_10005B0BC((uint64_t)v3);

  return v4;
}

- (_TtC18SharingViewService23B389StartViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC18SharingViewService23B389StartViewController *)sub_100054B84((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_10004E6CC);
}

- (_TtC18SharingViewService23B389StartViewController)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService23B389StartViewController *)sub_10004E848(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService23B389StartViewController_player));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService23B389StartViewController_mainBtn));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService23B389StartViewController_playerYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService23B389StartViewController_topInfoLbl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService23B389StartViewController_bottomInfoLbl));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC18SharingViewService23B389StartViewController_bubbleMonitor));
  swift_bridgeObjectRelease(*(NSLayoutConstraint **)((char *)&self->super._bottomMarginConstraint
                                                   + OBJC_IVAR____TtC18SharingViewService23B389StartViewController_bypassBatteryTooLowCheck));
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC18SharingViewService23B389StartViewController *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10005B1E4(v6, v7);

  return v9 & 1;
}

@end
