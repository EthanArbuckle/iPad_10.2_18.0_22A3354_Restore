@implementation AssistiveAccessViewController

- (void)viewDidAppear:(BOOL)a3
{
  _TtC16MagnifierSupport29AssistiveAccessViewController *v3;
  id v4;

  v3 = self;
  sub_22738116C();
  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  objc_msgSend(v4, sel_setIdleTimerDisabled_, 1);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  _TtC16MagnifierSupport29AssistiveAccessViewController *v5;
  id v6;

  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_sharedApplication);
  objc_msgSend(v6, sel_setIdleTimerDisabled_, 0);

}

- (void)viewDidLoad
{
  _TtC16MagnifierSupport29AssistiveAccessViewController *v2;

  v2 = self;
  sub_227380C88();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AssistiveAccessViewController();
  swift_unknownObjectRetain();
  v7 = v8.receiver;
  -[AssistiveAccessViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  sub_22738116C();
  swift_unknownObjectRelease();

}

- (_TtC16MagnifierSupport29AssistiveAccessViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_22758E1E4();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC16MagnifierSupport29AssistiveAccessViewController *)sub_2273814B0(v5, v7, a4);
}

- (_TtC16MagnifierSupport29AssistiveAccessViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC16MagnifierSupport29AssistiveAccessViewController *v8;
  _TtC16MagnifierSupport29AssistiveAccessViewController *v9;
  objc_super v11;

  v5 = OBJC_IVAR____TtC16MagnifierSupport29AssistiveAccessViewController_cameraVideoPreviewView;
  v6 = objc_allocWithZone((Class)type metadata accessor for AssistiveAccessLivePreviewView());
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for AssistiveAccessViewController();
  v9 = -[AssistiveAccessViewController initWithCoder:](&v11, sel_initWithCoder_, v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport29AssistiveAccessViewController_cameraVideoPreviewView));
}

@end
