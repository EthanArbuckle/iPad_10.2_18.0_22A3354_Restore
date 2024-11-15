@implementation PKLongPressGestureRecognizer

- (PKLongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
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
  return (PKLongPressGestureRecognizer *)PKLongPressGestureRecognizer.init(target:action:)((uint64_t)v6, (uint64_t)a4);
}

- (void)reset
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PKLongPressGestureRecognizer_pressStartLocations) = (Class)MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRelease();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  @objc PKLongPressGestureRecognizer.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, specialized PKLongPressGestureRecognizer.touchesBegan(_:with:));
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  @objc PKLongPressGestureRecognizer.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, specialized PKLongPressGestureRecognizer.touchesMoved(_:with:));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  uint64_t v6;
  PKLongPressGestureRecognizer *v7;

  v5 = a4;
  v7 = self;
  if (-[PKLongPressGestureRecognizer state](v7, sel_state) == (id)2)
    v6 = 3;
  else
    v6 = 5;
  -[PKLongPressGestureRecognizer setState:](v7, sel_setState_, v6);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  uint64_t v6;
  PKLongPressGestureRecognizer *v7;

  v5 = a4;
  v7 = self;
  if (-[PKLongPressGestureRecognizer state](v7, sel_state) == (id)2)
    v6 = 4;
  else
    v6 = 5;
  -[PKLongPressGestureRecognizer setState:](v7, sel_setState_, v6);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
