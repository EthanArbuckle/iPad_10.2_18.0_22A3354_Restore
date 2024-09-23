@implementation AVAssetCustomURLAuthentication

- (AVAssetCustomURLAuthentication)initWithFigAsset:(OpaqueFigAsset *)a3
{
  AVAssetCustomURLAuthentication *v4;
  NSObject *v5;
  uint64_t CMBaseObject;
  uint64_t (*v7)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v8;
  CFTypeRef v9;
  OS_dispatch_queue *callbackQueue;
  uint64_t (*v11)(CFTypeRef, uint64_t, const char *, AVAssetCustomURLAuthentication *, OS_dispatch_queue *, void *, _QWORD, OpaqueFigCustomURLHandler **);
  int v12;
  objc_super v14;
  CFTypeRef cf;

  v14.receiver = self;
  v14.super_class = (Class)AVAssetCustomURLAuthentication;
  cf = 0;
  v4 = -[AVAssetCustomURLAuthentication init](&v14, sel_init);
  if (v4)
  {
    if (a3)
    {
      v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.authkeychain.callback", v5);
      CMBaseObject = FigAssetGetCMBaseObject();
      v7 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
      if (v7)
      {
        v8 = v7(CMBaseObject, *MEMORY[0x1E0CC39A0], *MEMORY[0x1E0C9AE00], &cf);
        if (v8)
        {
LABEL_7:
          v12 = v8;
          goto LABEL_10;
        }
        v9 = cf;
        callbackQueue = v4->_callbackQueue;
        v11 = *(uint64_t (**)(CFTypeRef, uint64_t, const char *, AVAssetCustomURLAuthentication *, OS_dispatch_queue *, void *, _QWORD, OpaqueFigCustomURLHandler **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
        if (v11)
        {
          v8 = v11(v9, 800, "com.apple.avfoundation.authkeychain", v4, callbackQueue, &initWithFigAsset__sAVAssetCustomURLAuthenticationCallbacks, 0, &v4->_handler);
          goto LABEL_7;
        }
      }
    }
    v12 = -12780;
  }
  else
  {
    v12 = 0;
  }
LABEL_10:
  if (cf)
    CFRelease(cf);
  if (v12)
  {

    return 0;
  }
  return v4;
}

- (int)_handleAuthChallenge:(__CFDictionary *)a3 requestID:(unint64_t)a4 canHandleRequestOut:(char *)a5
{
  int v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *callbackQueue;
  _QWORD v17[7];
  _QWORD block[8];
  id v19;
  id v20;

  v19 = 0;
  v20 = 0;
  *a5 = 0;
  v9 = FigCustomURLRequestInfoCopyNSURLAuthenticationChallenge();
  if (v9)
  {
    if (v9 == -17360)
      v10 = 0;
    else
      v10 = v9;
    v12 = 0;
  }
  else
  {
    *a5 = 1;
    v10 = FigCustomURLRequestInfoCopyURL();
    if (v10
      || (v11 = +[AVAssetCustomURLAuthentication copyKeychainCredentialForUrl:](AVAssetCustomURLAuthentication, "copyKeychainCredentialForUrl:", v19)) == 0)
    {
      if (a3)
        CFRetain(a3);
      callbackQueue = self->_callbackQueue;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __85__AVAssetCustomURLAuthentication__handleAuthChallenge_requestID_canHandleRequestOut___block_invoke_2;
      v17[3] = &unk_1E30314D8;
      v17[5] = a3;
      v17[6] = a4;
      v17[4] = self;
      dispatch_async(callbackQueue, v17);
      v12 = 0;
    }
    else
    {
      v12 = v11;
      if (a3)
        CFRetain(a3);
      v13 = v12;
      v14 = self->_callbackQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __85__AVAssetCustomURLAuthentication__handleAuthChallenge_requestID_canHandleRequestOut___block_invoke;
      block[3] = &unk_1E3031B58;
      block[6] = a3;
      block[7] = a4;
      block[4] = v12;
      block[5] = self;
      dispatch_async(v14, block);
      v10 = 0;
    }
  }

  return v10;
}

- (void)dealloc
{
  NSObject *callbackQueue;
  OpaqueFigCustomURLHandler *handler;
  objc_super v5;

  callbackQueue = self->_callbackQueue;
  if (callbackQueue)
    dispatch_release(callbackQueue);
  handler = self->_handler;
  if (handler)
    CFRelease(handler);
  v5.receiver = self;
  v5.super_class = (Class)AVAssetCustomURLAuthentication;
  -[AVAssetCustomURLAuthentication dealloc](&v5, sel_dealloc);
}

void __85__AVAssetCustomURLAuthentication__handleAuthChallenge_requestID_canHandleRequestOut___block_invoke(uint64_t a1)
{
  const void *v2;

  +[AVAssetCustomURLAuthentication sendAuthResponse:requestID:disposition:credential:authHandler:](AVAssetCustomURLAuthentication, "sendAuthResponse:requestID:disposition:credential:authHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));

  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
}

void __85__AVAssetCustomURLAuthentication__handleAuthChallenge_requestID_canHandleRequestOut___block_invoke_2(_QWORD *a1)
{
  const void *v2;

  +[AVAssetCustomURLAuthentication sendAuthResponse:requestID:disposition:credential:authHandler:](AVAssetCustomURLAuthentication, "sendAuthResponse:requestID:disposition:credential:authHandler:", a1[5], a1[6], 3, 0, *(_QWORD *)(a1[4] + 8));
  v2 = (const void *)a1[5];
  if (v2)
    CFRelease(v2);
}

+ (id)copyKeychainCredentialForUrl:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CFTypeRef result;

  result = 0;
  if (!objc_msgSend(a3, "scheme") || !objc_msgSend(a3, "host"))
  {
    v4 = 0;
LABEL_17:
    v9 = 0;
    goto LABEL_18;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0CD6CB8], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0CD6928], *MEMORY[0x1E0CD6910]);
  objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0CD6F40], *MEMORY[0x1E0CD6F30]);
  v5 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7010]);
  objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x1E0CD7018]);
  v6 = objc_msgSend(a3, "host");
  objc_msgSend(v4, "setObject:forKey:", v6, *MEMORY[0x1E0CD6B50]);
  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "scheme"), "lowercaseString"), "isEqualToString:", CFSTR("http")) & 1) != 0)
  {
    v7 = (_QWORD *)MEMORY[0x1E0CD6AF0];
  }
  else
  {
    if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "scheme"), "lowercaseString"), "isEqualToString:", CFSTR("https")))goto LABEL_8;
    v7 = (_QWORD *)MEMORY[0x1E0CD6B00];
  }
  objc_msgSend(v4, "setObject:forKey:", *v7, *MEMORY[0x1E0CD6AD0]);
