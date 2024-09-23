@implementation RemoteUITableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RemoteUITableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("_imageView:"), "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("_textLabel:"), "@", "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("RUITableView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RUITableView"), CFSTR("objectModelRowForIndexPath:"), "@", "@", 0);

}

- (void)_accessoriesChanged
{
  void *v3;
  int v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RemoteUITableViewCellAccessibility;
  -[RemoteUITableViewCellAccessibility _accessoriesChanged](&v6, sel__accessoriesChanged);
  -[RemoteUITableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_remoteUIAccessoryType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if ((v4 & 0xFFFFFFFD) == 1)
  {
    -[RemoteUITableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_remoteUIAccessoryView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsAccessibilityElement:", 0);

  }
}

- (void)setRemoteUIAccessoryView:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RemoteUITableViewCellAccessibility;
  -[RemoteUITableViewCellAccessibility setRemoteUIAccessoryView:](&v7, sel_setRemoteUIAccessoryView_, v4);
  -[RemoteUITableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_remoteUIAccessoryType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if ((v6 & 0xFFFFFFFD) == 1)
    objc_msgSend(v4, "setIsAccessibilityElement:", 0);

}

- (unint64_t)accessibilityTraits
{
  void *v3;
  int v4;
  unint64_t *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  objc_super v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  RemoteUITableViewCellAccessibility *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  __int16 v34;

  -[RemoteUITableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_remoteUIAccessoryType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (v4 == 1)
  {
    v5 = (unint64_t *)MEMORY[0x24BDF73B0];
    return *v5;
  }
  if (v4 == 3)
  {
    v5 = (unint64_t *)MEMORY[0x24BDF7400];
    return *v5;
  }
  -[RemoteUITableViewCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v28) = 0;
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __57__RemoteUITableViewCellAccessibility_accessibilityTraits__block_invoke;
  v23 = &unk_24FF29680;
  v27 = &v28;
  v10 = v9;
  v24 = v10;
  v11 = v7;
  v25 = v11;
  v26 = self;
  AXPerformSafeBlock();
  v12 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  __UIAccessibilitySafeClass();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v34
    || (objc_msgSend(v13, "safeValueForKey:", CFSTR("attributes")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        __UIAccessibilitySafeClass(),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        HIBYTE(v34)))
  {
    abort();
  }
  objc_msgSend(v15, "objectForKey:", CFSTR("class"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("link"));

  if (v17)
  {
    v6 = (id)*MEMORY[0x24BDF73B0];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)RemoteUITableViewCellAccessibility;
    v6 = -[RemoteUITableViewCellAccessibility accessibilityTraits](&v19, sel_accessibilityTraits);
  }

  return (unint64_t)v6;
}

void __57__RemoteUITableViewCellAccessibility_accessibilityTraits__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "indexPathForCell:", *(_QWORD *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectModelRowForIndexPath:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_privateAccessibilityCustomActions
{
  id v3;
  void *v4;
  objc_super *v5;
  void *v6;
  RemoteUITableViewCellAccessibility *v8;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v9[2] = MEMORY[0x24BDAC760];
  v9[3] = 3221225472;
  v9[4] = __72__RemoteUITableViewCellAccessibility__privateAccessibilityCustomActions__block_invoke;
  v9[5] = &unk_24FF296A8;
  v9[6] = self;
  v9[7] = &v10;
  AXPerformSafeBlock();
  v3 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  objc_msgSend(v3, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v9[0] = self;
    v5 = (objc_super *)v9;
  }
  else
  {
    v8 = self;
    v5 = (objc_super *)&v8;
  }
  v5->super_class = (Class)RemoteUITableViewCellAccessibility;
  -[objc_super _privateAccessibilityCustomActions](v5, sel__privateAccessibilityCustomActions, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __72__RemoteUITableViewCellAccessibility__privateAccessibilityCustomActions__block_invoke(uint64_t a1)
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

- (id)accessibilityLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  objc_super v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  RemoteUITableViewCellAccessibility *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __56__RemoteUITableViewCellAccessibility_accessibilityLabel__block_invoke;
  v17 = &unk_24FF296A8;
  v18 = self;
  v19 = &v20;
  AXPerformSafeBlock();
  v3 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = 0;
  objc_opt_class();
  -[RemoteUITableViewCellAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("subviews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &__block_literal_global_1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v20)
    abort();
  v13.receiver = self;
  v13.super_class = (Class)RemoteUITableViewCellAccessibility;
  -[RemoteUITableViewCellAccessibility accessibilityLabel](&v13, sel_accessibilityLabel);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __56__RemoteUITableViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
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

uint64_t __56__RemoteUITableViewCellAccessibility_accessibilityLabel__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
