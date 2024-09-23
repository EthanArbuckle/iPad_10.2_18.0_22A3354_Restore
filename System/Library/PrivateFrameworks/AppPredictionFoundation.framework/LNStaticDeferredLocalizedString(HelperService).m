@implementation LNStaticDeferredLocalizedString(HelperService)

- (id)atx_efficientLocalizedString
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[6];
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  __CFString *v14;

  if (shouldDenyConnectionForCurrentProcess())
  {
    objc_msgSend(a1, "localizedStringForLocaleIdentifier:", 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    prepareXPCConnection();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy_;
    v13 = __Block_byref_object_dispose_;
    v14 = &stru_1E82C0108;
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __78__LNStaticDeferredLocalizedString_HelperService__atx_efficientLocalizedString__block_invoke;
    v8[3] = &unk_1E82BF5B8;
    v8[4] = a1;
    v8[5] = &v9;
    objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __78__LNStaticDeferredLocalizedString_HelperService__atx_efficientLocalizedString__block_invoke_30;
    v7[3] = &unk_1E82BF5E0;
    v7[4] = a1;
    v7[5] = &v9;
    objc_msgSend(v5, "localizedStringForLinkString:withReply:", a1, v7);

    objc_msgSend(v3, "invalidate");
    v2 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  return v2;
}

@end
