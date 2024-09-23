@implementation HMRemoteLoginHandler

void __81__HMRemoteLoginHandler_HUMediaAdditions__hu_appleMusicInAppAuthenticationContext__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__HMRemoteLoginHandler_HUMediaAdditions__hu_appleMusicInAppAuthenticationContext__block_invoke_2;
  v6[3] = &unk_1E6F5F280;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "queryProxiedDevice:", v6);

}

void __81__HMRemoteLoginHandler_HUMediaAdditions__hu_appleMusicInAppAuthenticationContext__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v6 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D002F8]);
    objc_msgSend(v5, "setServiceType:", 2);
    objc_msgSend(v5, "setProxiedDevice:", v6);
    objc_msgSend(v5, "setAnisetteDataProvider:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v5, "_setProxyingForApp:", 1);
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v5);

  }
}

@end
