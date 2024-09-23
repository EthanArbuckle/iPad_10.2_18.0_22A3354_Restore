@implementation DragFromPointGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  @objc DragFromPointGestureRecognizer.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))DragFromPointGestureRecognizer.touchesBegan(_:with:));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  @objc DragFromPointGestureRecognizer.touchesEnded(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_, MEMORY[0x24BEE78F0], "Ending drag gesture...");
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  @objc DragFromPointGestureRecognizer.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))DragFromPointGestureRecognizer.touchesMoved(_:with:));
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  @objc DragFromPointGestureRecognizer.touchesEnded(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_, MEMORY[0x24BEE7908], "Cancelling scale widget drag gesture...");
}

- (void)reset
{
  _TtC19_RealityKit_SwiftUIP33_4ABB148B5599ED86F84C6943D86F570D30DragFromPointGestureRecognizer *v2;

  v2 = self;
  DragFromPointGestureRecognizer.reset()();

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC19_RealityKit_SwiftUIP33_4ABB148B5599ED86F84C6943D86F570D30DragFromPointGestureRecognizer *v5;
  char v6;

  v4 = a3;
  v5 = self;
  DragFromPointGestureRecognizer.gestureRecognizerShouldBegin(_:)(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)onPanInternal:(id)a3
{
  double *v3;
  double v5;
  double v6;
  void (*v7)(double, double, double, double);
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _TtC19_RealityKit_SwiftUIP33_4ABB148B5599ED86F84C6943D86F570D30DragFromPointGestureRecognizer *v14;

  v3 = (double *)((char *)self
                + OBJC_IVAR____TtC19_RealityKit_SwiftUIP33_4ABB148B5599ED86F84C6943D86F570D30DragFromPointGestureRecognizer_startPoint);
  if ((*((_BYTE *)&self->super.super._gestureFlags
        + OBJC_IVAR____TtC19_RealityKit_SwiftUIP33_4ABB148B5599ED86F84C6943D86F570D30DragFromPointGestureRecognizer_startPoint
        + 8) & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v6 = *v3;
    v5 = v3[1];
    v7 = *(void (**)(double, double, double, double))((char *)&self->super.super.super.isa
                                                               + OBJC_IVAR____TtC19_RealityKit_SwiftUIP33_4ABB148B5599ED86F84C6943D86F570D30DragFromPointGestureRecognizer_onPan);
    v8 = a3;
    v14 = self;
    v9 = -[DragFromPointGestureRecognizer view](v14, sel_view);
    objc_msgSend(v8, sel_locationInView_, v9);
    v11 = v10;
    v13 = v12;

    v7(v6, v5, v11, v13);
  }
}

- (_TtC19_RealityKit_SwiftUIP33_775A7FE6C6FA1F309878473FBDD2537430DragFromPointGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _TtC19_RealityKit_SwiftUIP33_775A7FE6C6FA1F309878473FBDD2537430DragFromPointGestureRecognizer *result;

  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  result = (_TtC19_RealityKit_SwiftUIP33_775A7FE6C6FA1F309878473FBDD2537430DragFromPointGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  swift_release();
}

- (_TtC19_RealityKit_SwiftUIP33_4ABB148B5599ED86F84C6943D86F570D30DragFromPointGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _TtC19_RealityKit_SwiftUIP33_4ABB148B5599ED86F84C6943D86F570D30DragFromPointGestureRecognizer *result;

  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  result = (_TtC19_RealityKit_SwiftUIP33_4ABB148B5599ED86F84C6943D86F570D30DragFromPointGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
