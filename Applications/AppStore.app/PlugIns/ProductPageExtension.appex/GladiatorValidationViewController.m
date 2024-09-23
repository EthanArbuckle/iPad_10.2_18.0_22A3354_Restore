@implementation GladiatorValidationViewController

- (_TtC20ProductPageExtension33GladiatorValidationViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  _TtC20ProductPageExtension33GladiatorValidationViewController *result;
  uint64_t v15;

  v5 = type metadata accessor for GladiatorRules(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OBJC_IVAR____TtC20ProductPageExtension33GladiatorValidationViewController_gladiator;
  type metadata accessor for Gladiator(0, v7);
  *(Class *)((char *)&self->super.super.super.super.isa + v10) = (Class)Gladiator.__allocating_init()(a3);
  v11 = OBJC_IVAR____TtC20ProductPageExtension33GladiatorValidationViewController_rules;
  v12 = GladiatorRules.init()();
  v13 = (objc_class *)GladiatorRules.rules.getter(v12);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  *(Class *)((char *)&self->super.super.super.super.isa + v11) = v13;

  result = (_TtC20ProductPageExtension33GladiatorValidationViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/GladiatorValidationViewController.swift", 60, 2, 37, 0);
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33GladiatorValidationViewController_rules))[2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC20ProductPageExtension33GladiatorValidationViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_10037E410(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC20ProductPageExtension33GladiatorValidationViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10037E790();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC20ProductPageExtension33GladiatorValidationViewController)initWithStyle:(int64_t)a3
{
  _TtC20ProductPageExtension33GladiatorValidationViewController *result;

  result = (_TtC20ProductPageExtension33GladiatorValidationViewController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.GladiatorValidationViewController", 54, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtension33GladiatorValidationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC20ProductPageExtension33GladiatorValidationViewController *result;

  v4 = a4;
  result = (_TtC20ProductPageExtension33GladiatorValidationViewController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.GladiatorValidationViewController", 54, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension33GladiatorValidationViewController_events));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC20ProductPageExtension33GladiatorValidationViewController_gladiator));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension33GladiatorValidationViewController_rules));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension33GladiatorValidationViewController_ruleNames));
}

@end
