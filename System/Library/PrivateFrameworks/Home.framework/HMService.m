@implementation HMService

uint64_t __48__HMService_Additions__hf_characteristicOfType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __42__HMService_Additions__hf_isLegacyService__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __40__HMService_Additions__hf_parentService__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "hf_childServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __40__HMService_Additions__hf_lightProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 32)))
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

uint64_t __42__HMService_Additions__hf_isLegacyService__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0CB8780]) ^ 1;

  return v3;
}

id __44__HMService_Additions__hf_serviceDescriptor__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hf_parentService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_serviceDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __47__HMService_Additions__hf_standardServiceTypes__block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)objc_opt_class(), "_serviceTypeToServiceItemClassMap");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED379240;
  qword_1ED379240 = v2;

}

id __39__HMService_Additions__hf_serviceGroup__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__HMService_Additions__hf_serviceGroup__block_invoke_2;
  v6[3] = &unk_1EA72E668;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "na_firstObjectPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __55__HMService_AbstractionAdditions__hf_containedProfiles__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __40__HMService_Additions__hf_childServices__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[5];

  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(*(id *)(a1 + 32), "linkedServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB9A50]);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_servicesBehindBridge");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "serviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB9AF0]);

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "services");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "na_filter:", &__block_literal_global_40_4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v15);

  }
  v16 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __40__HMService_Additions__hf_childServices__block_invoke_3;
  v21[3] = &unk_1EA7283A0;
  v21[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "na_filter:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSet:", v17);

  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __40__HMService_Additions__hf_childServices__block_invoke_4;
  v20[3] = &unk_1EA7283A0;
  v20[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "na_filter:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __77__HMService_HFProgrammableSwitchAdditions__hf_programmableSwitchServiceTypes__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9AD0], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED3792D0;
  qword_1ED3792D0 = v0;

}

void __42__HMService_Additions__hf_fanServiceTypes__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB9B10];
  v5[0] = *MEMORY[0x1E0CB9A10];
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED379270;
  qword_1ED379270 = v3;

}

void __50__HMService_Additions__hf_alarmSensorServiceTypes__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB99E8];
  v6[0] = *MEMORY[0x1E0CB99E0];
  v6[1] = v1;
  v2 = *MEMORY[0x1E0CB9AB8];
  v6[2] = *MEMORY[0x1E0CB9A60];
  v6[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED379290;
  qword_1ED379290 = v4;

}

void __45__HMService_Additions__hf_sensorServiceTypes__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[12];

  v9[11] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB99E0];
  v9[0] = *MEMORY[0x1E0CB99B0];
  v9[1] = v1;
  v2 = *MEMORY[0x1E0CB99F0];
  v9[2] = *MEMORY[0x1E0CB99E8];
  v9[3] = v2;
  v3 = *MEMORY[0x1E0CB9A60];
  v9[4] = *MEMORY[0x1E0CB9A40];
  v9[5] = v3;
  v4 = *MEMORY[0x1E0CB9A90];
  v9[6] = *MEMORY[0x1E0CB9A68];
  v9[7] = v4;
  v5 = *MEMORY[0x1E0CB9AB8];
  v9[8] = *MEMORY[0x1E0CB9A98];
  v9[9] = v5;
  v9[10] = *MEMORY[0x1E0CB9AF8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1ED379280;
  qword_1ED379280 = v7;

}

void __102__HMService_HFCharacteristicValueDisplayMetadataAdditions__hf_sensorCharacteristicTypeForServiceType___block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[11];
  _QWORD v18[12];

  v18[11] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB87B0];
  v1 = *MEMORY[0x1E0CB99E0];
  v17[0] = *MEMORY[0x1E0CB99B0];
  v17[1] = v1;
  v2 = *MEMORY[0x1E0CB87D8];
  v18[0] = v0;
  v18[1] = v2;
  v3 = *MEMORY[0x1E0CB87F0];
  v4 = *MEMORY[0x1E0CB99F0];
  v17[2] = *MEMORY[0x1E0CB99E8];
  v17[3] = v4;
  v5 = *MEMORY[0x1E0CB8820];
  v18[2] = v3;
  v18[3] = v5;
  v6 = *MEMORY[0x1E0CB8880];
  v7 = *MEMORY[0x1E0CB9A60];
  v17[4] = *MEMORY[0x1E0CB9A40];
  v17[5] = v7;
  v8 = *MEMORY[0x1E0CB8930];
  v18[4] = v6;
  v18[5] = v8;
  v9 = *MEMORY[0x1E0CB8860];
  v10 = *MEMORY[0x1E0CB9A90];
  v17[6] = *MEMORY[0x1E0CB9A68];
  v17[7] = v10;
  v11 = *MEMORY[0x1E0CB8958];
  v18[6] = v9;
  v18[7] = v11;
  v12 = *MEMORY[0x1E0CB8988];
  v13 = *MEMORY[0x1E0CB9AB8];
  v17[8] = *MEMORY[0x1E0CB9A98];
  v17[9] = v13;
  v14 = *MEMORY[0x1E0CB8A38];
  v18[8] = v12;
  v18[9] = v14;
  v17[10] = *MEMORY[0x1E0CB9AF8];
  v18[10] = *MEMORY[0x1E0CB8890];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 11);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)qword_1ED379070;
  qword_1ED379070 = v15;

}

