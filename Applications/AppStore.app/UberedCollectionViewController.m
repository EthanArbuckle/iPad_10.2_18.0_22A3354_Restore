@implementation UberedCollectionViewController

- (void)viewDidLoad
{
  _TtC8AppStore30UberedCollectionViewController *v2;

  v2 = self;
  sub_100197284();

}

- (void)as_viewWillBecomeFullyVisible
{
  _TtC8AppStore30UberedCollectionViewController *v2;

  v2 = self;
  sub_100197484();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8AppStore30UberedCollectionViewController *v4;

  v4 = self;
  sub_100197594(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8AppStore30UberedCollectionViewController *v4;

  v4 = self;
  sub_1001979B8(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC8AppStore30UberedCollectionViewController *v4;

  v4 = self;
  sub_100197B04(a3);

}

- (void)as_viewDidBecomePartiallyVisible
{
  _TtC8AppStore30UberedCollectionViewController *v2;

  v2 = self;
  sub_100197FB0();

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
  _TtC8AppStore30UberedCollectionViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_1001980E4(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)viewDidLayoutSubviews
{
  _TtC8AppStore30UberedCollectionViewController *v2;

  v2 = self;
  sub_100198244();

}

- (void)viewSafeAreaInsetsDidChange
{
  _BYTE *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UberedCollectionViewController();
  v2 = v3.receiver;
  -[UberedCollectionViewController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  v2[OBJC_IVAR____TtC8AppStore30UberedCollectionViewController_contentInsetsInvalid] = 1;

}

- (int64_t)preferredStatusBarStyle
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore30UberedCollectionViewController_statusBarStyle);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  uint64_t v5;
  uint64_t v9;
  id v10;
  _TtC8AppStore30UberedCollectionViewController *v11;

  v5 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore30UberedCollectionViewController_uberScrollObserver);
  if (v5)
  {
    v9 = type metadata accessor for UberScrollObserver();
    sub_100005C94(&qword_100831B40, (uint64_t (*)(uint64_t))type metadata accessor for UberScrollObserver, (uint64_t)&unk_100662C34);
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
  _TtC8AppStore30UberedCollectionViewController *v6;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore30UberedCollectionViewController_uberScrollObserver);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    swift_retain(v3);
    sub_1000C4358(v5);

    swift_release(v3);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore30UberedCollectionViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1001989E8((uint64_t)a3);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore30UberedCollectionViewController_artworkLoader));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore30UberedCollectionViewController_uber));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30UberedCollectionViewController_uberHeaderView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore30UberedCollectionViewController_uberScrollObserver));
}

@end
