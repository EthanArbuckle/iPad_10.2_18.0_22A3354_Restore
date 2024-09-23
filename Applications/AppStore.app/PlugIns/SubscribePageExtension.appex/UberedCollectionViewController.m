@implementation UberedCollectionViewController

- (void)viewDidLoad
{
  _TtC22SubscribePageExtension30UberedCollectionViewController *v2;

  v2 = self;
  sub_1004B2F20();

}

- (void)as_viewWillBecomeFullyVisible
{
  _TtC22SubscribePageExtension30UberedCollectionViewController *v2;

  v2 = self;
  sub_1004B3120();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC22SubscribePageExtension30UberedCollectionViewController *v4;

  v4 = self;
  sub_1004B3230(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC22SubscribePageExtension30UberedCollectionViewController *v4;

  v4 = self;
  sub_1004B3654(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC22SubscribePageExtension30UberedCollectionViewController *v4;

  v4 = self;
  sub_1004B37A0(a3);

}

- (void)as_viewDidBecomePartiallyVisible
{
  _TtC22SubscribePageExtension30UberedCollectionViewController *v2;

  v2 = self;
  sub_1004B3C4C();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UberedCollectionViewController();
  v4 = v5.receiver;
  -[StoreCollectionViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
  ArtworkLoader.isOccluded.setter(1);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC22SubscribePageExtension30UberedCollectionViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_1004B3D80(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)viewDidLayoutSubviews
{
  _TtC22SubscribePageExtension30UberedCollectionViewController *v2;

  v2 = self;
  sub_1004B3EE0();

}

- (void)viewSafeAreaInsetsDidChange
{
  _BYTE *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UberedCollectionViewController();
  v2 = v3.receiver;
  -[UberedCollectionViewController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  v2[OBJC_IVAR____TtC22SubscribePageExtension30UberedCollectionViewController_contentInsetsInvalid] = 1;

}

- (int64_t)preferredStatusBarStyle
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension30UberedCollectionViewController_statusBarStyle);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  uint64_t v5;
  uint64_t v9;
  id v10;
  _TtC22SubscribePageExtension30UberedCollectionViewController *v11;

  v5 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension30UberedCollectionViewController_uberScrollObserver);
  if (v5)
  {
    v9 = type metadata accessor for UberScrollObserver();
    sub_10000E99C(&qword_100812EE8, (uint64_t (*)(uint64_t))type metadata accessor for UberScrollObserver, (uint64_t)"5*\v");
    v10 = a3;
    v11 = self;
    swift_retain(v5);
    ScrollObserver.willEndDragging(in:with:targetContentOffset:)(v10, a5, v9);

    swift_release(v5);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v3;
  id v5;
  _TtC22SubscribePageExtension30UberedCollectionViewController *v6;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension30UberedCollectionViewController_uberScrollObserver);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    swift_retain(v3);
    sub_10048852C(v5);

    swift_release(v3);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension30UberedCollectionViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1004B4684((uint64_t)a3);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension30UberedCollectionViewController_artworkLoader));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension30UberedCollectionViewController_uber));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30UberedCollectionViewController_uberHeaderView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension30UberedCollectionViewController_uberScrollObserver));
}

@end
