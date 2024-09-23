@implementation EditorialService

- (_TtC7NewsUI216EditorialService)init
{
  _TtC7NewsUI216EditorialService *result;

  result = (_TtC7NewsUI216EditorialService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI216EditorialService_delegate);
  swift_unknownObjectRelease();
}

- (void)updateEditorialItemWith:(id)a3
{
  id v4;
  _TtC7NewsUI216EditorialService *v5;

  v4 = a3;
  v5 = self;
  sub_1D6C19864((uint64_t)v4);

}

- (void)refreshEditorialItemsWithItems:(id)a3
{
  uint64_t v4;
  _TtC7NewsUI216EditorialService *v5;

  type metadata accessor for EditorialItem();
  v4 = sub_1D6E26D80();
  v5 = self;
  sub_1D6C19988(v4);

  swift_bridgeObjectRelease();
}

@end
