@implementation SUUIHorizontalListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIHorizontalListView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIHorizontalListView"), CFSTR("setImage: forArtworkRequest: context:"), "B", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIHorizontalListView"), CFSTR("reloadWithViewElement: width: context:"), "v", "@", "d", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIHorizontalListView"), CFSTR("_imageViewToImageResourceCacheKey"), "NSMapTable");

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIHorizontalListViewAccessibility;
  v6 = -[SUUIHorizontalListViewAccessibility setImage:forArtworkRequest:context:](&v8, sel_setImage_forArtworkRequest_context_, a3, a4, a5);
  -[SUUIHorizontalListViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  return v6;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIHorizontalListViewAccessibility;
  -[SUUIHorizontalListViewAccessibility reloadWithViewElement:width:context:](&v6, sel_reloadWithViewElement_width_context_, a3, a5, a4);
  -[SUUIHorizontalListViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  const __CFString *v15;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)SUUIHorizontalListViewAccessibility;
  -[SUUIHorizontalListViewAccessibility _accessibilityLoadAccessibilityInformation](&v22, sel__accessibilityLoadAccessibilityInformation);
  v21 = 0;
  objc_opt_class();
  -[SUUIHorizontalListViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageViewToImageResourceCacheKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v21 = 0;
        objc_opt_class();
        objc_msgSend(v5, "objectForKey:", v10, (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
          abort();
        objc_msgSend(v12, "absoluteString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsString:", CFSTR("itunes-mastered"));
        v15 = CFSTR("itunes-mastered");
        if ((v14 & 1) != 0
          || (v16 = objc_msgSend(v13, "containsString:", CFSTR("parental-advisory")),
              v15 = CFSTR("parental.advisory"),
              v16))
        {
          objc_msgSend(v10, "setAccessibilityIdentifier:", v15);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v7);
  }

}

@end
