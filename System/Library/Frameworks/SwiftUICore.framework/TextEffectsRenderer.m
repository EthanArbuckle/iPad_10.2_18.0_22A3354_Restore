@implementation TextEffectsRenderer

- (NSCustomTextRenderingDelegate)delegate
{
  return (NSCustomTextRenderingDelegate *)(id)MEMORY[0x23B7C9E44]((char *)self+ OBJC_IVAR____TtC7SwiftUI19TextEffectsRenderer_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (double)contentsScale
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI19TextEffectsRenderer_contentsScale);
}

- (void)setContentsScale:(double)a3
{
  double v3;
  _TtC7SwiftUI19TextEffectsRenderer *v4;

  v3 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI19TextEffectsRenderer_contentsScale);
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI19TextEffectsRenderer_contentsScale) = a3;
  v4 = self;
  TextEffectsRenderer.contentsScale.didset(v3);

}

- (_TtC7SwiftUI19TextEffectsRenderer)init
{
  return (_TtC7SwiftUI19TextEffectsRenderer *)TextEffectsRenderer.init()();
}

- (void).cxx_destruct
{
  outlined destroy of weak GestureGraphDelegate?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI19TextEffectsRenderer_delegate);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)preLayoutNotify
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI19TextEffectsRenderer_notifyFlags) = 1;
}

- (void)postLayoutNotify
{
  _TtC7SwiftUI19TextEffectsRenderer *v2;

  v2 = self;
  TextEffectsRenderer.postLayoutNotify()();

}

- (void)beginLayout
{
  _QWORD *v2;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI19TextEffectsRenderer_updatedFragments);
  swift_beginAccess();
  *v2 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
}

- (void)didLayoutFragment:(id)a3
{
  _QWORD *v5;
  id v6;
  _TtC7SwiftUI19TextEffectsRenderer *v7;

  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI19TextEffectsRenderer_updatedFragments);
  swift_beginAccess();
  v6 = a3;
  v7 = self;
  MEMORY[0x23B7C61A8]();
  if (*(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();

}

- (void)endLayoutWithConsumer:(id)a3
{
  void *v4;
  _TtC7SwiftUI19TextEffectsRenderer *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  specialized TextEffectsRenderer.endLayout(with:)((int64_t)v5, v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)setNeedsDisplay
{
  _TtC7SwiftUI19TextEffectsRenderer *v2;

  v2 = self;
  TextEffectsRenderer.setNeedsDisplay()();

}

- (CGRect)customTextBounds
{
  _TtC7SwiftUI19TextEffectsRenderer *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v2 = self;
  v3 = TextEffectsRenderer.customTextBounds.getter();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (_NSCustomTextRenderingDisplayLink)externalDisplayLink
{
  return (_NSCustomTextRenderingDisplayLink *)(id)swift_unknownObjectRetain();
}

- (void)setExternalDisplayLink:(id)a3
{
  _TtC7SwiftUI19TextEffectsRenderer *v5;

  swift_unknownObjectRetain();
  v5 = self;
  specialized TextEffectsRenderer.externalDisplayLink.setter((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (BOOL)fragmentsValid
{
  _TtC7SwiftUI19TextEffectsRenderer *v2;
  BOOL v3;

  v2 = self;
  v3 = TextEffectsRenderer.fragmentsValid.getter();

  return v3;
}

- (void)enumerateTextSegmentsInRange:(id)a3 type:(int64_t)a4 options:(unint64_t)a5 textLayoutManager:(id)a6 usingBlock:(id)a7
{
  void *v12;
  id v13;
  id v14;
  _TtC7SwiftUI19TextEffectsRenderer *v15;
  _QWORD v16[4];

  v12 = _Block_copy(a7);
  v16[2] = v12;
  v13 = a3;
  v14 = a6;
  v15 = self;
  TextEffectsRenderer.enumerateTextSegments(in:type:options:textLayoutManager:using:)(v13, a4, a5, v14, (uint64_t)partial apply for thunk for @callee_unowned @convention(block) (@unowned NSTextRange?, @unowned CGRect, @unowned CGFloat, @unowned NSTextContainer) -> (@unowned ObjCBool), (uint64_t)v16);
  _Block_release(v12);

}

- (void)invalidateTemporaryAttributesInRange:(id)a3
{
  id v4;
  _TtC7SwiftUI19TextEffectsRenderer *v5;

  v4 = a3;
  v5 = self;
  TextEffectsRenderer.invalidateTemporaryAttributes(in:)((NSTextRange)v4);

}

- (CGPoint)convertPointFromRenderSpace:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  _TtC7SwiftUI19TextEffectsRenderer *v5;
  CGPoint v6;
  double v7;
  double v8;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = self;
  v6 = TextEffectsRenderer.convertFromRenderSpace(_:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));

  v7 = v6.x;
  v8 = v6.y;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)convertPointToTextAnimationsCoordinateSpace:(CGPoint)a3
{
  double y;
  double x;
  _TtC7SwiftUI19TextEffectsRenderer *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = self;
  TextEffectsRenderer._convertToRenderSpace(_:textRange:)(0, x, y);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (id)animatorForTextAnimation:(id)a3
{
  void *v3;

  type metadata accessor for AnyTextAnimation();
  v3 = (void *)swift_dynamicCastClass();
  if (v3)
    v3 = TextEffectsAnimationController.animator(for:)((uint64_t)v3);
  return v3;
}

- (id)animatorForTextAnimation:(id)a3 notify:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC7SwiftUI19TextEffectsRenderer *v9;
  id v10;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  type metadata accessor for AnyTextAnimation();
  v7 = swift_dynamicCastClass();
  if (v7)
  {
    v8 = (char *)v7;
    swift_unknownObjectRetain();
    v9 = self;
    v10 = TextEffectsAnimationController.animator(for:with:)(v8, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned _NSTextAnimator) -> (), v6);

  }
  else
  {
    swift_unknownObjectRetain();
    v10 = 0;
  }
  swift_release();
  swift_unknownObjectRelease();
  return v10;
}

@end
