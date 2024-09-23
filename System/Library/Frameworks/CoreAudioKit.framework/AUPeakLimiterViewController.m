@implementation AUPeakLimiterViewController

- (void)viewDidLoad
{
  _TtC12CoreAudioKit27AUPeakLimiterViewController *v2;

  v2 = self;
  sub_2131AB8BC();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12CoreAudioKit27AUPeakLimiterViewController *v3;

  v3 = self;
  sub_2131AEDB8();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _TtC12CoreAudioKit27AUPeakLimiterViewController *v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v5 = (void *)objc_opt_self();
  v6 = self;
  v7 = objc_msgSend(v5, sel_defaultCenter);
  objc_msgSend(v7, sel_removeObserver_, v6);

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for AUPeakLimiterViewController();
  -[AUAppleViewControllerBase viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);

}

- (void)knobValueChangedWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_2131AD8D8);
}

- (void)knobTouchedWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_2131ADAC0);
}

- (void)knobReleasedWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC12CoreAudioKit27AUPeakLimiterViewController *v9;
  uint64_t v10;

  v4 = sub_2131E18CC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2131E18B4();
  v9 = self;
  sub_2131ADE88();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)viewWillLayoutSubviews
{
  _TtC12CoreAudioKit27AUPeakLimiterViewController *v2;

  v2 = self;
  sub_2131AE26C();

}

- (_TtC12CoreAudioKit27AUPeakLimiterViewController)init
{
  return (_TtC12CoreAudioKit27AUPeakLimiterViewController *)sub_2131AE76C();
}

- (_TtC12CoreAudioKit27AUPeakLimiterViewController)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit27AUPeakLimiterViewController *)sub_2131AE8F0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController____lazy_storage___headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController____lazy_storage___graphView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController____lazy_storage___controlsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController_viewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController____lazy_storage___attackKnob));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController____lazy_storage___releaseKnob));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController____lazy_storage___gainKnob));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController____lazy_storage___wholeNumberFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController_v3AU));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController_compressionAmountParam));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController_attackSpacer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController_gainSpacer));
}

@end
