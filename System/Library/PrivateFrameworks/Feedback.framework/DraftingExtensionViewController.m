@implementation DraftingExtensionViewController

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC8Feedback31DraftingExtensionViewController *v4;

  v4 = self;
  sub_22DD9C6C0(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DraftingExtensionViewController();
  v4 = v5.receiver;
  -[DraftingExtensionViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_22DE1E0B0();
  sub_22DD9E570();

}

- (void)viewDidLoad
{
  _TtC8Feedback31DraftingExtensionViewController *v2;

  v2 = self;
  sub_22DD9CEE8();

}

- (_TtC8Feedback31DraftingExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_22DE1F2B0();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC8Feedback31DraftingExtensionViewController *)DraftingExtensionViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8Feedback31DraftingExtensionViewController)initWithCoder:(id)a3
{
  return (_TtC8Feedback31DraftingExtensionViewController *)DraftingExtensionViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Feedback31DraftingExtensionViewController_form));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Feedback31DraftingExtensionViewController_formStub));
  sub_22DD50DE0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8Feedback31DraftingExtensionViewController_setFeedbackFormReply));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Feedback31DraftingExtensionViewController_feedbackDraftNavigationController));
  swift_unknownObjectWeakDestroy();
  sub_22DDA47D8((uint64_t)self + OBJC_IVAR____TtC8Feedback31DraftingExtensionViewController_localClient);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Feedback31DraftingExtensionViewController_bugFormTableViewController));
}

- (void)setShowsCompletionPage:(BOOL)a3
{
  _TtC8Feedback31DraftingExtensionViewController *v4;

  v4 = self;
  sub_22DDA1764(a3, (uint64_t)&unk_24F991438, (uint64_t)sub_22DDA4694, (uint64_t)&block_descriptor_27);

}

- (void)saveDraftWithIsClosing:(BOOL)a3
{
  _TtC8Feedback31DraftingExtensionViewController *v4;

  v4 = self;
  sub_22DDA1764(a3, (uint64_t)&unk_24F9913C0, (uint64_t)sub_22DDA4688, (uint64_t)&block_descriptor_18);

}

- (void)deleteDraft
{
  _TtC8Feedback31DraftingExtensionViewController *v2;

  v2 = self;
  sub_22DDA1A60();

}

- (void)setFeedbackForm:(id)a3 reply:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC8Feedback31DraftingExtensionViewController *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  DraftingExtensionViewController.setFeedbackForm(_:reply:)(v8, (uint64_t)sub_22DDA4628, v7);

  swift_release();
}

- (void)controller:(id)a3 didClickSwitchAccountsWithCurrentUser:(id)a4
{
  id v6;
  id v7;
  _TtC8Feedback31DraftingExtensionViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22DDA3574(v7);

}

- (void)controller:(id)a3 didFinishLoadingDraft:(id)a4 devicesController:(id)a5 draftingController:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _TtC8Feedback31DraftingExtensionViewController *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  sub_22DDA375C(v11, a5, v13);

}

- (void)controller:(id)a3 didAttachLocalFile:(id)a4
{
  id v6;
  id v7;
  _TtC8Feedback31DraftingExtensionViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22DDA3800(v7);

}

- (void)controllerWillResignFirstActive:(id)a3
{
  uint64_t v4;
  _TtC8Feedback31DraftingExtensionViewController *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;

  v4 = qword_255DB52F0;
  v10 = a3;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_22DE1E410();
  __swift_project_value_buffer(v6, (uint64_t)qword_255DB7C78);
  v7 = sub_22DE1E3F8();
  v8 = sub_22DE1F514();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_22DD4B000, v7, v8, "Will resign first active", v9, 2u);
    MEMORY[0x22E320870](v9, -1, -1);
  }

}

- (void)controller:(id)a3 didFinishSubmissionWithError:(id)a4
{
  id v6;
  _TtC8Feedback31DraftingExtensionViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  DraftingExtensionViewController.controller(_:didFinishSubmissionWithError:)(v6, a4);

}

- (void)controller:(id)a3 didFailToLoadDraftWithError:(id)a4
{
  id v6;
  _TtC8Feedback31DraftingExtensionViewController *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_22DDA40F4(v8);

}

- (void)controller:(id)a3 didRequestDismissalWithSavedDraft:(BOOL)a4
{
  id v6;
  _TtC8Feedback31DraftingExtensionViewController *v7;

  v6 = a3;
  v7 = self;
  sub_22DDA431C(a4);

}

- (void)controllerDidRequestFullScreenWithController:(id)a3
{
  id v4;
  _TtC8Feedback31DraftingExtensionViewController *v5;

  v4 = a3;
  v5 = self;
  _s8Feedback31DraftingExtensionViewControllerC30controllerDidRequestFullScreen4withySo015FBKBugFormTabledE0C_tF_0();

}

@end
