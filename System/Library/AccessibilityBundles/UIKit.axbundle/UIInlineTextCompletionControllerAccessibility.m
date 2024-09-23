@implementation UIInlineTextCompletionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIInlineTextCompletionController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInlineTextCompletionController"), CFSTR("acceptTextCompletionWithInteraction:wordTerminator:outputHandledByCaller:"), "q", "@", "B", 0);
  objc_storeStrong(v4, obj);
}

- (id)acceptTextCompletionWithInteraction:(int64_t)a3 wordTerminator:(id)a4 outputHandledByCaller:(BOOL)a5
{
  id v6;
  id v8;
  char v9;
  BOOL v10;
  char v11;
  id v12;
  objc_super v13;
  id v14;
  BOOL v15;
  id location;
  int64_t v17;
  SEL v18;
  UIInlineTextCompletionControllerAccessibility *v19;

  v19 = self;
  v18 = a2;
  v17 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v15 = a5;
  v13.receiver = v19;
  v13.super_class = (Class)UIInlineTextCompletionControllerAccessibility;
  v14 = -[UIInlineTextCompletionControllerAccessibility acceptTextCompletionWithInteraction:wordTerminator:outputHandledByCaller:](&v13, sel_acceptTextCompletionWithInteraction_wordTerminator_outputHandledByCaller_, v17, location, a5);
  v8 = (id)objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v9 = objc_msgSend(v8, "voiceOverInlineTextCompletionInsertionFeedback");

  v11 = 0;
  v10 = 0;
  if ((v9 & 4) != 0)
  {
    v12 = (id)objc_msgSend(v14, "candidate");
    v11 = 1;
    v10 = objc_msgSend(v12, "length") != 0;
  }
  if ((v11 & 1) != 0)

  if (v10)
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAEB0], 0);
  v6 = v14;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&location, 0);
  return v6;
}

@end
