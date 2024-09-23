@implementation NoKeyboardTextField

- (BOOL)_disableAutomaticKeyboardBehavior
{
  return 1;
}

- (BOOL)_disableAutomaticKeyboardUI
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC11EmojiPoster19NoKeyboardTextField *v5;
  _TtC11EmojiPoster19NoKeyboardTextField *v6;
  char v7;
  _OWORD v9[2];

  if (a4)
  {
    v5 = self;
    swift_unknownObjectRetain();
    sub_1DD2F9FE8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }
  if ((sub_1DD2F9CC4() & 1) != 0 || (sub_1DD2F9CC4() & 1) != 0)
    v7 = 1;
  else
    v7 = sub_1DD2F9CC4();

  sub_1DD2EBE30((uint64_t)v9);
  return v7 & 1;
}

- (BOOL)supportsImagePaste
{
  return 0;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NoKeyboardTextField();
  swift_unknownObjectRetain();
  v4 = v5.receiver;
  -[NoKeyboardTextField buildMenuWithBuilder:](&v5, sel_buildMenuWithBuilder_, a3);
  objc_msgSend(a3, sel_removeMenuForIdentifier_, *MEMORY[0x1E0DC5028], v5.receiver, v5.super_class);
  swift_unknownObjectRelease();

}

- (_TtC11EmojiPoster19NoKeyboardTextField)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for NoKeyboardTextField();
  return -[NoKeyboardTextField initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11EmojiPoster19NoKeyboardTextField)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NoKeyboardTextField();
  return -[NoKeyboardTextField initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
