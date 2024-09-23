@implementation ARView

- (void)didMoveToWindow
{
  _TtC10RealityKit6ARView *v2;

  v2 = self;
  ARView.didMoveToWindow()();

}

- (void)windowWillRotateWithNotification:(id)a3
{
  id v4;
  _TtC10RealityKit6ARView *v5;

  v4 = a3;
  v5 = self;
  ARView.windowWillRotate(notification:)((NSNotification)v4);

}

- (void)windowWillAnimateRotationWithNotification:(id)a3
{
  id v4;
  _TtC10RealityKit6ARView *v5;

  v4 = a3;
  v5 = self;
  specialized ARView.windowWillAnimateRotation(notification:)();

}

- (void)windowDidRotateWithNotification:(id)a3
{
  _BYTE *v4;

  v4 = (char *)self + OBJC_IVAR____TtC10RealityKit6ARView___disableCounterRotation;
  swift_beginAccess();
  if ((*v4 & 1) == 0
    && (*((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC10RealityKit6ARView_viewCounterRotating) & 1) != 0)
  {
    *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC10RealityKit6ARView_viewCounterRotating) = 0;
    *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC10RealityKit6ARView_updateAfterCounterRotation) = 1;
  }
}

- (_TtC10RealityKit6ARView)initWithCoder:(id)a3
{
  return (_TtC10RealityKit6ARView *)ARView.init(coder:)(a3);
}

- (_TtC10RealityKit6ARView)initWithFrame:(CGRect)a3
{
  return (_TtC10RealityKit6ARView *)ARView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  _TtC10RealityKit6ARView *v2;

  v2 = self;
  ARView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  swift_release();
  swift_release();
  outlined destroy of weak __ARViewDelegatePrivate?((uint64_t)self + OBJC_IVAR____TtC10RealityKit6ARView___delegatePrivate);
  outlined consume of ARView.Environment.Background.Value(*(void **)((char *)&self->super.super.__layeringSceneIdentity + OBJC_IVAR____TtC10RealityKit6ARView_environment), *((_BYTE *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC10RealityKit6ARView_environment));
  swift_release();
  swift_release();

  swift_release();
  outlined destroy of CheckedContinuation<related decl 'e' for ARErrorCode?, Never>?((uint64_t)self + OBJC_IVAR____TtC10RealityKit6ARView_updateSubscription, &demangling cache variable for type metadata for Cancellable?);
  outlined destroy of CheckedContinuation<related decl 'e' for ARErrorCode?, Never>?((uint64_t)self + OBJC_IVAR____TtC10RealityKit6ARView_renderSubscription, &demangling cache variable for type metadata for Cancellable?);
  swift_release();

  v3 = *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC10RealityKit6ARView_sessionComponents);
  v4 = *(uint64_t *)((char *)&self->super._swiftAnimationInfo + OBJC_IVAR____TtC10RealityKit6ARView_sessionComponents);
  v5 = *(uint64_t *)((char *)&self->super._layerRetained + OBJC_IVAR____TtC10RealityKit6ARView_sessionComponents);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  outlined consume of (@escaping @callee_guaranteed (@guaranteed Set<ARReferenceImage>) -> ())?(v4);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Set<ARReferenceImage>) -> ())?(v5);
  v6 = (char *)self + OBJC_IVAR____TtC10RealityKit6ARView_antialiasingMode;
  v7 = type metadata accessor for AntialiasingMode();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

- (NSArray)entityAccessibilityWrappers
{
  _TtC10RealityKit6ARView *v2;
  Class isa;

  v2 = self;
  ARView.entityAccessibilityWrappers.getter();

  type metadata accessor for __EntityAccessibilityWrapper();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (float)distanceInMetersFromEntityAccessibilityWrapper:(id)a3
{
  id v5;
  _TtC10RealityKit6ARView *v6;
  float v7;
  float v8;

  if (!swift_weakLoadStrong())
    return 0.0;
  v5 = a3;
  v6 = self;
  ARView.__distanceInMetersFromEntity(_:)();
  v8 = v7;

  swift_release();
  return v8;
}

- (BOOL)handleTapForEntityAccessibilityWrapper:(id)a3
{
  id v5;
  _TtC10RealityKit6ARView *v6;
  uint64_t v7;
  char v8;
  char v9;

  if (swift_weakLoadStrong())
  {
    v5 = a3;
    v6 = self;
    v7 = swift_retain();
    ARView.handleTapForEntity(_:shouldNotifyDelegateAlways:)(v7, 0);
    v9 = v8;

    swift_release_n();
  }
  else
  {
    v9 = 0;
  }
  return v9 & 1;
}

+ (Class)layerClass
{
  type metadata accessor for ARReferenceObject(0, (unint64_t *)&lazy cache variable for type metadata for CALayer);
  return (Class)swift_getObjCClassFromMetadata();
}

- (CALayer)renderLayer
{
  return (CALayer *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10RealityKit6ARView_renderView), sel_layer);
}

