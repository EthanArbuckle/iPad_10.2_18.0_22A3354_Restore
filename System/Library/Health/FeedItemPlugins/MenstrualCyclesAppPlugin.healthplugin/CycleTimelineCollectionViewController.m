@implementation CycleTimelineCollectionViewController

- (_TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2319DD71C();
}

- (void)dealloc
{
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v2;

  v2 = self;
  sub_2319D70A4();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController_calendarCache));
  swift_unknownObjectRelease();
  sub_23190C114((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController_cycleLoggingDataProvider);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController_today;
  v4 = sub_231CA1A58();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_23191BD58((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController_indexableDays, (uint64_t (*)(_QWORD))sub_231937D9C);
}

- (_TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout)collectionViewLayout
{
  _TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = -[CycleTimelineCollectionViewController collectionViewLayout](&v4, sel_collectionViewLayout);
  type metadata accessor for CycleTimelineCollectionViewLayout();
  return (_TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout *)(id)swift_dynamicCastClassUnconditional();
}

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v2;

  v2 = self;
  sub_2319D75B0();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v4;

  v4 = self;
  sub_2319D79DC(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v4;

  v4 = self;
  sub_2319D7B60(a3);

}

- (void)didMoveToParentViewController:(id)a3
{
  id v5;
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v6;

  v5 = a3;
  v6 = self;
  sub_2319D7C60((uint64_t)a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v2;

  v2 = self;
  sub_2319D8178();

}

- (void)didReceiveSignificantTimeChangeNotification
{
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v2;

  v2 = self;
  sub_2319D89C0();

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_2319D935C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v7;
  int64_t v9;

  sub_231937D9C();
  sub_231CA1A58();
  sub_23190BE38((unint64_t *)&unk_255F42D90, (uint64_t (*)(uint64_t))MEMORY[0x24BDD2488], MEMORY[0x24BDD24C0]);
  v6 = a3;
  v7 = self;
  sub_231CA276C();

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
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v11;
  uint64_t v12;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  sub_2319DD7D0((uint64_t)v9);

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
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v14;
  uint64_t v15;

  v8 = sub_231C9D438();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_2319DDE70(v13, (uint64_t)v11);

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
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v14;
  uint64_t v15;

  v8 = sub_231C9D438();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_2319DE360();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t (*v4)(char *, uint64_t);
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v5;

  v4 = (uint64_t (*)(char *, uint64_t))a3;
  v5 = self;
  sub_2319DC52C(v4);

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2319DE590();

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2319DE750();

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v7;

  v6 = a3;
  v7 = self;
  sub_2319DE800(a4);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2319DE9AC();

}

- (_TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *result;

  v3 = a3;
  result = (_TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *result;

  v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v7;

  v6 = a3;
  v7 = self;
  sub_2319DEB54(a4, "[%{public}s] splitViewController willHide %ld", (uint64_t)&unk_25009A380, (uint64_t)sub_2319DF094, (uint64_t)&unk_25009A398);

}

- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v7;

  v6 = a3;
  v7 = self;
  sub_2319DEB54(a4, "[%{public}s] splitViewController willShow %ld", (uint64_t)&unk_25009A330, (uint64_t)sub_2319DF094, (uint64_t)&unk_25009A348);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_2319DD3A0(v4);

  return self & 1;
}

@end
