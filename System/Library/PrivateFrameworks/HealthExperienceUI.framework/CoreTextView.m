@implementation CoreTextView

- (_TtC18HealthExperienceUI12CoreTextView)init
{
  id v2;
  _TtC18HealthExperienceUI12CoreTextView *v3;
  _TtC18HealthExperienceUI12CoreTextView *v4;

  v2 = objc_allocWithZone((Class)type metadata accessor for CoreTextView());
  CoreTextView.init(frame:columns:)(1, 0, 0.0, 0.0, 0.0, 0.0);
  v4 = v3;
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

- (_TtC18HealthExperienceUI12CoreTextView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A98583FC();
}

- (void)drawRect:(CGRect)a3
{
  _TtC18HealthExperienceUI12CoreTextView *v3;

  v3 = self;
  sub_1A985862C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC18HealthExperienceUI12CoreTextView *v5;
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
  sub_1A98576A4(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)onLinkTap:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI12CoreTextView *v5;

  v4 = a3;
  v5 = self;
  sub_1A98578DC(v4);

}

- (_TtC18HealthExperienceUI12CoreTextView)initWithFrame:(CGRect)a3
{
  _TtC18HealthExperienceUI12CoreTextView *result;

  result = (_TtC18HealthExperienceUI12CoreTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A961AEDC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView_attributedText));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView_linkColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView____lazy_storage___tapRecognizer));
  sub_1A9859370(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView_lastTypesettingResult), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView_lastTypesettingResult), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView_lastTypesettingResult), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView_lastTypesettingResult), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView_lastTypesettingResult), *(uint64_t *)((char *)&self->super._animationInfo+ OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView_lastTypesettingResult));
}

@end
