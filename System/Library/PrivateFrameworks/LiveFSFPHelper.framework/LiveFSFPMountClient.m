@implementation LiveFSFPMountClient

+ (id)locallyBuiltDomainStorageSuffix
{
  return &stru_24E46BB18;
}

- (id)fixupConnectionFor:(id)a3
{
  id v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  LiveFSFPMountClient *v12;

  v5 = a3;
  v6 = (objc_class *)objc_opt_new();
  v7 = (int)*MEMORY[0x24BE60480];
  v8 = *(Class *)((char *)&self->super.super.isa + v7);
  *(Class *)((char *)&self->super.super.isa + v7) = v6;

  if (*(Class *)((char *)&self->super.super.isa + v7))
  {
    objc_storeStrong((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE60488]), a3);
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v7), "internalSetProviderName:", v5);
    v9 = *(uint64_t *)((char *)&self->super.super.isa + v7);
    v10 = (int)*MEMORY[0x24BE60478];
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v10), "setExportedObject:", v9);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255523A30);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v10), "setExportedInterface:", v11);

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)newClientForProvider:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProvider:", v4);

  return v5;
}

+ (id)locallyBuildFPDomain:(id)a3 displayName:(id)a4 provider:(id)a5 how:(int)a6
{
  uint64_t v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = *(_QWORD *)&a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  v12 = (void *)objc_opt_new();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "setProviderName:", v11);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __69__LiveFSFPMountClient_locallyBuildFPDomain_displayName_provider_how___block_invoke;
    v17[3] = &unk_24E46B180;
    v17[4] = &v18;
    objc_msgSend(v13, "LiveMounterClientCreateDomain:displayName:how:storageName:reply:", v9, v10, v6, v9, v17);
    v14 = (id)v19[5];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 12, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  _Block_object_dispose(&v18, 8);
  return v15;
}

void __69__LiveFSFPMountClient_locallyBuildFPDomain_displayName_provider_how___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)locallyDestroyFPDomain:(id)a3 provider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setProviderName:", v6);
    objc_msgSend(v8, "destroyDomain:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 12, 0);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
