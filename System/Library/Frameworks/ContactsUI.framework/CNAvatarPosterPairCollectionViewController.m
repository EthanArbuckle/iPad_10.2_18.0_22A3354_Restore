@implementation CNAvatarPosterPairCollectionViewController

- (_TtC10ContactsUI42CNAvatarPosterPairCollectionViewController)initWithConfiguration:(id)a3 contact:(id)a4 contactForSharedProfile:(id)a5 mode:(int64_t)a6 delegate:(id)a7
{
  id v10;
  id v11;
  id v12;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  swift_unknownObjectRetain();
  return (_TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *)sub_18AD4ACC8(v10, v11, v12, a6);
}

- (_TtC10ContactsUI42CNAvatarPosterPairCollectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18AD549DC();
}

- (void)dealloc
{
  _TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *v3;
  _TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *v4;
  objc_super v5;

  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModelSubscriber))
  {
    v3 = self;
    swift_retain();
    sub_18AF4EB40();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewController();
  -[CNAvatarPosterPairCollectionViewController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_contact));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_contactForSharedProfile));
  sub_18ACD7800((uint64_t)self + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_pageControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_centeredPosterButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_addPosterButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_lastPosterConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_layout));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController____lazy_storage___feedbackGenerator));
}

- (void)viewDidLoad
{
  _TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *v2;

  v2 = self;
  sub_18AD4B248();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[6];
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewController();
  swift_unknownObjectRetain();
  v7 = v12.receiver;
  -[CNAvatarPosterPairCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v11[4] = sub_18AD54FAC;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_18AD4B688;
  v11[3] = &block_descriptor_74;
  v9 = _Block_copy(v11);
  v10 = v7;
  swift_release();
  objc_msgSend(a4, sel_animateAlongsideTransition_completion_, v9, 0);
  _Block_release(v9);
  swift_unknownObjectRelease();

}

- (void)viewWillLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewController();
  v2 = v3.receiver;
  -[CNAvatarPosterPairCollectionViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  sub_18AD5037C();

}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *v4;

  v4 = self;
  sub_18AD4B838(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *v4;

  v4 = self;
  sub_18AD4C128(a3);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v6;
  id v7;
  _TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *v8;
  id v9;
  int64_t v10;
  unint64_t v12;

  v6 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  v7 = a3;
  v8 = self;
  v9 = v6;
  sub_18AF4EB94();

  swift_release();
  swift_release();
  if (v12 >> 62)
  {
    sub_18AF4E9A8();
    v10 = sub_18AF50328();

    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);

  }
  swift_bridgeObjectRelease();

  return v10;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *v12;
  void *v13;
  uint64_t v15;

  v6 = sub_18AF4E5B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AF4E570();
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_18AD4C334(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *v13;
  id v14;
  uint64_t v16;

  v7 = sub_18AF4E5B8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AF4FC5C();
  sub_18AF4E570();
  v12 = a3;
  v13 = self;
  v14 = sub_18AD4C784(v12);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v14;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *v12;
  uint64_t v13;

  v6 = sub_18AF4E5B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AF4E570();
  v11 = a3;
  v12 = self;
  sub_18AD54ACC();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)editingViewController:(id)a3 didFinishWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_18AD4D6E4(v6, a4);

}

- (void)pageControlDidChangePage:(id)a3
{
  id v4;
  _TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_18AD50D24(v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_18AD51FF8(v4);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_isScrollingOrSettling) = 1;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  id v8;
  _TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *v9;

  x = a4.x;
  v8 = a3;
  v9 = self;
  sub_18AD54C08(&a5->x, x);

}

- (void)scrollViewDidEndScrollingAnimation:(void *)a3
{
  int v3;
  id v5;
  _BYTE *v6;

  v3 = a1[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_isScrollingOrSettling];
  a1[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_isScrollingOrSettling] = 0;
  if (v3 == 1)
  {
    v5 = a3;
    v6 = a1;
    sub_18AD51010(0, 1);

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  char v5;
  id v6;
  _TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *v7;

  if (!a4)
  {
    v5 = *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_isScrollingOrSettling);
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_isScrollingOrSettling) = 0;
    if ((v5 & 1) != 0)
    {
      v6 = a3;
      v7 = self;
      sub_18AD51010(0, 1);

    }
  }
}

- (_TtC10ContactsUI42CNAvatarPosterPairCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *result;

  v3 = a3;
  result = (_TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10ContactsUI42CNAvatarPosterPairCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *result;

  v4 = a4;
  result = (_TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