void __49__HMService_AbstractionAdditions__hf_moveToRoom___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "home");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assignAccessory:toRoom:completionHandler:", v5, *(_QWORD *)(a1 + 40), v4);

}

id __112__HMService_HFCharacteristicValueDisplayMetadataAdditions__hf_allRequiredCharacteristicTypesForStandardServices__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__HMService_HFCharacteristicValueDisplayMetadataAdditions__hf_allRequiredCharacteristicTypesForStandardServices__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (qword_1ED379078 != -1)
    dispatch_once(&qword_1ED379078, block);
  return (id)qword_1ED379080;
}

void __112__HMService_HFCharacteristicValueDisplayMetadataAdditions__hf_allRequiredCharacteristicTypesForStandardServices__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "hf_standardServiceTypes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __112__HMService_HFCharacteristicValueDisplayMetadataAdditions__hf_allRequiredCharacteristicTypesForStandardServices__block_invoke_3;
  v6[3] = &__block_descriptor_40_e25___NSSet_16__0__NSString_8l;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "na_map:", v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_setByFlattening");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED379080;
  qword_1ED379080 = v3;

}

uint64_t __112__HMService_HFCharacteristicValueDisplayMetadataAdditions__hf_allRequiredCharacteristicTypesForStandardServices__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hf_requiredCharacteristicTypesForDisplayMetadataWithServiceType:", a2);
}

void __70__HMService_HFIncludedContextProtocol__hf_updateValue_forContextType___block_invoke(uint64_t a1, void *a2)
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

uint64_t __44__HMService_Additions__hf_roomsForServices___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_parentRoom");
}

uint64_t __44__HMService_Additions__hf_roomsForServices___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __44__HMService_Additions__hf_serviceComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend(v5, "isPrimaryService");
  if (v6 == objc_msgSend(v4, "isPrimaryService"))
  {
    objc_msgSend(v5, "instanceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "instanceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "compare:", v10);

  }
  else
  {
    v7 = objc_msgSend(v5, "isPrimaryService");

    if (v7)
      v8 = -1;
    else
      v8 = 1;
  }

  return v8;
}

void __68__HMService_Additions__hf_serviceTypesHiddenFromScenesOrAutomations__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9A50], *MEMORY[0x1E0CB9A18], *MEMORY[0x1E0CB9B08], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379250;
  qword_1ED379250 = v0;

}

uint64_t __48__HMService_Additions__hf_updateIconDescriptor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void __48__HMService_Additions__hf_updateIconDescriptor___block_invoke_2(uint64_t a1, void *a2)
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

void __41__HMService_Additions__hf_supportsGroups__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB9AA0];
  v7[0] = *MEMORY[0x1E0CB9A70];
  v7[1] = v1;
  v2 = *MEMORY[0x1E0CB9A10];
  v7[2] = *MEMORY[0x1E0CB9AD8];
  v7[3] = v2;
  v3 = *MEMORY[0x1E0CB9B30];
  v7[4] = *MEMORY[0x1E0CB9B10];
  v7[5] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED379260;
  qword_1ED379260 = v5;

}

uint64_t __39__HMService_Additions__hf_serviceGroup__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 32)))
    v5 = objc_msgSend(v3, "hf_isSupported");
  else
    v5 = 0;

  return v5;
}

uint64_t __47__HMService_Additions__hf_requiresDeviceUnlock__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "requiresDeviceUnlock");
}

