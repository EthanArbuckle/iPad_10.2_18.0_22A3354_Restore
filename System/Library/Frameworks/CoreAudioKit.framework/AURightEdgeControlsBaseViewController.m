@implementation AURightEdgeControlsBaseViewController

- (void)viewDidLoad
{
  _TtC12CoreAudioKit37AURightEdgeControlsBaseViewController *v2;

  v2 = self;
  sub_21319EAB8();

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  _TtC12CoreAudioKit37AURightEdgeControlsBaseViewController *v5;
  id v6;
  id v7;

  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_defaultCenter);
  v7 = (id)sub_2131E1A64();
  objc_msgSend(v6, sel_addObserver_selector_name_object_, v5, sel_auParameterValueChangedWithNotification_, v7, 0);

}

- (void)auParameterValueChangedWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC12CoreAudioKit37AURightEdgeControlsBaseViewController *v9;
  uint64_t v10;

  v4 = sub_2131E18CC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2131E18B4();
  v9 = self;
  sub_21319E380();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)viewDidLayoutSubviews
{
  _TtC12CoreAudioKit37AURightEdgeControlsBaseViewController *v2;

  v2 = self;
  sub_2131A0014();

}

- (_TtC12CoreAudioKit37AURightEdgeControlsBaseViewController)init
{
  return (_TtC12CoreAudioKit37AURightEdgeControlsBaseViewController *)sub_2131A02C8();
}

- (_TtC12CoreAudioKit37AURightEdgeControlsBaseViewController)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit37AURightEdgeControlsBaseViewController *)sub_2131A0460(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController_graphView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController_edgeControlSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController_bandControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController_gainKnob));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController____lazy_storage___decimalFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController____lazy_storage___wholeNumberFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController_rightWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController_bandWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController_bandHeightConstraint));
  swift_release();
}

@end
