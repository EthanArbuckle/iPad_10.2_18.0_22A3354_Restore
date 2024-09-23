@implementation SVSHomePodIDViewController

- (id)handler
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  if (!*(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_handler))
    return 0;
  v2 = *(_QWORD *)&self->engine[OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_handler];
  v6[4] = *(Class *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_handler);
  v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_10007C6B4;
  v6[3] = &unk_1000C5460;
  v3 = _Block_copy(v6);
  v4 = v7;
  swift_retain(v2);
  swift_release(v4);
  return v3;
}

- (void)setHandler:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_1000C5448, 24, 7);
    v4[2] = v5;
    v6 = sub_10007E6C8;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_handler);
  v9 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_handler);
  v8 = *(_QWORD *)&self->engine[OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_handler];
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_1000588E4(v9, v8);
}

- (_TtC14HDSViewService26SVSHomePodIDViewController)init
{
  sub_10007C9E0();
}

- (_TtC14HDSViewService26SVSHomePodIDViewController)initWithDeviceModel:(unsigned __int8)a3
{
  return (_TtC14HDSViewService26SVSHomePodIDViewController *)sub_10007CB34(a3);
}

- (_TtC14HDSViewService26SVSHomePodIDViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10007E564();
}

- (void)viewDidLoad
{
  _TtC14HDSViewService26SVSHomePodIDViewController *v2;

  v2 = self;
  SVSHomePodIDViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC14HDSViewService26SVSHomePodIDViewController *v4;

  v4 = self;
  SVSHomePodIDViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC14HDSViewService26SVSHomePodIDViewController *v4;

  v4 = self;
  SVSHomePodIDViewController.viewDidDisappear(_:)(a3);

}

- (void)viewDidLayoutSubviews
{
  char *v2;
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for SVSHomePodIDViewController();
  v2 = (char *)v14.receiver;
  -[SVSHomePodIDViewController viewDidLayoutSubviews](&v14, "viewDidLayoutSubviews");
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_preView], "layer", v14.receiver, v14.super_class);
  v4 = objc_msgSend(v2, "view");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(v3, "setFrame:", v7, v9, v11, v13);
  }
  else
  {
    __break(1u);
  }
}

- (void)configureEngine
{
  _TtC14HDSViewService26SVSHomePodIDViewController *v2;

  v2 = self;
  SVSHomePodIDViewController.configureEngine()();

}

- (void)preheatEngine
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_engine), "preheat");
}

- (void)dealloc
{
  _TtC14HDSViewService26SVSHomePodIDViewController *v2;

  v2 = self;
  SVSHomePodIDViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_engine));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_preView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_session));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_feedbackGenerator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_output));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_videoDeviceInput));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController__videoDevice));
  sub_1000588E4(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_handler), *(_QWORD *)&self->engine[OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_handler]);
}

- (_TtC14HDSViewService26SVSHomePodIDViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  __n128 v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  _TtC14HDSViewService26SVSHomePodIDViewController *result;

  v4 = a4;
  result = (_TtC14HDSViewService26SVSHomePodIDViewController *)_swift_stdlib_reportUnimplementedInitializer("HDSViewService.SVSHomePodIDViewController", 41, "init(nibName:bundle:)", 21, 0, v5, v6, v7, v8);
  __break(1u);
  return result;
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  void *v5;

  if (*((_BYTE *)&self->super.super.super.isa
       + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_startIngesting) == 1)
  {
    v5 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_engine);
    if (v5)
      objc_msgSend(v5, "ingestVideoFrame:", a4);
  }
}

@end
