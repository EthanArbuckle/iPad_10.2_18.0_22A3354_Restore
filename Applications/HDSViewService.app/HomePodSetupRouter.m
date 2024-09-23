@implementation HomePodSetupRouter

- (_TtC14HDSViewService18HomePodSetupRouter)init
{
  return (_TtC14HDSViewService18HomePodSetupRouter *)sub_100058610();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC14HDSViewService18HomePodSetupRouter_hostViewController);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14HDSViewService18HomePodSetupRouter_navigationController));
  sub_1000588E4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14HDSViewService18HomePodSetupRouter_didDismiss), *(_QWORD *)&self->hostViewController[OBJC_IVAR____TtC14HDSViewService18HomePodSetupRouter_didDismiss]);
  sub_1000588E4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14HDSViewService18HomePodSetupRouter_prepareForPresentation), *(_QWORD *)&self->hostViewController[OBJC_IVAR____TtC14HDSViewService18HomePodSetupRouter_prepareForPresentation]);
}

- (void)proxCardFlowDidDismiss
{
  uint64_t v2;
  _TtC14HDSViewService18HomePodSetupRouter *v3;

  v3 = self;
  sub_100058774((uint64_t)v3, v2);

}

@end
