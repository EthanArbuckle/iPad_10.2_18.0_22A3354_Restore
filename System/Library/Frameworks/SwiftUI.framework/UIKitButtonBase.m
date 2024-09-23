@implementation UIKitButtonBase

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  uint64_t v9;
  id v10;
  id v11;
  _TtC7SwiftUI15UIKitButtonBase *v12;
  objc_super v13;

  v9 = MEMORY[0x18D760234]((char *)self + OBJC_IVAR____TtC7SwiftUI15UIKitButtonBase_delegate, a2);
  v10 = a3;
  v11 = a4;
  swift_unknownObjectRetain();
  v12 = self;
  if (v9)
  {
    Coordinator.menuWillShow(interaction:)();
    swift_unknownObjectRelease();
  }
  v13.receiver = v12;
  v13.super_class = (Class)type metadata accessor for UIKitButtonBase();
  -[UIKitButtonBase contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v13, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, v10, v11, a5);

  swift_unknownObjectRelease();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC7SwiftUI15UIKitButtonBase *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  UIKitButtonBase.contextMenuInteraction(_:willEndFor:animator:)((uint64_t)v8, (uint64_t)v9, (uint64_t)a5);

  swift_unknownObjectRelease();
}

- (_TtC7SwiftUI15UIKitButtonBase)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags + OBJC_IVAR____TtC7SwiftUI15UIKitButtonBase_delegate) = 0;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for UIKitButtonBase();
  return -[UIKitButtonBase initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7SwiftUI15UIKitButtonBase)initWithCoder:(id)a3
{
  objc_super v6;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags + OBJC_IVAR____TtC7SwiftUI15UIKitButtonBase_delegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for UIKitButtonBase();
  return -[UIKitButtonBase initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI15UIKitButtonBase_delegate);
}

@end
