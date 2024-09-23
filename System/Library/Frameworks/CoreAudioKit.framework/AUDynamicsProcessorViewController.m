@implementation AUDynamicsProcessorViewController

- (void)viewDidLoad
{
  _TtC12CoreAudioKit33AUDynamicsProcessorViewController *v2;

  v2 = self;
  sub_2131A6428();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12CoreAudioKit33AUDynamicsProcessorViewController *v4;

  v4 = self;
  sub_2131A8BD4(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _TtC12CoreAudioKit33AUDynamicsProcessorViewController *v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v5 = (void *)objc_opt_self();
  v6 = self;
  v7 = objc_msgSend(v5, sel_defaultCenter);
  objc_msgSend(v7, sel_removeObserver_, v6);

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for AUDynamicsProcessorViewController();
  -[AUAppleViewControllerBase viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);

}

- (void)auParameterValueChangedWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_2131A9070);
}

- (void)graphControlTouchedWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_2131A95D8);
}

- (void)knobValueChangedWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_2131A9AAC);
}

- (void)knobTouchedWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_2131A9C64);
}

- (void)knobReleasedWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC12CoreAudioKit33AUDynamicsProcessorViewController *v9;
  uint64_t v10;

  v4 = sub_2131E18CC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2131E18B4();
  v9 = self;
  sub_2131A9FF0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)viewDidLayoutSubviews
{
  void *v2;
  void *v3;
  _TtC12CoreAudioKit33AUDynamicsProcessorViewController *v4;
  id v5;
  double v6;
  double v7;
  id v8;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_viewContainer);
  if (v2)
  {
    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_headerView);
    v4 = self;
    v5 = v2;
    v8 = v3;
    objc_msgSend(v5, sel_frame);
    sub_2131CA42C(v6, v7);

  }
}

- (_TtC12CoreAudioKit33AUDynamicsProcessorViewController)init
{
  return (_TtC12CoreAudioKit33AUDynamicsProcessorViewController *)sub_2131AA844();
}

- (_TtC12CoreAudioKit33AUDynamicsProcessorViewController)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit33AUDynamicsProcessorViewController *)sub_2131AAABC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_viewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_graphView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_edgeControlSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_inputLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_outputLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_meterLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_meter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_attackKnob));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_releaseKnob));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_gainKnob));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_rightWidthConstraint));
}

@end
