@implementation MKFCKGuest

+ (BOOL)_importWeekDayScheduleRulesIntoLocalModel:(id)a3 fromCloudModel:(id)a4 localRelationship:(id)a5 cloudAttributeName:(id)a6 parentRelationshipName:(id)a7 context:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;

  v13 = a3;
  v14 = a7;
  v15 = a8;
  v16 = a5;
  objc_msgSend(a4, "valueForKey:", a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "valueForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v17, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __139__MKFCKGuest__importWeekDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke;
  v41[3] = &unk_24E777A98;
  v23 = v21;
  v42 = v23;
  objc_msgSend(v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v41);
  v35[0] = v22;
  v35[1] = 3221225472;
  v35[2] = __139__MKFCKGuest__importWeekDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke_2;
  v35[3] = &unk_24E7794C8;
  v36 = v23;
  v24 = v15;
  v37 = v24;
  v38 = v13;
  v39 = v14;
  v25 = v20;
  v40 = v25;
  v26 = v14;
  v27 = v13;
  v28 = v23;
  objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v35);
  v32[0] = v22;
  v32[1] = 3221225472;
  v32[2] = __139__MKFCKGuest__importWeekDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke_3;
  v32[3] = &unk_24E777AC0;
  v33 = v25;
  v34 = v24;
  v29 = v24;
  v30 = v25;
  objc_msgSend(v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v32);

  return 1;
}

+ (BOOL)_importYearDayScheduleRulesIntoLocalModel:(id)a3 fromCloudModel:(id)a4 localRelationship:(id)a5 cloudAttributeName:(id)a6 parentRelationshipName:(id)a7 context:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;

  v13 = a3;
  v14 = a7;
  v15 = a8;
  v16 = a5;
  objc_msgSend(a4, "valueForKey:", a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "valueForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v17, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __139__MKFCKGuest__importYearDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke;
  v41[3] = &unk_24E777AE8;
  v23 = v21;
  v42 = v23;
  objc_msgSend(v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v41);
  v35[0] = v22;
  v35[1] = 3221225472;
  v35[2] = __139__MKFCKGuest__importYearDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke_2;
  v35[3] = &unk_24E7794C8;
  v36 = v23;
  v24 = v15;
  v37 = v24;
  v38 = v13;
  v39 = v14;
  v25 = v20;
  v40 = v25;
  v26 = v14;
  v27 = v13;
  v28 = v23;
  objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v35);
  v32[0] = v22;
  v32[1] = 3221225472;
  v32[2] = __139__MKFCKGuest__importYearDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke_3;
  v32[3] = &unk_24E777B10;
  v33 = v25;
  v34 = v24;
  v29 = v24;
  v30 = v25;
  objc_msgSend(v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v32);

  return 1;
}

+ (id)_dictionaryRepresentationFromWeekDayScheduleRules:(id)a3 cloudWeekDayScheduleRulesDictionary:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v5 = (void *)MEMORY[0x24BDBCEF0];
  v6 = a3;
  objc_msgSend(v5, "setWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __100__MKFCKGuest__dictionaryRepresentationFromWeekDayScheduleRules_cloudWeekDayScheduleRulesDictionary___block_invoke;
  v14 = &unk_24E777B38;
  v15 = v7;
  v16 = a1;
  v8 = v7;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v11);

  objc_msgSend(v8, "allObjects", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_dictionaryRepresentationFromYearDayScheduleRules:(id)a3 cloudYearDayScheduleRulesDictionary:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v5 = (void *)MEMORY[0x24BDBCEF0];
  v6 = a3;
  objc_msgSend(v5, "setWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __100__MKFCKGuest__dictionaryRepresentationFromYearDayScheduleRules_cloudYearDayScheduleRulesDictionary___block_invoke;
  v14 = &unk_24E777B60;
  v15 = v7;
  v16 = a1;
  v8 = v7;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v11);

  objc_msgSend(v8, "allObjects", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __100__MKFCKGuest__dictionaryRepresentationFromYearDayScheduleRules_cloudYearDayScheduleRulesDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(v3, "isValid") & 1) != 0)
  {
    objc_msgSend(v3, "dictionaryRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "debugDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot export yearDayRule as it is not valid : %{public}@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }

}

