@implementation SiriUIAceObjectControllerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriUIAceObjectControllerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityIdentifier
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[SiriUIAceObjectControllerCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("aceViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("aceObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  v4 = v3;
  AXPerformSafeBlock();
  v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  if (!v5)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy_;
    v12 = __Block_byref_object_dispose_;
    v13 = 0;
    v7 = v4;
    AXPerformSafeBlock();
    v5 = (id)v9[5];

    _Block_object_dispose(&v8, 8);
  }

  return v5;
}

void __69__SiriUIAceObjectControllerCellAccessibility_accessibilityIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "propertyForKey:", CFSTR("dialogIdentifier"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __69__SiriUIAceObjectControllerCellAccessibility_accessibilityIdentifier__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "propertyForKey:", CFSTR("$group"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

@end
