@implementation CustomContentView

- (_TtC16HealthArticlesUI17CustomContentView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16HealthArticlesUI17CustomContentView_customView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthArticlesUI17CustomContentView_currentConstraints) = (Class)MEMORY[0x1E0DEE9D8];
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CustomContentView();
  return -[CustomContentView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC16HealthArticlesUI17CustomContentView)initWithCoder:(id)a3
{
  sub_1BC97A930((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16HealthArticlesUI17CustomContentView_customView, &OBJC_IVAR____TtC16HealthArticlesUI17CustomContentView_currentConstraints, MEMORY[0x1E0DEE9D8]);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthArticlesUI17CustomContentView_customView));
  swift_bridgeObjectRelease();
}

@end
