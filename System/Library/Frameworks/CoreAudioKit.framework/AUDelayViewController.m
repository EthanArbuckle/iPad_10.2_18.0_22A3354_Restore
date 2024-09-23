@implementation AUDelayViewController

- (void)viewDidLoad
{
  _TtC12CoreAudioKit21AUDelayViewController *v2;

  v2 = self;
  sub_2131BC4FC();

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  _TtC12CoreAudioKit21AUDelayViewController *v5;
  id v6;
  id v7;

  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_defaultCenter);
  v7 = (id)sub_2131E1A64();
  objc_msgSend(v6, sel_addObserver_selector_name_object_, v5, sel_auParameterValueChangedWithNotification_, v7, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _TtC12CoreAudioKit21AUDelayViewController *v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v5 = (void *)objc_opt_self();
  v6 = self;
  v7 = objc_msgSend(v5, sel_defaultCenter);
  objc_msgSend(v7, sel_removeObserver_, v6);

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for AUDelayViewController();
  -[AUAppleViewControllerBase viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);

}

- (void)auParameterValueChangedWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_2131BE228);
}

- (void)zoomIn
{
  _TtC12CoreAudioKit21AUDelayViewController *v2;

  v2 = self;
  sub_2131BE6C8();

}

- (void)zoomOut
{
  _TtC12CoreAudioKit21AUDelayViewController *v2;

  v2 = self;
  sub_2131BE798();

}

- (void)modeControlChanged
{
  _TtC12CoreAudioKit21AUDelayViewController *v2;

  v2 = self;
  sub_2131BE86C();

}

- (void)knobValueChangedWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_2131BF470);
}

- (void)knobTouchedWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_2131BF628);
}

- (_TtC12CoreAudioKit21AUDelayViewController)init
{
  return (_TtC12CoreAudioKit21AUDelayViewController *)sub_2131BFDF8();
}

- (_TtC12CoreAudioKit21AUDelayViewController)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit21AUDelayViewController *)sub_2131C000C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_edgeControlSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_graphView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_modeControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController____lazy_storage___decimalFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_timeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_zoomInButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_zoomOutButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_mixKnob));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_cutoffKnob));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_rightWidthConstraint));
}

@end
