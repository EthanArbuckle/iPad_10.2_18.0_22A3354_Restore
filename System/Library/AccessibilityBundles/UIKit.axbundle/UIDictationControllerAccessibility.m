@implementation UIDictationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIDictationController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const char *v4;
  const __CFString *v5;
  const char *v6;
  const __CFString *v7;
  id v8;
  id *v9;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = "@";
  v5 = CFSTR("UIDictationController");
  v4 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("updateLastHypothesis:WithNewHypothesis:"), v4, v6, v6, 0);
  v3 = "i";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("state"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("setState:"), v4, v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("targetHypothesis"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("lastHypothesis"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_createDictationPresenterWindowIfNecessary"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("dictationPresenterWindow"), v6, 0);
  v7 = CFSTR("UIDictationSerializableResults");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:", v7);
  objc_storeStrong(v9, v8);
}

- (void)setState:(int)a3
{
  objc_super v3;
  unsigned int v4;
  SEL v5;
  UIDictationControllerAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  if (a3 <= 6uLL)
    __asm { BR              X8 }
  v3.receiver = v6;
  v3.super_class = (Class)UIDictationControllerAccessibility;
  -[UIDictationControllerAccessibility setState:](&v3, sel_setState_, v4);
}

- (void)_axNotifyDictationStarted
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEE30]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  UIAccessibilityPostNotification(0x16A8u, 0);
}

- (void)_axNotifyDictationStopped
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  UIAccessibilityPostNotification(0x16A9u, 0);
}

- (void)updateLastHypothesis:(id)a3 WithNewHypothesis:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  UIDictationControllerAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)UIDictationControllerAccessibility;
  -[UIDictationControllerAccessibility updateLastHypothesis:WithNewHypothesis:](&v5, sel_updateLastHypothesis_WithNewHypothesis_, location[0], v6);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)insertSerializedDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  BOOL v14;
  id v15;
  id v16;
  objc_super v18;
  uint64_t v19;
  int v20;
  int v21;
  void (*v22)(_QWORD *);
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  char v28;
  id v29;
  id v30;
  char v31;
  id v32;
  int v33;
  objc_super v34;
  id v35;
  id location[2];
  UIDictationControllerAccessibility *v37;

  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = 0;
  objc_storeStrong(&v35, a4);
  if ((AXProcessIsInputUI() & 1) != 0)
  {
    v34.receiver = v37;
    v34.super_class = (Class)UIDictationControllerAccessibility;
    -[UIDictationControllerAccessibility insertSerializedDictationResult:withCorrectionIdentifier:](&v34, sel_insertSerializedDictationResult_withCorrectionIdentifier_, location[0], v35);
    v33 = 1;
  }
  else
  {
    v32 = (id)objc_msgSend(location[0], "safeStringForKey:", CFSTR("bestText"));
    if (!v32)
    {
      v31 = 0;
      objc_opt_class();
      v16 = (id)-[UIDictationControllerAccessibility safeValueForKey:](v37, "safeValueForKey:", CFSTR("targetHypothesis"));
      v30 = (id)__UIAccessibilityCastAsClass();

      v29 = v30;
      objc_storeStrong(&v30, 0);
      v4 = v32;
      v32 = v29;

      if (!v32)
      {
        v28 = 0;
        objc_opt_class();
        v15 = (id)-[UIDictationControllerAccessibility safeValueForKey:](v37, "safeValueForKey:", CFSTR("lastHypothesis"));
        v27 = (id)__UIAccessibilityCastAsClass();

        v26 = v27;
        objc_storeStrong(&v27, 0);
        v5 = v32;
        v32 = v26;

      }
    }
    if (v32)
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      v12 = accessibilityLocalizedString(CFSTR("inserted.text"));
      v25 = (id)objc_msgSend(v11, "stringWithFormat:", v32);

      v13 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityResponderElement");
      v6 = objc_msgSend(v13, "accessibilityTraits");
      v14 = (v6 & *MEMORY[0x24BEBB168]) != *MEMORY[0x24BEBB168];

      if (!v14)
      {
        v9 = (void *)MEMORY[0x24BDD17C8];
        v10 = accessibilityLocalizedString(CFSTR("secure.dictation.characters.count"));
        v7 = (id)objc_msgSend(v9, "localizedStringWithFormat:", v10, objc_msgSend(v32, "length"));
        v8 = v25;
        v25 = v7;

      }
      v19 = MEMORY[0x24BDAC760];
      v20 = -1073741824;
      v21 = 0;
      v22 = __95__UIDictationControllerAccessibility_insertSerializedDictationResult_withCorrectionIdentifier___block_invoke;
      v23 = &unk_24FF3DA40;
      v24 = v25;
      AXPerformBlockOnMainThreadAfterDelay();
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v25, 0);
    }
    MEMORY[0x2348C39BC](1005);
    v18.receiver = v37;
    v18.super_class = (Class)UIDictationControllerAccessibility;
    -[UIDictationControllerAccessibility insertSerializedDictationResult:withCorrectionIdentifier:](&v18, sel_insertSerializedDictationResult_withCorrectionIdentifier_, location[0], v35);
    objc_storeStrong(&v32, 0);
    v33 = 0;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

void __95__UIDictationControllerAccessibility_insertSerializedDictationResult_withCorrectionIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id v3;
  id v4;
  id argument[3];
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  argument[2] = a1;
  argument[1] = a1;
  v3 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  v2 = a1[4];
  v6[0] = *MEMORY[0x24BDFEAD8];
  v7[0] = &unk_24FF85A48;
  v6[1] = *MEMORY[0x24BDFEB20];
  v7[1] = MEMORY[0x24BDBD1C8];
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  argument[0] = (id)objc_msgSend(v3, "initWithString:attributes:", v2);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument[0]);
  objc_storeStrong(argument, 0);
}

- (void)_createDictationPresenterWindowIfNecessary
{
  id v2;
  objc_super v3;
  SEL v4;
  UIDictationControllerAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIDictationControllerAccessibility;
  -[UIDictationControllerAccessibility _createDictationPresenterWindowIfNecessary](&v3, sel__createDictationPresenterWindowIfNecessary);
  v2 = (id)-[UIDictationControllerAccessibility safeValueForKey:](v5, "safeValueForKey:", CFSTR("dictationPresenterWindow"));
  objc_msgSend(v2, "setAccessibilityViewIsModal:", 1);

}

@end
