@implementation NSInvocation(FPExtensions)

- (void)fp_sanitizeError
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  id v5;

  objc_msgSend(a1, "methodSignature");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "numberOfArguments");
  if (v2)
  {
    v3 = v2;
    for (i = 0; i != v3; ++i)
    {
      if (!strncmp((const char *)objc_msgSend(objc_retainAutorelease(v5), "getArgumentTypeAtIndex:", i), "@\"NSError\", 0xAuLL))objc_msgSend(a1, "fp_transformArgumentAtIndex:withBlock:", i, &__block_literal_global_37);
    }
  }

}

- (void)fp_transformArgumentAtIndex:()FPExtensions withBlock:
{
  void (**v6)(_QWORD);
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v12 = 0;
  objc_msgSend(a1, "getArgument:atIndex:", &v12, a3);
  if (v12)
  {
    v6[2](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 != v12)
    {
      v8 = a1;
      v9 = v7;
      v10 = v8;
      objc_sync_enter(v10);
      objc_getAssociatedObject(v10, &retainedArgumentsKey);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_setAssociatedObject(v10, &retainedArgumentsKey, v11, (void *)0x301);
      }
      v13 = v9;
      objc_msgSend(v10, "setArgument:atIndex:", &v13, a3);
      objc_msgSend(v11, "addObject:", v9);

      objc_sync_exit(v10);
    }

  }
}

- (void)fp_zeroOutReplyBlockArgumentsWithError:()FPExtensions
{
  void *v4;
  unint64_t v5;
  size_t v6;
  char *v7;
  uint64_t i;
  uint64_t v9;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x1E0C80C00];
  v10[0] = a3;
  objc_msgSend(a1, "methodSignature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfArguments");
  v6 = objc_msgSend(v4, "frameLength");
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v7, v6);
  bzero(v7, objc_msgSend(v4, "frameLength"));
  if (v5 >= 2)
  {
    for (i = 1; i != v5; ++i)
      objc_msgSend(a1, "setArgument:atIndex:", v7, i);
  }
  v9 = objc_msgSend(v4, "fp_indexOfLastArgumentWithType:", "@\"NSError\");
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a1, "setArgument:atIndex:", v10, v9);

}

@end
