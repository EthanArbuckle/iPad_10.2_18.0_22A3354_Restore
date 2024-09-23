@implementation EntityTranslationGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  @objc EntityTranslationGestureRecognizer.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, EntityTranslationGestureRecognizer.touchesBegan(_:with:));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  @objc EntityTranslationGestureRecognizer.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, EntityTranslationGestureRecognizer.touchesEnded(_:with:));
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;
  _TtC10RealityKit34EntityTranslationGestureRecognizer *v6;

  v5 = a4;
  v6 = self;
  specialized EntityTranslationGestureRecognizer.touchesMoved(_:with:)();

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[EntityTranslationGestureRecognizer setState:](self, sel_setState_, 4, a4);
}

- (void)reset
{
  EntityTranslationGestureRecognizer.reset()();
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  UIGestureRecognizer *v4;
  _TtC10RealityKit34EntityTranslationGestureRecognizer *v5;

  v4 = (UIGestureRecognizer *)a3;
  v5 = self;
  LOBYTE(self) = EntityTranslationGestureRecognizer.canPrevent(_:)(v4);

  return self & 1;
}

- (_TtC10RealityKit34EntityTranslationGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _OWORD v6[2];

  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC10RealityKit34EntityTranslationGestureRecognizer *)EntityTranslationGestureRecognizer.init(target:action:)((uint64_t)v6, (uint64_t)a4);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
