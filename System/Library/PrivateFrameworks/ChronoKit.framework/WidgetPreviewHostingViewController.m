@implementation WidgetPreviewHostingViewController

- (_TtC9ChronoKit34WidgetPreviewHostingViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC9ChronoKit34WidgetPreviewHostingViewController *result;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC9ChronoKit34WidgetPreviewHostingViewController_isLuminanceReduced) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9ChronoKit34WidgetPreviewHostingViewController_tintParameters) = 0;
  v4 = a3;

  result = (_TtC9ChronoKit34WidgetPreviewHostingViewController *)sub_1D26CE1D8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9ChronoKit34WidgetPreviewHostingViewController *v2;

  v2 = self;
  sub_1D25E37B8();

}

- (void)viewWillLayoutSubviews
{
  _TtC9ChronoKit34WidgetPreviewHostingViewController *v2;

  v2 = self;
  sub_1D25E392C();

}

- (CHSWidgetTintParameters)tintParameters
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC9ChronoKit34WidgetPreviewHostingViewController_tintParameters);
  swift_beginAccess();
  return (CHSWidgetTintParameters *)*v2;
}

- (void)setTintParameters:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _TtC9ChronoKit34WidgetPreviewHostingViewController *v8;

  v5 = (void **)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC9ChronoKit34WidgetPreviewHostingViewController_tintParameters);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_1D25E3B5C();
}

- (CHSInlineTextParameters)inlineTextParameters
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_inlineTextParameters);
  swift_beginAccess();
  return (CHSInlineTextParameters *)*v2;
}

- (void)setInlineTextParameters:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _TtC9ChronoKit34WidgetPreviewHostingViewController *v8;

  v5 = (void **)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_inlineTextParameters);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_1D25E3B5C();
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  swift_release();
  v3 = *(UIView **)((char *)&self->super.super.super._view
                  + OBJC_IVAR____TtC9ChronoKit34WidgetPreviewHostingViewController_autoupdatingPreviewView);
  v4 = *(UITabBarItem **)((char *)&self->super.super.super._tabBarItem
                        + OBJC_IVAR____TtC9ChronoKit34WidgetPreviewHostingViewController_autoupdatingPreviewView);
  swift_release();
  swift_release();

  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9ChronoKit34WidgetPreviewHostingViewController_tintParameters));
}

@end
