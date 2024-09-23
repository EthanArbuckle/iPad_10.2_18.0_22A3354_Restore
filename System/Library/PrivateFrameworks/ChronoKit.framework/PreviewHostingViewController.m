@implementation PreviewHostingViewController

- (CHSInlineTextParameters)inlineTextParameters
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_inlineTextParameters);
  swift_beginAccess();
  return (CHSInlineTextParameters *)*v2;
}

- (void)setInlineTextParameters:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_inlineTextParameters);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtC9ChronoKit28PreviewHostingViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC9ChronoKit28PreviewHostingViewController *result;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_requiresStrictViewFraming) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_inlineTextParameters) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_vibrancyColor) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_metricsDefineSize) = 1;
  v4 = a3;

  result = (_TtC9ChronoKit28PreviewHostingViewController *)sub_1D26CE1D8();
  __break(1u);
  return result;
}

- (BOOL)metricsDefineSize
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_metricsDefineSize;
  swift_beginAccess();
  return *v2;
}

- (void)setMetricsDefineSize:(BOOL)a3
{
  BOOL *v5;
  _TtC9ChronoKit28PreviewHostingViewController *v6;

  v5 = (BOOL *)self + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_metricsDefineSize;
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  sub_1D2587DC4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_inlineTextParameters));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController__vibrancyView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_vibrancyColor));
}

@end
