@implementation TipUICollectionReusableView

- (UIColor)backgroundColor
{
  _TtC6TipKit27TipUICollectionReusableView *v3;
  void *v4;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = self;
  v4 = (void *)TipUICollectionReusableView.backgroundColor.getter();
  swift_release();

  return (UIColor *)v4;
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  _TtC6TipKit27TipUICollectionReusableView *v6;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = a3;
  v6 = self;
  TipUICollectionReusableView.backgroundColor.setter();
  swift_release();

}

- (void)dealloc
{
  _TtC6TipKit27TipUICollectionReusableView *v2;

  v2 = self;
  TipUICollectionReusableView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6TipKit27TipUICollectionReusableView_hostingView));
}

- (_TtC6TipKit27TipUICollectionReusableView)initWithFrame:(CGRect)a3
{
  _TtC6TipKit27TipUICollectionReusableView *v3;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = (_TtC6TipKit27TipUICollectionReusableView *)TipUICollectionReusableView.init(frame:)();
  swift_release();
  return v3;
}

- (_TtC6TipKit27TipUICollectionReusableView)initWithCoder:(id)a3
{
  _TtC6TipKit27TipUICollectionReusableView *v4;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = (_TtC6TipKit27TipUICollectionReusableView *)TipUICollectionReusableView.init(coder:)(a3);
  swift_release();
  return v4;
}

@end
