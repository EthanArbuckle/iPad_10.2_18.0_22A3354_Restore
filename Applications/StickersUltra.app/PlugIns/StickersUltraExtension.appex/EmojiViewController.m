@implementation EmojiViewController

- (void)viewDidLoad
{
  _TtC22StickersUltraExtension19EmojiViewController *v2;

  v2 = self;
  sub_10002E6E4();

}

- (void)viewWillLayoutSubviews
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for EmojiViewController();
  v2 = v6.receiver;
  -[EmojiViewController viewWillLayoutSubviews](&v6, "viewWillLayoutSubviews");
  v3 = (void *)objc_opt_self(UIKeyboardImpl);
  v4 = objc_msgSend(v3, "activeInstance", v6.receiver, v6.super_class);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "clearAnimations");

  }
  else
  {
    __break(1u);
  }
}

- (void)keyboardScroll:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC22StickersUltraExtension19EmojiViewController *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10002F2EC();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC22StickersUltraExtension19EmojiViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC22StickersUltraExtension19EmojiViewController *)sub_10002F500(v5, v7, a4);
}

- (_TtC22StickersUltraExtension19EmojiViewController)initWithCoder:(id)a3
{
  return (_TtC22StickersUltraExtension19EmojiViewController *)sub_10002F624(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension19EmojiViewController_keyline));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension19EmojiViewController_textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension19EmojiViewController_keyboardViewController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC22StickersUltraExtension19EmojiViewController_delegate));
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtC22StickersUltraExtension19EmojiViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10002F768(v4);

}

@end