void __100__MKFCKGuest__dictionaryRepresentationFromWeekDayScheduleRules_cloudWeekDayScheduleRulesDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(v3, "isValid") & 1) != 0)
  {
    objc_msgSend(v3, "dictionaryRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "debugDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot export weekDayRule as it is not valid : %{public}@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }

}

void __139__MKFCKGuest__importYearDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "modelID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __139__MKFCKGuest__importYearDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_msgSend(v3, "copy");
  +[_MKFYearDayScheduleRule populateYearDayScheduleRuleFromDictionary:existingLocalModels:context:](_MKFYearDayScheduleRule, "populateYearDayScheduleRuleFromDictionary:existingLocalModels:context:", v4, v5, *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "setValue:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v6);
  }

}

void __139__MKFCKGuest__importYearDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v3);

}

void __139__MKFCKGuest__importWeekDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "modelID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __139__MKFCKGuest__importWeekDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_msgSend(v3, "copy");
  +[_MKFWeekDayScheduleRule populateWeekDayScheduleRuleFromDictionary:existingLocalModels:context:](_MKFWeekDayScheduleRule, "populateWeekDayScheduleRuleFromDictionary:existingLocalModels:context:", v4, v5, *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "setValue:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v6);
  }

}

void __139__MKFCKGuest__importWeekDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v3);

}

- (BOOL)_importWeekDayScheduleRulesIntoLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  objc_msgSend(v7, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "relationshipsByName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("weekDayScheduleRules_"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v8, "_importWeekDayScheduleRulesIntoLocalModel:fromCloudModel:localRelationship:cloudAttributeName:parentRelationshipName:context:", v7, self, v11, CFSTR("weekDayScheduleRules"), CFSTR("guest"), v6);

  return (char)self;
}

- (BOOL)_importYearDayScheduleRulesIntoLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  objc_msgSend(v7, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "relationshipsByName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("yearDayScheduleRules_"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v8, "_importYearDayScheduleRulesIntoLocalModel:fromCloudModel:localRelationship:cloudAttributeName:parentRelationshipName:context:", v7, self, v11, CFSTR("yearDayScheduleRules"), CFSTR("guest"), v6);

  return (char)self;
}

- (BOOL)_importAllowedAccessoriesRelationshipIntoLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHomeObject _importSiblingRelationshipsIntoLocalModel:localRelationship:context:](self, a3, CFSTR("allowedAccessories_"), a4);
}

