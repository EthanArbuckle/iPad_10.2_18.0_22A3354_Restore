@implementation NSString

void __94__NSString_AXRealityFoundationUtilities___accessibilityEnumerateDelayedDescriptionsWithBlock___block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  NSObject *v3;
  id v4;

  v4 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\{\\{\\{delay:([0-9]+(\\.[0-9]+)?)\\}\\}\\}"), 1, &v4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v4;
  v2 = (void *)_accessibilityEnumerateDelayedDescriptionsWithBlock__regex;
  _accessibilityEnumerateDelayedDescriptionsWithBlock__regex = v0;

  if (!_accessibilityEnumerateDelayedDescriptionsWithBlock__regex)
  {
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __94__NSString_AXRealityFoundationUtilities___accessibilityEnumerateDelayedDescriptionsWithBlock___block_invoke_cold_1((uint64_t)v1, v3);

  }
}

void __94__NSString_AXRealityFoundationUtilities___accessibilityEnumerateDelayedDescriptionsWithBlock___block_invoke_178(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v3 = a2;
  v4 = objc_msgSend(v3, "rangeAtIndex:", 1);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL && v5 == 0)
  {
    AXLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __94__NSString_AXRealityFoundationUtilities___accessibilityEnumerateDelayedDescriptionsWithBlock___block_invoke_178_cold_1(v10);

    v9 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

  }
  v11 = objc_msgSend(v3, "range");
  v13 = v12;

  v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v14, v11 - v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
    (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                             + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11 + v13;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v9;

}

void __94__NSString_AXRealityFoundationUtilities___accessibilityEnumerateDelayedDescriptionsWithBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_23293E000, a2, OS_LOG_TYPE_ERROR, "Unable to create regular expression: %@", (uint8_t *)&v2, 0xCu);
}

void __94__NSString_AXRealityFoundationUtilities___accessibilityEnumerateDelayedDescriptionsWithBlock___block_invoke_178_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23293E000, log, OS_LOG_TYPE_ERROR, "Problem detecting delay string. Using delay of 0.", v1, 2u);
}

@end
