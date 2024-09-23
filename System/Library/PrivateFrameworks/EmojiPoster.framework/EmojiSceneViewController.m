@implementation EmojiSceneViewController

- (void)loadView
{
  _TtC11EmojiPoster24EmojiSceneViewController *v2;

  v2 = self;
  sub_1DD2E4928();

}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmojiSceneViewController();
  v2 = v3.receiver;
  -[EmojiSceneViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_1DD2E4CE0();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  double *v8;
  void *v9;
  _TtC11EmojiPoster24EmojiSceneViewController *v10;
  objc_super v11;
  _QWORD aBlock[6];

  height = a3.height;
  width = a3.width;
  v8 = (double *)swift_allocObject();
  *((_QWORD *)v8 + 2) = self;
  v8[3] = width;
  v8[4] = height;
  aBlock[4] = sub_1DD2E6138;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DD2E53A0;
  aBlock[3] = &block_descriptor_11;
  v9 = _Block_copy(aBlock);
  v10 = self;
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(a4, sel_animateAlongsideTransition_completion_, v9, 0);
  _Block_release(v9);
  v11.receiver = v10;
  v11.super_class = (Class)type metadata accessor for EmojiSceneViewController();
  -[EmojiSceneViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  swift_unknownObjectRelease();

}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  _TtC11EmojiPoster24EmojiSceneViewController *v4;
  id v5;
  id v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_currentDevice);
  v6 = objc_msgSend(v5, sel_userInterfaceIdiom);

  if (v6)
    return 30;
  else
    return 26;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (_TtC11EmojiPoster24EmojiSceneViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC11EmojiPoster24EmojiSceneViewController *)EmojiSceneViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC11EmojiPoster24EmojiSceneViewController)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster24EmojiSceneViewController *)EmojiSceneViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  _BYTE v3[128];

  sub_1DD2E60AC((uint64_t)self + OBJC_IVAR____TtC11EmojiPoster24EmojiSceneViewController_configuration, (uint64_t)v3, &qword_1F03D0D80);
  sub_1DD2C3968((uint64_t)v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DD2C39CC);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster24EmojiSceneViewController_overlayLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster24EmojiSceneViewController_sceneView));
  sub_1DD2E5EC4((uint64_t)self + OBJC_IVAR____TtC11EmojiPoster24EmojiSceneViewController_scene);
}

@end
