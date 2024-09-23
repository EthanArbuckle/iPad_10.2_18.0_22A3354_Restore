@implementation UITableViewCellAccessibility__MediaPlayer__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("_imageView:"), "@", "B", 0);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  char v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)UITableViewCellAccessibility__MediaPlayer__UIKit;
  v2 = -[UITableViewCellAccessibility__MediaPlayer__UIKit accessibilityTraits](&v18, sel_accessibilityTraits);
  v17 = 0;
  objc_opt_class();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  AXPerformSafeBlock();
  v3 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    abort();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("AlternateTrackCheckmark"));
  v8 = *MEMORY[0x24BDF7400];
  if (!v7)
    v8 = 0;
  v9 = v8 | v2;

  return v9;
}

@end
