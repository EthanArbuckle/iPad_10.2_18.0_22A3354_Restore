@implementation RUITableViewRowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RUITableViewRow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("RUITableViewRow"), CFSTR("RUIElement"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RUIElement"), CFSTR("loadImage"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RUIElement"), CFSTR("URLAttributeForImageName: getScale:"), "@", "@", "^d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("_imageView:"), "@", "B", 0);

}

- (BOOL)loadImage
{
  _BOOL4 v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[4];
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)RUITableViewRowAccessibility;
  v3 = -[RUITableViewRowAccessibility loadImage](&v24, sel_loadImage);
  if (v3)
  {
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v23[3] = 0xBFF0000000000000;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__0;
    v21 = __Block_byref_object_dispose__0;
    v22 = 0;
    v4 = MEMORY[0x24BDAC760];
    AXPerformSafeBlock();
    v5 = (id)v18[5];
    _Block_object_dispose(&v17, 8);

    objc_msgSend(v5, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v17) = 0;
    -[RUITableViewRowAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tableCell"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_BYTE)v17)
      abort();
    objc_opt_class();
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__0;
    v21 = __Block_byref_object_dispose__0;
    v22 = 0;
    v10 = v9;
    AXPerformSafeBlock();
    v11 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
    __UIAccessibilityCastAsClass();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v12, "accessibilityIdentifier", v4, 3221225472, __41__RUITableViewRowAccessibility_loadImage__block_invoke_2, &unk_24FF296A8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("@"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "count"))
        {
          objc_msgSend(v14, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setAccessibilityIdentifier:", v15);

        }
      }
    }

    _Block_object_dispose(v23, 8);
  }
  return v3;
}

void __41__RUITableViewRowAccessibility_loadImage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "URLAttributeForImageName:getScale:", CFSTR("image"), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __41__RUITableViewRowAccessibility_loadImage__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_imageView:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
