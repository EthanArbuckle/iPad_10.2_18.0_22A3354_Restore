@implementation TipUICollectionViewCell

- (UIColor)backgroundColor
{
  _TtC6TipKit23TipUICollectionViewCell *v3;
  void *v4;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = self;
  v4 = (void *)TipUICollectionViewCell.backgroundColor.getter();
  swift_release();

  return (UIColor *)v4;
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  _TtC6TipKit23TipUICollectionViewCell *v6;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = a3;
  v6 = self;
  TipUICollectionViewCell.backgroundColor.setter(a3);
  swift_release();

}

- (_TtC6TipKit23TipUICollectionViewCell)initWithFrame:(CGRect)a3
{
  _TtC6TipKit23TipUICollectionViewCell *v3;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = (_TtC6TipKit23TipUICollectionViewCell *)TipUICollectionViewCell.init(frame:)();
  swift_release();
  return v3;
}

- (_TtC6TipKit23TipUICollectionViewCell)initWithCoder:(id)a3
{
  _TtC6TipKit23TipUICollectionViewCell *v4;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = (_TtC6TipKit23TipUICollectionViewCell *)TipUICollectionViewCell.init(coder:)(a3);
  swift_release();
  return v4;
}

- (void).cxx_destruct
{
  sub_2353E4BCC((uint64_t)self + OBJC_IVAR____TtC6TipKit23TipUICollectionViewCell_tipView, &qword_254288E50);
}

@end
