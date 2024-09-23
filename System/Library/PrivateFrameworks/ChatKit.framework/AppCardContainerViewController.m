@implementation AppCardContainerViewController

- (void)loadView
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  _TtC7ChatKit30AppCardContainerViewController *v8;

  v3 = objc_allocWithZone(MEMORY[0x1E0CEABB0]);
  v8 = self;
  v4 = objc_msgSend(v3, sel_init);
  -[AppCardContainerViewController setView:](v8, sel_setView_, v4);

  v5 = -[AppCardContainerViewController view](v8, sel_view);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v6, sel_setBackgroundColor_, v7);

    sub_18E5F57AC();
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLoad
{
  _TtC7ChatKit30AppCardContainerViewController *v2;

  v2 = self;
  sub_18E5F5EE8();

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  _TtC7ChatKit30AppCardContainerViewController *v3;
  unint64_t result;
  void *v5;
  char v6;
  id v7;
  objc_super v8;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_remoteViewController);
  v3 = self;
  result = (unint64_t)objc_msgSend(v2, sel_balloonPlugin);
  if (result)
  {
    v5 = (void *)result;
    v6 = sub_18E5F54D4();

    if ((v6 & 1) != 0)
    {

      return 2;
    }
    else
    {
      v8.receiver = v3;
      v8.super_class = (Class)type metadata accessor for AppCardContainerViewController();
      v7 = -[AppCardContainerViewController supportedInterfaceOrientations](&v8, sel_supportedInterfaceOrientations);

    }
    return (unint64_t)v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  char *v6;
  id v7;
  char *v8;
  uint64_t v9;
  uint64_t ObjectType;
  objc_super v11;

  v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AppCardContainerViewController();
  v6 = (char *)v11.receiver;
  v7 = a3;
  -[AppCardContainerViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v11, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v7, v4);
  v8 = &v6[OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_presentationDelegate];
  if (MEMORY[0x193FF501C](&v6[OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_presentationDelegate]))
  {
    v9 = *((_QWORD *)v8 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(char *, id, uint64_t, uint64_t))(v9 + 40))(v6, v7, ObjectType, v9);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)checkForTouchInRemoteProcessIfNecessaryWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _TtC7ChatKit30AppCardContainerViewController *v8;
  id v9;
  _QWORD v10[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_remoteViewController);
  if ((objc_msgSend(v6, sel_respondsToSelector_, sel_checkForTouchInRemoteProcessIfNecessaryWithCompletion_) & 1) != 0)
  {
    v10[4] = sub_18E5F8804;
    v10[5] = v5;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 1107296256;
    v10[2] = sub_18E54B5FC;
    v10[3] = &block_descriptor_32;
    v7 = _Block_copy(v10);
    v8 = self;
    v9 = v6;
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_checkForTouchInRemoteProcessIfNecessaryWithCompletion_, v7);
    _Block_release(v7);

    swift_release();
  }
  else
  {
    swift_release();
  }
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  _TtC7ChatKit30AppCardContainerViewController *v5;
  _TtC7ChatKit30AppCardContainerViewController *v6;
  objc_super v7;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_remoteViewController);
  if ((objc_msgSend(v3, sel_respondsToSelector_, sel_forceTearDownRemoteViewOverridingExceptions_) & 1) != 0)
  {
    v4 = *((unsigned __int8 *)&self->super.super.super.isa
         + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_shouldOverrideExceptionsOnDismissal);
    v5 = self;
    objc_msgSend(v3, sel_forceTearDownRemoteViewOverridingExceptions_, v4);
  }
  else
  {
    v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AppCardContainerViewController();
  -[AppCardContainerViewController dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_remoteViewController));
  objc_release(*(id *)((char *)&self->super._view
                     + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_popoverPresentationLocation));
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_presentationDelegate);
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_sendDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_touchTrackingGesture));
}

- (_TtC7ChatKit30AppCardContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;

  v4 = a4;
  sub_18E5F86F8();
}

- (_TtC7ChatKit30AppCardContainerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E5F86F8();
}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC7ChatKit30AppCardContainerViewController *v4;

  v4 = self;
  sub_18E5F725C(a3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC7ChatKit30AppCardContainerViewController *v4;

  v4 = self;
  sub_18E5F7378(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC7ChatKit30AppCardContainerViewController *v4;

  v4 = self;
  sub_18E5F7480(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC7ChatKit30AppCardContainerViewController *v2;

  v2 = self;
  sub_18E5F7598();

}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  char *v6;
  uint64_t v7;
  double (*v8)(void);
  id v9;
  _TtC7ChatKit30AppCardContainerViewController *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  v6 = (char *)self + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_presentationDelegate;
  if (MEMORY[0x193FF501C]((char *)self + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_presentationDelegate, a2, a3, a4))
  {
    v7 = *((_QWORD *)v6 + 1);
    swift_getObjectType();
    v8 = *(double (**)(void))(v7 + 48);
    v9 = a3;
    v10 = self;
    v11 = v8();
    v13 = v12;
    v15 = v14;
    v17 = v16;

    swift_unknownObjectRelease();
  }
  else
  {
    v11 = *MEMORY[0x1E0CEB4B0];
    v13 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v15 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v17 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  char *v7;
  char *v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AppCardContainerViewController();
  swift_unknownObjectRetain();
  v7 = (char *)v9.receiver;
  -[AppCardContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  v8 = &v7[OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_cachedCompactDetentHeight];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  swift_unknownObjectRelease();

}

- (void)closeButtonPressed
{
  -[AppCardContainerViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)setShowingDarkEffect:(BOOL)a3 isInDarkMode:(BOOL)a4
{
  _TtC7ChatKit30AppCardContainerViewController *v4;

  v4 = self;
  sub_18E5F826C();

}

- (_UIRemoteViewController)_containedRemoteViewController
{
  _TtC7ChatKit30AppCardContainerViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_18E5F8400();

  return (_UIRemoteViewController *)v3;
}

@end
