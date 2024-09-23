@implementation ICDocumentMergeController

- (ICDocumentMergeControlling)parentController
{
  return (ICDocumentMergeControlling *)(id)MEMORY[0x1AF446658]((char *)self+ OBJC_IVAR___ICDocumentMergeController_parent, a2);
}

- (void)setParentController:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (NSSet)textViews
{
  uint64_t v2;
  void *v3;

  swift_beginAccess();
  v2 = swift_bridgeObjectRetain();
  sub_1AC972EC8(v2);
  sub_1AC7C3570(0, &qword_1ED6E74C0);
  sub_1AC8FC360();
  v3 = (void *)sub_1ACA4233C();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (void)addTextView:(id)a3
{
  id v4;
  ICDocumentMergeController *v5;

  v4 = a3;
  v5 = self;
  sub_1AC8FB054(v4);

}

- (void)removeTextView:(id)a3
{
  id v4;
  ICDocumentMergeController *v5;

  v4 = a3;
  v5 = self;
  sub_1AC8FB198((uint64_t)v4);

}

- (BOOL)isBlockingMerge
{
  ICDocumentMergeController *v2;
  ICDocumentMergeControlling *v3;
  unsigned __int8 v4;
  char v5;
  uint64_t v6;
  char v7;

  v2 = self;
  v3 = -[ICDocumentMergeController parentController](v2, sel_parentController);
  if (v3
    && (v4 = -[ICDocumentMergeControlling isBlockingMerge](v3, sel_isBlockingMerge),
        swift_unknownObjectRelease(),
        (v4 & 1) != 0))
  {

    v5 = 1;
  }
  else
  {
    swift_beginAccess();
    v6 = swift_bridgeObjectRetain();
    sub_1AC8FB53C(v6);
    v5 = v7;

    swift_bridgeObjectRelease();
  }
  return v5 & 1;
}

- (void)beginBlockingMergeForReason:(unint64_t)a3 textView:(id)a4
{
  id v6;
  ICDocumentMergeController *v7;

  v6 = a4;
  v7 = self;
  sub_1AC8FB6DC(a3, v6);

}

- (void)endBlockingMergeForReason:(unint64_t)a3 textView:(id)a4
{
  id v6;
  ICDocumentMergeController *v7;

  v6 = a4;
  v7 = self;
  sub_1AC8FBA9C(a3, v6);

}

- (void)blockingMergeForReason:(unint64_t)a3 textView:(id)a4 block:(id)a5
{
  void (**v7)(_QWORD);
  id v8;
  ICDocumentMergeController *v9;

  v7 = (void (**)(_QWORD))_Block_copy(a5);
  v8 = a4;
  v9 = self;
  -[ICDocumentMergeController beginBlockingMergeForReason:textView:](v9, sel_beginBlockingMergeForReason_textView_, 3, v8);
  v7[2](v7);
  -[ICDocumentMergeController endBlockingMergeForReason:textView:](v9, sel_endBlockingMergeForReason_textView_, 3, v8);
  _Block_release(v7);

}

- (void)requestMergeWithBlock:(id)a3
{
  void *v4;
  ICDocumentMergeController *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1AC8FC128((char *)v5, (void (**)(_QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (ICDocumentMergeController)init
{
  uint64_t v3;
  ICDocumentMergeController *v4;
  _QWORD *v5;
  objc_super v7;

  swift_unknownObjectWeakInit();
  v3 = OBJC_IVAR___ICDocumentMergeController_textViewsToReasonCounts;
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1AC8D99B0(MEMORY[0x1E0DEE9D8]);
  v5 = (Class *)((char *)&v4->super.isa + OBJC_IVAR___ICDocumentMergeController_requestedMergeBlock);
  *v5 = 0;
  v5[1] = 0;

  v7.receiver = v4;
  v7.super_class = (Class)ICDocumentMergeController;
  return -[ICDocumentMergeController init](&v7, sel_init);
}

- (void).cxx_destruct
{
  sub_1AC8FC3B8((uint64_t)self + OBJC_IVAR___ICDocumentMergeController_parent);
  swift_bridgeObjectRelease();
  sub_1AC8C5C14(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICDocumentMergeController_requestedMergeBlock));
}

@end
