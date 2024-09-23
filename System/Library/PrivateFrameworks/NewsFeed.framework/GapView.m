@implementation GapView

- (_TtC8NewsFeed7GapView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  id v10;
  _TtC8NewsFeed7GapView *v11;
  _TtC8NewsFeed7GapView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = OBJC_IVAR____TtC8NewsFeed7GapView_activityIndicatorView;
  v10 = objc_allocWithZone(MEMORY[0x1E0DC3438]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_initWithActivityIndicatorStyle_, 100);

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[GapView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  -[GapView addSubview:](v12, sel_addSubview_, *(Class *)((char *)&v12->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed7GapView_activityIndicatorView));
  return v12;
}

- (_TtC8NewsFeed7GapView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8NewsFeed7GapView *result;

  v5 = OBJC_IVAR____TtC8NewsFeed7GapView_activityIndicatorView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3438]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithActivityIndicatorStyle_, 100);

  result = (_TtC8NewsFeed7GapView *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
