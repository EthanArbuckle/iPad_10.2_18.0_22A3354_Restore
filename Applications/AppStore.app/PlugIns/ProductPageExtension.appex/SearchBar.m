@implementation SearchBar

- (_TtC20ProductPageExtension9SearchBar)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SearchBar();
  return -[SearchBar initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC20ProductPageExtension9SearchBar)initWithCoder:(id)a3
{
  _TtC20ProductPageExtension9SearchBar *result;

  result = (_TtC20ProductPageExtension9SearchBar *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/SearchBar.swift", 36, 2, 29, 0);
  __break(1u);
  return result;
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (NSArray)keyCommands
{
  _TtC20ProductPageExtension9SearchBar *v2;
  double *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_100441798();

  if (v3)
  {
    sub_100018B6C(0, (unint64_t *)&qword_100808190, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)handleCancelKeyCommand
{
  id v2;
  void *v3;
  _TtC20ProductPageExtension9SearchBar *v4;

  v4 = self;
  v2 = -[SearchBar delegate](v4, "delegate");
  if (v2)
  {
    v3 = v2;
    if ((objc_msgSend(v2, "respondsToSelector:", "searchBarCancelButtonClicked:") & 1) != 0)
      objc_msgSend(v3, "searchBarCancelButtonClicked:", v4);

    swift_unknownObjectRelease(v3);
  }
  else
  {

  }
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchBar();
  v2 = v3.receiver;
  -[SearchBar layoutSubviews](&v3, "layoutSubviews");
  sub_1004419D8();

}

@end
