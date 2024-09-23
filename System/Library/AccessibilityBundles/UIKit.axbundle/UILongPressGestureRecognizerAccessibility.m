@implementation UILongPressGestureRecognizerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UILongPressGestureRecognizer");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewCell"), CFSTR("_gestureRecognizerShouldBegin:"), "B", "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)_accessibilityIsSupportedGestureRecognizer
{
  id v3;
  char isKindOfClass;
  objc_super v5;
  int v6;
  char v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13[2];
  uint64_t v14;
  uint64_t *v15;
  int v16;
  int v17;
  char v18;
  id v19[2];
  UILongPressGestureRecognizerAccessibility *v20;
  char v21;

  v20 = self;
  v19[1] = (id)a2;
  v19[0] = self;
  v3 = (id)objc_msgSend(v19[0], "delegate");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x20000000;
    v17 = 32;
    v18 = 0;
    v8 = MEMORY[0x24BDAC760];
    v9 = -1073741824;
    v10 = 0;
    v11 = __87__UILongPressGestureRecognizerAccessibility__accessibilityIsSupportedGestureRecognizer__block_invoke;
    v12 = &unk_24FF3DE88;
    v13[1] = &v14;
    v13[0] = v19[0];
    AXPerformSafeBlock();
    v7 = v15[3] & 1;
    objc_storeStrong(v13, 0);
    _Block_object_dispose(&v14, 8);
    v21 = v7 & 1;
  }
  else
  {
    v5.receiver = v20;
    v5.super_class = (Class)UILongPressGestureRecognizerAccessibility;
    v21 = -[UILongPressGestureRecognizerAccessibility _accessibilityIsSupportedGestureRecognizer](&v5, sel__accessibilityIsSupportedGestureRecognizer);
  }
  v6 = 1;
  objc_storeStrong(v19, 0);
  return v21 & 1;
}

void __87__UILongPressGestureRecognizerAccessibility__accessibilityIsSupportedGestureRecognizer__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "_gestureRecognizerShouldBegin:", *(_QWORD *)(a1 + 32)) & 1;

}

@end
