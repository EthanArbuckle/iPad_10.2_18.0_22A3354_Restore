@implementation ConduitApprovalDelegate

- (void)approveSplitSessionForConversation:(id)a3 requestedFromDevice:(id)a4 pullContext:(int64_t)a5 completion:(id)a6
{
  void *v9;
  id v10;
  id v11;
  _TtC15ConversationKit23ConduitApprovalDelegate *v12;

  v9 = _Block_copy(a6);
  *(_QWORD *)(swift_allocObject() + 16) = v9;
  v10 = a3;
  v11 = a4;
  v12 = self;
  ConduitApprovalDelegate.approveSplitSession(for:requestedFromDevice:pullContext:completion:)();

  swift_release();
}

- (void)cancelSplitSessionApproval
{
  _TtC15ConversationKit23ConduitApprovalDelegate *v2;

  v2 = self;
  ConduitApprovalDelegate.cancelSplitSessionApproval()();

}

- (_TtC15ConversationKit23ConduitApprovalDelegate)init
{
  ConduitApprovalDelegate.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
