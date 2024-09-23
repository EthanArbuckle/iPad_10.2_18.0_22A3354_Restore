@implementation AddRecipientsControllerRepresentable.Coordinator

- (void)handleCancelAction
{
  _TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator *v2;

  v2 = self;
  sub_18E6CD8CC();

}

- (void)handleDoneAction
{
  _TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator *v2;

  v2 = self;
  sub_18E6CDAC4();

}

- (BOOL)recipientSelectionIsGroup:(id)a3
{
  void *v3;
  id v5;
  _TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator_conversation);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    v7 = objc_msgSend(v3, sel_recipients);
    sub_18E00F31C(0, (unint64_t *)&qword_1EE0F50B8);
    v8 = sub_18E768AE0();

    if (v8 >> 62)
    {
      sub_18E7669BC();
      v9 = sub_18E769338();

      swift_bridgeObjectRelease();
    }
    else
    {
      v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);

    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9 > 1;
}

- (double)visibleInputAndEntryViewHeightToAvoidForRecipientSelectionController:(id)a3
{
  return 0.0;
}

- (UIEdgeInsets)navigationBarInsetsForRecipientSelectionController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0CEB4B0];
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)recipientSelectionControllerShouldResignFirstResponder:(id)a3
{
  id v4;
  _TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_18E6CDAC4();

}

- (_TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator)init
{
  _TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator *result;

  result = (_TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  v3 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator_parent];
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator_parent));
  sub_18E011A40(v3);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator_addRecipientsController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator_navigationController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator_conversation));
}

@end
