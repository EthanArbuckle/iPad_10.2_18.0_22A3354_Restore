@implementation NSInvocation(FPCopy)

- (id)fp_copy
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t i;
  id v10;

  v2 = (void *)MEMORY[0x1E0C99DB8];
  objc_msgSend(a1, "methodSignature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invocationWithMethodSignature:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "methodSignature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfArguments");

  objc_msgSend(a1, "methodSignature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = malloc_type_calloc(1uLL, objc_msgSend(v7, "frameLength"), 0x12649B63uLL);

  if (v8)
  {
    if (v6 >= 1)
    {
      for (i = 0; i != v6; ++i)
      {
        objc_msgSend(a1, "getArgument:atIndex:", v8, i);
        objc_msgSend(v4, "setArgument:atIndex:", v8, i);
      }
    }
    free(v8);
    if ((objc_msgSend(a1, "argumentsRetained") & 1) != 0)
      objc_msgSend(v4, "retainArguments");
    v10 = v4;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
