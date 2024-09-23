@implementation ComponentViewOverflowTransitioning

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  uint64_t v9;
  uint64_t v10;

  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8AppStore34ComponentViewOverflowTransitioning_presentedViewController, a3);
  v9 = objc_opt_self(UICollectionViewController);
  v10 = swift_dynamicCastObjCClass(a5, v9);
  if (v10)
    swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8AppStore34ComponentViewOverflowTransitioning_presentingViewController, v10);
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ComponentViewOverflowPresentationController()), "initWithPresentedViewController:presentingViewController:", a3, a4);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC8AppStore34ComponentViewOverflowTransitioning *v11;
  char *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_100215C98(v9);

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC8AppStore34ComponentViewOverflowTransitioning *v5;
  char *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1002154BC(v4);

  return v6;
}

- (_TtC8AppStore34ComponentViewOverflowTransitioning)init
{
  char *v3;
  uint64_t v4;
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8AppStore34ComponentViewOverflowTransitioning_presentedViewController, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8AppStore34ComponentViewOverflowTransitioning_presentingViewController, 0);
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC8AppStore34ComponentViewOverflowTransitioning_isTransitioningFromContainer) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore34ComponentViewOverflowTransitioning_selectedIndexPath;
  v4 = type metadata accessor for IndexPath(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ComponentViewOverflowTransitioning(0);
  return -[ComponentViewOverflowTransitioning init](&v6, "init");
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore34ComponentViewOverflowTransitioning_presentedViewController);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore34ComponentViewOverflowTransitioning_presentingViewController);
  sub_1000E20E4((uint64_t)self + OBJC_IVAR____TtC8AppStore34ComponentViewOverflowTransitioning_selectedIndexPath);
}

@end
