@implementation HRExpandedRangeValueView

- (HRExpandedRangeValueView)initWithFrame:(CGRect)a3
{
  return (HRExpandedRangeValueView *)_s15HealthRecordsUI22ExpandedRangeValueViewC5frameACSo6CGRectV_tcfc_0();
}

- (void)updateWithData:(id)a3
{
  id v5;
  HRExpandedRangeValueView *v6;

  v5 = a3;
  v6 = self;
  sub_1BC40064C(a3);

}

- (HRExpandedRangeValueView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC401380();
}

- (void)didMoveToSuperview
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ExpandedRangeValueView();
  v2 = v3.receiver;
  -[HRExpandedRangeValueView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  sub_1BC400E3C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRExpandedRangeValueView____lazy_storage___valueLabel));

  sub_1BC3EDFF4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___HRExpandedRangeValueView_viewData), *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR___HRExpandedRangeValueView_viewData), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity + OBJC_IVAR___HRExpandedRangeValueView_viewData), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR___HRExpandedRangeValueView_viewData), *(void **)((char *)&self->super._cachedTraitCollection + OBJC_IVAR___HRExpandedRangeValueView_viewData), *(void **)((char *)&self->super._animationInfo + OBJC_IVAR___HRExpandedRangeValueView_viewData), *(void **)((char *)&self->super._swiftAnimationInfo + OBJC_IVAR___HRExpandedRangeValueView_viewData));
  swift_bridgeObjectRelease();
}

@end
