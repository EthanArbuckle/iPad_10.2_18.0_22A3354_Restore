@implementation BackgroundViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  _TtC11EmojiPoster24BackgroundViewController *v2;

  v2 = self;
  sub_1DD2F791C();

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
  v14.super_class = (Class)type metadata accessor for BackgroundViewController();
  v2 = (char *)v14.receiver;
  -[BackgroundViewController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  v3 = *(id *)&v2[OBJC_IVAR____TtC11EmojiPoster24BackgroundViewController_dimmingLayer];
  v4 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_bounds);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC11EmojiPoster24BackgroundViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1DD2F9DE4();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC11EmojiPoster24BackgroundViewController *)BackgroundViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC11EmojiPoster24BackgroundViewController)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster24BackgroundViewController *)BackgroundViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1DD2BF928(*(uint64_t *)((char *)&self->super._tabBarItem+ OBJC_IVAR____TtC11EmojiPoster24BackgroundViewController_backgroundConfiguration), *(uint64_t *)((char *)&self->super._tab+ OBJC_IVAR____TtC11EmojiPoster24BackgroundViewController_backgroundConfiguration), *(uint64_t *)((char *)&self->super._tabElement+ OBJC_IVAR____TtC11EmojiPoster24BackgroundViewController_backgroundConfiguration), *(uint64_t *)((char *)&self->super._navigationItem+ OBJC_IVAR____TtC11EmojiPoster24BackgroundViewController_backgroundConfiguration), *(uint64_t *)((char *)&self->super._toolbarItems+ OBJC_IVAR____TtC11EmojiPoster24BackgroundViewController_backgroundConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster24BackgroundViewController_dimmingLayer));
}

@end
