@implementation NSError(HMDHTTPMessageTransportError)

+ (id)hmd_HTTPMessageTransportErrorWithCode:()HMDHTTPMessageTransportError
{
  id v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v3 = a3;
  v12[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = CFSTR("The client is unknown.");
    if (a3 != (id)100)
      v4 = 0;
    if (a3 == (id)200)
      v4 = CFSTR("An unknown error occurred.");
    if (v4)
    {
      v11 = *MEMORY[0x1E0CB2D50];
      v5 = (void *)MEMORY[0x1E0CB34D0];
      v6 = v4;
      objc_msgSend(v5, "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", v6, &stru_1E89C3E38, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v12[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.HomeKit.Messaging.HTTP"), v3, v9);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

@end
