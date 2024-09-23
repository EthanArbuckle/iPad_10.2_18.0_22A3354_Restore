@implementation BackdropViewController

- (_TtC13MediaRemoteUI22BackdropViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC13MediaRemoteUI22BackdropViewController *)sub_10000D100(v5, v7, a4);
}

- (_TtC13MediaRemoteUI22BackdropViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10000E6E0();
}

- (void)loadView
{
  -[BackdropViewController setView:](self, "setView:", *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_metalView));
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for BackdropViewController();
  -[BackdropViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for BackdropViewController();
  v4 = v10.receiver;
  v5 = -[BackdropViewController viewWillAppear:](&v10, "viewWillAppear:", v3);
  sub_10000E37C((uint64_t)v5, v6);
  v9 = v4[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen];
  v4[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen] = 1;
  if ((v9 & 1) == 0)
    sub_10000DE78(v7, v8);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC13MediaRemoteUI22BackdropViewController *v4;

  v4 = self;
  sub_10000D64C(a3);

}

- (void)didMoveToParentViewController:(id)a3
{
  char *v4;
  id v5;
  uint64_t v6;
  char *v7;
  void *Strong;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for BackdropViewController();
  v4 = (char *)v9.receiver;
  v5 = a3;
  -[BackdropViewController didMoveToParentViewController:](&v9, "didMoveToParentViewController:", v5);
  if (v5)
  {

  }
  else
  {
    v7 = &v4[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_displayLink];
    Strong = (void *)swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_displayLink], v6);
    objc_msgSend(Strong, "invalidate", v9.receiver, v9.super_class);

    swift_unknownObjectWeakAssign(v7, 0);
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateImage:(id)a3 animated:(BOOL)a4
{
  id v7;
  _TtC13MediaRemoteUI22BackdropViewController *v8;

  v7 = a3;
  v8 = self;
  sub_10000DA70((uint64_t)a3, a4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC13MediaRemoteUI22BackdropViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10000DD74((uint64_t)a3);

}

- (void)displayLinkFiredWithSender:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_metalView), "draw", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_metalView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_backdropRenderer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_artworkTransitionTimer));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_displayLink);
}

@end
