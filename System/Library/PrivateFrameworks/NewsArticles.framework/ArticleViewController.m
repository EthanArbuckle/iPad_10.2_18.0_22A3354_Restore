@implementation ArticleViewController

- (_TtC12NewsArticles21ArticleViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9F2E440();
}

- (_TtC12NewsArticles21ArticleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles21ArticleViewController *result;

  v4 = a4;
  result = (_TtC12NewsArticles21ArticleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B9E327F4((uint64_t)self + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_model, (uint64_t (*)(_QWORD))type metadata accessor for ArticleModel);
  swift_release();
  swift_release();
  sub_1B9E30DEC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_pageDelegate);
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_articleViewController));
  sub_1B9F2EAE0(*(void **)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_presentationContext));
  sub_1B9E923D8(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles21ArticleViewController_articleGroupData), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC12NewsArticles21ArticleViewController_articleGroupData), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC12NewsArticles21ArticleViewController_articleGroupData));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_hardPaywallViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_footerProvider);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_headerProvider);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_urlHandler));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_keyboardInputMonitor);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_multiDelegate));
}

- (void)viewDidLoad
{
  _TtC12NewsArticles21ArticleViewController *v2;

  v2 = self;
  ArticleViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12NewsArticles21ArticleViewController *v4;

  v4 = self;
  ArticleViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12NewsArticles21ArticleViewController *v4;

  v4 = self;
  ArticleViewController.viewDidAppear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[ArticleViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  sub_1BA0BB048();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC12NewsArticles21ArticleViewController *v4;

  v4 = self;
  ArticleViewController.viewDidDisappear(_:)(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  v4 = v10.receiver;
  v5 = a3;
  -[ArticleViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v5);
  v6 = objc_msgSend(v4, sel_traitCollection, v10.receiver, v10.super_class);
  v7 = objc_msgSend(v4, sel_view);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
    objc_msgSend(v8, sel_setBackgroundColor_, v9);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillLayoutSubviews
{
  _TtC12NewsArticles21ArticleViewController *v2;

  v2 = self;
  ArticleViewController.viewWillLayoutSubviews()();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[ArticleViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  sub_1BA0BB090();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  char *v7;
  double *v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  v7 = (char *)v9.receiver;
  -[ArticleViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  v8 = (double *)&v7[OBJC_IVAR____TtC12NewsArticles21ArticleViewController_destinationViewSize];
  *v8 = width;
  v8[1] = height;
  swift_unknownObjectRelease();

}

- (BOOL)resignFirstResponder
{
  objc_class *ObjectType;
  void *v4;
  _TtC12NewsArticles21ArticleViewController *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_articleViewController);
  v5 = self;
  objc_msgSend(v4, sel_resignFirstResponder);
  v7.receiver = v5;
  v7.super_class = ObjectType;
  LOBYTE(ObjectType) = -[ArticleViewController resignFirstResponder](&v7, sel_resignFirstResponder);

  return (char)ObjectType;
}

- (void)handleKeyCommandWithKeyCommand:(id)a3
{
  id v4;
  char v5;
  _TtC12NewsArticles21ArticleViewController *v6;

  v4 = a3;
  v6 = self;
  v5 = sub_1B9F25880(v4);
  if ((_s12NewsArticles21ArticleViewControllerC12isPreviewingSbyF_0() & 1) != 0)
  {
    if ((v5 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  if ((*(Class *)((char *)&v6->super.super.super.isa
                 + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_hardPaywallViewController) == 0) | v5 & 1)
LABEL_5:
    objc_msgSend(*(id *)((char *)&v6->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles21ArticleViewController_keyCommandManager), sel_handleKeyCommand_, v4);
LABEL_6:

}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (void)articleHostViewController:(id)a3 didScrollToPosition:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _TtC12NewsArticles21ArticleViewController *v11;

  v7 = swift_allocObject();
  swift_weakInit();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = a4;
  v9 = a4;
  v10 = a3;
  v11 = self;
  swift_retain();
  sub_1B9E39F2C();

  swift_release();
  swift_release();
}

- (void)articleHostViewControllerDidScrollToBottomOfPrimaryContent:(id)a3
{
  id v4;
  _TtC12NewsArticles21ArticleViewController *v5;

  v4 = a3;
  v5 = self;
  _s12NewsArticles21ArticleViewControllerC011articleHostdE33DidScrollToBottomOfPrimaryContentyySo09NUArticlegdE0CF_0();

}

- (void)tabBarSplitViewDidChangeFocusToFocus:(int64_t)a3 action:(int64_t)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  _TtC12NewsArticles21ArticleViewController *v7;
  _TtC12NewsArticles21ArticleViewController *v8;
  _TtC12NewsArticles21ArticleViewController *v9;

  v9 = self;
  v4 = sub_1BA0BB6F0();
  if (v4 != sub_1BA0BB6F0())
  {
    v8 = v9;
    goto LABEL_5;
  }
  v5 = -[ArticleViewController view](v9, sel_view);
  if (v5)
  {
    v6 = v5;
    v7 = (_TtC12NewsArticles21ArticleViewController *)objc_msgSend(v5, sel_window);

    -[ArticleViewController makeKeyAndVisible](v7, sel_makeKeyAndVisible);
    v8 = v7;
LABEL_5:

    return;
  }
  __break(1u);
}

- (void)loadingWillStart
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  _TtC12NewsArticles21ArticleViewController *v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v3 = (*(_QWORD **)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_eventHandler))[4];
  swift_beginAccess();
  if (*(_QWORD *)(v3 + 56))
  {
    sub_1B9E21DB8(v3 + 32, (uint64_t)v8);
    v4 = v9;
    v5 = v10;
    __swift_project_boxed_opaque_existential_1(v8, v9);
    v6 = *(void (**)(uint64_t, uint64_t))(v5 + 96);
    v7 = self;
    v6(v4, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);

  }
}

- (void)loadingDidFinishWithError:(id)a3
{
  _TtC12NewsArticles21ArticleViewController *v4;
  id v5;

  v4 = self;
  v5 = a3;
  ArticleViewController.loadingDidFinishWithError(_:)(a3);

}

- (void)didLoadArticle:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  _TtC12NewsArticles21ArticleViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  ArticleViewController.didLoad(_:with:)(v6, v7);

}

- (void)footerNeedsLayout:(id)a3
{
  id v4;
  _TtC12NewsArticles21ArticleViewController *v5;

  v4 = a3;
  v5 = self;
  _s12NewsArticles21ArticleViewControllerC17footerNeedsLayoutyyAA0C10FooterType_So06UIViewE0CXcF_0();

}

- (BOOL)isShowingHardPaywall
{
  return *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_hardPaywallViewController) != 0;
}

- (BOOL)isPreviewing
{
  _TtC12NewsArticles21ArticleViewController *v2;
  char v3;

  v2 = self;
  v3 = _s12NewsArticles21ArticleViewControllerC12isPreviewingSbyF_0();

  return v3 & 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  UIScrollView *v4;
  _TtC12NewsArticles21ArticleViewController *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  ArticleViewController.scrollViewDidScroll(_:)(v4);

}

- (BOOL)shouldOccludeAccessibilityElement:(id)a3
{
  id v4;
  _TtC12NewsArticles21ArticleViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1B9F2A3C8(v4);

  return self & 1;
}

- (BOOL)accessibilityShouldScroll:(id)a3 defaultValue:(BOOL)a4
{
  return a4
      && *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_hardPaywallViewController) == 0;
}

