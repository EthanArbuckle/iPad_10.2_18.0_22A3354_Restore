@implementation HMHomeManager(HFDebugging)

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

  v4 = a3;
  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromHMHomeManagerDataSyncState(objc_msgSend(a1, "dataSyncState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("dataSyncState"));

  objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isThisDeviceResidentCapable"), CFSTR("residentCapable"), 1);
  objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isResidentEnabledForThisDevice"), CFSTR("residentEnabled"), 1);
  if (objc_msgSend(a1, "residentProvisioningStatus"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "residentProvisioningStatus"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("residentProvisioningStatus"));

  }
  if (objc_msgSend(v4, "detailLevel") == 2)
  {
    objc_msgSend(a1, "options");
    HMHomeManagerOptionsToString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("options"));

    objc_msgSend(a1, "homes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("homes"));

    objc_msgSend(a1, "incomingHomeInvitations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendObject:withName:options:", v10, CFSTR("incomingInvitations"), 1);

    objc_msgSend(a1, "currentAccessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendObject:withName:options:", v11, CFSTR("currentAccessory"), 1);

    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "hf_hasSeenOnboardingWelcomeView"), CFSTR("hasOnboarded"), 0);
  }

  return v5;
}

@end
