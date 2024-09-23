@implementation MessagesViewController

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC22AskToMessagesExtension22MessagesViewController *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_10000A898(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)generateSnapshotWithContentSize:(CGSize)a3 completion:(id)a4
{
  double height;
  double width;
  void (**v7)(void *, void *);
  void *v8;
  _TtC22AskToMessagesExtension22MessagesViewController *v9;

  height = a3.height;
  width = a3.width;
  v7 = (void (**)(void *, void *))_Block_copy(a4);
  v9 = self;
  v8 = (void *)sub_10000B880(width, height);
  v7[2](v7, v8);

  _Block_release(v7);
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  _QWORD *v4;
  _TtC22AskToMessagesExtension22MessagesViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10000BA50(v4);

}

- (void)_didUpdateMessage:(id)a3 conversation:(id)a4
{
  id v6;
  _QWORD *v7;
  _TtC22AskToMessagesExtension22MessagesViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000115B8(v7);

}

- (void)requestResize
{
  char *v2;
  objc_super v3;

  v2 = (char *)self + OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_cachedSizeInfo;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  v2[32] = 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MessagesViewController();
  -[MessagesViewController requestResize](&v3, "requestResize");
}

- (_TtC22AskToMessagesExtension22MessagesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC22AskToMessagesExtension22MessagesViewController *)sub_10000FEC4(v5, v7, a4);
}

- (_TtC22AskToMessagesExtension22MessagesViewController)initWithCoder:(id)a3
{
  return (_TtC22AskToMessagesExtension22MessagesViewController *)sub_100010088(a3);
}

- (_TtC22AskToMessagesExtension22MessagesViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  return (_TtC22AskToMessagesExtension22MessagesViewController *)sub_1000101D8(a3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_balloonContentContainer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_recipientAddresses));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload));
}

@end
