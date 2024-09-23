@implementation FBKTopicCell

- (NSString)itemIdentifier
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_21DAC4810();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setItemIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_21DAC481C();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_itemIdentifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSLayoutConstraint)topicToBottomOfView
{
  return (NSLayoutConstraint *)(id)MEMORY[0x22079912C]((char *)self+ OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_topicToBottomOfView, a2);
}

- (void)setTopicToBottomOfView:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (FBKQuestionCellTextView)formDescriptions
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_formDescriptions;
  swift_beginAccess();
  return (FBKQuestionCellTextView *)(id)MEMORY[0x22079912C](v2);
}

- (void)setFormDescriptions:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (FBKBugFormLabel)formName
{
  return (FBKBugFormLabel *)(id)MEMORY[0x22079912C]((char *)self+ OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_formName, a2);
}

- (void)setFormName:(id)a3
{
  swift_unknownObjectWeakAssign();
}

+ (NSString)reuseIdentifier
{
  return (NSString *)(id)sub_21DAC4810();
}

- (FBKBugFormStub)formStub
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_formStub);
  swift_beginAccess();
  return (FBKBugFormStub *)*v2;
}

- (void)setFormStub:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _TtC12FeedbackCore12FBKTopicCell *v8;

  v5 = (void **)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_formStub);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_21DAA394C();
}

- (BOOL)disclosesMoreForms
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_disclosesMoreForms;
  swift_beginAccess();
  return *v2;
}

- (void)setDisclosesMoreForms:(BOOL)a3
{
  _TtC12FeedbackCore12FBKTopicCell *v4;

  v4 = self;
  sub_21DAA3C64(a3);

}

- (double)horizontalFrameInset
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_horizontalFrameInset);
  swift_beginAccess();
  return *v2;
}

- (void)setHorizontalFrameInset:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_horizontalFrameInset);
  swift_beginAccess();
  *v4 = a3;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBKTopicCell();
  -[FBKTopicCell frame](&v6, sel_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double *v8;
  double v9;
  double v10;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (double *)((char *)self + OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_horizontalFrameInset);
  swift_beginAccess();
  v9 = x + *v8;
  v10 = width - (*v8 + *v8);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FBKTopicCell();
  -[FBKTopicCell setFrame:](&v11, sel_setFrame_, v9, y, v10, height);
}

- (_TtC12FeedbackCore12FBKTopicCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_21DAC481C();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC12FeedbackCore12FBKTopicCell *)FBKTopicCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC12FeedbackCore12FBKTopicCell)initWithCoder:(id)a3
{
  return (_TtC12FeedbackCore12FBKTopicCell *)FBKTopicCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

}

@end
