@implementation InteractiveTimelineCollectionViewController

- (NSString)description
{
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v3;
  void *v4;

  swift_getObjectType();
  v3 = self;
  sub_2318D63CC();
  sub_2318D56A0();
  swift_bridgeObjectRelease();
  sub_2318D56A0();
  sub_2318D6138();

  v4 = (void *)sub_2318D558C();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2317F84B8();
}

- (void)dealloc
{
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v2;

  v2 = self;
  sub_2317F26CC();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController_calendarCache));
  objc_release(*(id *)((char *)&self->super.super._tabElement
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController_nextCollectionViewLayoutConfig));
  swift_unknownObjectRelease();
  sub_2317F9C14((uint64_t)self+ OBJC_IVAR____TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController_timelineDataProvider);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController_today;
  v4 = sub_2318D54C0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_2317CF774((uint64_t)self+ OBJC_IVAR____TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController_indexableDays, (uint64_t (*)(_QWORD))sub_2317CE964);
}

- (_TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout)collectionViewLayout
{
  _TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = -[InteractiveTimelineCollectionViewController collectionViewLayout](&v4, sel_collectionViewLayout);
  type metadata accessor for InteractiveTimelineCollectionViewLayout();
  return (_TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout *)(id)swift_dynamicCastClassUnconditional();
}

- (void)viewDidLoad
{
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v2;

  v2 = self;
  sub_2317F2A8C();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v4;

  v4 = self;
  sub_2317F2DF8(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v4;

  v4 = self;
  sub_2317F2F7C(a3);

}

- (void)didMoveToParentViewController:(id)a3
{
  id v5;
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v6;

  v5 = a3;
  v6 = self;
  sub_2317F307C((uint64_t)a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v2;

  v2 = self;
  sub_2317F3B10();

}

- (void)didReceiveSignificantTimeChangeNotification
{
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v2;

  v2 = self;
  sub_2317F459C();

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_2318D2B80();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2318D2B38();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_2317F52B0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v7;
  int64_t v9;

  sub_2317CE964(0);
  sub_2318D54C0();
  sub_2317CC4AC((unint64_t *)&qword_255F25790, (uint64_t (*)(uint64_t))MEMORY[0x24BDD2488], MEMORY[0x24BDD24C0]);
  v6 = a3;
  v7 = self;
  sub_2318D5F94();

  return v9;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v11;
  uint64_t v12;

  v6 = sub_2318D2B80();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2318D2B38();
  v10 = a3;
  v11 = self;
  sub_2317F8580((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v14;
  uint64_t v15;

  v8 = sub_2318D2B80();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2318D2B38();
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_2317F88A0(v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v14;
  uint64_t v15;

  v8 = sub_2318D2B80();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2318D2B38();
  if (*((_BYTE *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController_state) == 2)
  {
    v12 = a3;
    v13 = a4;
    v14 = self;
    sub_2317F5F70();

  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2317F7064(v4);

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2317F8DB0();

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2317F9018();

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v7;

  v6 = a3;
  v7 = self;
  sub_2317F90C8(a4);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2317F9320();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_2317F7784(a4, width, height);
  swift_unknownObjectRelease();

}

- (_TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *result;

  v3 = a3;
  result = (_TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *result;

  v4 = a4;
  result = (_TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_2317F7BE8(v4);

  return self & 1;
}

- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4
{
  id v6;
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v7;

  v6 = a3;
  v7 = self;
  sub_2317F957C(a4, "[%{public}s] splitViewController willHide %ld", (uint64_t)&unk_25007DA40, (uint64_t)sub_2317F9A98, (uint64_t)&unk_25007DA58);

}

- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4
{
  id v6;
  _TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *v7;

  v6 = a3;
  v7 = self;
  sub_2317F957C(a4, "[%{public}s] splitViewController willShow %ld", (uint64_t)&unk_25007D9F0, (uint64_t)sub_2317F9A98, (uint64_t)&unk_25007DA08);

}

@end