uint64_t __47__HMService_Additions__hf_childServicesOfType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __55__HMService_Additions___hf_allowedChildServicesTypeMap__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];
  uint64_t v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  uint64_t v31;
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[8];

  v37[6] = *MEMORY[0x1E0C80C00];
  v32[0] = *MEMORY[0x1E0CB99A8];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v2 = *MEMORY[0x1E0CB9A20];
  v30[0] = *MEMORY[0x1E0CB9B10];
  v1 = v30[0];
  v30[1] = v2;
  v31 = *MEMORY[0x1E0CB9AB0];
  v3 = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v23;
  v32[1] = *MEMORY[0x1E0CB9A38];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v29[0] = v1;
  v29[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v5;
  v33 = *MEMORY[0x1E0CB9A30];
  v6 = v33;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v28[0] = v1;
  v28[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v9;
  v34 = *MEMORY[0x1E0CB9A50];
  v10 = (void *)MEMORY[0x1E0C99E60];
  v27 = *MEMORY[0x1E0CB9B08];
  v11 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v13;
  v35 = *MEMORY[0x1E0CB9A18];
  v14 = (void *)MEMORY[0x1E0C99E60];
  v26[0] = v6;
  v26[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v16;
  v36 = *MEMORY[0x1E0CB9AF0];
  v17 = (void *)MEMORY[0x1E0C99E60];
  v25 = *MEMORY[0x1E0CB9A48];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v32, 6);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)qword_1ED3792A0;
  qword_1ED3792A0 = v20;

}

uint64_t __40__HMService_Additions__hf_childServices__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9A48]);

  return v3;
}

uint64_t __40__HMService_Additions__hf_childServices__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_hf_allowedChildServicesTypeMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "serviceType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __40__HMService_Additions__hf_childServices__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_hf_isDirectlyOrIndirectlyLinkedToService:", *(_QWORD *)(a1 + 32)) ^ 1;
}

void __56__HMService_Additions__hf_descriptionForServiceSubtype___block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB9970];
  v4[0] = *MEMORY[0x1E0CB9988];
  v4[1] = v0;
  v5[0] = CFSTR("Unknown");
  v5[1] = CFSTR("GenericValve");
  v1 = *MEMORY[0x1E0CB9980];
  v4[2] = *MEMORY[0x1E0CB9978];
  v4[3] = v1;
  v5[2] = CFSTR("IrrigationValve");
  v5[3] = CFSTR("ShowerheadValve");
  v4[4] = *MEMORY[0x1E0CB9990];
  v5[4] = CFSTR("WaterFaucetValve");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED3792B0;
  qword_1ED3792B0 = v2;

}

id __53__HMService_Additions__hf_characteristicsInServices___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __50__HMService_Additions__hf_supportsNaturalLighting__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportedFeatures") & 1;

  return v3;
}

