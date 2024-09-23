@implementation MedicationsListEditViewController

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v6 = sub_2318D2B80();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2318D2B38();
  v10 = a3;
  v11 = self;
  if (sub_2318D2B74())
  {

  }
  else
  {
    sub_2318D4758();
    swift_allocObject();
    sub_2318D474C();
    v12 = sub_2318D4350();
    v13 = (void *)sub_2318D2B2C();
    objc_msgSend(v10, sel_deselectRowAtIndexPath_animated_, v13, 1);

    sub_2318D5B14();
    swift_release();
    v11 = (_TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController *)v12;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  _TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController *v18;
  uint64_t v19;
  char *v20;
  void (*v21)(char *, uint64_t);
  void *v22;
  uint64_t v24;

  v7 = sub_2318D2B80();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v24 - v12;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v24 - v15;
  sub_2318D2B38();
  sub_2318D2B38();
  v17 = a3;
  v18 = self;
  v19 = sub_2318D2B74();
  if (v19 == sub_2318D2B74())
    v20 = v10;
  else
    v20 = v13;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v16, v20, v7);

  v21 = *(void (**)(char *, uint64_t))(v8 + 8);
  v21(v10, v7);
  v21(v13, v7);
  v22 = (void *)sub_2318D2B2C();
  v21(v16, v7);
  return v22;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_2318D2B80();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2318D2B38();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (void)didTapDone
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  _TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController *v8;
  uint64_t v9;

  v3 = sub_2318D4974();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController_listManagerState;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = self;
  sub_2318D4908();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  -[MedicationsListEditViewController dismissViewControllerAnimated:completion:](v8, sel_dismissViewControllerAnimated_completion_, 1, 0);

}

- (_TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController_diffableDataSource) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController_listRefreshSubscription) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController_currentIdentifiers) = (Class)MEMORY[0x24BEE4B08];
  v4 = a3;
  sub_2318D492C();

  result = (_TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController *)sub_2318D6150();
  __break(1u);
  return result;
}

- (_TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController)initWithStyle:(int64_t)a3
{
  _TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController *result;

  result = (_TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController *result;

  v4 = a4;
  result = (_TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController_diffableDataSource));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController_listManagerState;
  v4 = sub_2318D4974();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
