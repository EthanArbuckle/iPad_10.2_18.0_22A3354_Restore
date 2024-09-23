@implementation SGTokenizerML

+ (void)enumerateTokensInString:(id)a3 block:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "enumerateTokensInString:withRange:block:", v6, 0, objc_msgSend(v6, "length"), v5);

}

+ (void)enumerateTokensInString:(id)a3 withRange:(_NSRange)a4 block:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  NSUInteger v23;
  NSUInteger v24;
  _QWORD block[6];

  length = a4.length;
  location = a4.location;
  v10 = a3;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGFutureFoundationFramework.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("str"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGFutureFoundationFramework.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

LABEL_3:
  v13 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SGTokenizerML_enumerateTokensInString_withRange_block___block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  if (enumerateTokensInString_withRange_block___pasOnceToken2 != -1)
    dispatch_once(&enumerateTokensInString_withRange_block___pasOnceToken2, block);
  v14 = (id)enumerateTokensInString_withRange_block___pasExprOnceResult;
  objc_msgSend(v14, "result");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __57__SGTokenizerML_enumerateTokensInString_withRange_block___block_invoke_3;
  v20[3] = &unk_24DDC4F30;
  v23 = location;
  v24 = length;
  v21 = v10;
  v22 = v12;
  v16 = v12;
  v19 = v10;
  objc_msgSend(v15, "runWithLockAcquired:", v20);

}

+ (id)tokenize:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __26__SGTokenizerML_tokenize___block_invoke;
  v8[3] = &unk_24DDC4F58;
  v6 = v5;
  v9 = v6;
  objc_msgSend(a1, "enumerateTokensInString:block:", v4, v8);

  return v6;
}

uint64_t __26__SGTokenizerML_tokenize___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __57__SGTokenizerML_enumerateTokensInString_withRange_block___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  __int128 v7;

  v2 = (void *)MEMORY[0x220753E80]();
  v3 = objc_alloc(MEMORY[0x24BE7A600]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__SGTokenizerML_enumerateTokensInString_withRange_block___block_invoke_2;
  v6[3] = &__block_descriptor_48_e20____PASQueueLock_8__0l;
  v7 = *(_OWORD *)(a1 + 32);
  v4 = objc_msgSend(v3, "initWithBlock:idleTimeout:", v6, 1.0);
  v5 = (void *)enumerateTokensInString_withRange_block___pasExprOnceResult;
  enumerateTokensInString_withRange_block___pasExprOnceResult = v4;

  objc_autoreleasePoolPop(v2);
}

void __57__SGTokenizerML_enumerateTokensInString_withRange_block___block_invoke_3(uint64_t a1, void *a2)
{
  __CFStringTokenizer *v3;
  void *v4;
  CFRange CurrentTokenRange;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  CFRange v10;

  v3 = a2;
  CFStringTokenizerSetString(v3, *(CFStringRef *)(a1 + 32), *(CFRange *)(a1 + 48));
  while (CFStringTokenizerAdvanceToNextToken(v3))
  {
    v4 = (void *)MEMORY[0x220753E80]();
    CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v3);
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:range:", v7, 0, CurrentTokenRange.location, CurrentTokenRange.length);

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    objc_autoreleasePoolPop(v4);
  }
  v10.location = 0;
  v10.length = 1;
  CFStringTokenizerSetString(v3, CFSTR("⌘"), v10);
  CFRelease(v3);

}

id __57__SGTokenizerML_enumerateTokensInString_withRange_block___block_invoke_2(uint64_t a1)
{
  const __CFArray *v2;
  const __CFArray *v3;
  const __CFString *ValueAtIndex;
  const __CFLocale *v5;
  CFStringTokenizerRef v6;
  id v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  void *v12;
  void *v13;
  CFRange v14;

  v2 = CFLocaleCopyPreferredLanguages();
  if (v2)
  {
    v3 = v2;
    if (CFArrayGetCount(v2))
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v3, 0);
      v5 = CFLocaleCreate(0, ValueAtIndex);
      CFRelease(v3);
      if (v5)
        goto LABEL_8;
    }
    else
    {
      CFRelease(v3);
    }
  }
  v5 = CFLocaleCopyCurrent();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("SGFutureFoundationFramework.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locale"));

  }
LABEL_8:
  v14.location = 0;
  v14.length = 0;
  v6 = CFStringTokenizerCreate(0, 0, v14, 0x810004uLL, v5);
  CFRelease(v5);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("SGFutureFoundationFramework.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("guardedTokenizer"));

  }
  v7 = objc_alloc(MEMORY[0x24BE7A620]);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("SGTokenizerML", v8);
  v10 = (void *)objc_msgSend(v7, "initWithGuardedData:serialQueue:", v6, v9);

  return v10;
}

@end
