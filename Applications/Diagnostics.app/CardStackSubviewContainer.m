@implementation CardStackSubviewContainer

- (UIView)containedView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedView));
}

- (void)setContainedView:(id)a3
{
  void *v4;
  _TtC11Diagnostics25CardStackSubviewContainer *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedView) = (Class)a3;
  v6 = a3;
  v5 = self;
  sub_1000D26B0(v4);
  sub_1000D2A94();

}

- (_TtC11Diagnostics25CardStackSubviewContainer)initWithFrame:(CGRect)a3
{
  return (_TtC11Diagnostics25CardStackSubviewContainer *)sub_1000D2EDC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11Diagnostics25CardStackSubviewContainer)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics25CardStackSubviewContainer *)sub_1000D2FB8(a3);
}

- (void).cxx_destruct
{
  sub_100035D74(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedViewRemovedCompletion), *(_QWORD *)&self->animated[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedViewRemovedCompletion]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_topContainerConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_bottomContainerConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_leadingContainerConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_trailingContainerConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedView));
}

@end
