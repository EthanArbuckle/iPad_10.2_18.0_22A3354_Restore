@implementation HMAccessory(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4;
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
  _QWORD v24[5];

  v4 = a3;
  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:withName:options:", v6, CFSTR("UUID"), 2);

  objc_msgSend(a1, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("name"));

  objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isReachable"), CFSTR("reachable"), 0);
  objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isReachable"), CFSTR("controllable"), 0);
  objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isBlocked"), CFSTR("blocked"), 1);
  objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isFirmwareUpdateAvailable"), CFSTR("firmwareUpdateAvailable"), 1);
  if (objc_msgSend(a1, "supportsSoftwareUpdateV2"))
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "softwareUpdateManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "softwareUpdateForAccessory:", a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v5, "appendObject:withName:", v10, CFSTR("softwareUpdate"));
      objc_msgSend(v9, "softwareUpdateProgressForAccessory:", a1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendObject:withName:options:", v11, CFSTR("progress"), 1);

    }
    else
    {
      objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "supportsSoftwareUpdateV2"), CFSTR("supportsSoftwareUpdateV2"));
    }

  }
  else
  {
    objc_msgSend(a1, "softwareUpdateController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendObject:withName:options:", v9, CFSTR("softwareUpdateController"), 1);
  }

  if (objc_msgSend(v4, "detailLevel") == 2)
  {
    objc_msgSend(a1, "room");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v4, "copyWithDetailLevel:", 0);
    objc_msgSend(v5, "appendObject:withName:context:", v12, CFSTR("room"), v13);

    objc_msgSend(a1, "services");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendObject:withName:options:", v14, CFSTR("services"), 1);

    objc_msgSend(a1, "cameraProfiles");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendObject:withName:options:", v15, CFSTR("cameraProfiles"), 1);

    objc_msgSend(a1, "uniqueIdentifiersForBridgedAccessories");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __59__HMAccessory_HFDebugging__hf_stateDumpBuilderWithContext___block_invoke;
    v24[3] = &unk_1EA72B548;
    v24[4] = a1;
    objc_msgSend(v16, "na_map:", v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v4, "copyWithDetailLevel:", 0);
    objc_msgSend(v5, "appendObject:withName:context:options:", v17, CFSTR("bridgedAccessories"), v18, 1);

    objc_msgSend(a1, "mediaProfile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendObject:withName:options:", v19, CFSTR("mediaProfile"), 1);

    objc_msgSend(a1, "audioDestinationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "availableDestinations");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendObject:withName:options:", v21, CFSTR("availableDestinations"), 1);

    objc_msgSend(a1, "device");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendObject:withName:options:", v22, CFSTR("device"), 1);

    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_isOnForContextType:", 0), CFSTR("isLegacyFavorite"));
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_shouldBeOnForContextType:", 0), CFSTR("showInLegacyFavorite"));
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_isFavorite"), CFSTR("isFavorite"));
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_effectiveIsFavorite"), CFSTR("effectiveIsFavorite"));
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_showInHomeDashboard"), CFSTR("showInHomeDashboard"));
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_effectiveShowInHomeDashboard"), CFSTR("effectiveShowInHomeDashboard"));
  }

  return v5;
}

@end
