@implementation TappableArtworkView

- (void)didTap
{
  _TtC12GameCenterUI19TappableArtworkView *v2;

  v2 = self;
  sub_1AB4FF560();

}

- (_TtC12GameCenterUI19TappableArtworkView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI19TappableArtworkView *)sub_1AB4FF5E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI19TappableArtworkView_tapGestureRecognizer));
  OUTLINED_FUNCTION_0_62(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                                    + OBJC_IVAR____TtC12GameCenterUI19TappableArtworkView_tapHandler));
}

@end
