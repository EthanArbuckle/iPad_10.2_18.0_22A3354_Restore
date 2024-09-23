@implementation AXClientSideValueTransformer

+ (void)initialize
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___AXClientSideValueTransformer;
  objc_msgSendSuper2(&v2, sel_initialize);
}

+ (BOOL)canTransformAttribute:(int64_t)a3
{
  BOOL result;

  result = 1;
  if (a3 > 2185)
  {
    if (a3 == 2186 || a3 == 5039 || a3 == 95006)
      return result;
    return 0;
  }
  if (a3 != 2001 && a3 != 2006)
    return 0;
  return result;
}

+ (id)transformValue:(id)a3 forAttribute:(int64_t)a4 withElement:(__AXUIElement *)a5
{
  id v7;
  void *v8;
  uint64_t v9;

  v7 = a3;
  v8 = 0;
  if (a4 <= 2185)
  {
    if (a4 == 2001 || a4 == 2006)
    {
      objc_msgSend(a1, "_transformUserString:", v7);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  else
  {
    if (a4 == 2186)
    {
      objc_msgSend(a1, "_transformArrayWithUserStrings:", v7);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (a4 == 5039 || a4 == 95006)
    {
      objc_msgSend(a1, "_transformAutomationDictionary:", v7);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v8 = (void *)v9;
    }
  }

  return v8;
}

+ (id)_transformUserString:(id)a3
{
  id v3;
  id v4;
  void (*v5)(id, void *);
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v5 = (void (*)(id, void *))getAXPerformPrivilegedAttributedStringTransformationsSymbolLoc_ptr;
    v12 = getAXPerformPrivilegedAttributedStringTransformationsSymbolLoc_ptr;
    if (!getAXPerformPrivilegedAttributedStringTransformationsSymbolLoc_ptr)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __getAXPerformPrivilegedAttributedStringTransformationsSymbolLoc_block_invoke;
      v8[3] = &unk_1E69194D0;
      v8[4] = &v9;
      __getAXPerformPrivilegedAttributedStringTransformationsSymbolLoc_block_invoke((uint64_t)v8);
      v5 = (void (*)(id, void *))v10[3];
    }
    _Block_object_dispose(&v9, 8);
    if (!v5)
      +[AXClientSideValueTransformer _transformUserString:].cold.1();
    v5(v4, &unk_1E6926B60);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_transformArrayWithUserStrings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1B5E4B708]();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__AXClientSideValueTransformer__transformArrayWithUserStrings___block_invoke;
    v8[3] = &__block_descriptor_40_e8__16__0_8l;
    v8[4] = a1;
    objc_msgSend(v4, "ax_mappedArrayUsingBlock:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __63__AXClientSideValueTransformer__transformArrayWithUserStrings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_transformUserString:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

+ (id)_transformAutomationDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  void *context;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    context = (void *)MEMORY[0x1B5E4B708]();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UIAccessibilitySnapshotKeyAttributes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E69269F8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_transformUserString:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, &unk_1E69269F8);

    objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E6926A10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_transformUserString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, &unk_1E6926A10);

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UIAccessibilitySnapshotKeyChildren"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    if (objc_msgSend(v12, "count"))
    {
      v13 = 0;
      do
      {
        objc_msgSend(v12, "objectAtIndex:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(a1, "_transformUserString:", v14);
        else
          objc_msgSend(a1, "_transformAutomationDictionary:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v12, "replaceObjectAtIndex:withObject:", v13, v15);

        ++v13;
      }
      while (v13 < objc_msgSend(v12, "count"));
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("UIAccessibilitySnapshotKeyAttributes"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("UIAccessibilitySnapshotKeyChildren"));

    objc_autoreleasePoolPop(context);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)_transformUserString:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *soft_AXPerformPrivilegedAttributedStringTransformations(NSString *__strong, NSArray *__strong)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXClientSideValueTransformer.m"), 17, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
