@implementation BaseTableViewCell

- (_TtC11Diagnostics17BaseTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  DARootViewController *v6;
  DARootViewController *v7;
  NSString v8;
  SEL v9;
  id v10;
  int v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _TtC11Diagnostics17BaseTableViewCell *v16;
  uint64_t (*v17)(void);
  _TtC11Diagnostics17BaseTableViewCell *v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v22;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    v8 = 0;
  }
  v22.receiver = self;
  v22.super_class = (Class)type metadata accessor for BaseTableViewCell();
  v16 = -[BaseTableViewCell initWithStyle:reuseIdentifier:](&v22, "initWithStyle:reuseIdentifier:", a3, v8);

  v17 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)v16->super.super.super.super.isa) + 0x50);
  v18 = v16;
  v19 = v17();
  v20 = (*(uint64_t (**)(uint64_t))((swift_isaMask & (uint64_t)v18->super.super.super.super.isa) + 0x58))(v19);
  (*(void (**)(uint64_t))((swift_isaMask & (uint64_t)v18->super.super.super.super.isa) + 0x60))(v20);

  return v18;
}

- (_TtC11Diagnostics17BaseTableViewCell)initWithCoder:(id)a3
{
  _TtC11Diagnostics17BaseTableViewCell *result;

  result = (_TtC11Diagnostics17BaseTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100112360, "Diagnostics/BaseTableViewCell.swift", 35, 2, 22, 0);
  __break(1u);
  return result;
}

@end
