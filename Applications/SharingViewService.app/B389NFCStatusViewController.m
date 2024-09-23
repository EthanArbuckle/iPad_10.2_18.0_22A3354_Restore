@implementation B389NFCStatusViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService27B389NFCStatusViewController *v4;

  v4 = self;
  sub_1000275A4(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC18SharingViewService27B389NFCStatusViewController *v4;

  v4 = self;
  sub_10002A494(a3);

}

- (void)contactPressed
{
  uint64_t v2;
  _TtC18SharingViewService27B389NFCStatusViewController *v3;

  v3 = self;
  sub_10002A5D4((uint64_t)v3, v2);

}

- (void)_dismiss
{
  _TtC18SharingViewService27B389NFCStatusViewController *v2;

  v2 = self;
  sub_10002BA1C(0, 0);

}

- (void)_dismissX
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _TtC18SharingViewService27B389NFCStatusViewController *v5;

  v2 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_onDoneAction);
  v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_onDoneAction);
  v4 = *(uint64_t *)((char *)&self->super._bottomMarginConstraint
                  + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_onDoneAction);
  *v2 = 0;
  v2[1] = 0;
  v5 = self;
  sub_100012F60(v3, v4);
  sub_10002BA1C(0, 0);

}

- (_TtC18SharingViewService27B389NFCStatusViewController)initWithMainController:(id)a3
{
  id v3;
  _TtC18SharingViewService27B389NFCStatusViewController *v4;

  v3 = a3;
  v4 = (_TtC18SharingViewService27B389NFCStatusViewController *)sub_10002C54C((uint64_t)v3);

  return v4;
}

- (_TtC18SharingViewService27B389NFCStatusViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC18SharingViewService27B389NFCStatusViewController *)sub_10002BCA8(v5, v7, a4);
}

- (_TtC18SharingViewService27B389NFCStatusViewController)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService27B389NFCStatusViewController *)sub_10002BEF8(a3);
}

- (void).cxx_destruct
{
  sub_100012F60(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_onDoneAction), *(uint64_t *)((char *)&self->super._bottomMarginConstraint+ OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_onDoneAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_previousNFCConfig));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_coalescer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_nfcConfig));
  sub_100012F60(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_responseHandler), *(uint64_t *)((char *)&self->super._bottomMarginConstraint+ OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_responseHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_bigBtn));
  swift_bridgeObjectRelease(*(NSLayoutConstraint **)((char *)&self->super._bottomMarginConstraint
                                                   + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_btnTitle));
  swift_bridgeObjectRelease(*(NSLayoutConstraint **)((char *)&self->super._bottomMarginConstraint
                                                   + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_defaultBtnTitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_numberLbl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_msgLbl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_connectingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_spinner));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_player));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_heightConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_subviewsToRemoveOnUpdate));
}

@end
