@implementation FBKFeedbackDraftViewController

- (_TtC8Feedback30FBKFeedbackDraftViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22DDC0434();
}

- (void)dealloc
{
  _TtC8Feedback30FBKFeedbackDraftViewController *v2;

  v2 = self;
  FBKFeedbackDraftViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Feedback30FBKFeedbackDraftViewController_form));
  sub_22DDA47D8((uint64_t)self + OBJC_IVAR____TtC8Feedback30FBKFeedbackDraftViewController_delegate);
  sub_22DDA47D8((uint64_t)self + OBJC_IVAR____TtC8Feedback30FBKFeedbackDraftViewController_presentationDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Feedback30FBKFeedbackDraftViewController_extensionObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Feedback30FBKFeedbackDraftViewController_extensionKitQueryDelegate));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Feedback30FBKFeedbackDraftViewController__xpcConnection));
}

- (_TtC8Feedback30FBKFeedbackDraftViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Feedback30FBKFeedbackDraftViewController *result;

  v4 = a4;
  result = (_TtC8Feedback30FBKFeedbackDraftViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)didRequestViewFullScreen
{
  _TtC8Feedback30FBKFeedbackDraftViewController *v2;

  v2 = self;
  FBKFeedbackDraftViewController.didRequestViewFullScreen()();

}

- (void)didRequestViewDismissalWithSaved:(BOOL)a3
{
  _TtC8Feedback30FBKFeedbackDraftViewController *v3;

  v3 = self;
  _s8Feedback30FBKFeedbackDraftViewControllerC010didRequestD9Dismissal5savedySb_tF_0();

}

- (void)draftDirtyStateUpdated:(BOOL)a3
{
  sub_22DDC0838(0xD00000000000001ALL, 0x800000022DE2B320);
}

- (void)feedbackDidBeginSubmission
{
  sub_22DDC0838(0xD00000000000001CLL, 0x800000022DE2B300);
}

- (void)feedbackDidCompleteWithResponseType:(int64_t)a3 responseID:(id)a4 completedForm:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC8Feedback30FBKFeedbackDraftViewController *v12;

  v8 = sub_22DE1F2B0();
  v10 = v9;
  v11 = a5;
  v12 = self;
  FBKFeedbackDraftViewController.feedbackDidComplete(responseType:responseID:completedForm:)(a3, v8, v10, v11);

  swift_bridgeObjectRelease();
}

- (void)didFailSubmissionWithError:(id)a3
{
  id v4;
  _TtC8Feedback30FBKFeedbackDraftViewController *v5;

  v4 = a3;
  v5 = self;
  FBKFeedbackDraftViewController.didFailSubmission(error:)(v4);

}

- (void)feedbackDidFailToAttachURL:(id)a3 nsError:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8Feedback30FBKFeedbackDraftViewController *v11;
  uint64_t v12;

  v6 = sub_22DE1DFB4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DE1DF84();
  v10 = a4;
  v11 = self;
  FBKFeedbackDraftViewController.feedbackDidFailToAttachURL(_:nsError:)((uint64_t)v9, v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)feedbackRestartDidFailWithError:(id)a3
{
  id v4;
  _TtC8Feedback30FBKFeedbackDraftViewController *v5;

  v4 = a3;
  v5 = self;
  FBKFeedbackDraftViewController.feedbackRestartDidFail(error:)((NSNumber)v4);

}

@end
