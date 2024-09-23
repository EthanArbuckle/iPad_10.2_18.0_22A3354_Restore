@implementation MPCAssistantPause

- (void)pauseDevicesByUID:(id)a3 withRefId:(id)a4 audioRoutingInfo:(id)a5 completion:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = (void *)MEMORY[0x24BDD1488];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "mainBundle");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCAssistantPause pauseDevicesByUID:withRefId:audioRoutingInfo:source:completion:](self, "pauseDevicesByUID:withRefId:audioRoutingInfo:source:completion:", v13, v12, *(unsigned int *)&a5, v14, v11);

}

- (void)pauseDevicesByUID:(id)a3 withRefId:(id)a4 audioRoutingInfo:(id)a5 source:(id)a6 completion:(id)a7
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  qos_class_t v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v10 = a7;
  v11 = (objc_class *)MEMORY[0x24BE65570];
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend([v11 alloc], "initWithName:requestID:reason:", CFSTR("MPCAssistantPause.pauseDevicesByUID"), v13, v12);

  v16 = (void *)MEMORY[0x24BE654C0];
  objc_msgSend(v14, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = qos_class_self();
  dispatch_get_global_queue(v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __84__MPCAssistantPause_pauseDevicesByUID_withRefId_audioRoutingInfo_source_completion___block_invoke;
  v21[3] = &unk_24CAB9A98;
  v22 = v10;
  v20 = v10;
  objc_msgSend(v16, "pauseOutputDeviceUIDs:details:queue:completion:", v17, v15, v19, v21);

}

void __84__MPCAssistantPause_pauseDevicesByUID_withRefId_audioRoutingInfo_source_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "description");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

@end
