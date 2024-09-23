@implementation DeviationsHistoryCollectionViewController

- (_TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController____lazy_storage___dataSource) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController____lazy_storage___coordinator) = 0;
  v4 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController *v2;

  v2 = self;
  sub_23198D0C0();

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController *v11;
  uint64_t v12;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  sub_23198E508();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController *result;

  v3 = a3;
  result = (_TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController *result;

  v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController____lazy_storage___dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController_analysisProvider));
  swift_release();
}

@end
