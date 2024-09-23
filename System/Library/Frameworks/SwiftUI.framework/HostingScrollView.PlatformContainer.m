@implementation HostingScrollView.PlatformContainer

- (void)_updateSafeAreaInsets
{
  _TtCC7SwiftUI17HostingScrollView17PlatformContainer *v2;

  v2 = self;
  HostingScrollView.PlatformContainer._updateSafeAreaInsets()();

}

- (UIEdgeInsets)safeAreaInsets
{
  _TtCC7SwiftUI17HostingScrollView17PlatformContainer *v2;
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
  double v14;
  UIEdgeInsets result;

  v2 = self;
  HostingScrollView.PlatformContainer.safeAreaInsets.getter();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

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

- (void)setBounds:(CGRect)a3
{
  @objc HostingScrollView.PlatformContainer.frame.setter(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_setBounds_, (SEL *)&selRef_bounds);
}

- (void)setFrame:(CGRect)a3
{
  @objc HostingScrollView.PlatformContainer.frame.setter(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_setFrame_, (SEL *)&selRef_frame);
}

- (_TtCC7SwiftUI17HostingScrollView17PlatformContainer)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  int64x2_t *v7;
  int64x2_t v8;
  id v9;
  _TtCC7SwiftUI17HostingScrollView17PlatformContainer *result;

  v5 = OBJC_IVAR____TtCC7SwiftUI17HostingScrollView17PlatformContainer_safeAreaHelper;
  type metadata accessor for UIView.SafeAreaHelper();
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = 0u;
  *(_OWORD *)(v6 + 32) = 0u;
  *(_BYTE *)(v6 + 48) = 1;
  *(_OWORD *)(v6 + 56) = 0u;
  *(_OWORD *)(v6 + 72) = 0u;
  *(_BYTE *)(v6 + 88) = 1;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v6;
  v7 = (int64x2_t *)((char *)self + OBJC_IVAR____TtCC7SwiftUI17HostingScrollView17PlatformContainer__safeAreaInsets);
  v8 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *v7 = v8;
  v7[1] = v8;
  v9 = a3;

  result = (_TtCC7SwiftUI17HostingScrollView17PlatformContainer *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_UIGestureRecognizerContainer)_parentGestureRecognizerContainer
{
  _TtCC7SwiftUI17HostingScrollView17PlatformContainer *v2;
  id v3;

  v2 = self;
  v3 = HostingScrollView.PlatformContainer._parentContainer.getter();

  return (_UIGestureRecognizerContainer *)v3;
}

- (_TtCC7SwiftUI17HostingScrollView17PlatformContainer)initWithFrame:(CGRect)a3
{
  _TtCC7SwiftUI17HostingScrollView17PlatformContainer *result;

  result = (_TtCC7SwiftUI17HostingScrollView17PlatformContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC7SwiftUI17HostingScrollView17PlatformContainer_scrollView));
  swift_release();
}

@end
