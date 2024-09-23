@implementation BaseTableViewHeaderFooterView

- (_TtC11Diagnostics29BaseTableViewHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  DARootViewController *v4;
  DARootViewController *v5;
  NSString v6;
  SEL v7;
  id v8;
  int v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _TtC11Diagnostics29BaseTableViewHeaderFooterView *v14;
  objc_super v16;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    v6 = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for BaseTableViewHeaderFooterView();
  v14 = -[BaseTableViewHeaderFooterView initWithReuseIdentifier:](&v16, "initWithReuseIdentifier:", v6);

  return v14;
}

- (_TtC11Diagnostics29BaseTableViewHeaderFooterView)initWithCoder:(id)a3
{
  _TtC11Diagnostics29BaseTableViewHeaderFooterView *result;

  result = (_TtC11Diagnostics29BaseTableViewHeaderFooterView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100112360, "Diagnostics/BaseTableViewHeaderFooterView.swift", 47, 2, 21, 0);
  __break(1u);
  return result;
}

@end
