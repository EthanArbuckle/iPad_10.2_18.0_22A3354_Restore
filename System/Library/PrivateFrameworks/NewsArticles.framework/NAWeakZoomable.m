@implementation NAWeakZoomable

- (NAWeakZoomable)initWithZoomable:(id)a3
{
  uint64_t v4;
  NAWeakZoomable *v5;

  swift_getObjectType();
  v4 = swift_unknownObjectRetain();
  v5 = (NAWeakZoomable *)sub_1B9FF923C(v4, self);
  swift_unknownObjectRelease();
  return v5;
}

- (NAWeakZoomable)init
{
  NAWeakZoomable *result;

  result = (NAWeakZoomable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B9E30DEC((uint64_t)self + OBJC_IVAR___NAWeakZoomable_zoomable);
}

- (BOOL)canIncreaseTextSize
{
  return sub_1B9FF90A4((char *)self, (uint64_t)a2, (SEL *)&selRef_canIncreaseTextSize);
}

- (BOOL)canDecreaseTextSize
{
  return sub_1B9FF90A4((char *)self, (uint64_t)a2, (SEL *)&selRef_canDecreaseTextSize);
}

- (BOOL)canZoomIn
{
  return sub_1B9FF90A4((char *)self, (uint64_t)a2, (SEL *)&selRef_canZoomIn);
}

- (BOOL)canZoomOut
{
  return sub_1B9FF90A4((char *)self, (uint64_t)a2, (SEL *)&selRef_canZoomOut);
}

- (BOOL)canResetZoom
{
  return sub_1B9FF90A4((char *)self, (uint64_t)a2, (SEL *)&selRef_canResetZoom);
}

- (void)increaseTextSize
{
  sub_1B9FF91D0((char *)self, (uint64_t)a2, (SEL *)&selRef_increaseTextSize);
}

- (void)decreaseTextSize
{
  sub_1B9FF91D0((char *)self, (uint64_t)a2, (SEL *)&selRef_decreaseTextSize);
}

- (void)zoomIn
{
  sub_1B9FF91D0((char *)self, (uint64_t)a2, (SEL *)&selRef_zoomIn);
}

- (void)zoomOut
{
  sub_1B9FF91D0((char *)self, (uint64_t)a2, (SEL *)&selRef_zoomOut);
}

- (void)resetZoom
{
  sub_1B9FF91D0((char *)self, (uint64_t)a2, (SEL *)&selRef_resetZoom);
}

@end
