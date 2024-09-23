@implementation EmojiEditingInputViewController

- (_TtC11EmojiPoster31EmojiEditingInputViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DD2EFAF0();
}

- (void)viewDidLoad
{
  _TtC11EmojiPoster31EmojiEditingInputViewController *v2;

  v2 = self;
  sub_1DD2EC7E4();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC11EmojiPoster31EmojiEditingInputViewController *v4;

  v4 = self;
  sub_1DD2EDBB4(a3);

}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmojiEditingInputViewController();
  v4 = (char *)v5.receiver;
  -[EmojiEditingInputViewController viewIsAppearing:](&v5, sel_viewIsAppearing_, v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC11EmojiPoster31EmojiEditingInputViewController_textField], sel_becomeFirstResponder, v5.receiver, v5.super_class);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  _TtC11EmojiPoster31EmojiEditingInputViewController *v10;

  length = a4.length;
  location = a4.location;
  sub_1DD2F9DE4();
  v9 = a3;
  v10 = self;
  LOBYTE(length) = sub_1DD2EE2F8(v9, location, length);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)didTapCloseButton
{
  char *v3;
  uint64_t v4;
  void (*v5)(void);
  _TtC11EmojiPoster31EmojiEditingInputViewController *v6;

  v3 = (char *)self + OBJC_IVAR____TtC11EmojiPoster31EmojiEditingInputViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x1DF0D8130](v3))
  {
    v4 = *((_QWORD *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 24);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (void)didTapDeleteButton
{
  _TtC11EmojiPoster31EmojiEditingInputViewController *v2;

  v2 = self;
  sub_1DD2EEB1C();

}

- (_TtC11EmojiPoster31EmojiEditingInputViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11EmojiPoster31EmojiEditingInputViewController *result;

  v4 = a4;
  result = (_TtC11EmojiPoster31EmojiEditingInputViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster31EmojiEditingInputViewController_navBar));
  v3 = (char *)self + OBJC_IVAR____TtC11EmojiPoster31EmojiEditingInputViewController_logger;
  v4 = sub_1DD2F9CE8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster31EmojiEditingInputViewController_textField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster31EmojiEditingInputViewController_emojiCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster31EmojiEditingInputViewController_keyboardVC));
  sub_1DD2CFD1C((uint64_t)self + OBJC_IVAR____TtC11EmojiPoster31EmojiEditingInputViewController_delegate);
}

@end
