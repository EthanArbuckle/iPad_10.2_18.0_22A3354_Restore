@implementation HRAccountUpgradeTileCell

+ (NSString)reuseIdentifier
{
  return (NSString *)(id)sub_1BC62C650();
}

- (HRAccountUpgradeTileCell)initWithProfile:(id)a3 presentingViewController:(id)a4
{
  return (HRAccountUpgradeTileCell *)AccountUpgradeTileCell.init(profile:presentingViewController:)(a3, a4);
}

- (HRAccountUpgradeTileCell)initWithCoder:(id)a3
{
  id v4;
  HRAccountUpgradeTileCell *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___HRAccountUpgradeTileCell_accounts) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___HRAccountUpgradeTileCell_cancellable) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___HRAccountUpgradeTileCell_tileView) = 0;
  v4 = a3;

  result = (HRAccountUpgradeTileCell *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (BOOL)hasUpgradableAccounts
{
  unint64_t v2;
  uint64_t v3;
  HRAccountUpgradeTileCell *v5;

  v2 = *(unint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___HRAccountUpgradeTileCell_accounts);
  if (v2 >> 62)
  {
    v5 = self;
    swift_bridgeObjectRetain();
    v3 = sub_1BC62D3B8();

    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return v3 != 0;
}

- (void)reloadDataSource
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  HRAccountUpgradeTileCell *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  sub_1BC384E68(0, (unint64_t *)&qword_1ED6A4DE0, (void (*)(uint64_t))MEMORY[0x1E0DF0750]);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - v4;
  v6 = sub_1BC62C95C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_1BC62C944();
  v7 = self;
  v8 = sub_1BC62C938();
  v9 = (_QWORD *)swift_allocObject();
  v10 = MEMORY[0x1E0DF06E8];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v7;
  sub_1BC5C2784((uint64_t)v5, (uint64_t)&unk_1EF4311D0, (uint64_t)v9);
  swift_release();

}

- (HRAccountUpgradeTileCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HRAccountUpgradeTileCell *result;

  result = (HRAccountUpgradeTileCell *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_release();

}

@end
