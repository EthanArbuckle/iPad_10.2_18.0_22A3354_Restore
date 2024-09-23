@implementation HMServiceGroup

uint64_t __60__HMServiceGroup_AbstractionAdditions__hf_containedProfiles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_containedProfiles");
}

uint64_t __67__HMServiceGroup_AbstractionAdditions__hf_containedCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristics");
}

uint64_t __64__HMServiceGroup_AbstractionAdditions__hf_associatedAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessory");
}

uint64_t __56__HMServiceGroup_AbstractionAdditions__hf_accessoryType__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_accessoryType");
}

uint64_t __56__HMServiceGroup_AbstractionAdditions__hf_accessoryType__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

uint64_t __56__HMServiceGroup_AbstractionAdditions__hf_accessoryType__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_serviceDescriptor");
}

uint64_t __52__HMServiceGroup_AbstractionAdditions__hf_isInRoom___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  return v6;
}

uint64_t __65__HMServiceGroup_AbstractionAdditions__hf_canShowInControlCenter__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_showsAsServiceInControlCentre");
}

uint64_t __54__HMServiceGroup_AbstractionAdditions__hf_moveToRoom___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_moveToRoom:", *(_QWORD *)(a1 + 32));
}

uint64_t __70__HMServiceGroup_AbstractionAdditions__hf_isForcedVisibleInHomeStatus__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isForcedVisibleInHomeStatus");
}

uint64_t __45__HMServiceGroup_HFAdditions__hf_isSupported__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_supportsGroups");
}

uint64_t __58__HMServiceGroup_HFAdditions__hf_areAllServicesInSameRoom__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "hf_parentRoom");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __51__HMServiceGroup_HFAdditions__hf_serviceDescriptor__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_serviceDescriptor");
}

uint64_t __67__HMServiceGroup_HFIncludedContextProtocol__hf_isOnForContextType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isOnForContextType:", *(_QWORD *)(a1 + 32));
}

uint64_t __69__HMServiceGroup_HFIncludedContextProtocol__hf_hasSetForContextType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasSetForContextType:", *(_QWORD *)(a1 + 32));
}

uint64_t __73__HMServiceGroup_HFIncludedContextProtocol__hf_shouldHideForContextType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_shouldHideForContextType:", *(_QWORD *)(a1 + 32));
}

uint64_t __62__HMServiceGroup_HFHomeKitObjectConformance__hf_isValidObject__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __86__HMServiceGroup_HFUserNotificationServiceSettings___hf_allBulletinBoardNotifications__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bulletinBoardNotification");
}

void __66__HMServiceGroup_HFApplicationData___hf_didUpdateApplicationData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "services");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home:didUpdateApplicationDataForServiceGroup:", v5, *(_QWORD *)(a1 + 32));

  }
}

void __92__HMServiceGroup_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString **v10;
  int v11;
  __CFString *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  id v17;

  v17 = a2;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasOptedToHH2") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "services");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "residentDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    v10 = HFOperationUpdateApplicationDataResidentSync;
    if (!v9)
      v10 = HFOperationUpdateApplicationDataCloudSync;
  }
  else
  {

    v10 = HFOperationUpdateApplicationDataCloudSync;
  }
  v11 = *(unsigned __int8 *)(a1 + 56);
  v12 = *v10;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v11)
    objc_msgSend(v13, "handleError:operationType:options:retryBlock:cancelBlock:", v17, v12, 0, 0, 0);
  else
    objc_msgSend(v13, "logError:operationDescription:", v17, v12);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "applicationData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_hf_didUpdateApplicationData:", v16);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
