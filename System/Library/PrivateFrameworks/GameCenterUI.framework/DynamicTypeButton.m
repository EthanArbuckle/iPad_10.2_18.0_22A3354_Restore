@implementation DynamicTypeButton

- (_TtC12GameCenterUI17DynamicTypeButton)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI17DynamicTypeButton *)sub_1AB7346E8();
}

- (_TtC12GameCenterUI17DynamicTypeButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB73489C();
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1AB73537C((uint64_t)self, (uint64_t)a2, (double (*)(double))sub_1AB734D6C);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1AB73537C((uint64_t)self, (uint64_t)a2, (double (*)(double))sub_1AB735118);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC12GameCenterUI17DynamicTypeButton *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1AB7353E0(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)tintColorDidChange
{
  _TtC12GameCenterUI17DynamicTypeButton *v2;

  v2 = self;
  sub_1AB7354A4();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI17DynamicTypeButton *v6;

  v5 = a3;
  v6 = self;
  sub_1AB735548((uint64_t)a3);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC12GameCenterUI17DynamicTypeButton *v8;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  LOBYTE(self) = sub_1AB73577C(x, y);

  return self & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17DynamicTypeButton_fontUseCaseContentSizeCategory));
  sub_1AB473FBC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI17DynamicTypeButton_fontUseCase, (uint64_t *)&unk_1EEC07AC0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI17DynamicTypeButton_imageSpacing);
}

@end
