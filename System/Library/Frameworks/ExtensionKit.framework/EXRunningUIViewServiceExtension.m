@implementation EXRunningUIViewServiceExtension

void __61___EXRunningUIViewServiceExtension_startWithArguments_count___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;

  v3 = a2;
  objc_msgSend(v3, "setDomain:", CFSTR("XPCService"));
  objc_msgSend(v3, "setService:", CFSTR("InternalService"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "setDelegate:", WeakRetained);

}

void __61___EXRunningUIViewServiceExtension_startWithArguments_count___block_invoke_41(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;

  v3 = a2;
  objc_msgSend(v3, "setDomain:", CFSTR("XPCService"));
  objc_msgSend(v3, "setService:", CFSTR("MainService"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "setDelegate:", WeakRetained);

}

uint64_t __61___EXRunningUIViewServiceExtension_startWithArguments_count___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  os_signpost_id_t v5;
  uint8_t v7[16];

  _EXSignpostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "signpost") && os_signpost_enabled(v2))
  {
    v3 = v2;
    v4 = objc_msgSend(*(id *)(a1 + 32), "signpost");
    if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)v7 = 0;
        _os_signpost_emit_with_name_impl(&dword_20AE73000, v3, OS_SIGNPOST_EVENT, v5, "extensionkit-lifecycle", "Runloop started", v7, 2u);
      }
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "didFinishLaunching");
}

void __78___EXRunningUIViewServiceExtension_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setActivateOnResume");
  objc_msgSend(v2, "setFaultOnSuspend");

}

@end
