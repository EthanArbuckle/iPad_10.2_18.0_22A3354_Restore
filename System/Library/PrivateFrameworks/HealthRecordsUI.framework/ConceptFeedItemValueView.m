@implementation ConceptFeedItemValueView

- (_TtC15HealthRecordsUI24ConceptFeedItemValueView)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI24ConceptFeedItemValueView *)ConceptFeedItemValueView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI24ConceptFeedItemValueView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC4498D8();
}

- (void)didMoveToSuperview
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ConceptFeedItemValueView();
  v2 = v3.receiver;
  -[ConceptFeedItemValueView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  sub_1BC449148();

}

- (void)traitCollectionDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  _TtC15HealthRecordsUI24ConceptFeedItemValueView *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  sub_1BC44999C(a4);
  swift_unknownObjectRelease();

}

- (void).cxx_destruct
{
  sub_1BC3EDFF4(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemValueView_viewData), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemValueView_viewData), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemValueView_viewData), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemValueView_viewData), *(void **)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemValueView_viewData), *(void **)((char *)&self->super._animationInfo + OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemValueView_viewData), *(void **)((char *)&self->super._swiftAnimationInfo+ OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemValueView_viewData));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemValueView____lazy_storage___textualValueView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemValueView____lazy_storage___referenceRangeView));
}

@end
