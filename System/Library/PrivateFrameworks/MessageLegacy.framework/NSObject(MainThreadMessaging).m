@implementation NSObject(MainThreadMessaging)

- (uint64_t)mf_performOnewaySelectorInMainThread:()MainThreadMessaging withObject:withObject:
{
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;

  v12 = a5;
  v13 = a4;
  v8 = (void *)objc_msgSend(a1, "methodSignatureForSelector:");
  if (!v8)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MainThread.m"), 24, CFSTR("Couldn't find signature for target %p selector %@"), a1, NSStringFromSelector(a3));
  v9 = objc_msgSend(v8, "numberOfArguments");
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v8);
  objc_msgSend(v10, "retainArguments");
  objc_msgSend(v10, "setTarget:", a1);
  objc_msgSend(v10, "setSelector:", a3);
  if (v9 >= 3)
  {
    objc_msgSend(v10, "setArgument:atIndex:", &v13, 2);
    if (v9 != 3)
      objc_msgSend(v10, "setArgument:atIndex:", &v12, 3);
  }
  return objc_msgSend(v10, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_invoke, 0, 0);
}

@end
