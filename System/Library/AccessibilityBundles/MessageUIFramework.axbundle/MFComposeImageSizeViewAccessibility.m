@implementation MFComposeImageSizeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFComposeImageSizeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setSizeDescription:(id)a3 forScale:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MFComposeImageSizeViewAccessibility;
  -[MFComposeImageSizeViewAccessibility setSizeDescription:forScale:](&v18, sel_setSizeDescription_forScale_, v6, v4);
  if (setSizeDescription_forScale__onceToken != -1)
    dispatch_once(&setSizeDescription_forScale__onceToken, &__block_literal_global_1);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__0;
  v12[4] = __Block_byref_object_dispose__0;
  v13 = 0;
  AXPerformSafeBlock();
  -[MFComposeImageSizeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_segmentedControl"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v15[3];
  if (v9 < objc_msgSend(v8, "numberOfSegments"))
  {
    objc_msgSend(v8, "imageForSegmentAtIndex:", v15[3]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityLabel:", v11, v6, CFSTR("__AXStringForVariablesSentinel"));

  }
  _Block_object_dispose(v12, 8);

  _Block_object_dispose(&v14, 8);
}

void __67__MFComposeImageSizeViewAccessibility_setSizeDescription_forScale___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("MFComposeImageSizeView")));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("SMALL_SIZE_BAR_TITLE"), &stru_24FEFADD8, CFSTR("Main"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v1;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("MFComposeImageSizeView")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("MEDIUM_SIZE_BAR_TITLE"), &stru_24FEFADD8, CFSTR("Main"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("MFComposeImageSizeView")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LARGE_SIZE_BAR_TITLE"), &stru_24FEFADD8, CFSTR("Main"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("MFComposeImageSizeView")));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ACTUAL_SIZE_BAR_TITLE"), &stru_24FEFADD8, CFSTR("Main"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)setSizeDescription_forScale__scaleLabels;
  setSizeDescription_forScale__scaleLabels = v8;

}

void __67__MFComposeImageSizeViewAccessibility_setSizeDescription_forScale___block_invoke_196(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_scaleLabelIndexForScale:", *(unsigned int *)(a1 + 56));
  objc_msgSend((id)setSizeDescription_forScale__scaleLabels, "objectAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)accessibilityElementsHidden
{
  void *v2;
  float v3;
  BOOL v4;

  -[MFComposeImageSizeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("alpha"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3 != 1.0;

  return v4;
}

@end
