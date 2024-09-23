@implementation B389CustomEmojiViewController

- (void)viewDidLoad
{
  _TtC18SharingViewService29B389CustomEmojiViewController *v2;

  v2 = self;
  sub_10005BE08();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  v4 = (char *)v5.receiver;
  -[B389CustomEmojiViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC18SharingViewService29B389CustomEmojiViewController_hiddenEmojiField], "becomeFirstResponder", v5.receiver, v5.super_class);

}

- (void)handleEmojiButtonTapped
{
  objc_msgSend(*(id *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService29B389CustomEmojiViewController_hiddenEmojiField], "becomeFirstResponder");
}

- (_TtC18SharingViewService29B389CustomEmojiViewController)initWithContentView:(id)a3
{
  id v3;
  _TtC18SharingViewService29B389CustomEmojiViewController *result;

  v3 = a3;
  result = (_TtC18SharingViewService29B389CustomEmojiViewController *)_swift_stdlib_reportUnimplementedInitializer("SharingViewService.B389CustomEmojiViewController", 48, "init(contentView:)", 18, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService29B389CustomEmojiViewController_mainController], a2);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC18SharingViewService29B389CustomEmojiViewController *v10;
  BOOL v11;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v8 = v7;
  v9 = a3;
  v10 = self;
  v11 = sub_10005D764();

  swift_bridgeObjectRelease(v8);
  return v11;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  sub_10005D3A4((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_systemBlueColor);
}

- (void)textFieldDidEndEditing:(id)a3
{
  sub_10005D3A4((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_tertiarySystemFillColor);
}

@end
