@implementation PreviewViewController

- (void)viewDidAppear:(BOOL)a3
{
  _TtC13ClarityCamera21PreviewViewController *v3;
  __n128 v4;
  id v5;

  v3 = self;
  sub_10001224C(v4);
  v5 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  objc_msgSend(v5, "setIdleTimerDisabled:", 1);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  _TtC13ClarityCamera21PreviewViewController *v5;
  id v6;

  v4 = (void *)objc_opt_self(UIApplication);
  v5 = self;
  v6 = objc_msgSend(v4, "sharedApplication");
  objc_msgSend(v6, "setIdleTimerDisabled:", 0);

}

- (void)viewDidLoad
{
  _TtC13ClarityCamera21PreviewViewController *v2;

  v2 = self;
  sub_100011E60();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  __n128 v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PreviewViewController();
  swift_unknownObjectRetain(a4);
  v7 = v9.receiver;
  -[PreviewViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  sub_10001224C(v8);
  swift_unknownObjectRelease(a4);

}

- (_TtC13ClarityCamera21PreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC13ClarityCamera21PreviewViewController *)sub_100012558(v5, v7, a4);
}

- (_TtC13ClarityCamera21PreviewViewController)initWithCoder:(id)a3
{
  return (_TtC13ClarityCamera21PreviewViewController *)sub_100012690(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_previewView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_cameraModel));
}

@end
