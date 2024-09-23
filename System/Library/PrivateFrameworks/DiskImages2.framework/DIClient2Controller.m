@implementation DIClient2Controller

void __60__DIClient2Controller_XPCHandler_newAttachWithParams_error___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "signalCommandCompletedWithXpcError:", v3);

}

void __77__DIClient2Controller_XPCHandler_keychainUnlockWithEncryptionUnlocker_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v6)
  {
    v8 = *(void **)(a1 + 32);
    v9 = 0;
    objc_msgSend(v8, "updateDiskImageParamsWithFrontend:error:", v5, &v9);
    v6 = v9;
  }
  objc_msgSend(WeakRetained, "signalCommandCompletedWithXpcError:", v6);

}

void __82__DIClient2Controller_XPCHandler_GUIAskForPassphraseWithEncryptionFrontend_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v6)
  {
    v8 = *(void **)(a1 + 32);
    v9 = 0;
    objc_msgSend(v8, "updateDiskImageParamsWithFrontend:error:", v5, &v9);
    v6 = v9;
  }
  objc_msgSend(WeakRetained, "signalCommandCompletedWithXpcError:", v6);

}

void __90__DIClient2Controller_XPCHandler_createAndStoreInSystemKeychainWithCreator_account_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v6)
  {
    v8 = *(void **)(a1 + 32);
    v9 = 0;
    objc_msgSend(v8, "updateDiskImageParamsWithFrontend:error:", v5, &v9);
    v6 = v9;
  }
  objc_msgSend(WeakRetained, "signalCommandCompletedWithXpcError:", v6);

}

@end
