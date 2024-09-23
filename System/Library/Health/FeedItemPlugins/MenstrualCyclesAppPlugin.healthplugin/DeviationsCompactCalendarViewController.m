@implementation DeviationsCompactCalendarViewController

- (_TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController *result;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController_subscriptions) = (Class)MEMORY[0x24BEE4B08];
  v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController *v2;

  v2 = self;
  sub_231C259F0();

}

- (_TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController *result;

  v3 = a3;
  result = (_TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController *result;

  v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23190C114((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController_delegate);
  swift_release();
  swift_bridgeObjectRelease();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5;
  _TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  swift_retain();
  v7 = sub_231B0C4C4();

  swift_release();
  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController *v11;
  id v12;
  uint64_t v14;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  v12 = sub_231C26370(v10);

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
  _TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController *v11;
  uint64_t v12;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  sub_231C26740(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end
