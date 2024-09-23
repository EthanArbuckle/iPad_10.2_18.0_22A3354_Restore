@implementation GEOCountryConfigurationRemoteProxy

void __67___GEOCountryConfigurationRemoteProxy_valueChangedForGEOConfigKey___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "serverProxy:countryCodeDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __83___GEOCountryConfigurationRemoteProxy_updateCountryCodeWithCallbackQueue_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C81310])
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v4, "objectForKey:", CFSTR("userInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_geo_errorForKey:", CFSTR("err"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83___GEOCountryConfigurationRemoteProxy_updateCountryCodeWithCallbackQueue_callback___block_invoke_2;
    v9[3] = &unk_1E1BFF970;
    v11 = v7;
    v10 = v6;
    dispatch_async(v8, v9);

  }
}

uint64_t __83___GEOCountryConfigurationRemoteProxy_updateCountryCodeWithCallbackQueue_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __70___GEOCountryConfigurationRemoteProxy_initWithDelegate_delegateQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *WeakRetained;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  _QWORD *v7;
  uint8_t buf[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Received country providers change notification. Informing delegate.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[3];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70___GEOCountryConfigurationRemoteProxy_initWithDelegate_delegateQueue___block_invoke_337;
    block[3] = &unk_1E1BFF6F8;
    v7 = WeakRetained;
    dispatch_async(v5, block);

  }
}

void __70___GEOCountryConfigurationRemoteProxy_initWithDelegate_delegateQueue___block_invoke_337(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "serverProxyProvidersDidChange:", *(_QWORD *)(a1 + 32));

}

@end
