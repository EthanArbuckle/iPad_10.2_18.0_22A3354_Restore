@implementation NSObject(SafeInitializer)

- (BOOL)ik_initInvocation:()SafeInitializer
{
  id v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v8;

  v4 = a3;
  v5 = v4;
  v6 = 0;
  if (v4)
  {
    objc_msgSend(v4, "retainArguments");
    objc_msgSend(v5, "invokeWithTarget:", a1);
    v8 = 0;
    objc_msgSend(v5, "getReturnValue:", &v8);
    if (v8)
      v6 = 1;
  }

  return v6;
}

- (id)ik_initWithSelectorString:()SafeInitializer arguments:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;

  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ik_invocationforSelectorString:argumentsPointerValue:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(a1, "ik_initInvocation:", v9) & 1) != 0)
  {
    v10 = a1;
  }
  else
  {
    ITMLKitGetLogObject(5);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[NSObject(SafeInitializer) ik_initWithSelectorString:arguments:].cold.1();

    v10 = 0;
  }

  return v10;
}

- (id)ik_initWithInitializers:()SafeInitializer
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "ik_invocationForSelectorCandidates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "ik_initInvocation:", v5) & 1) != 0)
  {
    v6 = a1;
  }
  else
  {
    ITMLKitGetLogObject(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[NSObject(SafeInitializer) ik_initWithInitializers:].cold.1((uint64_t)a1, v4, v7);

    v6 = 0;
  }

  return v6;
}

+ (id)ik_invocationForSelectorCandidates:()SafeInitializer
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v3);
      v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
      v9 = (void *)objc_opt_class();
      objc_msgSend(v3, "objectForKey:", v8, (_QWORD)v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ik_invocationforSelectorString:argumentsPointerValue:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

+ (id)ik_invocationforSelectorString:()SafeInitializer argumentsPointerValue:
{
  NSString *v5;
  id v6;
  SEL v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;

  v5 = a3;
  v6 = a4;
  v7 = NSSelectorFromString(v5);
  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", v7))
  {
    v8 = (void *)MEMORY[0x1E0C99DB8];
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invocationWithMethodSignature:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "setSelector:", v7);
      v11 = objc_msgSend(v6, "pointerValue");
      if (v11)
      {
        v12 = v11;
        objc_msgSend(v10, "methodSignature");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "numberOfArguments");

        if (v14 != 2)
        {
          v15 = 0;
          do
          {
            objc_msgSend(v10, "setArgument:atIndex:", *(_QWORD *)(v12 + 8 * v15), v15 + 2);
            ++v15;
            objc_msgSend(v10, "methodSignature");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "numberOfArguments") - 2;

          }
          while (v17 > v15);
        }
      }
    }
  }
  else
  {
    ITMLKitGetLogObject(5);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      +[NSObject(SafeInitializer) ik_invocationforSelectorString:argumentsPointerValue:].cold.1();

    v10 = 0;
  }

  return v10;
}

- (void)ik_initWithSelectorString:()SafeInitializer arguments:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_1D95F2000, v0, (uint64_t)v0, "No init invocation selector \"%@\" exists for %@", v1);
}

- (void)ik_initWithInitializers:()SafeInitializer .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_0_4(&dword_1D95F2000, a3, v6, "No init invocation selector exists for %@ -> %@", (uint8_t *)&v7);

}

+ (void)ik_invocationforSelectorString:()SafeInitializer argumentsPointerValue:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_1D95F2000, v0, (uint64_t)v0, "No invocation selector \"%@\" exists for %@", v1);
}

@end
