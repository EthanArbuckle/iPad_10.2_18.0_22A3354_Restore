@implementation ListTableViewHeaderFooter

- (void)prepareForReuse
{
  _TtC7SwiftUI25ListTableViewHeaderFooter *v2;

  v2 = self;
  ListTableViewHeaderFooter.prepareForReuse()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC7SwiftUI25ListTableViewHeaderFooter *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  if (*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI25ListTableViewHeaderFooter_host))
  {
    v3 = self;
    v4 = -[ListTableViewHeaderFooter contentView](v3, sel_contentView);
    objc_msgSend(v4, sel_bounds);

    v5 = specialized PlatformListViewBase<>.hostSizeThatFits(width:)();
    v7 = v6;

  }
  else
  {
    height = a3.height;
    width = a3.width;
    v14.receiver = self;
    v14.super_class = (Class)type metadata accessor for ListTableViewHeaderFooter();
    -[ListTableViewHeaderFooter sizeThatFits:](&v14, sel_sizeThatFits_, width, height);
    v5 = v10;
    v7 = v11;
  }
  v12 = v5;
  v13 = v7;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC7SwiftUI25ListTableViewHeaderFooter *v9;
  uint64_t v10;

  v4 = type metadata accessor for UIViewConfigurationState();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIViewConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  ListTableViewHeaderFooter.updateConfiguration(using:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (_TtC7SwiftUI25ListTableViewHeaderFooter)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC7SwiftUI25ListTableViewHeaderFooter *)ListTableViewHeaderFooter.init(reuseIdentifier:)(v3, v4);
}

- (_TtC7SwiftUI25ListTableViewHeaderFooter)initWithCoder:(id)a3
{
  return (_TtC7SwiftUI25ListTableViewHeaderFooter *)ListTableViewHeaderFooter.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI25ListTableViewHeaderFooter_host));
}

@end
