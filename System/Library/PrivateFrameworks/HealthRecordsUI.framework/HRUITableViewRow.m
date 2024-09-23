@implementation HRUITableViewRow

- (NSString)reuseIdentifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1BC62C650();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (HRUITableViewRow)initWithReuseIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  objc_super v8;

  v4 = sub_1BC62C680();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___HRUITableViewRow_reuseIdentifier);
  *v5 = v4;
  v5[1] = v6;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TableViewRow();
  return -[HRUITableViewRow init](&v8, sel_init);
}

- (HRUITableViewRow)init
{
  HRUITableViewRow *result;

  result = (HRUITableViewRow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
