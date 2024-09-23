@implementation FBKAddAttachmentsCell

+ (BOOL)supportsMenu
{
  return 0;
}

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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_itemIdentifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (UIMenu)menu
{
  UIMenu *result;

  result = *(UIMenu **)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_button);
  if (result)
    return (UIMenu *)-[UIMenu menu](result, sel_menu);
  __break(1u);
  return result;
}

- (void)setMenu:(id)a3
{
  void *v3;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_button);
  if (v3)
    objc_msgSend(v3, sel_setMenu_, a3);
  else
    __break(1u);
}

- (double)horizontalFrameInset
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_horizontalFrameInset);
  swift_beginAccess();
  return *v2;
}

- (void)setHorizontalFrameInset:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_horizontalFrameInset);
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
  v6.super_class = (Class)type metadata accessor for FBKAddAttachmentsCell();
  -[FBKAddAttachmentsCell frame](&v6, sel_frame);
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
  v8 = (double *)((char *)self + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_horizontalFrameInset);
  swift_beginAccess();
  v9 = x + *v8;
  v10 = width - (*v8 + *v8);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FBKAddAttachmentsCell();
  -[FBKAddAttachmentsCell setFrame:](&v11, sel_setFrame_, v9, y, v10, height);
}

- (_TtC12FeedbackCore21FBKAddAttachmentsCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  objc_super v6;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_itemIdentifier);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_button) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_horizontalFrameInset) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBKAddAttachmentsCell();
  return -[FBKAddAttachmentsCell initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (_TtC12FeedbackCore21FBKAddAttachmentsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC12FeedbackCore21FBKAddAttachmentsCell *)sub_21DA92F18(a3, (uint64_t)a4, v6);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_button));
}

@end
