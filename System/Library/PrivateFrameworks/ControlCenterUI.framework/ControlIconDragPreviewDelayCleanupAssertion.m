@implementation ControlIconDragPreviewDelayCleanupAssertion

- (void)dealloc
{
  _TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion *v3;
  objc_super v4;

  if (*((_BYTE *)&self->super.isa
       + OBJC_IVAR____TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion_isInvalidated) == 1)
  {
    v3 = self;
  }
  else
  {
    *((_BYTE *)&self->super.isa
    + OBJC_IVAR____TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion_isInvalidated) = 1;
    sub_1CFBB7C0C((uint64_t)self);
  }
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ControlIconDragPreviewDelayCleanupAssertion();
  -[ControlIconDragPreviewDelayCleanupAssertion dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion_dragPreview));
  swift_bridgeObjectRelease();
}

- (void)invalidate
{
  _TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion *v2;

  if ((*((_BYTE *)&self->super.isa
        + OBJC_IVAR____TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion_isInvalidated) & 1) == 0)
  {
    *((_BYTE *)&self->super.isa
    + OBJC_IVAR____TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion_isInvalidated) = 1;
    v2 = self;
    sub_1CFBB7C0C((uint64_t)v2);

  }
}

- (NSString)description
{
  _TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion *v2;
  void *v3;

  v2 = self;
  sub_1CFBB845C();

  v3 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)succinctDescription
{
  id v3;
  _TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion *v4;
  id result;
  id v6;
  id v7;
  void *v8;

  v3 = objc_allocWithZone(MEMORY[0x1E0D01748]);
  v4 = self;
  result = objc_msgSend(v3, sel_initWithObject_, v4);
  if (result)
  {
    v6 = result;
    v7 = objc_msgSend(result, sel_build);

    if (v7)
    {
      sub_1CFBFA894();

      v8 = (void *)sub_1CFBFA870();
      swift_bridgeObjectRelease();
      return v8;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

- (id)succinctDescriptionBuilder
{
  id v3;
  _TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion *v4;
  id result;
  id v6;

  v3 = objc_allocWithZone(MEMORY[0x1E0D01748]);
  v4 = self;
  result = objc_msgSend(v3, sel_initWithObject_, v4);
  if (result)
  {
    v6 = result;

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  _TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion *v4;
  void *v5;

  if (a3)
    sub_1CFBFA894();
  v4 = self;
  sub_1CFBB845C();

  swift_bridgeObjectRelease();
  v5 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  _TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion *v5;
  id result;
  id v7;
  void *v8;
  void *v9;

  if (a3)
    sub_1CFBFA894();
  v4 = objc_allocWithZone(MEMORY[0x1E0D01748]);
  v5 = self;
  result = objc_msgSend(v4, sel_initWithObject_, v5);
  if (result)
  {
    v7 = result;
    v8 = (void *)sub_1CFBFA870();
    v9 = (void *)sub_1CFBFA870();
    objc_msgSend(v7, sel_appendString_withName_, v8, v9);

    swift_bridgeObjectRelease();
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion)init
{
  _TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion *result;

  result = (_TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
