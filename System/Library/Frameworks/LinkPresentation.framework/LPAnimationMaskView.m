@implementation LPAnimationMaskView

- (UIView)imageView
{
  _TtC16LinkPresentation19LPAnimationMaskView *v3;
  id v4;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = self;
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = objc_retain(*(id *)((char *)&v3->super.super.super.isa
                         + OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_imageView));
  swift_release();

  swift_release();
  return (UIView *)v4;
}

- (int64_t)animationOrigin
{
  _TtC16LinkPresentation19LPAnimationMaskView *v3;
  int64_t *v4;
  int64_t v5;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = self;
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = (int64_t *)((char *)v3 + OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_animationOrigin);
  swift_beginAccess();
  v5 = *v4;
  swift_release();

  swift_release();
  return v5;
}

- (void)setAnimationOrigin:(int64_t)a3
{
  _TtC16LinkPresentation19LPAnimationMaskView *v5;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = self;
  sub_1A0D20148(a3);
  swift_release();

}

- (UIImage)image
{
  _TtC16LinkPresentation19LPAnimationMaskView *v3;
  id *v4;
  id v5;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = self;
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = (id *)((char *)&v3->super.super.super.isa + OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_image);
  swift_beginAccess();
  v5 = *v4;
  swift_release();

  swift_release();
  return (UIImage *)v5;
}

- (void)setImage:(id)a3
{
  id v5;
  _TtC16LinkPresentation19LPAnimationMaskView *v6;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = a3;
  v6 = self;
  sub_1A0D20654(a3);
  swift_release();

}

- (_TtC16LinkPresentation19LPAnimationMaskView)init
{
  return (_TtC16LinkPresentation19LPAnimationMaskView *)LPAnimationMaskView.init()();
}

- (_TtC16LinkPresentation19LPAnimationMaskView)initWithCoder:(id)a3
{
  id v4;
  _TtC16LinkPresentation19LPAnimationMaskView *v5;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = a3;
  v5 = (_TtC16LinkPresentation19LPAnimationMaskView *)sub_1A0D20FF0();
  swift_release();
  return v5;
}

- (void)layoutSubviews
{
  _TtC16LinkPresentation19LPAnimationMaskView *v3;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = self;
  sub_1A0D20BB8();
  swift_release();

}

- (_TtC16LinkPresentation19LPAnimationMaskView)initWithFrame:(CGRect)a3
{
  _TtC16LinkPresentation19LPAnimationMaskView *result;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  result = (_TtC16LinkPresentation19LPAnimationMaskView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_image));
}

@end
