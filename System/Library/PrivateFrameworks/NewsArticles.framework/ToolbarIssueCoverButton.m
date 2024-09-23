@implementation ToolbarIssueCoverButton

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[ToolbarIssueCoverButton isHighlighted](&v3, sel_isHighlighted);
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
  -[ToolbarIssueCoverButton setHighlighted:](&v9, sel_setHighlighted_, v3);
  v5 = (void *)objc_opt_self();
  v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v8[4] = sub_1B9ED9EE8;
  v8[5] = v6;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = sub_1B9E526D4;
  v8[3] = &block_descriptor_9;
  v7 = _Block_copy(v8);
  swift_release();
  objc_msgSend(v5, sel_animateWithDuration_animations_, v7, 0.3);
  _Block_release(v7);

}

- (_TtC12NewsArticles23ToolbarIssueCoverButton)init
{
  return (_TtC12NewsArticles23ToolbarIssueCoverButton *)sub_1B9ED9A60();
}

- (_TtC12NewsArticles23ToolbarIssueCoverButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9ED9DAC();
}

- (_TtC12NewsArticles23ToolbarIssueCoverButton)initWithFrame:(CGRect)a3
{
  _TtC12NewsArticles23ToolbarIssueCoverButton *result;

  result = (_TtC12NewsArticles23ToolbarIssueCoverButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles23ToolbarIssueCoverButton_coverView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles23ToolbarIssueCoverButton_callToActionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles23ToolbarIssueCoverButton_coverDateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles23ToolbarIssueCoverButton_highlightView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles23ToolbarIssueCoverButton_highlightColor));
}

@end
