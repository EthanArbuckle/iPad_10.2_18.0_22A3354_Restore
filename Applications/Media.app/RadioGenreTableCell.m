@implementation RadioGenreTableCell

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _TtC5Media19RadioGenreTableCell *v6;

  v6 = self;
  sub_100029BC0(a3, a4, (SEL *)&selRef_setHighlighted_animated_);

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _TtC5Media19RadioGenreTableCell *v6;

  v6 = self;
  sub_100029BC0(a3, a4, (SEL *)&selRef_setSelected_animated_);

}

- (_TtC5Media19RadioGenreTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  _TtC5Media19RadioGenreTableCell *v9;
  objc_super v11;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for RadioGenreTableCell();
  v9 = -[RadioGenreTableCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, v8);

  return v9;
}

- (_TtC5Media19RadioGenreTableCell)initWithCoder:(id)a3
{
  uint64_t v3;

  return (_TtC5Media19RadioGenreTableCell *)sub_10002DB24(self, (uint64_t)a2, (uint64_t)a3, v3, (uint64_t (*)(uint64_t))type metadata accessor for RadioGenreTableCell);
}

@end
