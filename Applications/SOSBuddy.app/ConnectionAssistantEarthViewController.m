@implementation ConnectionAssistantEarthViewController

- (_TtC8SOSBuddy38ConnectionAssistantEarthViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100046440();
}

- (void)viewDidLoad
{
  _TtC8SOSBuddy38ConnectionAssistantEarthViewController *v2;

  v2 = self;
  sub_100045AA0();

}

- (void)viewIsAppearing:(BOOL)a3
{
  sub_100045BDC(self, (uint64_t)a2, a3, (const char **)&selRef_viewIsAppearing_, (SEL *)&selRef_addToRunLoop_forMode_);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_100045BDC(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillDisappear_, (SEL *)&selRef_removeFromRunLoop_forMode_);
}

- (void)viewWillLayoutSubviews
{
  char *v2;
  void *v3;
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
  v14.super_class = (Class)type metadata accessor for ConnectionAssistantEarthViewController();
  v2 = (char *)v14.receiver;
  -[ConnectionAssistantEarthViewController viewWillLayoutSubviews](&v14, "viewWillLayoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC8SOSBuddy38ConnectionAssistantEarthViewController__metalView];
  v4 = objc_msgSend(v2, "view", v14.receiver, v14.super_class);
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

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC8SOSBuddy38ConnectionAssistantEarthViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8SOSBuddy38ConnectionAssistantEarthViewController *result;

  v4 = a4;
  result = (_TtC8SOSBuddy38ConnectionAssistantEarthViewController *)_swift_stdlib_reportUnimplementedInitializer("SOSBuddy.ConnectionAssistantEarthViewController", 47, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8SOSBuddy38ConnectionAssistantEarthViewController__device));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8SOSBuddy38ConnectionAssistantEarthViewController__commandQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy38ConnectionAssistantEarthViewController__metalView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy38ConnectionAssistantEarthViewController__displayLink));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8SOSBuddy38ConnectionAssistantEarthViewController__renderer));
}

@end
