@implementation CycleHistoryFiltersCollectionViewController

- (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController)init
{
  return (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *)sub_231A10D38();
}

- (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *result;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController_selectedItem) = 51;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController____lazy_storage___filterMapping) = 0;
  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CycleHistoryFiltersCollectionViewController();
  v2 = v3.receiver;
  -[CycleHistoryFiltersCollectionViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_231A1112C();
  sub_231A11AA0();
  sub_231A11574();

}

- (void)doneAndDismiss
{
  _TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *v2;
  _TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *v3;
  _TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *v4;
  _TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *v5;

  v5 = self;
  v2 = (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *)-[CycleHistoryFiltersCollectionViewController presentingViewController](v5, sel_presentingViewController);
  if (v2)
  {
    v3 = v2;
    -[CycleHistoryFiltersCollectionViewController dismissViewControllerAnimated:completion:](v2, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *v7;
  int64_t result;
  char v9;
  uint64_t v10;
  int64_t v11;

  v6 = a3;
  v7 = self;
  sub_231941D98();
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(result + 16) > (unint64_t)a4)
  {
    v9 = *(_BYTE *)(result + a4 + 32);
    swift_bridgeObjectRelease();
    sub_231940F78(v9);
    v11 = *(_QWORD *)(v10 + 16);

    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *v5;
  uint64_t v6;
  int64_t v7;

  v4 = a3;
  v5 = self;
  sub_231941D98();
  v7 = *(_QWORD *)(v6 + 16);

  swift_bridgeObjectRelease();
  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *v11;
  char *v12;
  uint64_t v14;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  v12 = sub_231A11D5C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *v11;
  uint64_t v12;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  sub_231A12298(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *v15;
  void *v16;
  uint64_t v18;

  v7 = sub_231C9D438();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  v13 = v12;
  sub_231C9D3E4();
  v14 = a3;
  v15 = self;
  v16 = (void *)sub_231A12B2C(v14, v11, v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v16;
}

- (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *result;

  v3 = a3;
  result = (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *result;

  v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_23190C114((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController_delegate);
}

@end
