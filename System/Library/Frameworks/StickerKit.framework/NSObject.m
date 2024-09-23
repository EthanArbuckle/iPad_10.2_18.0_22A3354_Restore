@implementation NSObject

void __69__NSObject_STKLoggable__stk_loggingDescriptionFromLoggable_isPretty___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (*(_BYTE *)(a1 + 48)
    && (objc_opt_class(), ITKDynamicCast(), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = v6;
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v6, "itk_prettyDescriptionWithTabLevel:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("\t%@ = %@\n"), v10, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", *(_QWORD *)(a1 + 40), v10, v5);
  }

}

@end
