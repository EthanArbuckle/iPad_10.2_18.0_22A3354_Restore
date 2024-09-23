@implementation PromptView

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC11Diagnostics10PromptView_titleLabel));
}

- (void)setTitleLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11Diagnostics10PromptView_titleLabel);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11Diagnostics10PromptView_titleLabel) = (Class)a3;
  v3 = a3;

}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC11Diagnostics10PromptView_subtitleLabel));
}

- (void)setSubtitleLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11Diagnostics10PromptView_subtitleLabel);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11Diagnostics10PromptView_subtitleLabel) = (Class)a3;
  v3 = a3;

}

- (UIStackView)infoVerticalStackView
{
  return (UIStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR____TtC11Diagnostics10PromptView_infoVerticalStackView));
}

- (void)setInfoVerticalStackView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics10PromptView_infoVerticalStackView);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11Diagnostics10PromptView_infoVerticalStackView) = (Class)a3;
  v3 = a3;

}

- (UIProgressView)infoProgressIndicatorView
{
  return (UIProgressView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                   + OBJC_IVAR____TtC11Diagnostics10PromptView_infoProgressIndicatorView));
}

- (UIActivityIndicatorView)infoActivityIndicatorView
{
  return (UIActivityIndicatorView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                            + OBJC_IVAR____TtC11Diagnostics10PromptView_infoActivityIndicatorView));
}

- (UIStackView)infoLabelHorizontalStackView
{
  return (UIStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR____TtC11Diagnostics10PromptView_infoLabelHorizontalStackView));
}

- (void)setInfoLabelHorizontalStackView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics10PromptView_infoLabelHorizontalStackView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11Diagnostics10PromptView_infoLabelHorizontalStackView) = (Class)a3;
  v3 = a3;

}

- (UILabel)infoLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC11Diagnostics10PromptView_infoLabel));
}

- (void)setInfoLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11Diagnostics10PromptView_infoLabel);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11Diagnostics10PromptView_infoLabel) = (Class)a3;
  v3 = a3;

}

- (UIStackView)buttonStackView
{
  return (UIStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR____TtC11Diagnostics10PromptView_buttonStackView));
}

- (_TtC11Diagnostics10PromptView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100078ED4();
}

- (_TtC11Diagnostics10PromptView)initWithFrame:(CGRect)a3
{
  _TtC11Diagnostics10PromptView *result;

  result = (_TtC11Diagnostics10PromptView *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.PromptView", 22, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  SEL v3;
  id v4;
  int v5;
  id v6;
  id v7;
  id v8;
  id v9;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics10PromptView_promptStackView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics10PromptView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics10PromptView_infoVerticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics10PromptView_infoProgressIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics10PromptView_infoActivityIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics10PromptView_infoLabelHorizontalStackView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics10PromptView_buttonStackView));
  sub_100035D74(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics10PromptView_containerLayoutUpdateHandler), *(_QWORD *)&self->promptStackView[OBJC_IVAR____TtC11Diagnostics10PromptView_containerLayoutUpdateHandler]);
  swift_bridgeObjectRelease(*(DARootViewController **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics10PromptView_actions), v3, v4, v5, v6, v7, v8, v9);
}

@end