- (double)contentScaleFactor
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ARView();
  -[ARView contentScaleFactor](&v3, sel_contentScaleFactor);
  return result;
}

- (void)setContentScaleFactor:(double)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ARView();
  v4 = v10.receiver;
  -[ARView setContentScaleFactor:](&v10, sel_setContentScaleFactor_, a3);
  if (*((_BYTE *)v4 + OBJC_IVAR____TtC10RealityKit6ARView_initialized) == 1)
  {
    objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
    v6 = v5;
    v8 = v7;
    objc_msgSend(v4, sel_contentScaleFactor);
    ARView.resizeDrawable(size:scaleFactor:)(v6, v8, v9);
  }

}

- (void)willResignActiveWithNotification:(id)a3
{
  id v4;
  _TtC10RealityKit6ARView *v5;

  v4 = a3;
  v5 = self;
  specialized ARView.willResignActive(notification:)();

}

- (void)restartEngineWithNotification:(id)a3
{
  id v4;
  _TtC10RealityKit6ARView *v5;

  v4 = a3;
  v5 = self;
  specialized ARView.restartEngine(notification:)();

}

- (void)didMoveToSuperview
{
  _TtC10RealityKit6ARView *v2;

  v2 = self;
  ARView.didMoveToSuperview()();

}

- (void)layoutSubviews
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ARView();
  v2 = v8.receiver;
  -[ARView layoutSubviews](&v8, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v8.receiver, v8.super_class);
  v4 = v3;
  v6 = v5;
  objc_msgSend(v2, sel_contentScaleFactor);
  ARView.resizeDrawable(size:scaleFactor:)(v4, v6, v7);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  @objc ARView.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))ARView.touchesBegan(_:with:));
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  @objc ARView.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))ARView.touchesMoved(_:with:));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  @objc ARView.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))ARView.touchesEnded(_:with:));
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  @objc ARView.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))ARView.touchesCancelled(_:with:));
}

- (void)handleSingleTapWithRecognizer:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  _TtC10RealityKit6ARView *v7;

  v4 = a3;
  v7 = self;
  objc_msgSend(v4, sel_locationInView_, v7);
  ARView.handleTapAtPoint(point:)((CGPoint)__PAIR128__(v6, v5));

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC10RealityKit6ARView *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = specialized ARView.gestureRecognizer(_:shouldRecognizeSimultaneouslyWith:)(v6, v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UIGestureRecognizer *v6;
  id v7;
  _TtC10RealityKit6ARView *v8;
  Swift::Bool v9;

  v6 = (UIGestureRecognizer *)a3;
  v7 = a4;
  v8 = self;
  v9 = ARView.gestureRecognizer(_:shouldReceive:)(v6, (UITouch)v7);

  return v9;
}

- (ARSession)session
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10RealityKit6ARView_arSystem);
  if (v2)
    return (ARSession *)*(id *)(v2 + OBJC_IVAR____TtC10RealityKit10RKARSystem_session);
  __break(1u);
  return self;
}

- (void)setSession:(id)a3
{
  id v4;
  _TtC10RealityKit6ARView *v5;

  v4 = a3;
  v5 = self;
  ARView.session.setter(v4);

}

- (void)handleTranslation:(id)a3
{
  id v4;
  _TtC10RealityKit6ARView *v5;

  v4 = a3;
  v5 = self;
  specialized ARView.handleTranslation(_:)(v4);

}

- (void)handleRotation:(id)a3
{
  id v4;
  _TtC10RealityKit6ARView *v5;

  v4 = a3;
  v5 = self;
  specialized ARView.handleRotation(_:)(v4);

}

- (void)handleScale:(id)a3
{
  id v4;
  _TtC10RealityKit6ARView *v5;

  v4 = a3;
  v5 = self;
  specialized ARView.handleScale(_:)(v4);

}

@end
