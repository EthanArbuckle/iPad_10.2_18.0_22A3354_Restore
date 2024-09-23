@implementation RoundEditProfileButton

- (_TtC12GameCenterUIP33_3CDA1BD77FD495B0F73399413CCB4C6E22RoundEditProfileButton)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUIP33_3CDA1BD77FD495B0F73399413CCB4C6E22RoundEditProfileButton *)sub_1AB4EB50C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUIP33_3CDA1BD77FD495B0F73399413CCB4C6E22RoundEditProfileButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB4EB820();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUIP33_3CDA1BD77FD495B0F73399413CCB4C6E22RoundEditProfileButton *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_1AB4EB9C4();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUIP33_3CDA1BD77FD495B0F73399413CCB4C6E22RoundEditProfileButton *v2;

  v2 = self;
  sub_1AB4EBA98();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUIP33_3CDA1BD77FD495B0F73399413CCB4C6E22RoundEditProfileButton *v6;

  v5 = a3;
  v6 = self;
  sub_1AB4EBCF4(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_3CDA1BD77FD495B0F73399413CCB4C6E22RoundEditProfileButton_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_3CDA1BD77FD495B0F73399413CCB4C6E22RoundEditProfileButton_pencilImageView));
}

@end
