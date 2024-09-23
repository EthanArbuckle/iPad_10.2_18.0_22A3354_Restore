@implementation UIKitAccessibilityLinkRotorBridge.LinkElement

- (CGRect)accessibilityFrame
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v3 = MEMORY[0x18D760234]((char *)self+ OBJC_IVAR____TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement_node, a2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement_range);
    v6 = *(_QWORD *)((char *)&self->super.super._responderFlags
                   + OBJC_IVAR____TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement_range);
    v7 = self;
    objc_msgSend(v4, sel__accessibilityBoundsForRange_, v5, v6);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

  }
  else
  {
    v13 = 0.0;
    v15 = 0.0;
    v9 = 0.0;
    v11 = 0.0;
  }
  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E0DC4688];
}

- (NSString)accessibilityLabel
{
  _TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = UIKitAccessibilityLinkRotorBridge.LinkElement.accessibilityLabel.getter();
  v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x18D75CC88](v3, v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (CGPoint)accessibilityActivationPoint
{
  _TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  v2 = self;
  v3 = UIKitAccessibilityLinkRotorBridge.LinkElement.accessibilityActivationPoint.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (_TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement)initWithAccessibilityContainer:(id)a3
{
  _TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement *result;

  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  result = (_TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement)init
{
  _TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement *result;

  result = (_TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
