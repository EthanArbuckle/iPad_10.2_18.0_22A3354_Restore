@implementation FBKEvaluationController

- (_TtC8Feedback23FBKEvaluationController)init
{
  _TtC8Feedback23FBKEvaluationController *result;

  result = (_TtC8Feedback23FBKEvaluationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  sub_22DDA47D8((uint64_t)self + OBJC_IVAR____TtC8Feedback23FBKEvaluationController__delegate);
  v3 = (char *)self + OBJC_IVAR____TtC8Feedback23FBKEvaluationController__swiftUIDetent;
  v4 = sub_22DE1E9BC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  sub_22DDF4C00(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC8Feedback23FBKEvaluationController___evaluation), self->_apiType[OBJC_IVAR____TtC8Feedback23FBKEvaluationController___evaluation]);
  sub_22DD50DE0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Feedback23FBKEvaluationController___evaluationCompletionHandler));
  sub_22DD5071C((uint64_t)self + OBJC_IVAR____TtC8Feedback23FBKEvaluationController__subject, &qword_255DB63B0);

  sub_22DD5071C((uint64_t)self + OBJC_IVAR____TtC8Feedback23FBKEvaluationController__formContext, &qword_255DB94F8);
  sub_22DD5071C((uint64_t)self + OBJC_IVAR____TtC8Feedback23FBKEvaluationController__actionPerformed, &qword_255DB94F0);
  v5 = (char *)self + OBJC_IVAR____TtC8Feedback23FBKEvaluationController___observationRegistrar;
  v6 = sub_22DE1E098();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (void)feedbackDraftViewController:(id)a3 didCompleteWithResponseType:(int64_t)a4 responseID:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC8Feedback23FBKEvaluationController *v11;

  v7 = sub_22DE1F2B0();
  v9 = v8;
  v10 = a3;
  v11 = self;
  sub_22DDF5DC4((uint64_t)v10, v7, v9);

  swift_bridgeObjectRelease();
}

- (void)feedbackDraftViewController:(id)a3 didFailToStartWithError:(int64_t)a4
{
  id v5;
  _TtC8Feedback23FBKEvaluationController *v6;

  v5 = a3;
  v6 = self;
  _s8Feedback23FBKEvaluationControllerC017feedbackDraftViewC0_23didFailToStartWithErroryAA011FBKFeedbackefC0C_AA08FBKDraftL0OtF_0();

}

- (void)feedbackDraftViewController:(id)a3 didFailToAttachURL:(id)a4 error:(int64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8Feedback23FBKEvaluationController *v12;
  uint64_t v13;

  v7 = sub_22DE1DFB4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DE1DF84();
  v11 = a3;
  v12 = self;
  _s8Feedback23FBKEvaluationControllerC017feedbackDraftViewC0_18didFailToAttachURL5erroryAA011FBKFeedbackefC0C_10Foundation0K0VAA18FBKAttachmentErrorOtF_0((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)feedbackDraftViewControllerDidCancel:(id)a3
{
  id v4;
  _TtC8Feedback23FBKEvaluationController *v5;

  v4 = a3;
  v5 = self;
  FBKEvaluationController.feedbackDraftViewControllerDidCancel(_:)();

}

- (void)feedbackDraftViewController:(id)a3 didFailToSubmitFeedback:(id)a4
{
  id v6;
  id v7;
  _TtC8Feedback23FBKEvaluationController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  FBKEvaluationController.feedbackDraftViewController(_:didFailToSubmitFeedback:)((uint64_t)v6, v7);

}

- (void)feedbackDraftViewControllerDidLoadForm:(id)a3
{
  id v4;
  _TtC8Feedback23FBKEvaluationController *v5;

  v4 = a3;
  v5 = self;
  _s8Feedback23FBKEvaluationControllerC017feedbackDraftViewC11DidLoadFormyyAA011FBKFeedbackefC0CF_0();

}

@end
