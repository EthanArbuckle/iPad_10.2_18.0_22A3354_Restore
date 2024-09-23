@implementation BMDSLTransformInvocation

+ (id)invokeTransformWithInput:(id)a3 selector:(SEL)a4 target:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  objc_class *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;

  v7 = a3;
  v26 = v7;
  v8 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = &stru_1E5E36E08;
    }
    v21 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("Target %@ does not have selector %@"), v17, v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99768];
    v20 = (const __CFString *)v23;
LABEL_17:
    objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v20, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  objc_msgSend(v8, "methodSignatureForSelector:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (objc_msgSend(v9, "numberOfArguments") == 3)
    {
      objc_msgSend(v10, "setArgument:atIndex:", &v26, 2);
      goto LABEL_11;
    }
    if (objc_msgSend(v9, "numberOfArguments") == 2)
      goto LABEL_11;
    goto LABEL_14;
  }
  v11 = v7;
  v12 = objc_msgSend(v11, "count");
  if (v12 != objc_msgSend(v9, "numberOfArguments") - 2)
  {
LABEL_14:
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99768];
    v20 = CFSTR("Invalid transform arguments.");
    goto LABEL_17;
  }
  if (objc_msgSend(v11, "count"))
  {
    v13 = 0;
    do
    {
      objc_msgSend(v11, "objectAtIndex:", v13);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setArgument:atIndex:", &v25, v13 + 2);

      ++v13;
    }
    while (objc_msgSend(v11, "count") > v13);
  }

LABEL_11:
  objc_msgSend(v10, "setTarget:", v8);
  objc_msgSend(v10, "setSelector:", a4);
  objc_msgSend(v10, "invoke");
  v25 = 0;
  objc_msgSend(v10, "getReturnValue:", &v25);
  v14 = v25;

  return v14;
}

@end
