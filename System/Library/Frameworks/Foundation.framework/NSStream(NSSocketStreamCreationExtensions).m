@implementation NSStream(NSSocketStreamCreationExtensions)

+ (void)getStreamsToHostWithName:()NSSocketStreamCreationExtensions port:inputStream:outputStream:
{
  id *v8;
  id *v9;
  id v10;
  id v11;
  id v12;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x1E0C80C00];
  v12 = 0;
  v13[0] = 0;
  if (host)
  {
    v8 = v13;
    if (!a5)
      v8 = 0;
    if (a6)
      v9 = &v12;
    else
      v9 = 0;
    CFStreamCreatePairWithSocketToHost((CFAllocatorRef)*MEMORY[0x1E0C9AE00], host, port, (CFReadStreamRef *)v8, (CFWriteStreamRef *)v9);
    if (v13[0])
    {
      v10 = v13[0];
      if (a5)
        *a5 = v13[0];
    }
    if (v12)
    {
      v11 = v12;
      if (a6)
        *a6 = v12;
    }
  }
}

+ (const)getStreamsToHost:()NSSocketStreamCreationExtensions port:inputStream:outputStream:
{
  const __CFString *v10;
  const __CFString *result;
  id *v12;
  id *v13;
  id v14;
  id v15;
  id v16[2];

  v16[1] = *(id *)MEMORY[0x1E0C80C00];
  if (getStreamsToHost_port_inputStream_outputStream__onceToken != -1)
    dispatch_once(&getStreamsToHost_port_inputStream_outputStream__onceToken, &__block_literal_global_48);
  v15 = 0;
  v16[0] = 0;
  v10 = (const __CFString *)objc_msgSend(a3, "name");
  if (v10
    || (v10 = (const __CFString *)objc_msgSend(a3, "address")) != 0
    || (result = (const __CFString *)objc_msgSend(a3, "_thingToResolve"), (v10 = result) != 0))
  {
    if (a5)
      v12 = v16;
    else
      v12 = 0;
    if (a6)
      v13 = &v15;
    else
      v13 = 0;
    CFStreamCreatePairWithSocketToHost((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v10, a4, (CFReadStreamRef *)v12, (CFWriteStreamRef *)v13);
    if (v16[0])
    {
      v14 = v16[0];
      if (a5)
        *a5 = v16[0];
    }
    result = (const __CFString *)v15;
    if (v15)
    {
      result = (const __CFString *)v15;
      if (a6)
        *a6 = v15;
    }
  }
  return result;
}

@end
