@implementation TickerColumnCell

- (_TtC13FTMInternal_416TickerColumnCell)initWithFrame:(CGRect)a3
{
  return (_TtC13FTMInternal_416TickerColumnCell *)sub_100153E04(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13FTMInternal_416TickerColumnCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC13FTMInternal_416TickerColumnCell *result;

  v5 = OBJC_IVAR____TtC13FTMInternal_416TickerColumnCell_tableView;
  v6 = objc_allocWithZone((Class)UITableView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_416TickerColumnCell_characters) = (Class)&_swiftEmptyArrayStorage;
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_416TickerColumnCell_size) = 2;
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_416TickerColumnCell_isScrolling) = 0;

  result = (_TtC13FTMInternal_416TickerColumnCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100211390, "FTMInternal_4/TickerColumnCell.swift", 36, 2, 56, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_416TickerColumnCell_tableView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC13FTMInternal_416TickerColumnCell_characters));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC13FTMInternal_416TickerColumnCell *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_100154414(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_416TickerColumnCell_characters))[2];
}

- (void)scrollViewDidScroll:(id)a3
{
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_416TickerColumnCell_isScrolling) = 1;
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_416TickerColumnCell_isScrolling) = 0;
}

@end
