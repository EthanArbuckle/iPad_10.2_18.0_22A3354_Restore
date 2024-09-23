@implementation AddressSelectionTableViewController

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_1B93EB900();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  sub_1B8E23A60(0, (unint64_t *)&unk_1EF20FF50);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC6HomeUI35AddressSelectionTableViewController *v14;
  uint64_t v15;

  v8 = sub_1B93EB900();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_1B8FD2A2C(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC6HomeUI35AddressSelectionTableViewController *v11;
  uint64_t v12;

  v6 = sub_1B93EB900();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  v10 = a3;
  v11 = self;
  sub_1B8FD1DA8(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC6HomeUI35AddressSelectionTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  id v4;
  _TtC6HomeUI35AddressSelectionTableViewController *result;

  v4 = a3;
  result = (_TtC6HomeUI35AddressSelectionTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B8E26870((uint64_t)self + OBJC_IVAR____TtC6HomeUI35AddressSelectionTableViewController_delegate, &qword_1EF20FEB8);
}

@end
