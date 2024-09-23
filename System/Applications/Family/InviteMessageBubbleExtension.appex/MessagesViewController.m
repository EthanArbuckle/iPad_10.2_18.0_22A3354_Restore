@implementation MessagesViewController

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double width;
  _TtC28InviteMessageBubbleExtension22MessagesViewController *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v4 = self;
  sub_100004228(width);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC28InviteMessageBubbleExtension22MessagesViewController *v4;

  v4 = self;
  sub_1000047B8(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC28InviteMessageBubbleExtension22MessagesViewController *v4;

  v4 = self;
  sub_100004964(a3);

}

- (void)willBecomeActiveWithConversation:(id)a3
{
  _TtC28InviteMessageBubbleExtension22MessagesViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_100004B08(v5);

}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  void *v4;
  _TtC28InviteMessageBubbleExtension22MessagesViewController *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100007AE0(v5, v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (BOOL)displaysAfterAppearance
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  _BYTE v10[24];

  v3 = sub_1000070B8(&qword_100034818);
  __chkstk_darwin(v3);
  v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_inviteMessageDetails;
  swift_beginAccess(v6, v10, 0, 0);
  sub_1000079E4((uint64_t)v6, (uint64_t)v5, &qword_100034818);
  v7 = type metadata accessor for InviteMessageDetails(0);
  LOBYTE(v6) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) != 1;
  sub_100008080((uint64_t)v5, &qword_100034818);
  return (char)v6;
}

- (void)handleFamilyDidUpdate
{
  _TtC28InviteMessageBubbleExtension22MessagesViewController *v2;

  v2 = self;
  sub_1000066E4();

}

- (_TtC28InviteMessageBubbleExtension22MessagesViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC28InviteMessageBubbleExtension22MessagesViewController *)sub_1000069CC(v5, v7, a4);
}

- (_TtC28InviteMessageBubbleExtension22MessagesViewController)initWithCoder:(id)a3
{
  return (_TtC28InviteMessageBubbleExtension22MessagesViewController *)sub_100006B84(a3);
}

- (_TtC28InviteMessageBubbleExtension22MessagesViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  return (_TtC28InviteMessageBubbleExtension22MessagesViewController *)sub_100006CC8(a3);
}

- (void).cxx_destruct
{
  sub_100008294((Class *)((char *)&self->super.super.super.super.super.isa
                        + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_familyFetcher));
  swift_bridgeObjectRelease(*(_QWORD *)&self->familyFetcher[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_recipientHandleFromConversation]);
  sub_100008080((uint64_t)self + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_urlComponents, &qword_100034820);
  sub_100008080((uint64_t)self + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_inviteMessageDetails, &qword_100034818);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_bubbleViewControler));
}

@end
