@implementation UIKitSearchBar

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (void)didMoveToWindow
{
  _TtC7SwiftUI14UIKitSearchBar *v2;

  v2 = self;
  UIKitSearchBar.didMoveToWindow()();

}

- (void)layoutSubviews
{
  _TtC7SwiftUI14UIKitSearchBar *v2;

  v2 = self;
  UIKitSearchBar.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  char *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v16.receiver = self;
  v16.super_class = (Class)swift_getObjectType();
  v5 = (char *)v16.receiver;
  -[UIKitSearchBar sizeThatFits:](&v16, sel_sizeThatFits_, width, height);
  v7 = v6;
  v9 = v8;
  v10 = *(void **)&v5[OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarHost];
  if (v10)
  {
    v11 = v10;
    if ((objc_msgSend(v11, sel_isHidden, v16.receiver, v16.super_class) & 1) != 0)
    {

    }
    else
    {
      UIKitSearchBar.roundedScopeBarSizeThatFits(_:)(width, height);
      v13 = v12;

      v9 = v9 + v13;
    }
  }
  else
  {

  }
  v14 = v7;
  v15 = v9;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)setShowsScopeBar:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v6 = v7.receiver;
  -[UIKitSearchBar setShowsScopeBar:animated:](&v7, sel_setShowsScopeBar_animated_, v5, v4);
  UIKitSearchBar.updateCustomScopeBarIsActive(_:isAnimated:)(v5, v4);

}

- (_TtC7SwiftUI14UIKitSearchBar)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_ensureVibrancy) = 0;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_isActive) = 0;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_pendingIsFirstResponder) = 2;
  v9 = (char *)self + OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarView;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_OWORD *)v9 + 2) = 0u;
  *((_OWORD *)v9 + 3) = 0u;
  *((_OWORD *)v9 + 4) = 0u;
  *((_QWORD *)v9 + 10) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarHost) = 0;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarVisibility) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[UIKitSearchBar initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7SwiftUI14UIKitSearchBar)initWithCoder:(id)a3
{
  return (_TtC7SwiftUI14UIKitSearchBar *)UIKitSearchBar.init(coder:)(a3);
}

- (void).cxx_destruct
{
  outlined consume of BoundInputsView?(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarView), *(_QWORD *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarView), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarView), *(uint64_t *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarView), *(void **)((char *)&self->super.super._cachedTraitCollection+ OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarHost));
}

@end
