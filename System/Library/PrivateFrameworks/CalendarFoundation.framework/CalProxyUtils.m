@implementation CalProxyUtils

+ (int64_t)replyBlockArgumentIndex:(id)a3
{
  void *v3;
  unint64_t v4;
  int64_t v5;

  objc_msgSend(a3, "methodSignature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfArguments");
  if (v4 < 3
    || (v5 = v4 - 1,
        strcmp("@?", (const char *)objc_msgSend(objc_retainAutorelease(v3), "getArgumentTypeAtIndex:", v4 - 1))))
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

+ (id)copyReplyBlockFromInvocation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v8;

  v4 = a3;
  v5 = objc_msgSend(a1, "replyBlockArgumentIndex:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    v8 = 0;
    objc_msgSend(v4, "getArgument:atIndex:", &v8, v5);
    v6 = (void *)objc_msgSend(v8, "copy");
  }

  return v6;
}

+ (void)callReplyHandler:(id)a3 ofInvocation:(id)a4 withErrorCode:(int64_t)a5
{
  int v5;
  id v7;
  id v8;
  const char *v9;
  const char *v10;
  NSObject *v11;
  unint64_t v12;
  unint64_t v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t i;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = _Block_signature(v7);
    if (v9 && (v10 = v9, *v9))
    {
      objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", v9);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = -[NSObject numberOfArguments](v11, "numberOfArguments");
      if (v12 >= 2)
      {
        v13 = v12;
        v11 = objc_retainAutorelease(v11);
        v14 = (const char *)-[NSObject getArgumentTypeAtIndex:](v11, "getArgumentTypeAtIndex:", 1);
        objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!strcmp("i", v14))
        {
          HIDWORD(v20) = v5;
          objc_msgSend(v15, "setArgument:atIndex:", (char *)&v20 + 4, 1);
        }
        else
        {
          +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            +[CalProxyUtils callReplyHandler:ofInvocation:withErrorCode:].cold.2((uint64_t)v14, v16, v17);

        }
        if (v13 >= 3)
        {
          for (i = 2; i != v13; ++i)
          {
            v19 = (char *)&v20 - ((-[NSObject frameLength](v11, "frameLength") + 15) & 0xFFFFFFFFFFFFFFF0);
            bzero(v19, -[NSObject frameLength](v11, "frameLength"));
            objc_msgSend(v15, "setArgument:atIndex:", v19, i);
          }
        }
        objc_msgSend(v15, "setTarget:", v7);
        objc_msgSend(v15, "invoke");

      }
    }
    else
    {
      +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[CalProxyUtils callReplyHandler:ofInvocation:withErrorCode:].cold.1(v8, v11);
    }

  }
}

+ (void)callReplyHandler:(void *)a1 ofInvocation:(NSObject *)a2 withErrorCode:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_2(&dword_18FC12000, a2, v4, "_Block_signature() failed for the block argument of invocation %@.", (uint8_t *)&v5);

}

+ (void)callReplyHandler:(uint64_t)a1 ofInvocation:(NSObject *)a2 withErrorCode:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_18FC12000, a2, a3, "The first argument of the reply block is of type %s, which is not an int. Ignoring!", (uint8_t *)&v3);
}

@end
