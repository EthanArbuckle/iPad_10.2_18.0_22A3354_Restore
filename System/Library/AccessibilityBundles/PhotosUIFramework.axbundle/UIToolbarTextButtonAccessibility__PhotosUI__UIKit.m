@implementation UIToolbarTextButtonAccessibility__PhotosUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIToolbarTextButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (double)_accessibilityDelayBeforeUpdatingOnActivation
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[UIToolbarTextButtonAccessibility__PhotosUI__UIKit allTargets](self, "allTargets");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        objc_opt_class();
        objc_msgSend(v8, "_accessibilityValueForKey:", AXIsPhotoSharingLikeButtonKey);
        v9 = objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v9) = objc_msgSend(v10, "BOOLValue");
        if ((v9 & 1) != 0)
        {

          v12 = 5.0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }

  v14.receiver = self;
  v14.super_class = (Class)UIToolbarTextButtonAccessibility__PhotosUI__UIKit;
  -[UIToolbarTextButtonAccessibility__PhotosUI__UIKit _accessibilityDelayBeforeUpdatingOnActivation](&v14, sel__accessibilityDelayBeforeUpdatingOnActivation);
  v12 = v11;
LABEL_11:

  return v12;
}

@end
