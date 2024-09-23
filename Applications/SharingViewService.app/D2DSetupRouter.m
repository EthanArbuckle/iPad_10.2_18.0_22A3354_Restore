@implementation D2DSetupRouter

- (_TtC18SharingViewService14D2DSetupRouter)init
{
  return (_TtC18SharingViewService14D2DSetupRouter *)sub_1000894CC();
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18SharingViewService14D2DSetupRouter_navigationController));
  sub_100012F60(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18SharingViewService14D2DSetupRouter_didDismiss), *(_QWORD *)&self->navigationController[OBJC_IVAR____TtC18SharingViewService14D2DSetupRouter_didDismiss]);
  sub_100012F60(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18SharingViewService14D2DSetupRouter_prepareForPresentation), *(_QWORD *)&self->navigationController[OBJC_IVAR____TtC18SharingViewService14D2DSetupRouter_prepareForPresentation]);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18SharingViewService14D2DSetupRouter_hostViewController, v3);
}

- (void)proxCardFlowDidDismiss
{
  uint64_t v2;
  _TtC18SharingViewService14D2DSetupRouter *v3;

  v3 = self;
  sub_10008963C((uint64_t)v3, v2);

}

@end
