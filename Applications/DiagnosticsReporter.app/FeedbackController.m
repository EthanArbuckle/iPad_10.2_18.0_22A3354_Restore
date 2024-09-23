@implementation FeedbackController

- (void)feedbackDraftViewController:(id)a3 didCompleteWithFeedbackID:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  swift_retain(self);
  sub_1000028E0(v6, v8);

  swift_release(self);
  swift_bridgeObjectRelease(v8);
}

- (void)feedbackDraftViewController:(id)a3 didFailToStartWithError:(int64_t)a4
{
  id v6;

  v6 = a3;
  swift_retain(self);
  sub_100002AEC(a4);

  swift_release(self);
}

- (void)feedbackDraftViewController:(id)a3 didFailToAttachURL:(id)a4 error:(int64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = a3;
  swift_retain(self);
  sub_100002D20((uint64_t)v12, a5);

  swift_release(self);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)feedbackDraftViewControllerDidCancel:(id)a3
{
  id v4;

  v4 = a3;
  swift_retain(self);
  sub_10000300C();

  swift_release(self);
}

- (void)feedbackDraftViewController:(id)a3 didFailToSubmitFeedback:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  swift_retain(self);
  sub_100003148(v7);

  swift_release(self);
}

@end
