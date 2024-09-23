@implementation HMDHomeAdministratorRemoteRelay

uint64_t __56____HMDHomeAdministratorRemoteRelay___handleXPCMessage___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "dispatchMessage:", *(_QWORD *)(result + 40));
  return result;
}

void __56____HMDHomeAdministratorRemoteRelay___handleXPCMessage___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1[4], "handler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v2, "code") == 3200 && v4)
      objc_msgSend(v4, "setHomeUpdatedToROARAndInformClients");
    objc_msgSend(a1[5], "responseHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(a1[5], "responseHandler");
      v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v6)[2](v6, v2, 0);

    }
  }

}

void __48____HMDHomeAdministratorRemoteRelay_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v17_162028;
  logCategory__hmf_once_v17_162028 = v0;

}

@end
