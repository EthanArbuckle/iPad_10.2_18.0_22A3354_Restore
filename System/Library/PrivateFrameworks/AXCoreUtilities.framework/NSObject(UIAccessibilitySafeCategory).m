@implementation NSObject(UIAccessibilitySafeCategory)

- (ptrdiff_t)safeIvarForKey:()UIAccessibilitySafeCategory
{
  id v4;
  objc_class *v5;
  id v6;
  objc_ivar *InstanceVariable;
  ptrdiff_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = objc_retainAutorelease(v4);
  InstanceVariable = class_getInstanceVariable(v5, (const char *)objc_msgSend(v6, "UTF8String"));
  if (InstanceVariable)
  {
    v8 = ivar_getOffset(InstanceVariable) + a1;
  }
  else
  {
    if (AXShouldReportValidationErrors())
    {
      +[AXValidationManager sharedInstance](AXValidationManager, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sendExceptionForSafeIVarKey:onTarget:overrideProcessName:", v6, v11, 0);

    }
    if (AXShouldLogValidationErrors())
    {
      AXLogValidations();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[NSObject(UIAccessibilitySafeCategory) safeIvarForKey:].cold.2((uint64_t)v6, a1, v12);

    }
    if (AXShouldCrashOnValidationErrors())
    {
      AXLogValidations();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[NSObject(UIAccessibilitySafeCategory) safeIvarForKey:].cold.1((uint64_t)v6, a1, v13);

    }
    v8 = 0;
  }

  return v8;
}

- (uint64_t)safeBoolForKey:()UIAccessibilitySafeCategory
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "i", "c", "B", "B", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (uint64_t)safeIntForKey:()UIAccessibilitySafeCategory
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "i", "I", "I", "q", "Q", "q", "Q", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "intValue");
  return v6;
}

- (uint64_t)safeUnsignedIntForKey:()UIAccessibilitySafeCategory
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "i", "I", "I", "q", "Q", "q", "Q", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntValue");
  return v6;
}

- (uint64_t)safeIntegerForKey:()UIAccessibilitySafeCategory
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "q", "Q", "c", "s", "i", "q", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

- (uint64_t)safeUnsignedIntegerForKey:()UIAccessibilitySafeCategory
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "Q", "q", "Q", "C", "S", "I", "Q", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  return v6;
}

- (float)safeFloatForKey:()UIAccessibilitySafeCategory
{
  id v4;
  void *v5;
  float v6;
  float v7;

  v4 = a3;
  objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "f", "d", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "floatValue");
  v7 = v6;

  return v7;
}

- (double)safeDoubleForKey:()UIAccessibilitySafeCategory
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "d", "f", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (uint64_t)safeRangeForKey:()UIAccessibilitySafeCategory
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(), "{_NSRange=QQ}");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "rangeValue");
  return v6;
}

- (double)safeCGPointForKey:()UIAccessibilitySafeCategory
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(), "{CGPoint=dd}");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pointValue");
  v7 = v6;

  return v7;
}

- (double)safeCGSizeForKey:()UIAccessibilitySafeCategory
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(), "{CGSize=dd}");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sizeValue");
  v7 = v6;

  return v7;
}

- (double)safeCGRectForKey:()UIAccessibilitySafeCategory
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(), "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "rectValue");
  v7 = v6;

  return v7;
}

- (id)safeStringForKey:()UIAccessibilitySafeCategory
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)safeArrayForKey:()UIAccessibilitySafeCategory
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)safeSetForKey:()UIAccessibilitySafeCategory
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)safeDictionaryForKey:()UIAccessibilitySafeCategory
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)safeUIViewForKey:()UIAccessibilitySafeCategory
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, NSClassFromString(CFSTR("UIView")), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)safeValueForKey:()UIAccessibilitySafeCategory
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__NSObject_UIAccessibilitySafeCategory__safeValueForKey___block_invoke;
  v8[3] = &unk_1E28C2DB0;
  v10 = &v11;
  v8[4] = a1;
  v5 = v4;
  v9 = v5;
  objc_msgSend(a1, "_accessibilityPerformSafeValueKeyBlock:withKey:onClass:", v8, v5, objc_opt_class());
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)safeValueForKeyPath:()UIAccessibilitySafeCategory
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__NSObject_UIAccessibilitySafeCategory__safeValueForKeyPath___block_invoke;
  v8[3] = &unk_1E28C2DB0;
  v10 = &v11;
  v8[4] = a1;
  v5 = v4;
  v9 = v5;
  objc_msgSend(a1, "_accessibilityPerformSafeValueKeyBlock:withKey:onClass:", v8, v5, objc_opt_class());
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (uint64_t)safeIntegerForIvarKey:()UIAccessibilitySafeCategory onClass:
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__NSObject_UIAccessibilitySafeCategory__safeIntegerForIvarKey_onClass___block_invoke;
  v10[3] = &unk_1E28C3A90;
  v14 = a4;
  v7 = v6;
  v12 = a1;
  v13 = &v15;
  v11 = v7;
  objc_msgSend(a1, "_accessibilityPerformSafeValueKeyBlock:withKey:onClass:", v10, v7, a4);
  v8 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (void)_accessibilityPerformSafeValueKeyBlock:()UIAccessibilitySafeCategory withKey:onClass:
{
  void (**v5)(_QWORD);
  id v6;

  v5 = a3;
  v6 = a4;
  v5[2](v5);

}

- (void)safeIvarForKey:()UIAccessibilitySafeCategory .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v4;
  void *v5;
  uint8_t v6[24];

  v4 = (objc_class *)OUTLINED_FUNCTION_3_1();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  _os_log_fault_impl(&dword_18EBEC000, a3, OS_LOG_TYPE_FAULT, "UIAccessibility Error. Could not safe access iVar: %{public}@ on class: %{public}@", v6, 0x16u);

  OUTLINED_FUNCTION_5();
}

- (void)safeIvarForKey:()UIAccessibilitySafeCategory .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v4;
  void *v5;
  uint8_t v6[24];

  v4 = (objc_class *)OUTLINED_FUNCTION_3_1();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_18EBEC000, a3, OS_LOG_TYPE_ERROR, "UIAccessibility Error. Could not safe access iVar: %{public}@ on class: %{public}@", v6, 0x16u);

  OUTLINED_FUNCTION_5();
}

@end