- (BOOL)_importGuestAccessCodeIntoLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _MKFUserAccessCode *v10;
  _MKFUserAccessCode *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  MKFCKGuest *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MKFCKGuest homeAccessCode](self, "homeAccessCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  objc_msgSend(v6, "accessCode");
  v10 = (_MKFUserAccessCode *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (!v10)
    {
      v11 = -[_MKFUserAccessCode initWithContext:]([_MKFUserAccessCode alloc], "initWithContext:", v7);
      -[MKFCKGuest modelID](self, "modelID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDUserAccessCodeModel modelUUIDWithUUID:](HMDUserAccessCodeModel, "modelUUIDWithUUID:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFUserAccessCode setModelID:](v11, "setModelID:", v13);

    }
    -[_MKFUserAccessCode accessCode](v11, "accessCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKGuest homeAccessCode](self, "homeAccessCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = HMFEqualObjects();

    if ((v16 & 1) == 0)
    {
      -[MKFCKGuest homeAccessCode](self, "homeAccessCode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFUserAccessCode setAccessCode:](v11, "setAccessCode:", v17);

    }
    -[_MKFUserAccessCode guest](v11, "guest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = HMFEqualObjects();

    if ((v19 & 1) == 0)
      -[_MKFUserAccessCode setGuest:](v11, "setGuest:", v6);
    objc_msgSend(v6, "accessCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = HMFEqualObjects();

    if ((v21 & 1) == 0)
      objc_msgSend(v6, "setAccessCode:", v11);
LABEL_14:

    goto LABEL_15;
  }

  if (v11)
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accessCode");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "debugDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543874;
      v30 = v25;
      v31 = 2112;
      v32 = v26;
      v33 = 2112;
      v34 = v27;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Deleting the MKFUserAccessCode %@ for Guest %@", (uint8_t *)&v29, 0x20u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(v6, "accessCode");
    v11 = (_MKFUserAccessCode *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteObject:", v11);
    goto LABEL_14;
  }
LABEL_15:

  return 1;
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  BOOL v9;

  v7 = a3;
  v8 = a5;
  v9 = -[MKFCKModel copyPropertiesIntoLocalModel:context:](self, "copyPropertiesIntoLocalModel:context:", v7, v8)
    && -[MKFCKGuest _importAllowedAccessoriesRelationshipIntoLocalModel:context:](self, "_importAllowedAccessoriesRelationshipIntoLocalModel:context:", v7, v8)&& -[MKFCKGuest _importGuestAccessCodeIntoLocalModel:context:](self, "_importGuestAccessCodeIntoLocalModel:context:", v7, v8)&& -[MKFCKGuest _importWeekDayScheduleRulesIntoLocalModel:context:](self, "_importWeekDayScheduleRulesIntoLocalModel:context:", v7, v8)&& -[MKFCKGuest _importYearDayScheduleRulesIntoLocalModel:context:](self, "_importYearDayScheduleRulesIntoLocalModel:context:", v7, v8);

  return v9;
}

- (BOOL)_exportWeekDaySchedulesFromLocalModel:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  objc_msgSend(v5, "weekDayScheduleRules");
  v7 = objc_claimAutoreleasedReturnValue();

  -[MKFCKGuest weekDayScheduleRules](self, "weekDayScheduleRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_dictionaryRepresentationFromWeekDayScheduleRules:cloudWeekDayScheduleRulesDictionary:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKFCKGuest weekDayScheduleRules](self, "weekDayScheduleRules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = HMFEqualObjects();

  if ((v7 & 1) == 0)
    -[MKFCKGuest setWeekDayScheduleRules:](self, "setWeekDayScheduleRules:", v9);

  return 1;
}

- (BOOL)_exportYearDaySchedulesFromLocalModel:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  objc_msgSend(v5, "yearDayScheduleRules");
  v7 = objc_claimAutoreleasedReturnValue();

  -[MKFCKGuest yearDayScheduleRules](self, "yearDayScheduleRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_dictionaryRepresentationFromYearDayScheduleRules:cloudYearDayScheduleRulesDictionary:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKFCKGuest yearDayScheduleRules](self, "yearDayScheduleRules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = HMFEqualObjects();

  if ((v7 & 1) == 0)
    -[MKFCKGuest setYearDayScheduleRules:](self, "setYearDayScheduleRules:", v9);

  return 1;
}

- (BOOL)_exportAllowedAccessoriesRelationshipFromGuestLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHomeObject _exportSiblingRelationshipsFromLocalModel:localRelationship:context:](self, a3, CFSTR("allowedAccessories_"), a4);
}

- (BOOL)_exportGuestAccessCodeFromLocalModel:(id)a3 context:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "accessCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "accessCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKGuest setHomeAccessCode:](self, "setHomeAccessCode:", v7);

  }
  return 1;
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[MKFCKModel copyPropertiesFromLocalModel:context:](self, "copyPropertiesFromLocalModel:context:", v8, v10)
    && -[MKFCKGuest _exportAllowedAccessoriesRelationshipFromGuestLocalModel:context:](self, "_exportAllowedAccessoriesRelationshipFromGuestLocalModel:context:", v8, v10)&& -[MKFCKGuest _exportGuestAccessCodeFromLocalModel:context:](self, "_exportGuestAccessCodeFromLocalModel:context:", v8, v10)&& (!-[MKFCKModel shouldExportUpdatedPropertyInSet:name:](self, "shouldExportUpdatedPropertyInSet:name:", v9, CFSTR("weekDayScheduleRules_"))|| -[MKFCKGuest _exportWeekDaySchedulesFromLocalModel:context:](self, "_exportWeekDaySchedulesFromLocalModel:context:", v8, v10)))
  {
    if (-[MKFCKModel shouldExportUpdatedPropertyInSet:name:](self, "shouldExportUpdatedPropertyInSet:name:", v9, CFSTR("yearDayScheduleRules_")))
    {
      v11 = -[MKFCKGuest _exportYearDaySchedulesFromLocalModel:context:](self, "_exportYearDaySchedulesFromLocalModel:context:", v8, v10);
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKGuest"));
}

@end
