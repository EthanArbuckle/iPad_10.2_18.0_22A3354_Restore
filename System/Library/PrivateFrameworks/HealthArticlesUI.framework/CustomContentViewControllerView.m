@implementation CustomContentViewControllerView

- (_TtC16HealthArticlesUI31CustomContentViewControllerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16HealthArticlesUI31CustomContentViewControllerView *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthArticlesUI31CustomContentViewControllerView_customViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthArticlesUI31CustomContentViewControllerView_customView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CustomContentViewControllerView();
  v7 = -[CustomContentViewControllerView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  -[CustomContentViewControllerView setPreservesSuperviewLayoutMargins:](v7, sel_setPreservesSuperviewLayoutMargins_, 1);
  return v7;
}

- (_TtC16HealthArticlesUI31CustomContentViewControllerView)initWithCoder:(id)a3
{
  sub_1BC97A930((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16HealthArticlesUI31CustomContentViewControllerView_customViewController, &OBJC_IVAR____TtC16HealthArticlesUI31CustomContentViewControllerView_customView, 0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthArticlesUI31CustomContentViewControllerView_customViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthArticlesUI31CustomContentViewControllerView_customView));
}

@end