LABEL_8:
  if (objc_msgSend(a3, "port"))
  {
    v8 = objc_msgSend(a3, "port");
    objc_msgSend(v4, "setObject:forKey:", v8, *MEMORY[0x1E0CD6AC8]);
  }
  if (SecItemCopyMatching((CFDictionaryRef)v4, &result))
    goto LABEL_17;
  v9 = (void *)objc_msgSend((id)result, "valueForKey:", *MEMORY[0x1E0CD68F8]);
  if (!v9)
  {
LABEL_18:
    v10 = 0;
    goto LABEL_15;
  }
  v10 = (void *)objc_msgSend((id)result, "valueForKey:", *MEMORY[0x1E0CD70D8]);
  if (v10 && (v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v10, 4)) != 0)
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C60]), "initWithUser:password:persistence:", v9, v10, 1);
  else
    v9 = 0;
LABEL_15:

  return v9;
}

+ (int)sendAuthResponse:(__CFDictionary *)a3 requestID:(unint64_t)a4 disposition:(int64_t)a5 credential:(id)a6 authHandler:(OpaqueFigCustomURLHandler *)a7
{
  int Mutable;
  uint64_t (*v11)(OpaqueFigCustomURLHandler *, unint64_t, _QWORD);
  uint64_t (*v12)(OpaqueFigCustomURLHandler *, unint64_t, _QWORD, _QWORD);

  Mutable = FigCustomURLResponseInfoCreateMutable();
  if (Mutable)
    return Mutable;
  if (a6)
  {
    Mutable = FigCustomURLResponseInfoSetNSURLCredential();
    if (Mutable)
      return Mutable;
  }
  Mutable = FigCustomURLResponseInfoSetNSURLSessionAuthChallengeDisposition();
  if (Mutable)
    return Mutable;
  v11 = *(uint64_t (**)(OpaqueFigCustomURLHandler *, unint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                        + 8);
  if (!v11)
    return -12782;
  Mutable = v11(a7, a4, 0);
  if (!Mutable)
  {
    v12 = *(uint64_t (**)(OpaqueFigCustomURLHandler *, unint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                  + 24);
    if (v12)
      return v12(a7, a4, 0, 0);
    return -12782;
  }
  return Mutable;
}

@end
