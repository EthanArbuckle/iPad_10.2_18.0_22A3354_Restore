@implementation NSObject(GKAdditions)

- (uint64_t)_gkPerformSelector:()GKAdditions
{
  return objc_msgSend(a1, "_gkPerformSelector:withNullableObject:", a3, 0);
}

- (void)_gkPerformSelector:()GKAdditions withNullableObject:
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelector:", a3);
  if (v8 && (unint64_t)objc_msgSend(v6, "numberOfArguments") >= 3)
    objc_msgSend(v7, "setArgument:atIndex:", &v8, 2);
  objc_msgSend(v7, "setTarget:", a1);
  objc_msgSend(v7, "retainArguments");
  objc_msgSend(v7, "invoke");

}

- (void)_gkPerformSelector:()GKAdditions withObject:withObject:
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a4;
  v8 = a5;
  v11 = v8;
  objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSelector:", a3);
  if (v12)
  {
    if ((unint64_t)objc_msgSend(v9, "numberOfArguments", v11, v12) >= 3)
    {
      objc_msgSend(v10, "setArgument:atIndex:", &v12, 2);
      if (v8)
      {
        if ((unint64_t)objc_msgSend(v9, "numberOfArguments") >= 4)
          objc_msgSend(v10, "setArgument:atIndex:", &v11, 3);
      }
    }
  }
  objc_msgSend(v10, "setTarget:", a1, v11);
  objc_msgSend(v10, "retainArguments");
  objc_msgSend(v10, "invoke");

}

- (void)_gkPerformSelector:()GKAdditions withObjects:
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelector:", a3);
  if (objc_msgSend(v6, "count"))
  {
    v9 = 2;
    do
    {
      objc_msgSend(v6, "objectAtIndex:", v9 - 2);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v12 && objc_msgSend(v7, "numberOfArguments") > v9)
        objc_msgSend(v8, "setArgument:atIndex:", &v12, v9);

      v10 = objc_msgSend(v6, "count");
      v11 = v9++ - 1;
    }
    while (v10 > v11);
  }
  objc_msgSend(v8, "setTarget:", a1);
  objc_msgSend(v8, "retainArguments");
  objc_msgSend(v8, "invoke");

}

- (uint64_t)_gkInvokeSelector:()GKAdditions
{
  return objc_msgSend(a1, "_gkInvokeSelector:withNullableObject:", a3, 0);
}

- (id)_gkInvokeSelector:()GKAdditions withNullableObject:
{
  void *v6;
  void *v7;
  id v8;
  id v10;
  id v11;

  v11 = a4;
  objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelector:", a3);
  if (v11 && (unint64_t)objc_msgSend(v6, "numberOfArguments") >= 3)
    objc_msgSend(v7, "setArgument:atIndex:", &v11, 2);
  objc_msgSend(v7, "setTarget:", a1);
  objc_msgSend(v7, "retainArguments");
  objc_msgSend(v7, "invoke");
  v10 = 0;
  objc_msgSend(v7, "getReturnValue:", &v10);
  v8 = v10;

  return v8;
}

@end
