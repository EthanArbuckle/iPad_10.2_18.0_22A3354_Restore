@implementation ICAudioAttachmentView

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[ICAudioAttachmentView _playerViewAccessibilityElement](self, "_playerViewAccessibilityElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[ICAudioAttachmentView _playerViewAccessibilityElement](self, "_playerViewAccessibilityElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;

  -[ICAudioAttachmentView _playerViewAccessibilityElement](self, "_playerViewAccessibilityElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityUserInputLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[ICAudioAttachmentView _playerViewAccessibilityElement](self, "_playerViewAccessibilityElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)ICAudioAttachmentView;
  -[ICAttachmentView accessibilityCustomActions](&v8, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_addObjectsFromNonNilArray:", v4);

  -[ICAudioAttachmentView _playerViewAccessibilityElement](self, "_playerViewAccessibilityElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityCustomActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_addObjectsFromNonNilArray:", v6);

  return v3;
}

- (id)accessibilityCustomContent
{
  void *v2;
  void *v3;

  -[ICAudioAttachmentView _playerViewAccessibilityElement](self, "_playerViewAccessibilityElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityCustomContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_playerViewAccessibilityElement
{
  void *v2;

  -[ICAudioAttachmentView icaxAudioPlayerViewAccessibilityElement](self, "icaxAudioPlayerViewAccessibilityElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SwiftUI.AccessibilityNode"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[swiftUIAccessibilityElement isKindOfClass:NSClassFromString(@\"SwiftUI.AccessibilityNode\")]", "-[ICAudioAttachmentView(ICAccessibility_iOS) _playerViewAccessibilityElement]", 1, 0, CFSTR("Unexpected accessibility element type for SwiftUI representation"));
  if (!v2)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((swiftUIAccessibilityElement) != nil)", "-[ICAudioAttachmentView(ICAccessibility_iOS) _playerViewAccessibilityElement]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "swiftUIAccessibilityElement");
  return v2;
}

- (void)didChangeMedia
{
  ICAudioAttachmentView *v2;

  v2 = self;
  sub_1DD99AC80();

}

- (ICAttachment)attachment
{
  return (ICAttachment *)sub_1DD99B800(self, (uint64_t)a2, (SEL *)&selRef_attachment);
}

- (void)setAttachment:(id)a3
{
  sub_1DD99B858(self, (uint64_t)a2, a3, (const char **)&selRef_setAttachment_, (void (*)(id))sub_1DD99AE54);
}

- (UIColor)highlightColor
{
  return (UIColor *)sub_1DD99B800(self, (uint64_t)a2, (SEL *)&selRef_highlightColor);
}

- (void)setHighlightColor:(id)a3
{
  sub_1DD99B858(self, (uint64_t)a2, a3, (const char **)&selRef_setHighlightColor_, (void (*)(id))sub_1DD99B8CC);
}

- (void)didMoveToSuperview
{
  ICAudioAttachmentView *v2;

  v2 = self;
  sub_1DD99B9CC();

}

- (void)layoutSubviews
{
  id v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudioAttachmentView();
  v2 = v5.receiver;
  -[ICAudioAttachmentView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_layer, v5.receiver, v5.super_class);
  if (qword_1F03F5D40 != -1)
    swift_once();
  objc_msgSend(v3, sel_setCornerRadius_, *(double *)&qword_1F03F9300);

  v4 = objc_msgSend(v2, sel_layer);
  objc_msgSend(v4, sel_setCornerCurve_, *MEMORY[0x1E0CD2A68]);

}

- (UIViewController)contextMenuPreviewController
{
  ICAudioAttachmentView *v2;
  id v3;

  v2 = self;
  v3 = sub_1DD99BBF8();

  return (UIViewController *)v3;
}

- (id)contextualMenuElementsFromProposedActions:(id)a3
{
  void *v3;

  sub_1DD7C0C74(0, (unint64_t *)&qword_1F03F69E0);
  sub_1DD9D22A8();
  v3 = (void *)sub_1DD9D229C();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)cut:(id)a3
{
  sub_1DD99BFD0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_1EA7E86A8, (uint64_t)sub_1DD9A831C, (uint64_t)&block_descriptor_25, 1);
}

- (void)delete:(id)a3
{
  sub_1DD99BFD0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_1EA7E86F8, (uint64_t)sub_1DD9A8378, (uint64_t)&block_descriptor_6_0, 0);
}

- (NSObject)icaxAudioPlayerViewAccessibilityElement
{
  ICAudioAttachmentView *v2;
  id v3;

  v2 = self;
  v3 = sub_1DD99C0A4();

  return v3;
}

- (ICAudioAttachmentView)initWithFrame:(CGRect)a3 textAttachment:(id)a4 textContainer:(id)a5 forManualRendering:(BOOL)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  ICAudioAttachmentView *v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a5;
  v15 = (ICAudioAttachmentView *)sub_1DD9A839C((uint64_t)a4, (uint64_t)a5, a6, x, y, width, height);

  return v15;
}

- (ICAudioAttachmentView)initWithCoder:(id)a3
{
  return (ICAudioAttachmentView *)AudioAttachmentView.init(coder:)(a3);
}

- (ICAudioAttachmentView)initWithTextAttachment:(id)a3 textContainer:(id)a4 forManualRendering:(BOOL)a5
{
  id v8;
  id v9;
  ICAudioAttachmentView *v10;

  v8 = a3;
  v9 = a4;
  v10 = (ICAudioAttachmentView *)sub_1DD9A84B4((uint64_t)a3, (uint64_t)a4, a5);

  return v10;
}

- (void).cxx_destruct
{

  swift_release();
  swift_release();
}

@end
