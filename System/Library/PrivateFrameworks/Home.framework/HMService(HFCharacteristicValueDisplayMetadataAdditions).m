@implementation HMService(HFCharacteristicValueDisplayMetadataAdditions)

+ (id)hf_requiredCharacteristicTypesForDisplayMetadataWithServiceType:()HFCharacteristicValueDisplayMetadataAdditions
{
  id v3;
  HFServiceDescriptor *v4;
  objc_class *v5;
  void *v6;
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD v32[4];
  _QWORD v33[2];
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[3];
  _QWORD v39[3];
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[HFServiceDescriptor initWithServiceType:serviceSubtype:parentServiceDescriptor:]([HFServiceDescriptor alloc], "initWithServiceType:serviceSubtype:parentServiceDescriptor:", v3, 0, 0);
  v5 = +[HFServiceState stateClassForServiceDescriptor:](HFServiceState, "stateClassForServiceDescriptor:", v4);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_sensorServiceTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __HFSimplePowerStateServices_block_invoke();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __HFSimpleActiveStateServices_block_invoke();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __HFCurrentTargetPositionServices_block_invoke();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB99A0]))
      goto LABEL_4;
    if (objc_msgSend(v7, "containsObject:", v3))
    {
      v12 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend((id)objc_opt_class(), "hf_sensorCharacteristicTypeForServiceType:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithArray:", v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_33;
    }
    if (objc_msgSend(v8, "containsObject:", v3))
    {
      v15 = (void *)MEMORY[0x1E0C99E60];
      v41 = *MEMORY[0x1E0CB89C8];
      v16 = (void *)MEMORY[0x1E0C99D20];
      v17 = &v41;
LABEL_12:
      v18 = 1;
LABEL_32:
      objc_msgSend(v16, "arrayWithObjects:count:", v17, v18);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithArray:", v30);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_33;
    }
    if (objc_msgSend(v9, "containsObject:", v3))
    {
      v15 = (void *)MEMORY[0x1E0C99E60];
      v40 = *MEMORY[0x1E0CB8790];
      v16 = (void *)MEMORY[0x1E0C99D20];
      v17 = &v40;
      goto LABEL_12;
    }
    if (objc_msgSend(v10, "containsObject:", v3))
    {
      v15 = (void *)MEMORY[0x1E0C99E60];
      v19 = *MEMORY[0x1E0CB8AF0];
      v39[0] = *MEMORY[0x1E0CB8878];
      v39[1] = v19;
      v39[2] = *MEMORY[0x1E0CB8980];
      v16 = (void *)MEMORY[0x1E0C99D20];
      v17 = v39;
LABEL_17:
      v18 = 3;
      goto LABEL_32;
    }
    if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9A28]))
    {
      v15 = (void *)MEMORY[0x1E0C99E60];
      v20 = *MEMORY[0x1E0CB8AA8];
      v38[0] = *MEMORY[0x1E0CB8838];
      v38[1] = v20;
      v38[2] = *MEMORY[0x1E0CB8980];
      v16 = (void *)MEMORY[0x1E0C99D20];
      v17 = v38;
      goto LABEL_17;
    }
    if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9A80]))
    {
      v15 = (void *)MEMORY[0x1E0C99E60];
      v21 = *MEMORY[0x1E0CB8AE0];
      v37[0] = *MEMORY[0x1E0CB8868];
      v37[1] = v21;
      v16 = (void *)MEMORY[0x1E0C99D20];
      v17 = v37;
    }
    else
    {
      if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9AA8]))
      {
        if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9B00]))
        {
          v15 = (void *)MEMORY[0x1E0C99E60];
          v23 = *MEMORY[0x1E0CB8B08];
          v35[0] = *MEMORY[0x1E0CB8890];
          v35[1] = v23;
          v24 = *MEMORY[0x1E0CB8AC0];
          v35[2] = *MEMORY[0x1E0CB8848];
          v35[3] = v24;
          v16 = (void *)MEMORY[0x1E0C99D20];
          v17 = v35;
        }
        else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9A30]))
        {
          v15 = (void *)MEMORY[0x1E0C99E60];
          v25 = *MEMORY[0x1E0CB8890];
          v34[0] = *MEMORY[0x1E0CB8790];
          v34[1] = v25;
          v26 = *MEMORY[0x1E0CB8AB8];
          v34[2] = *MEMORY[0x1E0CB8840];
          v34[3] = v26;
          v16 = (void *)MEMORY[0x1E0C99D20];
          v17 = v34;
        }
        else
        {
          if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB99A8]))
          {
            v15 = (void *)MEMORY[0x1E0C99E60];
            v27 = *MEMORY[0x1E0CB8830];
            v33[0] = *MEMORY[0x1E0CB8790];
            v33[1] = v27;
            v16 = (void *)MEMORY[0x1E0C99D20];
            v17 = v33;
            goto LABEL_22;
          }
          if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9A38]))
          {
            if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9AC8])
              && !objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9AD0]))
            {
              if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9A48]))
              {
                NSLog(CFSTR("Unknown or unimplemented service type \"%@\"), v3);
                v6 = 0;
                goto LABEL_33;
              }
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB8910]);
              v11 = objc_claimAutoreleasedReturnValue();
              goto LABEL_5;
            }
LABEL_4:
            objc_msgSend(MEMORY[0x1E0C99E60], "set");
            v11 = objc_claimAutoreleasedReturnValue();
LABEL_5:
            v6 = (void *)v11;
LABEL_33:

            goto LABEL_34;
          }
          v15 = (void *)MEMORY[0x1E0C99E60];
          v28 = *MEMORY[0x1E0CB8880];
          v32[0] = *MEMORY[0x1E0CB8790];
          v32[1] = v28;
          v29 = *MEMORY[0x1E0CB8AD0];
          v32[2] = *MEMORY[0x1E0CB8858];
          v32[3] = v29;
          v16 = (void *)MEMORY[0x1E0C99D20];
          v17 = v32;
        }
        v18 = 4;
        goto LABEL_32;
      }
      v15 = (void *)MEMORY[0x1E0C99E60];
      v22 = *MEMORY[0x1E0CB8B00];
      v36[0] = *MEMORY[0x1E0CB8888];
      v36[1] = v22;
      v16 = (void *)MEMORY[0x1E0C99D20];
      v17 = v36;
    }
LABEL_22:
    v18 = 2;
    goto LABEL_32;
  }
  -[objc_class requiredCharacteristicTypes](v5, "requiredCharacteristicTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:

  return v6;
}

- (id)hf_requiredCharacteristicTypesForDisplayMetadata
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_requiredCharacteristicTypesForDisplayMetadataWithServiceType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hf_sensorCharacteristicTypeForServiceType:()HFCharacteristicValueDisplayMetadataAdditions
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (_MergedGlobals_250 != -1)
    dispatch_once(&_MergedGlobals_250, &__block_literal_global_2_11);
  v4 = (id)qword_1ED379070;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    NSLog(CFSTR("No characteristic type specified for service type \"%@\"), v3);

  return v5;
}

+ (id)hf_allRequiredCharacteristicTypesForStandardServices
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __112__HMService_HFCharacteristicValueDisplayMetadataAdditions__hf_allRequiredCharacteristicTypesForStandardServices__block_invoke;
  v2[3] = &__block_descriptor_40_e5__8__0l;
  v2[4] = a1;
  __112__HMService_HFCharacteristicValueDisplayMetadataAdditions__hf_allRequiredCharacteristicTypesForStandardServices__block_invoke((uint64_t)v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
