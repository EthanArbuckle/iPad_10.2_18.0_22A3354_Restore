@implementation NSInvocation(GKProxyHelpers)

- (uint64_t)_gkReplyHandlerInvocation
{
  void *v2;
  uint64_t v3;
  uint64_t v5;

  v2 = (void *)objc_msgSend(a1, "methodSignature");
  v3 = objc_msgSend(v2, "numberOfArguments") - 1;
  if (objc_msgSend(v2, "_gkTakesBlockAtIndex:", v3)
    && (v5 = 0, objc_msgSend(a1, "getArgument:atIndex:", &v5, v3), v5))
  {
    return objc_msgSend(MEMORY[0x1E0C99DB8], "_gkInvocationWithBlock:");
  }
  else
  {
    return 0;
  }
}

- (void)_gkCopyArguments
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t i;
  uint64_t v10;
  id v11;

  if (objc_getAssociatedObject(a1, (const void *)kGKArgumentIndexesCopied))
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Must only copy arguments once per invocation : %@"), a1);
    v4 = objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (indexesCopied == nil)\n[%s (%s:%d)]"), v3, "-[NSInvocation(GKProxyHelpers) _gkCopyArguments]", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/NSInvocation+GKAdditions+NoARC.m"), "lastPathComponent"), "UTF8String"), 23);
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v4);
  }
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v6 = (void *)objc_msgSend(a1, "methodSignature");
  v7 = objc_msgSend(v6, "numberOfArguments");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2 * v7);
  if (v7 >= 3)
  {
    for (i = 2; i != v7; ++i)
    {
      if (*(_BYTE *)objc_msgSend(v6, "getArgumentTypeAtIndex:", i) == 64)
      {
        v11 = 0;
        objc_msgSend(a1, "getArgument:atIndex:", &v11, i);
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EF4A6110))
        {
          objc_msgSend(v5, "addIndex:", i);
          v10 = 0;
          v10 = objc_msgSend(v11, "copy");
          objc_msgSend(a1, "setArgument:atIndex:", &v10, i);
          objc_msgSend(v8, "addObject:", v10);
        }
      }
    }
  }
  objc_setAssociatedObject(a1, (const void *)kGKArgumentIndexesCopied, v5, (void *)0x301);
  objc_msgSend(a1, "retainArguments");

}

- (void)_gkClearCopiedArguments
{
  id AssociatedObject;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];

  AssociatedObject = objc_getAssociatedObject(a1, (const void *)kGKArgumentIndexesCopied);
  if (!AssociatedObject)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Must release arguments only once per invocation for which _gkCopyArguments has been called : %@"), a1);
    v5 = objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (indexesCopied != nil)\n[%s (%s:%d)]"), v4, "-[NSInvocation(GKProxyHelpers) _gkClearCopiedArguments]", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/NSInvocation+GKAdditions+NoARC.m"), "lastPathComponent"), "UTF8String"), 60);
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v5);
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__NSInvocation_GKProxyHelpers___gkClearCopiedArguments__block_invoke;
  v6[3] = &unk_1E75B5F18;
  v6[4] = a1;
  objc_msgSend(AssociatedObject, "enumerateIndexesUsingBlock:", v6);
  objc_setAssociatedObject(a1, (const void *)kGKArgumentIndexesCopied, 0, (void *)0x301);
}

- (uint64_t)_gkInvokeOnceWithTarget:()GKProxyHelpers
{
  objc_msgSend(a1, "_gkClearTarget");
  objc_msgSend(a1, "invokeWithTarget:", a3);
  return objc_msgSend(a1, "_gkClearTarget");
}

- (uint64_t)_gkClearTarget
{
  return objc_msgSend(a1, "setTarget:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
}

- (uint64_t)_gkInvokeOnce
{
  objc_msgSend(a1, "invoke");
  return objc_msgSend(a1, "_gkClearTarget");
}

- (void)_gkCallbackWithError:()GKProxyHelpers queue:
{
  _QWORD block[5];

  objc_msgSend(a1, "_gkPrepareForCallWithError:");
  objc_msgSend(a1, "retainArguments");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__NSInvocation_GKProxyHelpers___gkCallbackWithError_queue___block_invoke;
  block[3] = &unk_1E75B2460;
  block[4] = a1;
  dispatch_async(a4, block);
}

- (unint64_t)_gkPrepareForCallWithError:()GKProxyHelpers
{
  void *v4;
  unint64_t result;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  uint64_t *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = a3;
  v4 = (void *)objc_msgSend(a1, "methodSignature");
  result = objc_msgSend(v4, "numberOfArguments", 0);
  v6 = result - 3;
  if (result >= 3)
  {
    v7 = 0;
    v8 = result - 1;
    v9 = result - 2;
    do
    {
      v10 = (_BYTE *)objc_msgSend(v4, "getArgumentTypeAtIndex:", v7 + 2);
      if (v6 == v7 && *v10 == 64)
      {
        v11 = &v15;
        v12 = a1;
        v13 = v8;
      }
      else
      {
        v11 = &v14;
        v12 = a1;
        v13 = v7 + 2;
      }
      result = objc_msgSend(v12, "setArgument:atIndex:", v11, v13);
      ++v7;
    }
    while (v9 != v7);
  }
  return result;
}

@end
