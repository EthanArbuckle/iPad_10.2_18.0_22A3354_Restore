@implementation InsetLabel

- (void)drawTextInRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel *v11;
  objc_super v12;

  v4 = UIEdgeInsetsInsetRect(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *(double *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets), *(double *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for InsetLabel();
  v11 = self;
  -[InsetLabel drawTextInRect:](&v12, sel_drawTextInRect_, v4, v6, v8, v10);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  v3 = *(double *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets)
     + *(double *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets);
  v4 = a3.width - v3;
  v5 = *(double *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets)
     + *(double *)((char *)&self->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets);
  v6 = a3.height - v5;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for InsetLabel();
  -[InsetLabel sizeThatFits:](&v11, sel_sizeThatFits_, v4, v6);
  v8 = v3 + v7;
  v10 = v5 + v9;
  result.height = v10;
  result.width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  char *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for InsetLabel();
  v2 = (char *)v11.receiver;
  -[InsetLabel intrinsicContentSize](&v11, sel_intrinsicContentSize);
  v4 = v3;
  v5 = *(double *)&v2[OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets];
  v6 = *(double *)&v2[OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets + 16];
  v8 = v7
     + *(double *)&v2[OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets + 8]
     + *(double *)&v2[OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets + 24];

  v9 = v4 + v5 + v6;
  v10 = v8;
  result.height = v9;
  result.width = v10;
  return result;
}

- (_TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _OWORD *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (_OWORD *)((char *)self + OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets);
  *v7 = xmmword_20D637050;
  v7[1] = xmmword_20D637050;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for InsetLabel();
  return -[InsetLabel initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel)initWithCoder:(id)a3
{
  _OWORD *v4;
  objc_super v6;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets);
  *v4 = xmmword_20D637050;
  v4[1] = xmmword_20D637050;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InsetLabel();
  return -[InsetLabel initWithCoder:](&v6, sel_initWithCoder_, a3);
}

@end
