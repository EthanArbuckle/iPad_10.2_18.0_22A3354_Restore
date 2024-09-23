@implementation IssueCoverViewButton

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[IssueCoverViewButton isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = v9.receiver;
  -[IssueCoverViewButton setHighlighted:](&v9, sel_setHighlighted_, v3);
  v5 = (void *)objc_opt_self();
  v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v8[4] = sub_1BB079020;
  v8[5] = v6;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = sub_1BA4F1DD8;
  v8[3] = &block_descriptor_10_0;
  v7 = _Block_copy(v8);
  swift_release();
  objc_msgSend(v5, sel_animateWithDuration_animations_, v7, 0.2);
  _Block_release(v7);

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
  v6.super_class = (Class)swift_getObjectType();
  -[IssueCoverViewButton frame](&v6, sel_frame);
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
  char *v7;
  void *v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v7 = (char *)v9.receiver;
  -[IssueCoverViewButton setFrame:](&v9, sel_setFrame_, x, y, width, height);
  v8 = *(void **)&v7[OBJC_IVAR____TtC8NewsFeed20IssueCoverViewButton_coverView];
  objc_msgSend(v7, sel_bounds, v9.receiver, v9.super_class);
  objc_msgSend(v8, sel_setFrame_);

}

- (_TtC8NewsFeed20IssueCoverViewButton)initWithCoder:(id)a3
{
  uint64_t v5;
  Class v6;
  id v7;
  id v8;
  _TtC8NewsFeed20IssueCoverViewButton *result;

  v5 = OBJC_IVAR____TtC8NewsFeed20IssueCoverViewButton_onTap;
  sub_1BA563554();
  v7 = objc_allocWithZone(v6);
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v7, sel_init);

  result = (_TtC8NewsFeed20IssueCoverViewButton *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (_TtC8NewsFeed20IssueCoverViewButton)initWithFrame:(CGRect)a3
{
  _TtC8NewsFeed20IssueCoverViewButton *result;

  result = (_TtC8NewsFeed20IssueCoverViewButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed20IssueCoverViewButton_onTap));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed20IssueCoverViewButton_coverView));
}

@end