- (BOOL)accessibilityShouldScroll:(id)a3
{
  return *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_hardPaywallViewController) == 0;
}

- (BOOL)canIncreaseTextSize
{
  return sub_1B9F2A62C((char *)self, (uint64_t)a2, MEMORY[0x1E0DBCC98]);
}

- (BOOL)canDecreaseTextSize
{
  return sub_1B9F2A62C((char *)self, (uint64_t)a2, MEMORY[0x1E0DBCCA0]);
}

- (void)increaseTextSize
{
  _TtC12NewsArticles21ArticleViewController *v2;

  v2 = self;
  ArticleViewController.increaseTextSize()();

}

- (void)decreaseTextSize
{
  _TtC12NewsArticles21ArticleViewController *v2;

  v2 = self;
  ArticleViewController.decreaseTextSize()();

}

- (BOOL)canZoomIn
{
  void *v3;
  _TtC12NewsArticles21ArticleViewController *v4;
  id v5;

  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_hardPaywallViewController))
    return 0;
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_articleViewController);
  v4 = self;
  v5 = objc_msgSend(v3, sel_contentScale);

  return v5 != (id)11;
}

- (BOOL)canZoomOut
{
  void *v3;
  _TtC12NewsArticles21ArticleViewController *v4;
  id v5;

  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_hardPaywallViewController))
    return 0;
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_articleViewController);
  v4 = self;
  v5 = objc_msgSend(v3, sel_contentScale);

  return v5 != (id)1;
}

- (void)zoomIn
{
  void *v2;
  _TtC12NewsArticles21ArticleViewController *v3;

  if (!*(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_hardPaywallViewController))
  {
    v2 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_articleViewController);
    v3 = self;
    if (objc_msgSend(v2, sel_contentScale) != (id)11)
      objc_msgSend(v2, sel_setContentScale_, NUContentScaleIncrease((uint64_t)objc_msgSend(v2, sel_contentScale)));

  }
}

- (void)zoomOut
{
  void *v2;
  _TtC12NewsArticles21ArticleViewController *v3;

  if (!*(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_hardPaywallViewController))
  {
    v2 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_articleViewController);
    v3 = self;
    if (objc_msgSend(v2, sel_contentScale) != (id)1)
      objc_msgSend(v2, sel_setContentScale_, NUContentScaleDecrease((uint64_t)objc_msgSend(v2, sel_contentScale)));

  }
}

- (BOOL)canResetZoom
{
  _TtC12NewsArticles21ArticleViewController *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = ArticleViewController.canResetZoom()();

  return v3;
}

- (void)resetZoom
{
  _TtC12NewsArticles21ArticleViewController *v2;

  v2 = self;
  ArticleViewController.resetZoom()();

}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  id v4;
  _TtC12NewsArticles21ArticleViewController *v5;

  v4 = a3;
  v5 = self;
  _s12NewsArticles21ArticleViewControllerC30bundleSubscriptionDidSubscribeyySo08FCBundleG0CF_0();

}

- (void)URLHandler:(id)a3 wantsToPresentViewController:(id)a4 animated:(BOOL)a5
{
  -[ArticleViewController presentViewController:animated:completion:](self, sel_presentViewController_animated_completion_, a4, a5, 0);
}

- (void)URLHandler:(id)a3 willOpenURL:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = sub_1BA0B9998();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA0B995C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  _TtC12NewsArticles21ArticleViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = ArticleViewController.shouldUpdateFocus(in:)((UIFocusUpdateContext)v4);

  return self & 1;
}

@end
