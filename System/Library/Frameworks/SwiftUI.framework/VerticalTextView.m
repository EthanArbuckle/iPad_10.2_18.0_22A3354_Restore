@implementation VerticalTextView

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  @objc VerticalTextView.pressesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))VerticalTextView.pressesBegan(_:with:));
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  @objc VerticalTextView.pressesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))VerticalTextView.pressesEnded(_:with:));
}

- (_TtC7SwiftUI16VerticalTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v11;
  char *v12;
  uint64_t v13;
  id v14;
  _TtC7SwiftUI16VerticalTextView *v15;
  _TtC7SwiftUI16VerticalTextView *v16;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v11 = (char *)self + OBJC_IVAR____TtC7SwiftUI16VerticalTextView_upperLimit;
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  v12 = (char *)self + OBJC_IVAR____TtC7SwiftUI16VerticalTextView_lowerLimit;
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  *(_QWORD *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7SwiftUI16VerticalTextView_uiDelegate) = 0;
  swift_unknownObjectWeakInit();
  v13 = OBJC_IVAR____TtC7SwiftUI16VerticalTextView_uiDefaultTextAttributes;
  v14 = a4;
  v15 = self;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v13) = (Class)specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E0DEE9D8]);

  v18.receiver = v15;
  v18.super_class = ObjectType;
  v16 = -[UIKitTextView initWithFrame:textContainer:](&v18, sel_initWithFrame_textContainer_, v14, x, y, width, height);

  return v16;
}

- (_TtC7SwiftUI16VerticalTextView)initWithCoder:(id)a3
{
  return (_TtC7SwiftUI16VerticalTextView *)VerticalTextView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI16VerticalTextView_uiDelegate);
  swift_bridgeObjectRelease();
}

@end
