@implementation TipUIView

- (UIColor)backgroundColor
{
  _TtC6TipKit9TipUIView *v3;
  void *v4;
  void *v5;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = self;
  TipUIView.backgroundColor.getter();
  v5 = v4;
  swift_release();

  return (UIColor *)v5;
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  _TtC6TipKit9TipUIView *v6;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = a3;
  v6 = self;
  TipUIView.backgroundColor.setter();
  swift_release();

}

- (_TtC6TipKit9TipUIView)initWithCoder:(id)a3
{
  id v4;
  _TtC6TipKit9TipUIView *result;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = a3;
  TipUIView.init(coder:)();
  sub_23541E814();
  return result;
}

- (void)dealloc
{
  _TtC6TipKit9TipUIView *v2;

  v2 = self;
  TipUIView.__deallocating_deinit();
}

- (void).cxx_destruct
{

}

- (_TtC6TipKit9TipUIView)initWithFrame:(CGRect)a3
{
  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  TipUIView.init(frame:)();
}

@end
