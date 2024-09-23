@implementation MFCardContainerController

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC16MagnifierSupport25MFCardContainerController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_22754547C(v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (void)handlePanGestureWithSender:(id)a3
{
  id v4;
  _TtC16MagnifierSupport25MFCardContainerController *v5;

  v4 = a3;
  v5 = self;
  sub_227545630(v4);

}

- (void)handleLongPress:(id)a3
{
  id v4;
  _TtC16MagnifierSupport25MFCardContainerController *v5;

  v4 = a3;
  v5 = self;
  sub_2275461A8(v4);

}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC16MagnifierSupport25MFCardContainerController *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_227546C80();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[MFCardContainerController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_containerView));
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_containerHeightConstraint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_containerTopConstraint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_draggingAnimator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_panGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_cardHeightConstraint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_xPositionConstraint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_yPositionConstraint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_cardDragAndDropAnimator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_collapsingMiddleAnimator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_fadingBottomAnimator));
}

- (_TtC16MagnifierSupport25MFCardContainerController)init
{
  _TtC16MagnifierSupport25MFCardContainerController *result;

  result = (_TtC16MagnifierSupport25MFCardContainerController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
