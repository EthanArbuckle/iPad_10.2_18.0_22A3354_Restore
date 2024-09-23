@implementation DebugFormatCanvasViewController

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC8NewsFeed31DebugFormatCanvasViewController *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed31DebugFormatCanvasViewController_viewportMonitor);
  v5 = self;
  v6 = v4;
  sub_1BB870954();

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[DebugFormatCanvasViewController dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1BA8FD860((uint64_t)self + OBJC_IVAR____TtC8NewsFeed31DebugFormatCanvasViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatCanvasViewController_contentView));
  v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed31DebugFormatCanvasViewController_columnSystem;
  v4 = sub_1BB86D678();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatCanvasViewController____lazy_storage___columnView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatCanvasViewController_viewportMonitor));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatCanvasViewController_scrollView));
}

- (_TtC8NewsFeed31DebugFormatCanvasViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB40ED60();
}

- (void)viewDidLoad
{
  _TtC8NewsFeed31DebugFormatCanvasViewController *v2;

  v2 = self;
  sub_1BB40A908();

}

- (void)viewWillLayoutSubviews
{
  _TtC8NewsFeed31DebugFormatCanvasViewController *v2;

  v2 = self;
  sub_1BB40ACE4();

}

- (_TtC8NewsFeed31DebugFormatCanvasViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed31DebugFormatCanvasViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed31DebugFormatCanvasViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC8NewsFeed31DebugFormatCanvasViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BB87096C();

}

@end
