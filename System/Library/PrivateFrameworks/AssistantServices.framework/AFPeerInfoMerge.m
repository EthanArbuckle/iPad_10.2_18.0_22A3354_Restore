@implementation AFPeerInfoMerge

void __AFPeerInfoMerge_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isDeviceOwnedByCurrentUser") & 1) == 0)
    objc_msgSend(v33, "setIsDeviceOwnedByCurrentUser:", objc_msgSend(*(id *)(a1 + 40), "isDeviceOwnedByCurrentUser"));
  objc_msgSend(*(id *)(a1 + 32), "assistantIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "assistantIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAssistantIdentifier:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "sharedUserIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "sharedUserIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setSharedUserIdentifier:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "idsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "idsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setIdsIdentifier:", v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "idsDeviceUniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "idsDeviceUniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setIdsDeviceUniqueIdentifier:", v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "rapportEffectiveIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "rapportEffectiveIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setRapportEffectiveIdentifier:", v12);

  }
  objc_msgSend(*(id *)(a1 + 32), "homeKitAccessoryIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(*(id *)(a1 + 40), "homeKitAccessoryIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setHomeKitAccessoryIdentifier:", v14);

  }
  objc_msgSend(*(id *)(a1 + 32), "mediaSystemIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(*(id *)(a1 + 40), "mediaSystemIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setMediaSystemIdentifier:", v16);

  }
  objc_msgSend(*(id *)(a1 + 32), "mediaRouteIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(*(id *)(a1 + 40), "mediaRouteIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setMediaRouteIdentifier:", v18);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isCommunalDevice") & 1) == 0)
    objc_msgSend(v33, "setIsCommunalDevice:", objc_msgSend(*(id *)(a1 + 40), "isCommunalDevice"));
  objc_msgSend(*(id *)(a1 + 32), "roomName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(*(id *)(a1 + 40), "roomName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setRoomName:", v20);

  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setName:", v22);

  }
  objc_msgSend(*(id *)(a1 + 32), "productType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(*(id *)(a1 + 40), "productType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setProductType:", v24);

  }
  objc_msgSend(*(id *)(a1 + 32), "buildVersion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    objc_msgSend(*(id *)(a1 + 40), "buildVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setBuildVersion:", v26);

  }
  objc_msgSend(*(id *)(a1 + 32), "userInterfaceIdiom");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    objc_msgSend(*(id *)(a1 + 40), "userInterfaceIdiom");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setUserInterfaceIdiom:", v28);

  }
  objc_msgSend(*(id *)(a1 + 32), "aceVersion");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    objc_msgSend(*(id *)(a1 + 40), "aceVersion");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAceVersion:", v30);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isSiriCloudSyncEnabled") & 1) == 0)
    objc_msgSend(v33, "setIsSiriCloudSyncEnabled:", objc_msgSend(*(id *)(a1 + 40), "isSiriCloudSyncEnabled"));
  if ((objc_msgSend(*(id *)(a1 + 32), "isLocationSharingDevice") & 1) == 0)
    objc_msgSend(v33, "setIsLocationSharingDevice:", objc_msgSend(*(id *)(a1 + 40), "isLocationSharingDevice"));
  objc_msgSend(*(id *)(a1 + 32), "myriadTrialTreatment");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    objc_msgSend(*(id *)(a1 + 40), "myriadTrialTreatment");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setMyriadTrialTreatment:", v32);

  }
}

@end
