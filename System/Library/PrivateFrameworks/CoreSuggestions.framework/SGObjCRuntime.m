@implementation SGObjCRuntime

+ (unint64_t)arityForBlockAtIndex:(unint64_t)a3 inSelector:(SEL)a4 instanceMethod:(BOOL)a5 ofProtocol:(id)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  unint64_t v12;
  char v14;

  v6 = a5;
  v14 = 0;
  v10 = a6;
  v11 = (void *)objc_opt_new();
  v12 = objc_msgSend(a1, "_arityForBlockAtIndex:inSelector:instanceMethod:ofProtocol:seenProtocols:foundSelector:", a3, a4, v6, v10, v11, &v14);

  return v12;
}

+ (unint64_t)_arityForBlockAtIndex:(unint64_t)a3 inSelector:(SEL)a4 instanceMethod:(BOOL)a5 ofProtocol:(id)a6 seenProtocols:(id)a7 foundSelector:(BOOL *)a8
{
  _BOOL8 v10;
  Protocol *v13;
  id v14;
  void *v15;
  uint64_t MethodTypeEncoding;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  Protocol **v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unsigned int outCount;

  v10 = a5;
  v13 = (Protocol *)a6;
  v14 = a7;
  v15 = (void *)MEMORY[0x1A8583A40]();
  MethodTypeEncoding = _protocol_getMethodTypeEncoding();
  if (MethodTypeEncoding || (MethodTypeEncoding = _protocol_getMethodTypeEncoding()) != 0)
  {
    *a8 = 1;
    objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", MethodTypeEncoding);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_signatureForBlockAtArgumentIndex:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      v20 = objc_msgSend(v18, "numberOfArguments");
    else
      v20 = 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    outCount = 0;
    v22 = protocol_copyProtocolList(v13, &outCount);
    v25 = v15;
    if (outCount)
    {
      v23 = 0;
      v20 = 0x7FFFFFFFFFFFFFFFLL;
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", protocol_getName(v22[v23]));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "containsObject:", v24) & 1) == 0)
        {
          objc_msgSend(v14, "addObject:", v24);
          v20 = objc_msgSend(a1, "_arityForBlockAtIndex:inSelector:instanceMethod:ofProtocol:seenProtocols:foundSelector:", a3, a4, v10, v22[v23], v14, a8);
          if (*a8)
            break;
        }

        if (++v23 >= (unint64_t)outCount)
          goto LABEL_16;
      }

    }
    else
    {
      v20 = 0x7FFFFFFFFFFFFFFFLL;
    }
LABEL_16:
    free(v22);
    v15 = v25;
  }
  objc_autoreleasePoolPop(v15);

  return v20;
}

@end
