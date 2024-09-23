@implementation HMActionSet

void __70__HMActionSet_HFAdditions__hf_standardIconTintColorForIconIdentifier___block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[12];
  _QWORD v15[14];

  v15[12] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("sun.max.fill");
  objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v13;
  v14[1] = CFSTR("moon.stars.fill");
  objc_msgSend(MEMORY[0x1E0CEA478], "systemIndigoColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v12;
  v14[2] = CFSTR("figure.walk.arrival");
  objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v0;
  v14[3] = CFSTR("figure.walk.departure");
  objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v1;
  v14[4] = CFSTR("house.fill");
  objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v2;
  v14[5] = CFSTR("chair.lounge.fill");
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBrownColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v3;
  v14[6] = CFSTR("popcorn.fill");
  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v4;
  v14[7] = CFSTR("fork.knife");
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v5;
  v14[8] = CFSTR("cup.and.saucer.fill");
  objc_msgSend(MEMORY[0x1E0CEA478], "systemMintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v6;
  v14[9] = CFSTR("frying.pan.fill");
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[9] = v7;
  v14[10] = CFSTR("party.popper.fill");
  objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[10] = v8;
  v14[11] = CFSTR("heart.fill");
  objc_msgSend(MEMORY[0x1E0CEA478], "systemPinkColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[11] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 12);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_1ED3791F0;
  qword_1ED3791F0 = v10;

}

void __76__HMActionSet_HFAdditions__hf_standardSystemIconIdentifierForActionSetType___block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB8228];
  v4[0] = *MEMORY[0x1E0CB8240];
  v4[1] = v0;
  v5[0] = CFSTR("sun.max.fill");
  v5[1] = CFSTR("moon.stars.fill");
  v1 = *MEMORY[0x1E0CB8218];
  v4[2] = *MEMORY[0x1E0CB8210];
  v4[3] = v1;
  v5[2] = CFSTR("figure.walk.arrival");
  v5[3] = CFSTR("figure.walk.departure");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED3791D0;
  qword_1ED3791D0 = v2;

}

id __57__HMActionSet_HFAdditions__hf_characteristicWriteActions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

uint64_t __52__HMActionSet_HFAdditions__hf_affectedMediaSessions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaSession");
}

uint64_t __60__HMActionSet_HFAdditions__hf_affectsServiceWithIdentifier___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v6)
    *a3 = 1;
  return v6;
}

uint64_t __51__HMActionSet_HFAdditions__hf_requiresDeviceUnlock__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "requiresDeviceUnlock");
}

void __89__HMActionSet_HFAdditions__hf_percentOfAccessoryRepresentableObjectsAssociatedWithGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "hf_accessoryType");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "containsType:"))
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

void __62__HMActionSet_HFAdditions__hf_setIconIdentifier_andTintColor___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "applicationData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 1, v3);

}

void __77__HMActionSet_HFAdditions__hf_mapOldIconIdentifierToNewSystemIconIdentifier___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];
  _QWORD v3[13];

  v3[12] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("HFImageIconIdentifierSceneWakeUp");
  v2[1] = CFSTR("HFImageIconIdentifierSceneSleep");
  v3[0] = CFSTR("sun.max.fill");
  v3[1] = CFSTR("moon.stars.fill");
  v2[2] = CFSTR("HFImageIconIdentifierSceneArrivingHome");
  v2[3] = CFSTR("HFImageIconIdentifierSceneLeavingHome");
  v3[2] = CFSTR("figure.walk.arrival");
  v3[3] = CFSTR("figure.walk.departure");
  v2[4] = CFSTR("HFImageIconIdentifierGeneric");
  v2[5] = CFSTR("HFImageIconIdentifierSceneChillOut");
  v3[4] = CFSTR("house.fill");
  v3[5] = CFSTR("chair.lounge.fill");
  v2[6] = CFSTR("HFImageIconIdentifierSceneMovie");
  v2[7] = CFSTR("HFImageIconIdentifierSceneDinner");
  v3[6] = CFSTR("popcorn.fill");
  v3[7] = CFSTR("fork.knife");
  v2[8] = CFSTR("HFImageIconIdentifierSceneCoffee");
  v2[9] = CFSTR("HFImageIconIdentifierSceneBreakfast");
  v3[8] = CFSTR("cup.and.saucer.fill");
  v3[9] = CFSTR("frying.pan.fill");
  v2[10] = CFSTR("HFImageIconIdentifierSceneParty");
  v2[11] = CFSTR("HFImageIconIdentifierSceneRomance");
  v3[10] = CFSTR("party.popper.fill");
  v3[11] = CFSTR("heart.fill");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED3791E0;
  qword_1ED3791E0 = v0;

}

uint64_t __45__HMActionSet_HFAdditions__hf_shortcutAction__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __72__HMActionSet_HFIncludedContextProtocol__hf_updateValue_forContextType___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "applicationData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 1, v3);

}

uint64_t __59__HMActionSet_HFHomeKitObjectConformance__hf_isValidObject__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __63__HMActionSet_HFApplicationData___hf_didUpdateApplicationData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home:didUpdateApplicationDataForActionSet:", v3, *(_QWORD *)(a1 + 32));

  }
}

void __89__HMActionSet_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString **v8;
  int v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;

  v15 = a2;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasOptedToHH2") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "residentDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    v8 = HFOperationUpdateApplicationDataResidentSync;
    if (!v7)
      v8 = HFOperationUpdateApplicationDataCloudSync;
  }
  else
  {

    v8 = HFOperationUpdateApplicationDataCloudSync;
  }
  v9 = *(unsigned __int8 *)(a1 + 56);
  v10 = *v8;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
    objc_msgSend(v11, "handleError:operationType:options:retryBlock:cancelBlock:", v15, v10, 0, 0, 0);
  else
    objc_msgSend(v11, "logError:operationDescription:", v15, v10);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "applicationData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_hf_didUpdateApplicationData:", v14);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
