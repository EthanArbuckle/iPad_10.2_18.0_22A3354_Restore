@implementation _UIShapeHitTestingView

- (_TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView)initWithFrame:(CGRect)a3
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
  v9 = (char *)self + OBJC_IVAR____TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView_path;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  v9[32] = 6;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[_UIGraphicsView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (void).cxx_destruct
{
  outlined consume of Path.Storage(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView_path), *(_QWORD *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView_path), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView_path), *(uint64_t *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView_path), *((_BYTE *)&self->super.super._cachedTraitCollection+ OBJC_IVAR____TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView_path));
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  _BYTE *v7;
  id v8;
  id v9;
  char v10;
  __int128 v11;
  Swift::Bool v12;
  objc_super v14;
  _OWORD v15[2];
  char v16;
  _BYTE v17[40];

  y = a3.y;
  x = a3.x;
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v7 = v14.receiver;
  v8 = a4;
  v9 = -[_UIShapeHitTestingView hitTest:withEvent:](&v14, sel_hitTest_withEvent_, v8, x, y);
  if (v9)
  {

    v10 = v7[OBJC_IVAR____TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView_path + 32];
    v11 = *(_OWORD *)&v7[OBJC_IVAR____TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView_path + 16];
    v15[0] = *(_OWORD *)&v7[OBJC_IVAR____TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView_path];
    v15[1] = v11;
    v16 = v10;
    outlined init with take of Path.Storage((uint64_t)v15, (uint64_t)v17);
    outlined retain of TableColumnCustomizationID.Base((uint64_t)v17, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of Path.Storage);
    v12 = Path.contains(_:eoFill:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), 0);
    outlined retain of TableColumnCustomizationID.Base((uint64_t)v15, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of Path.Storage);

    if (v12)
      return v7;
  }
  else
  {

  }
  v7 = 0;
  return v7;
}

- (_TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView_path;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  v6[32] = 6;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[_UIGraphicsView initWithCoder:](&v8, sel_initWithCoder_, a3);
}

@end
