@implementation HostingScrollView

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  @objc HostingScrollView.PlatformContainer.frame.getter(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  @objc HostingScrollView.PlatformContainer.frame.getter(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC7SwiftUI17HostingScrollView *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  objc_super v24;
  objc_super v25;
  objc_super v26;
  objc_super v27;
  objc_super v28;
  __C::CGRect v29;
  __C::CGRect v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v28.receiver = self;
  v28.super_class = ObjectType;
  v9 = self;
  -[HostingScrollView frame](&v28, sel_frame);
  v11 = v10;
  v13 = v12;
  v27.receiver = v9;
  v27.super_class = ObjectType;
  -[HostingScrollView setFrame:](&v27, sel_setFrame_, x, y, width, height);
  v26.receiver = v9;
  v26.super_class = ObjectType;
  -[HostingScrollView bounds](&v26, sel_bounds);
  v15 = v14;
  v17 = v16;
  v25.receiver = v9;
  v25.super_class = ObjectType;
  -[HostingScrollView bounds](&v25, sel_bounds);
  v19 = v18;
  v21 = v20;
  v24.receiver = v9;
  v24.super_class = ObjectType;
  -[HostingScrollView frame](&v24, sel_frame);
  v30.size.width = v22;
  v30.size.height = v23;
  v29.origin.x = v15;
  v29.origin.y = v17;
  v29.size.width = v11;
  v29.size.height = v13;
  v30.origin.x = v19;
  v30.origin.y = v21;
  ScrollViewHelper.boundsDidChange(oldBounds:newBounds:)(v29, v30);

}

- (void)didMoveToWindow
{
  _TtC7SwiftUI17HostingScrollView *v2;

  v2 = self;
  HostingScrollView.didMoveToWindow()();

}

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI17HostingScrollView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized HostingScrollView.init(coder:)();
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC7SwiftUI17HostingScrollView *v9;
  objc_super v10;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = self;
  -[HostingScrollView bounds](&v11, sel_bounds);
  v10.receiver = v9;
  v10.super_class = ObjectType;
  -[HostingScrollView setBounds:](&v10, sel_setBounds_, x, y, width, height);
  HostingScrollView.bounds.didset();

}

- (void)layoutSubviews
{
  char *v2;
  uint64_t v3;
  int v4;
  __int128 v5;
  objc_super v6;
  _OWORD v7[2];
  char v8;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = (char *)v6.receiver;
  -[HostingScrollView layoutSubviews](&v6, sel_layoutSubviews);
  v3 = *(_QWORD *)&v2[OBJC_IVAR____TtC7SwiftUI17HostingScrollView_helper]
     + OBJC_IVAR____TtC7SwiftUI16ScrollViewHelper_lastTargetOffsetState;
  v4 = *(unsigned __int8 *)(v3 + 32);
  if (v4 != 2)
  {
    v5 = *(_OWORD *)(v3 + 16);
    v7[0] = *(_OWORD *)v3;
    v7[1] = v5;
    v8 = v4 & 1;
    ScrollViewHelper.retargetContentOffsetIfNeeded(state:)((uint64_t)v7);
    *(_OWORD *)v3 = 0u;
    *(_OWORD *)(v3 + 16) = 0u;
    *(_BYTE *)(v3 + 32) = 2;
  }

}

- (BOOL)_shouldScrollToContentBeginningInRightToLeft
{
  _TtC7SwiftUI17HostingScrollView *v2;
  char shouldScrollToContentBeginningInRightTo;

  v2 = self;
  shouldScrollToContentBeginningInRightTo = HostingScrollView._shouldScrollToContentBeginningInRightToLeft.getter();

  return shouldScrollToContentBeginningInRightTo & 1;
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  char *v7;
  double *v8;
  objc_super v9;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v7 = (char *)v9.receiver;
  -[HostingScrollView setContentOffset:animated:](&v9, sel_setContentOffset_animated_, v4, x, y);
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)&v7[OBJC_IVAR____TtC7SwiftUI17HostingScrollView_helper]
             + OBJC_IVAR____TtC7SwiftUI16ScrollViewHelper_lastPhase) = 4;
    ScrollViewHelper.updateGraphState(isPreferred:)(0);
  }
  v8 = (double *)&v7[OBJC_IVAR____TtC7SwiftUI17HostingScrollView_animationOffset];
  *v8 = x;
  v8[1] = y;

}

- (id)_focusScrollBoundaryMetricsForItem:(id)a3
{
  id v5;
  _TtC7SwiftUI17HostingScrollView *v6;
  id v7;

  v5 = objc_allocWithZone(MEMORY[0x1E0DC4180]);
  swift_unknownObjectRetain();
  v6 = self;
  v7 = objc_msgSend(v5, sel_initWithFocusItem_scrollView_, a3, v6);
  if ((objc_msgSend(v7, sel_hasDisprovedAllRelevantAssumptions) & 1) == 0)
    HostingScrollView.PlatformGroupContainer.updateFocusScrollBoundaryMetrics(_:for:)(v7, a3);
  swift_unknownObjectRelease();

  return v7;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (_TtC7SwiftUI17HostingScrollView)initWithFrame:(CGRect)a3
{
  _TtC7SwiftUI17HostingScrollView *result;

  result = (_TtC7SwiftUI17HostingScrollView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI17HostingScrollView_host));
  swift_weakDestroy();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(*(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI17HostingScrollView_onScrollToTopGesture));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI17HostingScrollView_helper));
  outlined consume of HostingScrollViewUpdateContext?(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC7SwiftUI17HostingScrollView_pendingContext), *(_QWORD *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC7SwiftUI17HostingScrollView_pendingContext), *(uint64_t *)((char *)&self->super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC7SwiftUI17HostingScrollView_pendingContext), *(uint64_t *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC7SwiftUI17HostingScrollView_pendingContext), *(uint64_t *)((char *)&self->super.super.super._cachedTraitCollection+ OBJC_IVAR____TtC7SwiftUI17HostingScrollView_pendingContext), *(uint64_t *)((char *)&self->super.super.super._animationInfo+ OBJC_IVAR____TtC7SwiftUI17HostingScrollView_pendingContext), *(uint64_t *)((char *)&self->super.super.super._swiftAnimationInfo+ OBJC_IVAR____TtC7SwiftUI17HostingScrollView_pendingContext), *(uint64_t *)((char *)&self->super.super.super._traitChangeRegistry+ OBJC_IVAR____TtC7SwiftUI17HostingScrollView_pendingContext), *(unint64_t *)((char *)&self->super.super.super._layerRetained+ OBJC_IVAR____TtC7SwiftUI17HostingScrollView_pendingContext));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(*(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI17HostingScrollView_animationTarget));
  swift_unknownObjectRelease();
  swift_weakDestroy();
  outlined destroy of ScrollViewConfiguration((uint64_t)self + OBJC_IVAR____TtC7SwiftUI17HostingScrollView_configuration);
}

@end
