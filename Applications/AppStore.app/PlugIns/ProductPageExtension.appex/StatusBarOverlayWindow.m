@implementation StatusBarOverlayWindow

- (_TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8422StatusBarOverlayWindow)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8422StatusBarOverlayWindow *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8422StatusBarOverlayWindow_interactionView) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[StatusBarOverlayWindow initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  -[StatusBarOverlayWindow setWindowLevel:](v9, "setWindowLevel:", UIWindowLevelStatusBar);
  -[StatusBarOverlayWindow _setWindowControlsStatusBarOrientation:](v9, "_setWindowControlsStatusBarOrientation:", 0);

  return v9;
}

- (_TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8422StatusBarOverlayWindow)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8422StatusBarOverlayWindow_interactionView) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[StatusBarOverlayWindow initWithCoder:](&v7, "initWithCoder:", a3);
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  void *v4;
  double y;
  double x;
  id v8;
  _TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8422StatusBarOverlayWindow *v9;
  id v10;
  unsigned __int8 v11;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8422StatusBarOverlayWindow_interactionView);
  if (!v4)
    return 0;
  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = v4;
  -[StatusBarOverlayWindow convertPoint:toCoordinateSpace:](v9, "convertPoint:toCoordinateSpace:", v10, x, y);
  v11 = objc_msgSend(v10, "pointInside:withEvent:", v8);

  return v11;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v7 = v13.receiver;
  v8 = a4;
  v9 = -[StatusBarOverlayWindow hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (v9)
  {
    v10 = v9;
    sub_100018B6C(0, (unint64_t *)&qword_10080B7F0, UIView_ptr);
    v11 = v7;
    v7 = v10;
    LOBYTE(v10) = static NSObject.== infix(_:_:)(v7, v11);

    if ((v10 & 1) == 0)
      return v7;
  }
  else
  {

  }
  v7 = 0;
  return v7;
}

- (_TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8422StatusBarOverlayWindow)initWithWindowScene:(id)a3
{
  id v3;
  _TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8422StatusBarOverlayWindow *result;

  v3 = a3;
  result = (_TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8422StatusBarOverlayWindow *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.StatusBarOverlayWindow", 43, "init(windowScene:)", 18, 0);
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8422StatusBarOverlayWindow)initWithContentRect:(CGRect)a3
{
  _TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8422StatusBarOverlayWindow *result;

  result = (_TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8422StatusBarOverlayWindow *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.StatusBarOverlayWindow", 43, "init(contentRect:)", 18, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8422StatusBarOverlayWindow_interactionView));
}

@end
