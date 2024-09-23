@implementation GradientView

+ (Class)layerClass
{
  sub_1AB5FDFFC((uint64_t)a1);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI12GradientView *v2;

  v2 = self;
  sub_1AB5FE030();

}

- (_TtC12GameCenterUI12GradientView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI12GradientView *)sub_1AB5FE2E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI12GradientView)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUI12GradientView *)sub_1AB5FE364((uint64_t)a3);
}

@end
