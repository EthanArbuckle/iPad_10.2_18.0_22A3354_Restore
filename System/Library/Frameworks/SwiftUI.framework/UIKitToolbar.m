@implementation UIKitToolbar

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI12UIKitToolbar)init
{
  return -[UIKitToolbar initWithFrame:](self, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (_TtC7SwiftUI12UIKitToolbar)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI12UIKitToolbar_backgroundHost) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[UIKitToolbar initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7SwiftUI12UIKitToolbar)initWithCoder:(id)a3
{
  id v4;
  _TtC7SwiftUI12UIKitToolbar *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI12UIKitToolbar_backgroundHost) = 0;
  v4 = a3;

  result = (_TtC7SwiftUI12UIKitToolbar *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)initInView:(id)a3 withFrame:(CGRect)a4 withItemList:(id)a5
{
  id v5;
  id result;

  v5 = a3;
  result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
