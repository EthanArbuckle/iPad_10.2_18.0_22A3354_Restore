@implementation FBSDisplayLayoutService

uint64_t __50___FBSDisplayLayoutService__initWithEndpoint_qos___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "encodeInt64:forKey:", *(char *)(a1 + 32), CFSTR("qos"));
}

void __47___FBSDisplayLayoutService_addObserver_forKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 32));
  v5 = *(id *)(a1[4] + 48);
  v2 = a1[4];
  if (a1[7] == *(_QWORD *)(v2 + 56))
  {
    objc_msgSend(*(id *)(v2 + 40), "objectForKey:", a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)a1[6];

    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 32));
    if (v3 == v4)
      (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
  }

}

void __50___FBSDisplayLayoutService__initWithEndpoint_qos___block_invoke_2(uint64_t a1, void *a2)
{
  unsigned int v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = *(char *)(a1 + 40);
  if (v3 >= 3)
    v4 = 9;
  else
    v4 = 4 * v3 + 17;
  v5 = a2;
  objc_msgSend(off_1E38E9E80, "serviceWithClass:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v6);

  objc_msgSend(v5, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  +[FBSDisplayLayoutMonitor interface](FBSDisplayLayoutMonitor, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterface:", v7);

  objc_msgSend(v5, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v8 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50___FBSDisplayLayoutService__initWithEndpoint_qos___block_invoke_3;
  v11[3] = &unk_1E38EC718;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v5, "setInterruptionHandler:", v11);
  v9[0] = v8;
  v9[1] = 3221225472;
  v9[2] = __50___FBSDisplayLayoutService__initWithEndpoint_qos___block_invoke_4;
  v9[3] = &unk_1E38EC718;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v5, "setInvalidationHandler:", v9);

}

void __50___FBSDisplayLayoutService__initWithEndpoint_qos___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "updateLayout:withTransition:", 0, 0);
  objc_msgSend(v3, "activate");

}

uint64_t __50___FBSDisplayLayoutService__initWithEndpoint_qos___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateLayout:withTransition:", 0, 0);
}

@end
