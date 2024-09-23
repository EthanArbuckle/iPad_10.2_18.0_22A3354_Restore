@implementation AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SwiftUI.AccessibilityNode");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SwiftUI.AccessibilityNode"), CFSTR("accessibilityCustomAttribute:"), "@", 0);
}

- (int64_t)_accessibilityExpandedStatus
{
  void *v3;
  int v4;
  id v5;
  int64_t v6;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  -[AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXLCNubbit"));

  if (!v4)
    goto LABEL_7;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __92__AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI__accessibilityExpandedStatus__block_invoke;
  v12 = &unk_25024AFB0;
  v13 = self;
  v14 = &v15;
  AXPerformSafeBlock();
  v5 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  if (v5)
  {
    if (objc_msgSend(v5, "BOOLValue"))
      v6 = 1;
    else
      v6 = 2;

  }
  else
  {
LABEL_7:
    v8.receiver = self;
    v8.super_class = (Class)AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI;
    return -[AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI _accessibilityExpandedStatus](&v8, sel__accessibilityExpandedStatus);
  }
  return v6;
}

- (id)accessibilityAttributedLabel
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI;
  -[AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI accessibilityAttributedLabel](&v12, sel_accessibilityAttributedLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI accessibilityIdentifier](self, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("AXLCCaptionText"));

  if (v5)
  {
    objc_msgSend(v3, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithStringOrAttributedString:", v7);
    v13 = *MEMORY[0x24BDFEAF0];
    v14[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttributes:", v9);

    objc_msgSend(v8, "attributedString");
    v10 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v10;
  }
  return v3;
}

- (BOOL)_accessibilityIsRealtimeElement
{
  void *v3;
  char v4;
  objc_super v6;

  -[AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXLCCaptionText"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI;
  return -[AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI _accessibilityIsRealtimeElement](&v6, sel__accessibilityIsRealtimeElement);
}

@end
