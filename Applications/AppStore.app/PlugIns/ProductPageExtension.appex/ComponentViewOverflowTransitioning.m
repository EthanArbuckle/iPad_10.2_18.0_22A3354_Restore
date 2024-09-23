@implementation ComponentViewOverflowTransitioning

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  uint64_t v8;

  swift_unknownObjectWeakAssign();
  v8 = objc_opt_self(UICollectionViewController);
  if (swift_dynamicCastObjCClass(a5, v8))
    swift_unknownObjectWeakAssign();
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ComponentViewOverflowPresentationController()), "initWithPresentedViewController:presentingViewController:", a3, a4);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC20ProductPageExtension34ComponentViewOverflowTransitioning *v11;
  char *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_100392A48(v9);

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC20ProductPageExtension34ComponentViewOverflowTransitioning *v5;
  char *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10039222C(v4);

  return v6;
}

- (_TtC20ProductPageExtension34ComponentViewOverflowTransitioning)init
{
  char *v3;
  uint64_t v4;
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC20ProductPageExtension34ComponentViewOverflowTransitioning_presentedViewController);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC20ProductPageExtension34ComponentViewOverflowTransitioning_presentingViewController);
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC20ProductPageExtension34ComponentViewOverflowTransitioning_isTransitioningFromContainer) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension34ComponentViewOverflowTransitioning_selectedIndexPath;
  v4 = type metadata accessor for IndexPath(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ComponentViewOverflowTransitioning(0);
  return -[ComponentViewOverflowTransitioning init](&v6, "init");
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension34ComponentViewOverflowTransitioning_presentedViewController);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension34ComponentViewOverflowTransitioning_presentingViewController);
  sub_100392A08((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension34ComponentViewOverflowTransitioning_selectedIndexPath);
}

@end