void __57__HMService_Additions__hf_getUserFriendlyDescriptionKey___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[45];
  _QWORD v25[46];

  v25[45] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB99A8];
  v24[0] = *MEMORY[0x1E0CB99A0];
  v24[1] = v0;
  v25[0] = CFSTR("AccessoryInformation");
  v25[1] = CFSTR("AirPurifier");
  v1 = *MEMORY[0x1E0CB99B8];
  v24[2] = *MEMORY[0x1E0CB99B0];
  v24[3] = v1;
  v25[2] = CFSTR("AirQualitySensor");
  v25[3] = CFSTR("Battery");
  v2 = *MEMORY[0x1E0CB99D8];
  v24[4] = *MEMORY[0x1E0CB99C0];
  v24[5] = v2;
  v25[4] = CFSTR("CameraControl");
  v25[5] = CFSTR("CameraRecordingManagement");
  v3 = *MEMORY[0x1E0CB99E0];
  v24[6] = *MEMORY[0x1E0CB99D0];
  v24[7] = v3;
  v25[6] = CFSTR("CameraRTPStreamManagement");
  v25[7] = CFSTR("CarbonDioxideSensor");
  v4 = *MEMORY[0x1E0CB99F0];
  v24[8] = *MEMORY[0x1E0CB99E8];
  v24[9] = v4;
  v25[8] = CFSTR("CarbonMonoxideSensor");
  v25[9] = CFSTR("ContactSensor");
  v5 = *MEMORY[0x1E0CB9A08];
  v24[10] = *MEMORY[0x1E0CB9A00];
  v24[11] = v5;
  v25[10] = CFSTR("Door");
  v25[11] = CFSTR("Doorbell");
  v6 = *MEMORY[0x1E0CB9A18];
  v24[12] = *MEMORY[0x1E0CB9A10];
  v24[13] = v6;
  v25[12] = CFSTR("Fan");
  v25[13] = CFSTR("Faucet");
  v7 = *MEMORY[0x1E0CB9A28];
  v24[14] = *MEMORY[0x1E0CB9A20];
  v24[15] = v7;
  v25[14] = CFSTR("FilterMaintenance");
  v25[15] = CFSTR("GarageDoorOpener");
  v8 = *MEMORY[0x1E0CB9A38];
  v24[16] = *MEMORY[0x1E0CB9A30];
  v24[17] = v8;
  v25[16] = CFSTR("HeaterCooler");
  v25[17] = CFSTR("HumidifierDehumidifier");
  v9 = *MEMORY[0x1E0CB9A48];
  v24[18] = *MEMORY[0x1E0CB9A40];
  v24[19] = v9;
  v25[18] = CFSTR("HumiditySensor");
  v25[19] = CFSTR("InputSource");
  v10 = *MEMORY[0x1E0CB9A58];
  v24[20] = *MEMORY[0x1E0CB9A50];
  v24[21] = v10;
  v25[20] = CFSTR("IrrigationSystem");
  v25[21] = CFSTR("Label");
  v11 = *MEMORY[0x1E0CB9A68];
  v24[22] = *MEMORY[0x1E0CB9A60];
  v24[23] = v11;
  v25[22] = CFSTR("LeakSensor");
  v25[23] = CFSTR("LightSensor");
  v12 = *MEMORY[0x1E0CB9A78];
  v24[24] = *MEMORY[0x1E0CB9A70];
  v24[25] = v12;
  v25[24] = CFSTR("Lightbulb");
  v25[25] = CFSTR("LockManagement");
  v13 = *MEMORY[0x1E0CB9A88];
  v24[26] = *MEMORY[0x1E0CB9A80];
  v24[27] = v13;
  v25[26] = CFSTR("LockMechanism");
  v25[27] = CFSTR("Microphone");
  v14 = *MEMORY[0x1E0CB9A98];
  v24[28] = *MEMORY[0x1E0CB9A90];
  v24[29] = v14;
  v25[28] = CFSTR("MotionSensor");
  v25[29] = CFSTR("OccupancySensor");
  v15 = *MEMORY[0x1E0CB9AA8];
  v24[30] = *MEMORY[0x1E0CB9AA0];
  v24[31] = v15;
  v25[30] = CFSTR("Outlet");
  v25[31] = CFSTR("SecuritySystem");
  v16 = *MEMORY[0x1E0CB9AB8];
  v24[32] = *MEMORY[0x1E0CB9AB0];
  v24[33] = v16;
  v25[32] = CFSTR("Slats");
  v25[33] = CFSTR("SmokeSensor");
  v17 = *MEMORY[0x1E0CB9AC8];
  v24[34] = *MEMORY[0x1E0CB9AC0];
  v24[35] = v17;
  v25[34] = CFSTR("Speaker");
  v25[35] = CFSTR("StatefulProgrammableSwitch");
  v18 = *MEMORY[0x1E0CB9AD8];
  v24[36] = *MEMORY[0x1E0CB9AD0];
  v24[37] = v18;
  v25[36] = CFSTR("StatelessProgrammableSwitch");
  v25[37] = CFSTR("Switch");
  v19 = *MEMORY[0x1E0CB9AF8];
  v24[38] = *MEMORY[0x1E0CB9AF0];
  v24[39] = v19;
  v25[38] = CFSTR("Television");
  v25[39] = CFSTR("TemperatureSensor");
  v20 = *MEMORY[0x1E0CB9B08];
  v24[40] = *MEMORY[0x1E0CB9B00];
  v24[41] = v20;
  v25[40] = CFSTR("Thermostat");
  v25[41] = CFSTR("Valve");
  v21 = *MEMORY[0x1E0CB9B28];
  v24[42] = *MEMORY[0x1E0CB9B10];
  v24[43] = v21;
  v25[42] = CFSTR("VentilationFan");
  v25[43] = CFSTR("Window");
  v24[44] = *MEMORY[0x1E0CB9B30];
  v25[44] = CFSTR("WindowCovering");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 45);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)qword_1ED3792B8;
  qword_1ED3792B8 = v22;

}

uint64_t __78__HMService_HFProgrammableSwitchAdditions__hf_fallbackProgrammableSwitchIndex__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0CBA7E0];
  v3 = a2;
  objc_msgSend(v2, "hf_programmableSwitchServiceTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5);
  return v6;
}

uint64_t __78__HMService_HFProgrammableSwitchAdditions__hf_fallbackProgrammableSwitchIndex__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

uint64_t __73__HMService_HFProgrammableSwitchAdditions___hf_firstLinkedServiceOfType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __59__HMService_HFApplicationData___hf_applicationDataUpdated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessory:didUpdateApplicationDataForService:", v3, *(_QWORD *)(a1 + 32));

  }
}

void __87__HMService_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke(uint64_t a1, void *a2)
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
  id v14;

  v14 = a2;
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
  v9 = *(unsigned __int8 *)(a1 + 64);
  v10 = *v8;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
    objc_msgSend(v11, "handleError:operationType:options:retryBlock:cancelBlock:", v14, v10, 0, 0, 0);
  else
    objc_msgSend(v11, "logError:operationDescription:", v14, v10);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_hf_applicationDataUpdated:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
