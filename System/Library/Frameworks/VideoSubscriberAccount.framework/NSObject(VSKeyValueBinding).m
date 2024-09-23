@implementation NSObject(VSKeyValueBinding)

- (void)vs_bind:()VSKeyValueBinding toObject:withKeyPath:options:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  VSBindingInfo *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v16)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The binding parameter must not be nil."));
    if (v10)
    {
LABEL_3:
      if (v11)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The keyPath parameter must not be nil."));
      if (v12)
        goto LABEL_5;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The options parameter must not be nil."));
      goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The observable parameter must not be nil."));
  if (!v11)
    goto LABEL_8;
LABEL_4:
  if (!v12)
    goto LABEL_9;
LABEL_5:
  v13 = (void *)MEMORY[0x1D8236758]();
  objc_msgSend(a1, "vs_binderCreatingIfNeeded:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[VSBindingInfo initWithObservedObject:keyPath:options:]([VSBindingInfo alloc], "initWithObservedObject:keyPath:options:", v10, v11, v12);
  objc_msgSend(v14, "establishBinding:withInfo:", v16, v15);

  objc_autoreleasePoolPop(v13);
}

- (void)vs_unbind:()VSKeyValueBinding
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (!v4)
    v4 = (id)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The binding parameter must not be nil."));
  v5 = (void *)MEMORY[0x1D8236758](v4);
  objc_msgSend(a1, "vs_binderCreatingIfNeeded:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tearDownBinding:", v7);

  objc_autoreleasePoolPop(v5);
}

- (id)vs_valueForBinding:()VSKeyValueBinding
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (!v4)
    v4 = (id)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The binding parameter must not be nil."));
  v6 = (void *)MEMORY[0x1D8236758](v4);
  objc_msgSend(a1, "vs_binderCreatingIfNeeded:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForBinding:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v6);
  return v8;
}

- (void)vs_setValue:()VSKeyValueBinding forBinding:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6)
    v6 = (id)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The binding parameter must not be nil."));
  v8 = (void *)MEMORY[0x1D8236758](v6);
  objc_msgSend(a1, "vs_binderCreatingIfNeeded:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forBinding:", v10, v7);

  objc_autoreleasePoolPop(v8);
}

@end
