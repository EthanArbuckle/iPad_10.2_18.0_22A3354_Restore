@implementation TodayArticleTransitioningDelegate

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC8AppStore33TodayArticleTransitioningDelegate *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_10063DB58(v8, a4, v10);

  return v12;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC8AppStore33TodayArticleTransitioningDelegate *v11;
  char *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_1006408A0(v8, v9);

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC8AppStore33TodayArticleTransitioningDelegate *v5;
  char *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10063ED04(v4);

  return v6;
}

- (_TtC8AppStore33TodayArticleTransitioningDelegate)init
{
  char *v3;
  char *v4;
  char *v5;
  uint64_t v6;
  objc_super v8;

  v3 = (char *)self + OBJC_IVAR____TtC8AppStore33TodayArticleTransitioningDelegate_presentedViewController;
  *((_QWORD *)v3 + 1) = 0;
  swift_unknownObjectWeakInit(v3);
  v4 = (char *)self + OBJC_IVAR____TtC8AppStore33TodayArticleTransitioningDelegate_presentingViewController;
  *((_QWORD *)v4 + 1) = 0;
  swift_unknownObjectWeakInit(v4);
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore33TodayArticleTransitioningDelegate_selectedIndexPath;
  v6 = type metadata accessor for IndexPath(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC8AppStore33TodayArticleTransitioningDelegate_shouldUseReducedMotionTransition) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TodayArticleTransitioningDelegate(0);
  return -[TodayArticleTransitioningDelegate init](&v8, "init");
}

- (void).cxx_destruct
{
  sub_1000834F4((uint64_t)self + OBJC_IVAR____TtC8AppStore33TodayArticleTransitioningDelegate_presentedViewController);
  sub_1000834F4((uint64_t)self + OBJC_IVAR____TtC8AppStore33TodayArticleTransitioningDelegate_presentingViewController);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore33TodayArticleTransitioningDelegate_selectedIndexPath, (uint64_t *)&unk_100834600);
}

@end
