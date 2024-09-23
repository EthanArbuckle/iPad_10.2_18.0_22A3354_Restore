@implementation EmojiTextField

- (NSString)textInputContextIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (_TtC18SharingViewService14EmojiTextField)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC18SharingViewService14EmojiTextField *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for EmojiTextField();
  v7 = -[EmojiTextField initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  -[EmojiTextField setKeyboardType:](v7, "setKeyboardType:", 124);
  return v7;
}

- (_TtC18SharingViewService14EmojiTextField)initWithCoder:(id)a3
{
  _TtC18SharingViewService14EmojiTextField *result;

  result = (_TtC18SharingViewService14EmojiTextField *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100136660, "SharingViewService/EmojiTextField.swift", 39, 2, 26, 0);
  __break(1u);
  return result;
}

@end
