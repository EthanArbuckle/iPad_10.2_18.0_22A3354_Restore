@implementation InsetRoundableImageView

- (UIColor)tintColor
{
  return (UIColor *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView_imageView), sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView_imageView), sel_setTintColor_, a3);
}

- (int64_t)contentMode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InsetRoundableImageView();
  return -[InsetRoundableImageView contentMode](&v3, sel_contentMode);
}

- (void)setContentMode:(int64_t)a3
{
  char *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InsetRoundableImageView();
  v4 = (char *)v6.receiver;
  -[InsetRoundableImageView setContentMode:](&v6, sel_setContentMode_, a3);
  v5 = *(id *)&v4[OBJC_IVAR____TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView_imageView];
  objc_msgSend(v5, sel_setContentMode_, objc_msgSend(v4, sel_contentMode, v6.receiver, v6.super_class));

}

- (_TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView *)sub_1A99FF8B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView *result;

  v5 = OBJC_IVAR____TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView_imageView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3890]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView_shouldRound) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView_drawsBackground) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView_inset) = 0;

  result = (_TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView *v2;

  v2 = self;
  sub_1A99FFA84();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  _TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView_imageView);
  v6 = self;
  objc_msgSend(v5, sel_sizeThatFits_, width, height);
  v8 = v7;
  v10 = v9;
  v11 = *(double *)((char *)&v6->super.super.super.isa
                  + OBJC_IVAR____TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView_inset);

  v12 = v8 + v11 + v11;
  v13 = v10 + v11 + v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView_imageView));
}

@end
