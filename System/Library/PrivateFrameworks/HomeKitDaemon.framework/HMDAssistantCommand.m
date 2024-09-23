@implementation HMDAssistantCommand

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_18652 != -1)
    dispatch_once(&logCategory__hmf_once_t2_18652, &__block_literal_global_18653);
  return (id)logCategory__hmf_once_v3_18654;
}

+ (void)initialize
{
  void *v2;
  HMDAssistantColorCharacteristic *v3;
  uint64_t v4;
  HMDAssistantColorCharacteristic *v5;
  HMDAssistantColorCharacteristic *v6;
  HMDAssistantColorCharacteristic *v7;
  HMDAssistantColorCharacteristic *v8;
  HMDAssistantColorCharacteristic *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (!+[HMDDeviceCapabilities supportsDeviceLock](HMDDeviceCapabilities, "supportsDeviceLock"))
    unlockErrorCode = 1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [HMDAssistantColorCharacteristic alloc];
  v4 = *MEMORY[0x24BDD56E8];
  v5 = -[HMDAssistantColorCharacteristic initWithReadCharacteristicType:writeCharacteristicType:format:mandatory:](v3, "initWithReadCharacteristicType:writeCharacteristicType:format:mandatory:", *MEMORY[0x24BDD58D0], *MEMORY[0x24BDD58D0], *MEMORY[0x24BDD56E8], 1);
  objc_msgSend(v2, "addObject:", v5);
  v6 = [HMDAssistantColorCharacteristic alloc];
  v7 = -[HMDAssistantColorCharacteristic initWithReadCharacteristicType:writeCharacteristicType:format:mandatory:](v6, "initWithReadCharacteristicType:writeCharacteristicType:format:mandatory:", *MEMORY[0x24BDD59A8], *MEMORY[0x24BDD59A8], v4, 1);

  objc_msgSend(v2, "addObject:", v7);
  v8 = [HMDAssistantColorCharacteristic alloc];
  v9 = -[HMDAssistantColorCharacteristic initWithReadCharacteristicType:writeCharacteristicType:format:mandatory:](v8, "initWithReadCharacteristicType:writeCharacteristicType:format:mandatory:", *MEMORY[0x24BDD57A0], *MEMORY[0x24BDD57A0], *MEMORY[0x24BDD56F0], 1);

  objc_msgSend(v2, "addObject:", v9);
  v13 = CFSTR("HSB");
  v10 = (void *)objc_msgSend(v2, "copy");
  v14[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)supportedColorSpaces;
  supportedColorSpaces = v11;

}

void __34__HMDAssistantCommand_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_18654;
  logCategory__hmf_once_v3_18654 = v0;

}

- (id)serviceFromObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("objectReference"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_stringForKey:", CFSTR("objectType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE81F50])
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)mediaProfileFromObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("objectReference"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_stringForKey:", CFSTR("objectType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE81F50]))
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)populateResult:(id)a3 withService:(id)a4 serviceType:(id)a5 characteristic:(id)a6 resultAttribute:(id)a7 action:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  int v75;
  uint64_t v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  char v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  HMDAssistantCommand *v93;
  void *v94;
  void *v95;
  char v96;
  void *v97;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v13, "setResultAttribute:", v16);
  }
  else
  {
    if (v15)
    {
      objc_msgSend(v15, "characteristicType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "mapToAssistantCharacteristicName:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setResultAttribute:", v20);

    }
    else
    {
      objc_msgSend(v17, "attribute");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setResultAttribute:", v19);
    }

  }
  objc_msgSend(v17, "attribute");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    objc_msgSend(v13, "outcome");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = isOutcomeSuccess(v23);

    if (v24)
    {
      v93 = self;
      if (v15)
      {
        objc_msgSend(v15, "characteristicType");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v17)
          goto LABEL_16;
        objc_msgSend(v17, "actionType");
        v27 = objc_claimAutoreleasedReturnValue();
        if (!v27
          || (v28 = (void *)v27,
              objc_msgSend(v17, "actionType"),
              v29 = (void *)objc_claimAutoreleasedReturnValue(),
              v30 = objc_msgSend(v29, "isEqualToString:", *MEMORY[0x24BE81C58]),
              v29,
              v28,
              v30))
        {
          objc_msgSend(v17, "attribute");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "mapReadCharacteristicFromAssistantName:", v31);
          v32 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_16:
          objc_msgSend(v17, "attribute");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "mapWriteCharacteristicFromAssistantName:", v31);
          v32 = objc_claimAutoreleasedReturnValue();
        }
        v25 = (void *)v32;

        objc_msgSend(v14, "characteristics");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "hmf_firstObjectWithCharacteristicType:", v25);
        v15 = (id)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          objc_msgSend(v18, "getCharacteristicTypeAlias:", v25);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "characteristics");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "hmf_firstObjectWithCharacteristicType:", v34);
          v15 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      objc_msgSend(v15, "metadata");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "units");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        LOBYTE(v26) = 1;
LABEL_46:

        goto LABEL_47;
      }
      v91 = v37;
      v97 = v25;
      objc_msgSend(v17, "actionType");
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = (uint64_t *)MEMORY[0x24BE81C58];
      v92 = v36;
      if (!v38)
      {
        v42 = *MEMORY[0x24BE81C58];
        goto LABEL_35;
      }
      v40 = (void *)v38;
      objc_msgSend(v17, "actionType");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = *v39;
      if (objc_msgSend(v41, "isEqualToString:", v42))
        goto LABEL_34;
      objc_msgSend(v17, "actionType");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v43, "isEqualToString:", *MEMORY[0x24BE81C78]))
      {

LABEL_34:
        goto LABEL_35;
      }
      v94 = v43;
      objc_msgSend(v17, "actionType");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v44, "isEqualToString:", *MEMORY[0x24BE81C88]) & 1) != 0)
      {

LABEL_33:
        goto LABEL_34;
      }
      v90 = v44;
      objc_msgSend(v17, "actionType");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v45, "isEqualToString:", *MEMORY[0x24BE81C80]) & 1) != 0)
      {

LABEL_32:
        goto LABEL_33;
      }
      v89 = v45;
      objc_msgSend(v17, "actionType");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v46, "isEqualToString:", *MEMORY[0x24BE81C50]) & 1) != 0)
      {

        goto LABEL_32;
      }
      objc_msgSend(v17, "actionType");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v87, "isEqualToString:", *MEMORY[0x24BE81CA0]);

      if ((v88 & 1) != 0)
      {
LABEL_35:
        objc_msgSend(v17, "value");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "units");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "mapFromAssistantUnitName:", v48);
        v95 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "actionType");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "isEqualToString:", v42);

        objc_msgSend(v13, "resultAttribute");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "value");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (isMetricLocale_onceToken != -1)
          dispatch_once(&isMetricLocale_onceToken, &__block_literal_global_177454);
        valueWithAssistantUnits(v95, v97, v51, v52, v50, isMetricLocale_isMetricLocale);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setResultValue:", v53);

        objc_msgSend(v17, "value");
        v54 = objc_claimAutoreleasedReturnValue();
        if (!v54)
        {
          LOBYTE(v26) = 1;
          v25 = v97;
          goto LABEL_44;
        }
        v55 = (void *)v54;
        objc_msgSend(v17, "actionType");
        v56 = objc_claimAutoreleasedReturnValue();
        if (v56)
        {
          v57 = (void *)v56;
          objc_msgSend(v17, "actionType");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "isEqualToString:", v42);

          v25 = v97;
          if (!v59)
          {
LABEL_40:
            LOBYTE(v26) = 1;
LABEL_44:

LABEL_45:
            v37 = v91;
            v36 = v92;
            goto LABEL_46;
          }
        }
        else
        {

          v25 = v97;
        }
        objc_msgSend(v17, "value");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "resultValue");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v26) = -[HMDAssistantCommand isAttributeValue:equalTo:](v93, "isAttributeValue:equalTo:", v60, v61);

        goto LABEL_44;
      }
      objc_msgSend(v17, "actionType");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v63, "isEqualToString:", *MEMORY[0x24BE81C98]))
      {

        v25 = v97;
        goto LABEL_52;
      }
      objc_msgSend(v17, "actionType");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "isEqualToString:", *MEMORY[0x24BE81C90]);

      v25 = v97;
      if (v65)
      {
LABEL_52:
        if (v18)
        {
          objc_msgSend(v17, "value");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "units");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "mapFromAssistantUnitName:", v67);
          v95 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "resultAttribute");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "value");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          if (isMetricLocale_onceToken != -1)
            dispatch_once(&isMetricLocale_onceToken, &__block_literal_global_177454);
          valueWithAssistantUnits(v95, v25, v68, v69, 0, isMetricLocale_isMetricLocale);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setResultValue:", v70);

          objc_msgSend(v13, "setOutcome:", *MEMORY[0x24BE81C30]);
          goto LABEL_40;
        }
LABEL_64:
        LOBYTE(v26) = 0;
        goto LABEL_45;
      }
      objc_msgSend(v17, "actionType");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = *MEMORY[0x24BE81C68];
      if ((objc_msgSend(v71, "isEqualToString:", *MEMORY[0x24BE81C68]) & 1) == 0)
      {
        objc_msgSend(v17, "actionType");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v73, "isEqualToString:", *MEMORY[0x24BE81C60]))
        {
          objc_msgSend(v17, "actionType");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = objc_msgSend(v79, "isEqualToString:", *MEMORY[0x24BE81C70]);

          v25 = v97;
          if ((v96 & 1) == 0)
          {
            LOBYTE(v26) = 1;
            goto LABEL_45;
          }
LABEL_60:
          if (!v18)
            goto LABEL_64;
          objc_msgSend(v17, "actionType");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = objc_msgSend(v74, "isEqualToString:", v72);

          if (v75)
          {
            objc_msgSend(v92, "minimumValue");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              objc_msgSend(v92, "minimumValue");
              v76 = objc_claimAutoreleasedReturnValue();
LABEL_68:
              v95 = (void *)v76;
              LOBYTE(v26) = 1;
LABEL_78:
              objc_msgSend(v13, "resultAttribute");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              if (isMetricLocale_onceToken != -1)
                dispatch_once(&isMetricLocale_onceToken, &__block_literal_global_177454);
              valueWithAssistantUnits(v91, v25, v82, v95, 1u, isMetricLocale_isMetricLocale);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setResultValue:", v83);

              objc_msgSend(v17, "value");
              v84 = (void *)objc_claimAutoreleasedReturnValue();

              if (v84)
              {
                objc_msgSend(v17, "value");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "resultValue");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v26) = -[HMDAssistantCommand isAttributeValue:equalTo:](v93, "isAttributeValue:equalTo:", v85, v86);

              }
              objc_msgSend(v13, "setOutcome:", *MEMORY[0x24BE81C30]);
              goto LABEL_44;
            }
            goto LABEL_71;
          }
          objc_msgSend(v17, "actionType");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = objc_msgSend(v77, "isEqualToString:", *MEMORY[0x24BE81C60]);

          if (v78)
          {
            objc_msgSend(v92, "maximumValue");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              objc_msgSend(v92, "maximumValue");
              v76 = objc_claimAutoreleasedReturnValue();
              goto LABEL_68;
            }
LABEL_71:
            v95 = 0;
            goto LABEL_78;
          }
          objc_msgSend(v17, "actionType");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend(v80, "isEqualToString:", *MEMORY[0x24BE81C70]);

          if (v81)
          {
            objc_msgSend(v92, "stepValue");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v26)
            {
              v95 = 0;
              goto LABEL_77;
            }
            objc_msgSend(v92, "stepValue");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v95 = 0;
          }
          LOBYTE(v26) = 1;
LABEL_77:
          v25 = v97;
          goto LABEL_78;
        }

      }
      goto LABEL_60;
    }
  }
  LOBYTE(v26) = 1;
LABEL_47:

  return (char)v26;
}

- (BOOL)populateResult:(id)a3 withObject:(id)a4 serviceType:(id)a5 action:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  BOOL v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(v13, "includeCompleteInformation");
  objc_msgSend(v13, "attribute");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setResultAttribute:", v15);

  entityFromObject(v11, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEntity:", v16);

  objc_msgSend(v13, "attribute");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17
    && (v18 = (void *)v17,
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("objectType")),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BE81F50]),
        v19,
        v18,
        v20))
  {
    -[HMDAssistantCommand serviceFromObject:](self, "serviceFromObject:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HMDAssistantCommand populateResult:withService:serviceType:characteristic:resultAttribute:action:](self, "populateResult:withService:serviceType:characteristic:resultAttribute:action:", v10, v21, v12, 0, 0, v13);

  }
  else
  {
    v22 = 1;
  }

  return v22;
}

- (BOOL)populateResultWithEntity:(id)a3 action:(id)a4 entity:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a3;
  objc_msgSend(a4, "attribute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResultAttribute:", v9);

  objc_msgSend(v8, "setEntity:", v7);
  return 1;
}

- (BOOL)populateMediaProfileWriteResult:(id)a3 withValue:(id)a4 serviceType:(id)a5 action:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a6;
  v9 = a4;
  v10 = a3;
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attribute");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mapWriteCharacteristicFromAssistantName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "units");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attribute");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (isMetricLocale_onceToken != -1)
    dispatch_once(&isMetricLocale_onceToken, &__block_literal_global_177454);
  valueWithAssistantUnits(v15, v13, v16, v9, 0, isMetricLocale_isMetricLocale);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setResultValue:", v17);
  objc_msgSend(v8, "attribute");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setResultAttribute:", v18);
  return 1;
}

- (id)entityFromActionSet:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x24BE812C0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v6);

  v7 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v4, "urlString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v9);

  objc_msgSend(v5, "setEntityType:", *MEMORY[0x24BE81F48]);
  objc_msgSend(v4, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  mapToSiriSceneType(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSceneType:", v11);

  return v5;
}

- (id)failedActionResultsFromResponse:(id)a3 inActionSet:(id)a4 withAction:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDAssistantCommand *v37;
  NSObject *v38;
  HMDAssistantCommand *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v58 = a4;
  v60 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K =[d] %@"), CFSTR("objectType"), *MEMORY[0x24BE81F50]);
  v9 = objc_claimAutoreleasedReturnValue();
  -[HMDAssistantCommand homeKitObjects](self, "homeKitObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)v9;
  objc_msgSend(v10, "filteredArrayUsingPredicate:", v9);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v74;
    v15 = 0x24BDD1000uLL;
    v48 = *(_QWORD *)v74;
    v49 = v11;
    do
    {
      v16 = 0;
      v50 = v13;
      do
      {
        if (*(_QWORD *)v74 != v14)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v16);
        -[HMDAssistantCommand home](self, "home");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(objc_alloc(*(Class *)(v15 + 2176)), "initWithUUIDString:", v17);
        objc_msgSend(v18, "mediaProfileWithUUID:", v19);
        v20 = objc_claimAutoreleasedReturnValue();

        v52 = (void *)v20;
        if (v20)
        {
          objc_msgSend(v11, "hmf_dictionaryForKey:", v17);
          v61 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "hmf_dataForKey:", CFSTR("HM.mediaPlaybackErrorDataKey"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v21)
            goto LABEL_41;
          objc_msgSend(MEMORY[0x24BDD1540], "hmf_unarchiveFromData:error:", v21, 0);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            -[HMDAssistantCommand actionResultForMediaProfile:action:objects:error:](self, "actionResultForMediaProfile:action:objects:error:", v20, v60, v59, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
              objc_msgSend(v57, "addObject:", v23);

          }
        }
        else
        {
          v51 = v16;
          -[HMDAssistantCommand home](self, "home");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(objc_alloc(*(Class *)(v15 + 2176)), "initWithUUIDString:", v17);
          objc_msgSend(v24, "accessoryWithUUID:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v27 = v26;
          else
            v27 = 0;
          v61 = v27;

          objc_msgSend(v11, "hmf_dictionaryForKey:", v17);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v22 = v28;
          v55 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
          if (v55)
          {
            v53 = *(_QWORD *)v70;
            v54 = v22;
            do
            {
              v29 = 0;
              do
              {
                if (*(_QWORD *)v70 != v53)
                  objc_enumerationMutation(v22);
                v56 = v29;
                v62 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v29);
                objc_msgSend(v22, "hmf_dictionaryForKey:");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = 0u;
                v66 = 0u;
                v67 = 0u;
                v68 = 0u;
                v31 = v30;
                v64 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
                if (v64)
                {
                  v63 = *(_QWORD *)v66;
                  do
                  {
                    for (i = 0; i != v64; ++i)
                    {
                      if (*(_QWORD *)v66 != v63)
                        objc_enumerationMutation(v31);
                      v33 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
                      objc_msgSend(v31, "hmf_dictionaryForKey:", v33);
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v34, "errorFromDataForKey:", CFSTR("kCharacteristicErrorDataKey"));
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v35)
                      {
                        v36 = (void *)MEMORY[0x227676638]();
                        v37 = self;
                        HMFGetOSLogHandle();
                        v38 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                        {
                          HMFGetLogIdentifier();
                          v39 = self;
                          v40 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543618;
                          v78 = v40;
                          v79 = 2112;
                          v80 = v35;
                          _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Parsing error for Siri : %@", buf, 0x16u);

                          self = v39;
                        }

                        objc_autoreleasePoolPop(v36);
                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v33, "integerValue"));
                        v41 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v62, "integerValue"));
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v61, "findCharacteristic:forService:", v41, v42);
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v43)
                        {
                          -[HMDAssistantCommand actionResultForCharacteristic:actionSet:action:objects:error:](v37, "actionResultForCharacteristic:actionSet:action:objects:error:", v43, v58, v60, v59, v35);
                          v44 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v44)
                            objc_msgSend(v57, "addObject:", v44);

                        }
                      }

                    }
                    v64 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
                  }
                  while (v64);
                }

                v29 = v56 + 1;
                v22 = v54;
              }
              while (v56 + 1 != v55);
              v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
            }
            while (v55);
            v21 = v54;
            v14 = v48;
            v11 = v49;
            v15 = 0x24BDD1000;
            v13 = v50;
            v22 = v54;
          }
          else
          {
            v21 = v22;
          }
          v16 = v51;
        }

LABEL_41:
        ++v16;
      }
      while (v16 != v13);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
    }
    while (v13);
  }

  v45 = (void *)objc_msgSend(v57, "copy");
  return v45;
}

- (id)actionResultForMediaProfile:(id)a3 action:(id)a4 objects:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  HMDAssistantCommand *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  entityForMediaProfile(v10, v12, objc_msgSend(v11, "includeCompleteInformation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    actionResultForAction(v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommand actionOutcomeFromError:](self, "actionOutcomeFromError:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setOutcome:", v16);

    objc_msgSend(v15, "setEntity:", v14);
    v17 = v11;
    getAttributeForMediaProfile(v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actionType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BE81C88]) & 1) != 0)
    {
      v31 = v13;
      objc_msgSend(v17, "attribute");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x24BE81D60]);

      if (v21)
      {
        v22 = (void *)*MEMORY[0x24BE81DE0];
        if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE81DE0]))
          v23 = v22;
        else
          v23 = 0;
        v24 = v23;
      }
      else
      {
        v24 = 0;
      }
      v13 = v31;
    }
    else
    {

      v24 = 0;
    }

    objc_msgSend(v15, "setResultAttribute:", v24);
    v29 = objc_alloc_init(MEMORY[0x24BE812A8]);
    objc_msgSend(v29, "setValue:", 1);
    objc_msgSend(v15, "setResultValue:", v29);

  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v28;
      v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to get the entity for service : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    v15 = 0;
  }

  return v15;
}

- (id)actionResultForCharacteristic:(id)a3 actionSet:(id)a4 action:(id)a5 objects:(id)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t i;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  HMDAssistantCommand *v37;
  NSObject *v38;
  void *v39;
  id v40;
  HMDAssistantCommand *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *context;
  id v48;
  id v49;
  id v50;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v11, "service");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v11;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v12, "actions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, buf, 16);
  v50 = v14;
  if (v18)
  {
    v19 = v18;
    v48 = v15;
    v20 = v13;
    v21 = v12;
    v22 = *(_QWORD *)v54;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v54 != v22)
          objc_enumerationMutation(v17);
        v24 = *(id *)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v25 = v24;
        else
          v25 = 0;
        v26 = v25;

        if (v26 && objc_msgSend(v26, "isActionForCharacteristic:", v16))
        {
          objc_msgSend(v26, "targetValue");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_15;
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, buf, 16);
      if (v19)
        continue;
      break;
    }
    v27 = 0;
LABEL_15:
    v12 = v21;
    v13 = v20;
    v15 = v48;
    v14 = v50;
  }
  else
  {
    v27 = 0;
  }

  entityForService(v52, 0, v14, objc_msgSend(v13, "includeCompleteInformation"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    actionResultForAction(v13);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommand actionOutcomeFromError:](self, "actionOutcomeFromError:", v15);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setOutcome:", v30);

    objc_msgSend(v29, "setEntity:", v28);
    if (isMetricLocale_onceToken != -1)
      dispatch_once(&isMetricLocale_onceToken, &__block_literal_global_177454);
    getTupleForCharacteristic(v16, v27, isMetricLocale_isMetricLocale);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
    {
      objc_msgSend(v31, "attribute");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setResultAttribute:", v33);

      objc_msgSend(v32, "value");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setResultValue:", v34);

    }
    else
    {
      v49 = v15;
      context = (void *)MEMORY[0x227676638]();
      v41 = self;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v58 = v43;
        v59 = 2112;
        v60 = v16;
        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@There is no Siri mapping attribute and/or format for characteristic : %@", buf, 0x16u);

        v14 = v50;
      }

      objc_autoreleasePoolPop(context);
      v15 = v49;
    }

    if (v29)
    {
      objc_msgSend(v29, "resultValue");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
        v45 = v29;
      else
        v45 = 0;
      v40 = v45;

    }
    else
    {
      v40 = 0;
    }
  }
  else
  {
    v35 = v15;
    v36 = (void *)MEMORY[0x227676638]();
    v37 = self;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v39;
      v59 = 2112;
      v60 = v52;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Unable to get the entity for service : %@", buf, 0x16u);

      v14 = v50;
    }

    objc_autoreleasePoolPop(v36);
    v40 = 0;
    v15 = v35;
  }

  return v40;
}

- (id)getLocaleUnits:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v3 = a3;
  v4 = (void *)*MEMORY[0x24BDD5720];
  v5 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD5720]);
  v6 = (void *)*MEMORY[0x24BDD5728];
  if ((v5 & 1) != 0 || (v7 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD5728]), v8 = v3, v7))
  {
    if (isMetricLocale_onceToken != -1)
      dispatch_once(&isMetricLocale_onceToken, &__block_literal_global_177454);
    if (isMetricLocale_isMetricLocale)
      v8 = v4;
    else
      v8 = v6;
  }
  v9 = v8;

  return v9;
}

- (id)getValueOfType:(id)a3 action:(id)a4
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;

  v4 = a4;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "value"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    v10 = objc_opt_isKindOfClass();

    objc_msgSend(v4, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if ((v10 & 1) != 0)
    {
      v12 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v11, "value");
      objc_msgSend(v12, "numberWithFloat:");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      v13 = objc_opt_isKindOfClass();

      objc_msgSend(v4, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v14;
      if ((v13 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v14, "value"));
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        v15 = objc_opt_isKindOfClass();

        if ((v15 & 1) == 0)
        {
          v16 = 0;
          goto LABEL_10;
        }
        objc_msgSend(v4, "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "value");
        v9 = objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v16 = (void *)v9;

LABEL_10:
  return v16;
}

- (BOOL)isAttributeValue:(id)a3 equalTo:(id)a4
{
  id v5;
  id v6;
  id v7;
  char v8;
  char v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  id v15;
  float v16;
  float v17;
  float v18;
  float v19;
  id v20;
  void *v21;
  void *v22;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    v8 = objc_msgSend(v5, "value");
    v9 = objc_msgSend(v7, "value");

    v10 = v8 ^ v9 ^ 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v6;
    v12 = objc_msgSend(v5, "value");
    v13 = objc_msgSend(v11, "value");

    v14 = v12 == v13;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v6;
      objc_msgSend(v5, "value");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "value");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v21, "isEqualToString:", v22);
      goto LABEL_14;
    }
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  v15 = v6;
  objc_msgSend(v5, "value");
  v17 = v16;
  objc_msgSend(v15, "value");
  v19 = v18;

  v14 = v17 == v19;
LABEL_8:
  v10 = v14;
LABEL_14:

  return v10;
}

- (id)adjustSetValue:(id)a3 type:(id)a4 units:(id)a5 attribute:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  double v19;
  void *v20;
  HMDAssistantCommand *v21;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v10;
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "supportsLocalization:", v13))
  {
    v16 = v14;
    if (isTemperatureAttribute(v13))
    {
      v16 = v14;
      if (temperatureConversionIsNeeded(v12))
      {
        v17 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v14, "floatValue");
        *(float *)&v19 = (float)((float)(v18 + -32.0) * 5.0) / 9.0;
        objc_msgSend(v17, "numberWithFloat:", v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)MEMORY[0x227676638]();
        v21 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138544130;
          v26 = v23;
          v27 = 2112;
          v28 = v13;
          v29 = 2112;
          v30 = v14;
          v31 = 2112;
          v32 = v16;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@adjustSet: Attribute %@ value %@  converted to Celsius as %@", (uint8_t *)&v25, 0x2Au);

        }
        objc_autoreleasePoolPop(v20);
      }
    }
  }
  else
  {
    objc_msgSend(v15, "mapFromAssistantCharacteristicValue:name:", v14, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (id)adjustGetValue:(id)a3 type:(id)a4 units:(id)a5 attribute:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  double v19;
  void *v20;
  HMDAssistantCommand *v21;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v10;
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "supportsLocalization:", v13))
  {
    v16 = v14;
    if (isTemperatureAttribute(v13))
    {
      v16 = v14;
      if (temperatureConversionIsNeeded(v12))
      {
        v17 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v14, "floatValue");
        *(float *)&v19 = (float)(v18 * 1.8) + 32.0;
        objc_msgSend(v17, "numberWithFloat:", v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)MEMORY[0x227676638]();
        v21 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138544130;
          v26 = v23;
          v27 = 2112;
          v28 = v13;
          v29 = 2112;
          v30 = v14;
          v31 = 2112;
          v32 = v16;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@adjustGet: Attribute %@ value %@  adjusted to Fahrenheit %@", (uint8_t *)&v25, 0x2Au);

        }
        objc_autoreleasePoolPop(v20);
      }
    }
  }
  else
  {
    objc_msgSend(v15, "mapToAssistantCharacteristicValue:name:getActionType:", v14, v13, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (id)objectsWithIdentifierList:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[HMDAssistantCommand homeKitObjects](self, "homeKitObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v21 = a4;
    v10 = 0;
    v11 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("objectIdentifier"), v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v6, "containsObject:", v14);

        if (v15)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("objectHomeIdentifier"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v10)
          {
            if ((objc_msgSend(v10, "isEqualToString:", v16) & 1) == 0)
            {
              if (v21)
              {
                objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
                *v21 = (id)objc_claimAutoreleasedReturnValue();
              }

              v18 = (void *)MEMORY[0x24BDBD1A8];
              v19 = v22;
              goto LABEL_20;
            }
          }
          else
          {
            v10 = v16;
          }
          objc_msgSend(v22, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }

  v19 = v22;
  v18 = (void *)objc_msgSend(v22, "copy");
LABEL_20:

  return v18;
}

- (id)filteredObjectsFromObjects:(id)a3 forHomeName:(id)a4 roomName:(id)a5 zoneName:(id)a6
{
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v40;
  void *v41;
  id v42;
  id obj;
  id obja;
  unint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _QWORD v61[3];

  v61[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (unint64_t)a5;
  v45 = (unint64_t)a6;
  if (v12 | v45)
  {
    v13 = 0x24BDBC000uLL;
    v42 = v11;
    if (v12)
    {
      v61[0] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (v45)
    {
      v40 = v10;
      v41 = (void *)objc_opt_new();
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      -[HMDAssistantCommand homeKitObjects](self, "homeKitObjects");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v55;
        v19 = *MEMORY[0x24BE81F40];
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v55 != v18)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            if (v11)
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("objectHome"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "isEqualToString:", v11);

              if (!v23)
                continue;
            }
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("objectType"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "isEqualToString:", v19);

            if (v25)
            {
              v52 = 0u;
              v53 = 0u;
              v50 = 0u;
              v51 = 0u;
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("objectZones"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
              if (v27)
              {
                v28 = v27;
                v29 = *(_QWORD *)v51;
                while (2)
                {
                  for (j = 0; j != v28; ++j)
                  {
                    if (*(_QWORD *)v51 != v29)
                      objc_enumerationMutation(v26);
                    if (objc_msgSend((id)v45, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j)))
                    {
                      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("objectName"));
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v41, "addObject:", v31);

                      goto LABEL_24;
                    }
                  }
                  v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
                  if (v28)
                    continue;
                  break;
                }
              }
LABEL_24:

              v11 = v42;
            }
          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
        }
        while (v17);
      }

      v10 = v40;
      v12 = 0;
      v13 = 0x24BDBC000;
      v14 = v41;
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(*(id *)(v13 + 3768), "array");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    obja = v14;
    v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    if (v32)
    {
      v33 = v32;
      v34 = 0;
      v35 = *(_QWORD *)v47;
      do
      {
        v36 = 0;
        v37 = v34;
        do
        {
          if (*(_QWORD *)v47 != v35)
            objc_enumerationMutation(obja);
          objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K =[d] %@"), CFSTR("objectRoom"), *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v36));
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "filteredArrayUsingPredicate:", v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:", v38);

          ++v36;
          v37 = v34;
        }
        while (v33 != v36);
        v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      }
      while (v33);

    }
    v11 = v42;
  }
  else
  {
    v15 = v10;
  }

  return v15;
}

- (id)filteredObjectsFromObjects:(id)a3 forGroup:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("objectGroups"), (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14 && objc_msgSend(v14, "containsObject:", v6))
          objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)filteredObjectsFromObjects:(id)a3 byAttribute:(id)a4 forActionType:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  char v21;
  int v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  int v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  int v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  id obj;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE81C58]) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE81CA0]) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE81C80]) & 1) != 0)
  {
    v47 = 1;
  }
  else
  {
    v47 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE81C50]);
  }
  objc_msgSend(v10, "mapReadCharacteristicFromAssistantName:", v8);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getAliasedCharacteristicTypes:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v9;
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE81C88]) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE81C78]) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE81C98]) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE81C90]) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE81C68]) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE81C60]) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE81C70]) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE81CA0]) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE81C80]) & 1) != 0)
  {
    v53 = 1;
  }
  else
  {
    v53 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE81C50]);
  }
  v44 = v8;
  objc_msgSend(v10, "mapWriteCharacteristicFromAssistantName:", v8);
  v42 = v10;
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getAliasedCharacteristicTypes:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  v12 = v47;
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v65;
    v15 = *MEMORY[0x24BE81F50];
    v51 = *(_QWORD *)v65;
    v52 = *MEMORY[0x24BE81F50];
    do
    {
      v16 = 0;
      v54 = v13;
      do
      {
        if (*(_QWORD *)v65 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v16);
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("objectType"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v15);

        if (v19)
        {
          if (v12
            && (objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("objectCharacteristics")),
                v20 = (void *)objc_claimAutoreleasedReturnValue(),
                v21 = objc_msgSend(v20, "containsObject:", v50),
                v20,
                (v21 & 1) == 0))
          {
            v62 = 0u;
            v63 = 0u;
            v60 = 0u;
            v61 = 0u;
            v23 = v46;
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v61;
              while (2)
              {
                for (i = 0; i != v25; ++i)
                {
                  if (*(_QWORD *)v61 != v26)
                    objc_enumerationMutation(v23);
                  v28 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
                  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("objectCharacteristics"));
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v28) = objc_msgSend(v29, "containsObject:", v28);

                  if ((v28 & 1) != 0)
                  {
                    v22 = 1;
                    goto LABEL_35;
                  }
                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
                if (v25)
                  continue;
                break;
              }
              v22 = 0;
LABEL_35:
              v12 = v47;
              v14 = v51;
            }
            else
            {
              v22 = 0;
            }

          }
          else
          {
            v22 = 1;
          }
          if (v53)
          {
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("objectCharacteristics"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "containsObject:", v48);

            if ((v31 & 1) != 0)
            {
              v32 = 1;
            }
            else
            {
              v58 = 0u;
              v59 = 0u;
              v56 = 0u;
              v57 = 0u;
              v33 = v45;
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
              if (v34)
              {
                v35 = v34;
                v36 = *(_QWORD *)v57;
                while (2)
                {
                  for (j = 0; j != v35; ++j)
                  {
                    if (*(_QWORD *)v57 != v36)
                      objc_enumerationMutation(v33);
                    v38 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j);
                    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("objectCharacteristics"));
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    LOBYTE(v38) = objc_msgSend(v39, "containsObject:", v38);

                    if ((v38 & 1) != 0)
                    {
                      v32 = 1;
                      goto LABEL_52;
                    }
                  }
                  v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
                  if (v35)
                    continue;
                  break;
                }
                v32 = 0;
LABEL_52:
                v12 = v47;
              }
              else
              {
                v32 = 0;
              }

            }
            v14 = v51;
          }
          else
          {
            v32 = 1;
          }
          v40 = v22 & v32;
          v15 = v52;
          v13 = v54;
          if (v40 == 1)
            objc_msgSend(v49, "addObject:", v17);
        }
        ++v16;
      }
      while (v16 != v13);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    }
    while (v13);
  }

  return v49;
}

- (id)filteredObjectsFromObjects:(id)a3 byCharacteristicType:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v18 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v10 = *MEMORY[0x24BE81F50];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("objectType"), v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqualToString:", v10) & 1) != 0)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("objectCharacteristics"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "containsObject:", v18);

          if (v15)
            objc_msgSend(v17, "addObject:", v12);
        }
        else
        {

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  return v17;
}

- (id)_evaluateHomeOptionallyMatchingHomeName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  HMDAssistantCommand *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  HMDAssistantCommand *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  HMDAssistantCommand *v27;
  void *v28;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAssistantCommand homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessoryOfCurrentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || v4
    && (objc_msgSend(v7, "name"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v4, "isEqual:", v8),
        v8,
        !v9))
  {
    objc_msgSend(v5, "currentHomeUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_homeWithUUID:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17
      && (!v4
       || (objc_msgSend(v17, "name"),
           v18 = (void *)objc_claimAutoreleasedReturnValue(),
           v19 = objc_msgSend(v4, "isEqual:", v18),
           v18,
           v19)))
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543618;
        v31 = v23;
        v32 = 2112;
        v33 = v17;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Defaulting to current home %@ of the device", (uint8_t *)&v30, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v5, "primaryHomeUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "_homeWithUUID:", v24);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (!v14
        || v4
        && (objc_msgSend(v14, "name"),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            v26 = objc_msgSend(v4, "isEqual:", v25),
            v25,
            !v26))
      {
        v15 = 0;
        goto LABEL_20;
      }
      v20 = (void *)MEMORY[0x227676638]();
      v27 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543618;
        v31 = v28;
        v32 = 2112;
        v33 = v14;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Defaulting to primary home %@ of the device", (uint8_t *)&v30, 0x16u);

      }
      v17 = v14;
      v16 = v24;
    }

    objc_autoreleasePoolPop(v20);
    v14 = v17;
    v24 = v16;
    v15 = v14;
LABEL_20:

    goto LABEL_21;
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543618;
    v31 = v13;
    v32 = 2112;
    v33 = v7;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Defaulting to home %@ that this device belongs to", (uint8_t *)&v30, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  v14 = v7;
  v15 = v14;
LABEL_21:

  return v15;
}

- (id)_homeWithSearchFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HMDAssistantCommand *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDAssistantCommand *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  HMDAssistantCommand *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  HMDAssistantCommand *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  HMDAssistantCommand *v41;
  NSObject *v42;
  void *v43;
  int v45;
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAssistantCommand homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "homeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_homeWithAssistantIdentifier:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "homeIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 138543874;
        v46 = v14;
        v47 = 2112;
        v48 = v9;
        v49 = 2112;
        v50 = v15;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Matched home %@ with the homeIdentifier %@ from SCF", (uint8_t *)&v45, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      goto LABEL_31;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "homeIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138543618;
      v46 = v16;
      v47 = 2112;
      v48 = v17;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_FAULT, "%{public}@No home found with identifier %@", (uint8_t *)&v45, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  objc_msgSend(v4, "homeName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v4, "homeName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_homesWithName:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v20, "count") >= 2)
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "homeName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 138543618;
        v46 = v24;
        v47 = 2112;
        v48 = v25;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_FAULT, "%{public}@Multiple homes found with name %@, homeIdentifier should be used instead", (uint8_t *)&v45, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
    }
    objc_msgSend(v4, "homeName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommand _evaluateHomeOptionallyMatchingHomeName:](self, "_evaluateHomeOptionallyMatchingHomeName:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
      goto LABEL_19;
    objc_msgSend(v20, "firstObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v27 = (void *)v28;
      v29 = (void *)MEMORY[0x227676638]();
      v30 = self;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "homeName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 138543874;
        v46 = v32;
        v47 = 2112;
        v48 = v27;
        v49 = 2112;
        v50 = v33;
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Matched home %@ with the homeName %@ from SCF after a homeIdentifier mismatch", (uint8_t *)&v45, 0x20u);

      }
      objc_autoreleasePoolPop(v29);
LABEL_19:
      v9 = v27;

      goto LABEL_31;
    }

    goto LABEL_24;
  }
  if (v6)
  {
LABEL_24:
    v36 = (void *)MEMORY[0x227676638]();
    v37 = self;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138543362;
      v46 = v39;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@No matches for the home name/identifier specified in Siri command - bailing out....", (uint8_t *)&v45, 0xCu);

    }
    objc_autoreleasePoolPop(v36);
    v9 = 0;
    goto LABEL_31;
  }
  -[HMDAssistantCommand _evaluateHomeOptionallyMatchingHomeName:](self, "_evaluateHomeOptionallyMatchingHomeName:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v34;
  if (v34)
  {
    v35 = v34;
  }
  else
  {
    v40 = (void *)MEMORY[0x227676638]();
    v41 = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138543362;
      v46 = v43;
      _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Cannot evaluate the home to apply the Siri command to - bailing out....", (uint8_t *)&v45, 0xCu);

    }
    objc_autoreleasePoolPop(v40);
  }

LABEL_31:
  return v9;
}

- (id)objectsWithSearchFilter:(id)a3 inHome:(id)a4 serviceTypeIsATV:(BOOL)a5 overrideServiceTypeIfNeeded:(id *)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  HMDAssistantCommand *v19;
  HMDAssistantCommand *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDAssistantCommand *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDAssistantCommand *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  HMDAssistantCommand *v41;
  NSObject *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  HMDAssistantCommand *v71;
  NSObject *v72;
  void *v73;
  const char *v74;
  void *v75;
  HMDAssistantCommand *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  id v88;
  id *v89;
  void *v91;
  HMDAssistantCommand *v92;
  NSObject *v93;
  id v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  HMDAssistantCommand *v101;
  NSObject *v102;
  id v103;
  void *v104;
  void *v105;
  char v106;
  void *v107;
  void *v108;
  id v109;
  id v110;
  id v111;
  id v112;
  HMDAssistantCommand *v113;
  HMDAssistantCommand *v114;
  void *v115;
  void *v116;
  _BOOL4 v117;
  void *v118;
  void *v119;
  id obj;
  void *v121;
  void *v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  uint8_t v128[128];
  uint8_t buf[4];
  void *v130;
  __int16 v131;
  id v132;
  __int16 v133;
  void *v134;
  uint64_t v135;

  v6 = a5;
  v135 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  -[HMDAssistantCommand homeKitObjects](self, "homeKitObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v10, "urlString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K = %@)"), CFSTR("objectHomeIdentifier"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filteredArrayUsingPredicate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v14, "count"))
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v123 = v28;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "name");
        v115 = v12;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uuid");
        v33 = v9;
        v34 = v10;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "UUIDString");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v130 = v31;
        v131 = 2112;
        v132 = v32;
        v133 = 2112;
        v134 = v36;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@After filtering for home %@/%@, no objects to apply the command to", buf, 0x20u);

        v10 = v34;
        v9 = v33;

        v12 = v115;
        v28 = v123;
      }

      objc_autoreleasePoolPop(v28);
      v27 = 0;
      goto LABEL_80;
    }
    v117 = v6;
    objc_msgSend(v9, "entityType");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attribute");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)*MEMORY[0x24BE81F50];
      if (v15)
      {
        if ((objc_msgSend(v15, "isEqualToString:", v17) & 1) == 0
          && (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BE81F48]) & 1) == 0)
        {
          v18 = (void *)MEMORY[0x227676638]();
          v19 = self;
          v20 = self;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v110 = v15;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v130 = v22;
            v131 = 2112;
            v132 = v9;
            _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Attribute specified in search filter with entityType not SERVICE/SCENE(%@)", buf, 0x16u);

            v15 = v110;
          }

          objc_autoreleasePoolPop(v18);
          self = v19;
        }
        goto LABEL_18;
      }
      v15 = v17;
    }
    if (!v15)
    {
      v118 = v13;
      goto LABEL_25;
    }
LABEL_18:
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("objectType"), v15);
    v37 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "filteredArrayUsingPredicate:", v37);
    v38 = (id)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v38, "count"))
    {
      v39 = v37;
      v40 = (void *)MEMORY[0x227676638]();
      v41 = self;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v130 = v43;
        v44 = "%{public}@After filtering for entityType, no objects to apply the command to";
LABEL_22:
        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, v44, buf, 0xCu);

      }
LABEL_23:

      objc_autoreleasePoolPop(v40);
      v27 = 0;
      v45 = v39;
LABEL_79:

      v13 = (void *)v45;
      v14 = v38;
LABEL_80:

      v11 = v14;
      goto LABEL_81;
    }
    v118 = (void *)v37;
    v14 = v38;
LABEL_25:
    objc_msgSend(v9, "serviceType");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v46)
      goto LABEL_45;
    v109 = v10;
    v111 = v15;
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serviceType");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mapFromAssistantServiceName:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v117)
    {
      objc_msgSend(v9, "serviceType");
      v50 = objc_claimAutoreleasedReturnValue();

      v49 = (void *)v50;
    }
    else if (!v49)
    {

      v27 = 0;
      v38 = v14;
      goto LABEL_72;
    }
    v113 = self;
    v116 = v12;
    v119 = v9;
    v108 = v47;
    objc_msgSend(v47, "getAliasedServiceType:", v49);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    obj = v14;
    v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v128, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v125;
      do
      {
        for (i = 0; i != v53; ++i)
        {
          if (*(_QWORD *)v125 != v54)
            objc_enumerationMutation(obj);
          v56 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * i);
          objc_msgSend(v56, "hmf_stringForKey:", CFSTR("objectServiceType"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "hmf_stringForKey:", CFSTR("objectAssociatedServiceType"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v57, "isEqual:", v49))
          {
            objc_msgSend(v51, "addObject:", v56);
          }
          else if ((objc_msgSend(v57, "isEqual:", v121) & 1) != 0
                 || (objc_msgSend(v58, "isEqual:", v49) & 1) != 0
                 || objc_msgSend(v58, "isEqual:", v121))
          {
            objc_msgSend(v51, "addObject:", v56);
            if (a6)
            {
              objc_msgSend(v119, "serviceType");
              *a6 = (id)objc_claimAutoreleasedReturnValue();
            }
          }

        }
        v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v128, 16);
      }
      while (v53);
    }

    v38 = (id)objc_msgSend(v51, "copy");
    if (objc_msgSend(v38, "count"))
    {

      v14 = v38;
      v9 = v119;
      v10 = v109;
      v15 = v111;
      self = v113;
      v12 = v116;
LABEL_45:
      objc_msgSend(v9, "roomName");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (v59)
      {

      }
      else
      {
        objc_msgSend(v9, "zoneName");
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v60)
          goto LABEL_50;
      }
      objc_msgSend(v9, "homeName");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "roomName");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "zoneName");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAssistantCommand filteredObjectsFromObjects:forHomeName:roomName:zoneName:](self, "filteredObjectsFromObjects:forHomeName:roomName:zoneName:", v14, v61, v62, v63);
      v38 = (id)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v38, "count"))
      {
        v70 = (void *)MEMORY[0x227676638]();
        v71 = self;
        HMFGetOSLogHandle();
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v130 = v73;
          v74 = "%{public}@After filtering for room/zone, no objects to apply the command to";
LABEL_75:
          _os_log_impl(&dword_2218F0000, v72, OS_LOG_TYPE_INFO, v74, buf, 0xCu);

        }
LABEL_76:

        objc_autoreleasePoolPop(v70);
LABEL_77:
        v27 = 0;
        goto LABEL_78;
      }
      v14 = v38;
LABEL_50:
      objc_msgSend(v9, "groupName");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v64)
        goto LABEL_53;
      objc_msgSend(v9, "groupName");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAssistantCommand filteredObjectsFromObjects:forGroup:](self, "filteredObjectsFromObjects:forGroup:", v14, v65);
      v38 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v38, "count"))
      {
        v14 = v38;
LABEL_53:
        objc_msgSend(v9, "accessoryName");
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        if (v66)
        {
          v67 = (void *)MEMORY[0x24BDD1758];
          objc_msgSend(v9, "accessoryName");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("objectAccessory"), v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "filteredArrayUsingPredicate:", v69);
          v38 = (id)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v38, "count"))
          {
            v91 = (void *)MEMORY[0x227676638]();
            v92 = self;
            HMFGetOSLogHandle();
            v93 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v94 = v15;
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v130 = v95;
              _os_log_impl(&dword_2218F0000, v93, OS_LOG_TYPE_INFO, "%{public}@After filtering for accessoryName, no objects to apply the command to", buf, 0xCu);

              v15 = v94;
            }

            objc_autoreleasePoolPop(v91);
            v27 = 0;
            v45 = (uint64_t)v69;
            goto LABEL_79;
          }
          v114 = self;
          v14 = v38;
        }
        else
        {
          v114 = self;
          v69 = v118;
        }
        objc_msgSend(v9, "serviceName");
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        if (v79)
        {
          v80 = (void *)MEMORY[0x24BDD1758];
          objc_msgSend(v9, "serviceName");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "predicateWithFormat:", CFSTR("%K =[d] %@"), CFSTR("objectName"), v81);
          v82 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "filteredArrayUsingPredicate:", v82);
          v38 = (id)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v38, "count"))
          {
            v39 = v82;
            v40 = (void *)MEMORY[0x227676638]();
            v41 = v114;
            HMFGetOSLogHandle();
            v42 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              goto LABEL_23;
            HMFGetLogIdentifier();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v130 = v43;
            v44 = "%{public}@After filtering for serviceName, no objects to apply the command to";
            goto LABEL_22;
          }
          v69 = (void *)v82;
          v14 = v38;
        }
        objc_msgSend(v9, "sceneName");
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v83)
          goto LABEL_68;
        v84 = (void *)MEMORY[0x24BDD1758];
        objc_msgSend(v9, "sceneName");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "predicateWithFormat:", CFSTR("%K =[d] %@"), CFSTR("objectName"), v85);
        v86 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "filteredArrayUsingPredicate:", v86);
        v38 = (id)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v38, "count"))
        {
          v69 = (void *)v86;
          v14 = v38;
LABEL_68:
          objc_msgSend(v9, "sceneType");
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v87)
          {
            v45 = (uint64_t)v69;
LABEL_102:
            objc_msgSend(v9, "attribute");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v97 || v117)
              goto LABEL_108;
            v118 = (void *)v45;
            objc_msgSend(v9, "attribute");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v98, "isEqual:", *MEMORY[0x24BE81D28]) & 1) != 0)
            {
LABEL_107:

              v45 = (uint64_t)v118;
LABEL_108:

LABEL_109:
              v38 = v14;
              v27 = v38;
              goto LABEL_79;
            }
            objc_msgSend(v9, "attribute");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v99, "isEqual:", *MEMORY[0x24BE81CA8]))
            {

              goto LABEL_107;
            }
            v112 = v15;
            objc_msgSend(v9, "entityType");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = objc_msgSend(v105, "isEqual:", *MEMORY[0x24BE81F48]);

            if ((v106 & 1) != 0)
            {
LABEL_116:
              v15 = v112;
              v45 = (uint64_t)v118;
              goto LABEL_109;
            }
            objc_msgSend(v9, "attribute");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDAssistantCommand filteredObjectsFromObjects:byAttribute:forActionType:](v114, "filteredObjectsFromObjects:byAttribute:forActionType:", v14, v107, 0);
            v38 = (id)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v38, "count"))
            {
              v14 = v38;
              goto LABEL_116;
            }
            v70 = (void *)MEMORY[0x227676638]();
            v71 = v114;
            HMFGetOSLogHandle();
            v72 = objc_claimAutoreleasedReturnValue();
            v15 = v112;
            if (!os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
              goto LABEL_76;
            HMFGetLogIdentifier();
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v130 = v73;
            v74 = "%{public}@After filtering for attribute, no objects to apply the command to";
            goto LABEL_75;
          }
          objc_msgSend(v9, "sceneType");
          v88 = (id)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v88, "isEqualToString:", *MEMORY[0x24BE81F78]) & 1) != 0)
          {
            v89 = (id *)MEMORY[0x24BDD5228];
          }
          else if ((objc_msgSend(v88, "isEqualToString:", *MEMORY[0x24BE81F80]) & 1) != 0)
          {
            v89 = (id *)MEMORY[0x24BDD5210];
          }
          else if ((objc_msgSend(v88, "isEqualToString:", *MEMORY[0x24BE81F88]) & 1) != 0)
          {
            v89 = (id *)MEMORY[0x24BDD51F8];
          }
          else
          {
            if (!objc_msgSend(v88, "isEqualToString:", *MEMORY[0x24BE81F90]))
            {
              v96 = 0;
              goto LABEL_97;
            }
            v89 = (id *)MEMORY[0x24BDD5200];
          }
          v96 = *v89;
LABEL_97:

          if (v96)
          {
            objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K =[d] %@"), CFSTR("objectSceneType"), v96);
            v45 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "filteredArrayUsingPredicate:", v45);
            v38 = (id)objc_claimAutoreleasedReturnValue();

            if (!objc_msgSend(v38, "count"))
            {
              v118 = (void *)v45;
              v100 = (void *)MEMORY[0x227676638]();
              v101 = v114;
              HMFGetOSLogHandle();
              v102 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v103 = v15;
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v130 = v104;
                _os_log_impl(&dword_2218F0000, v102, OS_LOG_TYPE_INFO, "%{public}@After filtering for actionSetType, no objects to apply the command to", buf, 0xCu);

                v15 = v103;
              }

              objc_autoreleasePoolPop(v100);
              goto LABEL_77;
            }
            v14 = v38;
          }
          else
          {
            v45 = (uint64_t)v69;
          }

          goto LABEL_102;
        }
        v39 = v86;
        v40 = (void *)MEMORY[0x227676638]();
        v41 = v114;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v130 = v43;
          v44 = "%{public}@After filtering for actionSetName, no objects to apply the command to";
          goto LABEL_22;
        }
        goto LABEL_23;
      }
      v70 = (void *)MEMORY[0x227676638]();
      v71 = self;
      HMFGetOSLogHandle();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v130 = v73;
        v74 = "%{public}@After filtering for serviceGroup, no objects to apply the command to";
        goto LABEL_75;
      }
      goto LABEL_76;
    }
    v75 = (void *)MEMORY[0x227676638]();
    v76 = v113;
    HMFGetOSLogHandle();
    v77 = objc_claimAutoreleasedReturnValue();
    v9 = v119;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v130 = v78;
      _os_log_impl(&dword_2218F0000, v77, OS_LOG_TYPE_INFO, "%{public}@After filtering for serviceType, no objects to apply the command to", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v75);

    v27 = 0;
    v10 = v109;
    v12 = v116;
LABEL_72:
    v15 = v111;
LABEL_78:
    v45 = (uint64_t)v118;
    goto LABEL_79;
  }
  v23 = (void *)MEMORY[0x227676638]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v130 = v26;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@No objects to apply the command to", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
  v27 = 0;
LABEL_81:

  return v27;
}

- (id)filterObjects:(id)a3 forCharacteristicTypes:(id)a4
{
  id v6;
  __int128 v7;
  __objc2_class **p_superclass;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  HMDAssistantCommand *v20;
  NSObject *v21;
  id v22;
  __objc2_class **v23;
  HMDAssistantCommand *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDAssistantCommand *v29;
  NSObject *v30;
  void *v31;
  __int128 v33;
  id obj;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  uint64_t v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v35 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v6;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v48;
    *(_QWORD *)&v7 = 138543618;
    v33 = v7;
    p_superclass = HMDCameraMetricsSnapshotLogEvent.superclass;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v48 != v36)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        -[HMDAssistantCommand serviceFromObject:](self, "serviceFromObject:", v10, v33);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
        {
          v38 = i;
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v11 = v35;
          v12 = v40;
          v42 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
          if (v42)
          {
            v13 = *(_QWORD *)v44;
            v39 = *(_QWORD *)v44;
            do
            {
              for (j = 0; j != v42; ++j)
              {
                if (*(_QWORD *)v44 != v13)
                  objc_enumerationMutation(v11);
                v15 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
                objc_msgSend(p_superclass + 276, "getSharedInstance");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "type");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v16, "disallowsAssistantServiceType:characteristicType:", v17, v15);

                if (v18)
                {
                  v19 = (void *)MEMORY[0x227676638]();
                  v20 = self;
                  HMFGetOSLogHandle();
                  v21 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v22 = v11;
                    v23 = p_superclass;
                    v24 = self;
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "type");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    v52 = v25;
                    v53 = 2112;
                    v54 = v26;
                    v55 = 2112;
                    v56 = v15;
                    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Filtering out request for disallowed service type: %@ characteristic type: %@", buf, 0x20u);

                    v12 = v40;
                    self = v24;
                    p_superclass = v23;
                    v11 = v22;
                    v13 = v39;
                  }

                  objc_autoreleasePoolPop(v19);
                }
                else
                {
                  objc_msgSend(v12, "findCharacteristicWithType:", v15);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v27)
                    objc_msgSend(v41, "addObject:", v27);

                }
              }
              v42 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
            }
            while (v42);
          }

          i = v38;
        }
        else
        {
          v28 = (void *)MEMORY[0x227676638]();
          v29 = self;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v33;
            v52 = v31;
            v53 = 2112;
            v54 = v10;
            _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Filtered object is not a service: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v28);
        }

      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
    }
    while (v37);
  }

  return v41;
}

- (id)filterObjects:(id)a3 forCharacteristics:(id)a4
{
  id v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  HMDAssistantCommand *v20;
  NSObject *v21;
  void *v22;
  id v24;
  id obj;
  HMDAssistantCommand *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v27 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v6;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v35;
    v26 = self;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        -[HMDAssistantCommand serviceFromObject:](self, "serviceFromObject:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v11 = v27;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v31;
            while (2)
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v31 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
                objc_msgSend(v9, "characteristics");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "hmf_firstObjectWithCharacteristicType:", v16);
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v18)
                {

                  self = v26;
                  goto LABEL_18;
                }
                objc_msgSend(v10, "setObject:forKey:", v18, v16);

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
              if (v13)
                continue;
              break;
            }
          }

          self = v26;
          if (v10)
          {
            objc_msgSend(v24, "addObject:", v10);
            v11 = v10;
LABEL_18:

          }
        }
        else
        {
          v19 = (void *)MEMORY[0x227676638]();
          v20 = self;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v40 = v22;
            v41 = 2112;
            v42 = v8;
            _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Filtered object %@ not a service", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v19);
        }

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v29);
  }

  return v24;
}

- (void)_logEvent:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HMDAssistantCommand *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc(MEMORY[0x24BE3F138]);
  v7 = (void *)MEMORY[0x24BDD17C8];
  MEMORY[0x227675180](self, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@, %s:%ld"), v8, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Assistant/HMDAssistantCommand.m", 1281);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v6, "initWithName:", v9);

  v40 = self;
  -[HMDAssistantCommand actions](self, "actions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = v5;
  objc_msgSend(v5, "actionResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v12)
  {
    v13 = v12;
    v44 = 0;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v46;
    v17 = *MEMORY[0x24BE81BD0];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v46 != v16)
          objc_enumerationMutation(v11);
        v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v19, "outcome");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = isOutcomeSuccess(v20);

        if ((v21 & 1) == 0)
        {
          objc_msgSend(v19, "outcome");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqual:", v17);

          if (v23)
            ++v14;
          else
            ++v15;
        }
      }
      v44 += v13;
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v13);
  }
  else
  {
    v44 = 0;
    v14 = 0;
    v15 = 0;
  }

  -[HMDAssistantCommand serverValidity](v40, "serverValidity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[HMDAssistantCommand serverValidity](v40, "serverValidity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "componentsSeparatedByString:", CFSTR(":"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
      v27 = (void *)atoll((const char *)objc_msgSend(objc_retainAutorelease(v27), "cStringUsingEncoding:", 4));
    v39 = v27;

  }
  else
  {
    v39 = 0;
  }
  -[HMDAssistantCommand homeManager](v40, "homeManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "assistantGenerationCounter");

  getLastSyncedAssistantConfigurationVersion();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "unsignedIntegerValue");

  mach_absolute_time();
  v33 = UpTicksToMilliseconds();
  v34 = v33 - -[HMDAssistantCommand startTime](v40, "startTime");
  objc_msgSend(v41, "actionType");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commandOutcome");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDSiriCommandEvent commandEventWithDuration:actionType:outcome:numberOfEntities:numberOfFailures:numberOfIncompletions:serverConfigurationVersion:configurationVersion:lastSyncedConfigurationVersion:](HMDSiriCommandEvent, "commandEventWithDuration:actionType:outcome:numberOfEntities:numberOfFailures:numberOfIncompletions:serverConfigurationVersion:configurationVersion:lastSyncedConfigurationVersion:", v34, v35, v36, v44, v15, v14, v39, v30, v32);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "submitLogEvent:", v37);

  objc_msgSend(v41, "aceId");
  objc_msgSend(v41, "actionType");

  objc_msgSend(v43, "commandOutcome");
}

- (void)reportOutcome:(id)a3 results:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, void *);
  id v11;
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
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void (**v40)(_QWORD, void *);
  HMDAssistantCommand *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD, void *))a5;
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BE812B8]);
    objc_msgSend(v11, "setCommandOutcome:", v8);
    if (v9)
    {
      objc_msgSend(v11, "setActionResults:", v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setActionResults:", v12);

    }
    -[HMDAssistantCommand home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x24BDBCF48];
      -[HMDAssistantCommand home](self, "home");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "urlString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLWithString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHomeIdentifier:", v17);

    }
    v40 = v10;
    v42 = v9;
    v43 = v8;
    -[HMDAssistantCommand serverValidity](self, "serverValidity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setServerValidity:", v18);

    -[HMDAssistantCommand homeKitObjects](self, "homeKitObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count") + 1;

    -[HMDAssistantCommand homeManager](self, "homeManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "assistantGenerationCounter");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%tu:%tu"), v22, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setClientValidity:", v23);

    v24 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAssistantCommand aceId](self, "aceId");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hm_headerDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v50 = v26;
      v51 = 2112;
      v52 = v27;
      v53 = 2112;
      v54 = v28;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Response for Siri command(%@): %@", buf, 0x20u);

    }
    v41 = self;

    objc_autoreleasePoolPop(v24);
    v39 = v11;
    objc_msgSend(v11, "hm_contentDescription");
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v45 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          v35 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v50 = v37;
            v51 = 2112;
            v52 = v34;
            _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v35);
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v31);
    }

    objc_msgSend(v39, "dictionary");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v40;
    v40[2](v40, v38);

    -[HMDAssistantCommand _logEvent:](v41, "_logEvent:", v39);
    v9 = v42;
    v8 = v43;
  }

}

- (void)reportResults:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id *v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v10, "count"))
  {
    v7 = v10;
    v8 = (id *)MEMORY[0x24BE81EB0];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (id *)MEMORY[0x24BE81EB8];
  }
  v9 = *v8;
  -[HMDAssistantCommand reportOutcome:results:handler:](self, "reportOutcome:results:handler:", v9, v7, v6);

}

- (void)reportUnlockRequired:(id)a3
{
  void *v4;
  _BOOL4 v5;
  _QWORD *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[HMDDeviceCapabilities supportsDeviceLock](HMDDeviceCapabilities, "supportsDeviceLock");
  v6 = (_QWORD *)MEMORY[0x24BE81F00];
  if (v5 && isPasscodeEnabledOnThisDevice())
    v6 = (_QWORD *)MEMORY[0x24BE81ED8];
  -[HMDAssistantCommand reportOutcome:results:handler:](self, "reportOutcome:results:handler:", *v6, v4, v7);

}

- (void)returnResults:(id)a3 serviceType:(id)a4 forAction:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v10;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    v17 = *MEMORY[0x24BE81C30];
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v18);
        actionResultForAction(v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setOutcome:", v17);
        -[HMDAssistantCommand populateResult:withObject:serviceType:action:](self, "populateResult:withObject:serviceType:action:", v20, v19, v11, v12);
        objc_msgSend(v13, "addObject:", v20);

        ++v18;
      }
      while (v15 != v18);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  -[HMDAssistantCommand reportResults:handler:](self, "reportResults:handler:", v13, v21);
}

- (id)actionOutcomeFromError:(id)a3
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = objc_msgSend(a3, "code");
  if (v4 > 44)
  {
    if (v4 > 2403)
    {
      if (v4 == 2404)
      {
        v5 = (id *)MEMORY[0x24BE81BA8];
        return *v5;
      }
      if (v4 == 2405)
      {
        v5 = (id *)MEMORY[0x24BE81BB8];
        return *v5;
      }
    }
    else
    {
      if (v4 == 45)
      {
        v5 = (id *)MEMORY[0x24BE81BD8];
        return *v5;
      }
      if (v4 == 88)
      {
        v5 = (id *)MEMORY[0x24BE81BB0];
        return *v5;
      }
    }
    goto LABEL_22;
  }
  if (v4 > 14)
  {
    if (v4 == 15)
    {
      v5 = (id *)MEMORY[0x24BE81BD0];
      return *v5;
    }
    if (v4 == 44)
    {
      v5 = (id *)MEMORY[0x24BE81C28];
      return *v5;
    }
    goto LABEL_22;
  }
  if (v4 != 4)
  {
    if (v4 == 5)
    {
      v5 = (id *)MEMORY[0x24BE81BF0];
      return *v5;
    }
LABEL_22:
    v5 = (id *)MEMORY[0x24BE81BC0];
    return *v5;
  }
  -[HMDAssistantCommand home](self, "home");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[HMDAssistantCommand home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "primaryResident");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

    }
    else
    {
      -[HMDAssistantCommand home](self, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "homeLocation");

      if (v11 != 1)
      {
        v5 = (id *)MEMORY[0x24BE81BE8];
        return *v5;
      }
    }
  }
  v5 = (id *)MEMORY[0x24BE81C38];
  return *v5;
}

- (void)executeActionSet:(id)a3 action:(id)a4 withCompletionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
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
  HMDAssistantCommand *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDAssistantCommand *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _BYTE location[12];
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc(MEMORY[0x24BE3F138]);
  v12 = (void *)MEMORY[0x24BDD17C8];
  MEMORY[0x227675180](self, a2);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@, %s:%ld"), v13, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Assistant/HMDAssistantCommand.m", 1469);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v11, "initWithName:", v14);

  objc_msgSend(v9, "attribute");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_msgSend((id)*MEMORY[0x24BE81D60], "isEqualToString:", v15);

  if ((v13 & 1) != 0)
  {
    objc_msgSend(v33, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommand setHome:](self, "setHome:", v16);
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attribute");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "mapCharacteristicValueType:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDAssistantCommand getValueOfType:action:](self, "getValueOfType:action:", v19, v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20 && (objc_msgSend(v20, "BOOLValue") & 1) != 0)
    {
      objc_initWeak((id *)location, self);
      -[HMDAssistantCommand assistantCommandHelper](self, "assistantCommandHelper");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __69__HMDAssistantCommand_executeActionSet_action_withCompletionHandler___block_invoke;
      v34[3] = &unk_24E777BC8;
      objc_copyWeak(&v39, (id *)location);
      v35 = v32;
      v38 = v10;
      v36 = v9;
      v37 = v33;
      objc_msgSend(v22, "addActionSetRequest:actionSet:completionHandler:", v16, v37, v34);

      objc_destroyWeak(&v39);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v31;
        v41 = 2112;
        v42 = v21;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ActionSet action value %@ not true", location, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      -[HMDAssistantCommand reportOutcome:results:handler:](v29, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v10);
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "attribute");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v26;
      v41 = 2112;
      v42 = v27;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid action.attribute %@ for actionSet", location, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    -[HMDAssistantCommand reportOutcome:results:handler:](v24, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v10);
  }

}

- (void)handleGetMetadataActionTypes:(id)a3 serviceType:(id)a4 forObjects:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMDAssistantCommand *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDAssistantCommand *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDAssistantCommand *v41;
  NSObject *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  HMDAssistantCommand *v47;
  NSObject *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  HMDAssistantCommand *v56;
  int v57;
  void *v58;
  id obj;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  void *v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "attribute");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v10, "attribute");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommand filteredObjectsFromObjects:byAttribute:forActionType:](self, "filteredObjectsFromObjects:byAttribute:forActionType:", v12, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = v17;
    if (objc_msgSend(v17, "count"))
    {
      +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "attribute");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "mapReadCharacteristicFromAssistantName:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v18, "getAliasedCharacteristicTypes:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "count"))
        {
          objc_msgSend(v21, "arrayByAddingObject:", v20);
          v22 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v69 = v20;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v69, 1);
          v22 = objc_claimAutoreleasedReturnValue();
        }
        v54 = (void *)v22;
        -[HMDAssistantCommand filterObjects:forCharacteristicTypes:](self, "filterObjects:forCharacteristicTypes:", v17, v22);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v32, "count"))
        {
          v55 = v20;
          v52 = v18;
          v53 = v13;
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v10, "includeCompleteInformation");
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          v51 = v32;
          obj = v32;
          v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
          if (v63)
          {
            v61 = *(_QWORD *)v65;
            v60 = *MEMORY[0x24BE81C30];
            v56 = self;
            v57 = v33;
            do
            {
              for (i = 0; i != v63; ++i)
              {
                if (*(_QWORD *)v65 != v61)
                  objc_enumerationMutation(obj);
                v35 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
                objc_msgSend(v35, "service");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                actionResultForAction(v10);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "setOutcome:", v60);
                entityForService(v36, v11, v62, v33);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "setEntity:", v38);

                if (-[HMDAssistantCommand populateResult:withService:serviceType:characteristic:resultAttribute:action:](self, "populateResult:withService:serviceType:characteristic:resultAttribute:action:", v37, v36, v11, v35, 0, v10))
                {
                  objc_msgSend(v58, "addObject:", v37);
                }
                else
                {
                  v39 = v21;
                  v40 = (void *)MEMORY[0x227676638]();
                  v41 = self;
                  HMFGetOSLogHandle();
                  v42 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v43 = v11;
                    v44 = v10;
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v71 = v45;
                    v72 = 2112;
                    v73 = v37;
                    _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Not including the result: %@ to the action results", buf, 0x16u);

                    v10 = v44;
                    v11 = v43;
                    self = v56;
                  }

                  objc_autoreleasePoolPop(v40);
                  v21 = v39;
                  v33 = v57;
                }

              }
              v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
            }
            while (v63);
          }

          v46 = (void *)MEMORY[0x227676638]();
          v47 = self;
          HMFGetOSLogHandle();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v49 = v10;
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v71 = v50;
            _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_INFO, "%{public}@All results have been received for get-metadata-action-types, calling result handler", buf, 0xCu);

            v10 = v49;
          }

          objc_autoreleasePoolPop(v46);
          v13 = v53;
          -[HMDAssistantCommand reportResults:handler:](v47, "reportResults:handler:", v58, v53);

          v32 = v51;
          v18 = v52;
          v20 = v55;
        }
        else
        {
          -[HMDAssistantCommand returnResults:serviceType:forAction:completionHandler:](self, "returnResults:serviceType:forAction:completionHandler:", 0, v11, v10, v13);
        }

      }
      else
      {
        v27 = (void *)MEMORY[0x227676638]();
        v28 = self;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "attribute");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v71 = v30;
          v72 = 2112;
          v73 = v31;
          _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot map actionAttribute(%@) to a characteristicType", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v27);
        -[HMDAssistantCommand reportOutcome:results:handler:](v28, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v13);
        v20 = 0;
      }

    }
    else
    {
      -[HMDAssistantCommand returnResults:serviceType:forAction:completionHandler:](self, "returnResults:serviceType:forAction:completionHandler:", 0, v11, v10, v13);
    }
    v12 = v62;
  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v71 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@In Get metadata action types, There is no attribute in action, reporting results", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    -[HMDAssistantCommand returnResults:serviceType:forAction:completionHandler:](v24, "returnResults:serviceType:forAction:completionHandler:", v12, v11, v10, v13);
  }

}

- (BOOL)populateResult:(id)a3 fromResponse:(id)a4 responses:(id)a5 forAction:(id)a6 serviceType:(id)a7 forObjects:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  int v57;
  id v58;
  void *v59;
  char isKindOfClass;
  void *v61;
  id v62;
  id *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  id v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  id v76;
  id v77;
  id v78;
  void *v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  id obj;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v76 = a5;
  v15 = a6;
  v78 = a7;
  v77 = a8;
  objc_msgSend(v14, "request");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "characteristic");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "type");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_msgSend(v18, "isEqualToString:", CFSTR("00000065-0000-1000-8000-0026BB765291"));

  if ((a7 & 1) != 0)
  {
    v19 = 0;
    v20 = v78;
    goto LABEL_45;
  }
  objc_msgSend(v14, "error");
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "service");
  v22 = objc_claimAutoreleasedReturnValue();
  v79 = (void *)v22;
  v74 = (void *)v21;
  if (v21)
  {
    v23 = (void *)v22;
    -[HMDAssistantCommand actionOutcomeFromError:](self, "actionOutcomeFromError:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOutcome:", v24);

  }
  else
  {
    objc_msgSend(v14, "request");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "characteristic");
    v72 = v17;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "value");
    v27 = v15;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "request");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "characteristic");
    v30 = v14;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "metadata");
    v32 = v13;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommand compareForBoundary:withMetadata:](self, "compareForBoundary:withMetadata:", v28, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setOutcome:", v34);

    v13 = v32;
    v14 = v30;

    v23 = v79;
    v15 = v27;

    v17 = v72;
    objc_msgSend(v32, "outcome");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
      objc_msgSend(v32, "setOutcome:", *MEMORY[0x24BE81C30]);
  }
  entityForService(v23, v78, v77, objc_msgSend(v15, "includeCompleteInformation"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEntity:", v36);

  objc_msgSend(v17, "type");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("00000064-0000-1000-8000-0026BB765291"));

  if (!v38)
  {
    objc_msgSend(v17, "type");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "isEqualToString:", CFSTR("000000C6-0000-1000-8000-0026BB765291"));

    if (v57)
    {
      v55 = (id)*MEMORY[0x24BE81E18];
      v58 = v78;
    }
    else
    {
      objc_msgSend(v17, "type");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "isEqualToString:", CFSTR("000000C7-0000-1000-8000-0026BB765291"));

      if (v65)
        v55 = (id)*MEMORY[0x24BE81E10];
      else
        v55 = 0;
      v58 = v78;
    }
    v42 = v79;
    goto LABEL_44;
  }
  v73 = v17;
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = v76;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
  if (!v39)
  {
    v55 = 0;
    v42 = v79;
    goto LABEL_43;
  }
  v40 = v39;
  v69 = v15;
  v70 = v14;
  v71 = v13;
  v41 = *(_QWORD *)v86;
  v42 = v79;
  v81 = *(_QWORD *)v86;
  while (2)
  {
    v43 = 0;
    v82 = v40;
    do
    {
      if (*(_QWORD *)v86 != v41)
        objc_enumerationMutation(obj);
      v84 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v43);
      objc_msgSend(v84, "request");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "characteristic");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v45, "service");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "accessory");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "uuid");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "accessory");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "uuid");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v48, "isEqual:", v50))
        goto LABEL_18;
      v51 = v45;
      objc_msgSend(v42, "instanceID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "instanceID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v52, "isEqual:", v53))
      {

        v45 = v51;
        v41 = v81;
        v40 = v82;
LABEL_18:

        goto LABEL_19;
      }
      objc_msgSend(v51, "type");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v54, "isEqualToString:", CFSTR("00000065-0000-1000-8000-0026BB765291"));

      v42 = v79;
      v45 = v51;

      v41 = v81;
      v40 = v82;
      if (v80)
      {
        objc_msgSend(v84, "value");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
          v61 = v59;
        else
          v61 = 0;
        v62 = v61;

        if (v62)
        {
          v14 = v70;
          v13 = v71;
          if (objc_msgSend(v62, "unsignedIntegerValue"))
          {
            if (objc_msgSend(v62, "unsignedIntegerValue") != 1)
            {
              v55 = 0;
              goto LABEL_41;
            }
            v63 = (id *)MEMORY[0x24BE81E10];
          }
          else
          {
            v63 = (id *)MEMORY[0x24BE81E18];
          }
          v55 = *v63;
        }
        else
        {
          v55 = 0;
          v14 = v70;
          v13 = v71;
        }
LABEL_41:

        goto LABEL_42;
      }
LABEL_19:

      ++v43;
    }
    while (v40 != v43);
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
    if (v40)
      continue;
    break;
  }
  v55 = 0;
  v14 = v70;
  v13 = v71;
LABEL_42:
  v15 = v69;
LABEL_43:

  v58 = v78;
  v17 = v73;
LABEL_44:
  v66 = v42;
  v67 = v42;
  v20 = v58;
  v19 = -[HMDAssistantCommand populateResult:withService:serviceType:characteristic:resultAttribute:action:](self, "populateResult:withService:serviceType:characteristic:resultAttribute:action:", v13, v66);

LABEL_45:
  return v19;
}

- (void)handleMediaAccessorySetActionType:(id)a3 forObjects:(id)a4 withServiceType:(id)a5 completionHandler:(id)a6
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  __CFString *v36;
  NSObject *v37;
  void *v38;
  HMDAssistantCommand *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  HMDAssistantCommand *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id obj;
  _QWORD block[4];
  id v54;
  HMDAssistantCommand *v55;
  id v56;
  __int128 *v57;
  _QWORD v58[4];
  NSObject *v59;
  id v60;
  id v61;
  uint64_t v62;
  __CFString *v63;
  id v64;
  id v65;
  __int128 *p_buf;
  id v67;
  id location;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t v77[128];
  __int128 buf;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v51 = a3;
  v47 = a4;
  v49 = a5;
  v50 = a6;
  v11 = objc_alloc(MEMORY[0x24BE3F138]);
  v12 = (void *)MEMORY[0x24BDD17C8];
  MEMORY[0x227675180](self, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@, %s:%ld"), v13, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Assistant/HMDAssistantCommand.m", 1695);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v11, "initWithName:", v14);

  objc_msgSend(v51, "attribute");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[HMDAssistantCommand getValueOfType:action:](self, "getValueOfType:action:", 0, v51);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "attribute");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BE81E28]);

    if (v17)
    {
      v18 = CFSTR("HMDMediaProfileSetPowerKey");
      objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      obj = v47;
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v74;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v74 != v21)
              objc_enumerationMutation(obj);
            -[HMDAssistantCommand mediaProfileFromObject:](self, "mediaProfileFromObject:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v22));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              +[HMDMediaPropertyWriteRequest writeRequestWithProperty:value:mediaProfile:](HMDMediaPropertyWriteRequest, "writeRequestWithProperty:value:mediaProfile:", CFSTR("HMDMediaProfileSetPowerKey"), v48, v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "accessory");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "home");
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (v26)
              {
                objc_msgSend(v19, "objectForKey:", v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v27)
                {
                  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "setObject:forKey:", v27, v26);
                }
                objc_msgSend(v27, "addObject:", v24);

              }
            }

            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
        }
        while (v20);
      }

      v28 = dispatch_group_create();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v79 = 0x3032000000;
      v80 = __Block_byref_object_copy__18838;
      v81 = __Block_byref_object_dispose__18839;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v82 = (id)objc_claimAutoreleasedReturnValue();
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v29 = v19;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v70;
        do
        {
          v32 = 0;
          do
          {
            if (*(_QWORD *)v70 != v31)
              objc_enumerationMutation(v29);
            v33 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v32);
            dispatch_group_enter(v28);
            objc_msgSend(v29, "objectForKey:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_initWeak(&location, self);
            -[HMDAssistantCommand assistantCommandHelper](self, "assistantCommandHelper");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v58[0] = MEMORY[0x24BDAC760];
            v58[1] = 3221225472;
            v58[2] = __102__HMDAssistantCommand_handleMediaAccessorySetActionType_forObjects_withServiceType_completionHandler___block_invoke;
            v58[3] = &unk_24E777BF0;
            objc_copyWeak(&v67, &location);
            v59 = v28;
            v65 = v50;
            v60 = v51;
            v61 = v49;
            v62 = v33;
            v36 = CFSTR("HMDMediaProfileSetPowerKey");
            v63 = CFSTR("HMDMediaProfileSetPowerKey");
            p_buf = &buf;
            v64 = obj;
            objc_msgSend(v35, "addMediaWriteRequests:withRequestProperty:completion:", v34, CFSTR("HMDMediaProfileSetPowerKey"), v58);

            objc_destroyWeak(&v67);
            objc_destroyWeak(&location);

            ++v32;
          }
          while (v30 != v32);
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
        }
        while (v30);
      }

      -[HMDAssistantCommand queue](self, "queue");
      v37 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __102__HMDAssistantCommand_handleMediaAccessorySetActionType_forObjects_withServiceType_completionHandler___block_invoke_83;
      block[3] = &unk_24E797938;
      v54 = v46;
      v55 = self;
      v57 = &buf;
      v56 = v50;
      dispatch_group_notify(v28, v37, block);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v42 = (void *)MEMORY[0x227676638]();
      v43 = self;
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v45;
        _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@In Set action types, passed-in attribute in action is not supported.", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v42);
      -[HMDAssistantCommand reportOutcome:results:handler:](v43, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v50);
    }

  }
  else
  {
    v38 = (void *)MEMORY[0x227676638]();
    v39 = self;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v41;
      _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@In Set action types, there is no attribute in action, reporting malformed results", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v38);
    -[HMDAssistantCommand reportOutcome:results:handler:](v39, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v50);
  }

}

- (void)handleGetActionTypes:(id)a3 serviceType:(id)a4 forObjects:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  HMDAssistantCommand *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  HMDAssistantCommand *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  uint64_t v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  HMDAssistantCommand *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id obj;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  _QWORD block[4];
  id v75;
  HMDAssistantCommand *v76;
  id v77;
  _BYTE *v78;
  _QWORD v79[4];
  NSObject *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  _BYTE *v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  id location;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint8_t v97[128];
  _BYTE buf[24];
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  _BYTE v102[128];
  _QWORD v103[4];

  v103[1] = *MEMORY[0x24BDAC8D0];
  v73 = a3;
  v71 = a4;
  v11 = a5;
  v72 = a6;
  v12 = objc_alloc(MEMORY[0x24BE3F138]);
  v13 = (void *)MEMORY[0x24BDD17C8];
  MEMORY[0x227675180](self, a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@, %s:%ld"), v14, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Assistant/HMDAssistantCommand.m", 1774);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)objc_msgSend(v12, "initWithName:", v15);

  objc_msgSend(v73, "attribute");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v73, "attribute");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BE81D28]);

    if (v18)
    {
      -[HMDAssistantCommand handleGetColor:forObjects:serviceType:completionHandler:](self, "handleGetColor:forObjects:serviceType:completionHandler:", v73, v11, v71, v72);
    }
    else
    {
      objc_msgSend(v73, "attribute");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", *MEMORY[0x24BE81CA8]);

      if (v24)
      {
        -[HMDAssistantCommand handleGetNaturalLightingAction:forObjects:serviceType:completionHandler:](self, "handleGetNaturalLightingAction:forObjects:serviceType:completionHandler:", v73, v11, v71, v72);
      }
      else
      {
        objc_msgSend(v73, "attribute");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "actionType");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAssistantCommand filteredObjectsFromObjects:byAttribute:forActionType:](self, "filteredObjectsFromObjects:byAttribute:forActionType:", v11, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v27, "count"))
        {
          +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "actionType");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqualToString:", *MEMORY[0x24BE81C78]);

          objc_msgSend(v73, "attribute");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
            objc_msgSend(v67, "mapWriteCharacteristicFromAssistantName:", v30);
          else
            objc_msgSend(v67, "mapReadCharacteristicFromAssistantName:", v30);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          if (v66)
          {
            objc_msgSend(v67, "getAliasedCharacteristicTypes:");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v65, "count"))
            {
              objc_msgSend(v65, "arrayByAddingObject:", v66);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDAssistantCommand filterObjects:forCharacteristicTypes:](self, "filterObjects:forCharacteristicTypes:", v27, v64);
            }
            else
            {
              v103[0] = v66;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v103, 1);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDAssistantCommand filterObjects:forCharacteristicTypes:](self, "filterObjects:forCharacteristicTypes:", v27, v64);
            }
            obj = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(obj, "count"))
            {
              objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v27);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", obj);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDAssistantCommand addCharacteristicsFromRelatedServicesFor:assistantObjects:](self, "addCharacteristicsFromRelatedServicesFor:assistantObjects:", v36, v63);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "allObjects");
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v63, "allObjects");
              v69 = (void *)objc_claimAutoreleasedReturnValue();

              -[HMDAssistantCommand addStatusCharacteristicsIfNeeded:](self, "addStatusCharacteristicsIfNeeded:", v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v95 = 0u;
              v96 = 0u;
              v93 = 0u;
              v94 = 0u;
              obj = v39;
              v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
              if (v41)
              {
                v42 = *(_QWORD *)v94;
                do
                {
                  for (i = 0; i != v41; ++i)
                  {
                    if (*(_QWORD *)v94 != v42)
                      objc_enumerationMutation(obj);
                    v44 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
                    objc_msgSend(v44, "service");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "accessory");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "home");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v40, "objectForKey:", v47);
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v48)
                    {
                      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v40, "setObject:forKey:", v48, v47);
                    }
                    -[HMDAssistantCommand readRequestsForCharacteristic:](self, "readRequestsForCharacteristic:", v44);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "addObjectsFromArray:", v49);

                  }
                  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
                }
                while (v41);
              }

              v50 = dispatch_group_create();
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x3032000000;
              v99 = __Block_byref_object_copy__18838;
              v100 = __Block_byref_object_dispose__18839;
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v101 = (id)objc_claimAutoreleasedReturnValue();
              objc_initWeak(&location, self);
              v90 = 0u;
              v91 = 0u;
              v88 = 0u;
              v89 = 0u;
              v51 = v40;
              v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
              if (v52)
              {
                v53 = *(_QWORD *)v89;
                do
                {
                  for (j = 0; j != v52; ++j)
                  {
                    if (*(_QWORD *)v89 != v53)
                      objc_enumerationMutation(v51);
                    v55 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * j);
                    dispatch_group_enter(v50);
                    objc_msgSend(v51, "objectForKey:", v55);
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HMDAssistantCommand assistantCommandHelper](self, "assistantCommandHelper");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    v79[0] = MEMORY[0x24BDAC760];
                    v79[1] = 3221225472;
                    v79[2] = __85__HMDAssistantCommand_handleGetActionTypes_serviceType_forObjects_completionHandler___block_invoke;
                    v79[3] = &unk_24E777C18;
                    objc_copyWeak(&v87, &location);
                    v80 = v50;
                    v85 = v72;
                    v81 = v73;
                    v82 = v71;
                    v86 = buf;
                    v83 = v69;
                    v84 = v70;
                    objc_msgSend(v57, "addReadRequests:home:completion:", v56, v55, v79);

                    objc_destroyWeak(&v87);
                  }
                  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
                }
                while (v52);
              }

              -[HMDAssistantCommand queue](self, "queue");
              v58 = objc_claimAutoreleasedReturnValue();
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __85__HMDAssistantCommand_handleGetActionTypes_serviceType_forObjects_completionHandler___block_invoke_86;
              block[3] = &unk_24E797938;
              v75 = v70;
              v76 = self;
              v78 = buf;
              v77 = v72;
              dispatch_group_notify(v50, v58, block);

              objc_destroyWeak(&location);
              _Block_object_dispose(buf, 8);

              v27 = v69;
            }
            else
            {
              v59 = (void *)MEMORY[0x227676638]();
              v60 = self;
              HMFGetOSLogHandle();
              v61 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v62;
                _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_INFO, "%{public}@No characteristics found after filtering objects", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v59);
              -[HMDAssistantCommand returnResults:serviceType:forAction:completionHandler:](v60, "returnResults:serviceType:forAction:completionHandler:", 0, v71, v73, v72);
            }

          }
          else
          {
            v31 = (void *)MEMORY[0x227676638]();
            v32 = self;
            HMFGetOSLogHandle();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "attribute");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v34;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v35;
              _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot map actionAttribute(%@) to a characteristicType", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v31);
            -[HMDAssistantCommand reportOutcome:results:handler:](v32, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v72);
          }

        }
        else
        {
          -[HMDAssistantCommand returnResults:serviceType:forAction:completionHandler:](self, "returnResults:serviceType:forAction:completionHandler:", 0, v71, v73, v72);
        }
        v11 = v27;
      }
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@In Get action types, There is no attribute in action, reporting results", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    -[HMDAssistantCommand returnResults:serviceType:forAction:completionHandler:](v20, "returnResults:serviceType:forAction:completionHandler:", v11, v71, v73, v72);
  }

}

- (id)compareCurrentValue:(id)a3 newValue:(id)a4 withMetadata:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v9, "maximumValue");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v9, "maximumValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "compare:", v7);

      if ((unint64_t)(v12 + 1) > 1 || (unint64_t)(objc_msgSend(v7, "compare:", v8) + 1) > 1)
        v10 = 0;
      else
        v10 = (id)*MEMORY[0x24BE81B90];
    }
    objc_msgSend(v9, "minimumValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v9, "minimumValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "compare:", v7);

      if (v16 <= 1 && (unint64_t)objc_msgSend(v7, "compare:", v8) <= 1)
      {
        v17 = (id)*MEMORY[0x24BE81B98];

        v10 = v17;
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)compareForBoundary:(id)a3 withMetadata:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v5 = a3;
  v6 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "maximumValue");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "maximumValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "compare:", v5);

      if (v9)
        v7 = 0;
      else
        v7 = (id)*MEMORY[0x24BE81C18];
    }
    objc_msgSend(v6, "minimumValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v6, "minimumValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "compare:", v5);

      if (!v13)
      {
        v14 = (id)*MEMORY[0x24BE81C20];

        v7 = v14;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)handleGetNaturalLightingAction:(id)a3 forObjects:(id)a4 serviceType:(id)a5 completionHandler:(id)a6
{
  id v10;
  void *v11;
  HMDAssistantCommand *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  HMDAssistantCommand *v36;
  NSObject *v37;
  HMDAssistantCommand *v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  _QWORD v50[4];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v48 = a3;
  v10 = a4;
  v47 = a5;
  v43 = a6;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v58 = v14;
    v59 = 2112;
    v60 = v10;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Getting natural lighting enabled for objects: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v53;
    v44 = *MEMORY[0x24BE81CA8];
    v45 = *MEMORY[0x24BE81C30];
    do
    {
      v19 = 0;
      v49 = v17;
      do
      {
        if (*(_QWORD *)v53 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v19);
        -[HMDAssistantCommand serviceFromObject:](v12, "serviceFromObject:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          objc_msgSend(v21, "accessory");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v24 = v23;
          else
            v24 = 0;
          v25 = v24;

          objc_msgSend(v25, "lightProfiles");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v50[0] = MEMORY[0x24BDAC760];
          v50[1] = 3221225472;
          v50[2] = __95__HMDAssistantCommand_handleGetNaturalLightingAction_forObjects_serviceType_completionHandler___block_invoke;
          v50[3] = &unk_24E782CB8;
          v27 = v22;
          v51 = v27;
          objc_msgSend(v26, "na_firstObjectPassingTest:", v50);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_msgSend(v28, "settings");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "supportedFeatures");

            if ((v30 & 1) != 0)
            {
              actionResultForAction(v48);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              entityForService(v27, v47, v15, objc_msgSend(v48, "includeCompleteInformation"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setEntity:", v32);

              objc_msgSend(v31, "setOutcome:", v45);
              objc_msgSend(v31, "setResultAttribute:", v44);
              v33 = objc_alloc_init(MEMORY[0x24BE812A8]);
              objc_msgSend(v28, "settings");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setValue:", objc_msgSend(v34, "isNaturalLightingEnabled"));

              objc_msgSend(v31, "setResultValue:", v33);
              objc_msgSend(v46, "addObject:", v31);

            }
          }

        }
        else
        {
          v35 = (void *)MEMORY[0x227676638]();
          v36 = v12;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v38 = v12;
            v39 = v18;
            v40 = v15;
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v58 = v41;
            v59 = 2112;
            v60 = v20;
            _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Did not find service for filtered object: %@", buf, 0x16u);

            v15 = v40;
            v18 = v39;
            v12 = v38;
            v17 = v49;
          }

          objc_autoreleasePoolPop(v35);
        }

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v17);
  }

  objc_msgSend(v46, "allObjects");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAssistantCommand reportResults:handler:](v12, "reportResults:handler:", v42, v43);

}

- (void)handleSetNaturalLightingAction:(id)a3 serviceType:(id)a4 forObjects:(id)a5 completionHandler:(id)a6
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  BOOL v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  char v37;
  void *v38;
  void *v39;
  HMDAssistantCommand *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  HMDAssistantCommand *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  HMDAssistantCommand *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  HMDAssistantCommand *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  id obj;
  HMDAssistantCommand *v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  id v86;
  __int16 v87;
  void *v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v64 = a3;
  v60 = a4;
  v62 = a5;
  v61 = a6;
  v11 = objc_alloc(MEMORY[0x24BE3F138]);
  v12 = (void *)MEMORY[0x24BDD17C8];
  MEMORY[0x227675180](self, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@, %s:%ld"), v13, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Assistant/HMDAssistantCommand.m", 2002);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_msgSend(v11, "initWithName:", v14);

  v15 = (void *)MEMORY[0x227676638]();
  v68 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v84 = v17;
    v85 = 2112;
    v86 = v62;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Setting natural lighting enabled for objects: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  objc_msgSend(v64, "value");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v63 = v19;

  if (v63)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = v62;
    v20 = 0;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v80 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
          -[HMDAssistantCommand serviceFromObject:](v68, "serviceFromObject:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v25)
          {
            objc_msgSend(v25, "accessory");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v28 = v27;
            else
              v28 = 0;
            v29 = v28;

            objc_msgSend(v29, "home");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v30 == 0;

            if (!v31)
            {
              objc_msgSend(v29, "home");
              v32 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v29, "lightProfiles");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v77[0] = MEMORY[0x24BDAC760];
              v77[1] = 3221225472;
              v77[2] = __95__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_completionHandler___block_invoke;
              v77[3] = &unk_24E782CB8;
              v78 = v26;
              objc_msgSend(v33, "na_firstObjectPassingTest:", v77);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v34, "settings");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "supportedFeatures");

              if ((v36 & 1) != 0)
              {
                if (!_os_feature_enabled_impl()
                  || (v37 = objc_msgSend(v34, "supportsCHIP"), v38 = v65, (v37 & 1) == 0))
                {
                  v38 = v66;
                }
                objc_msgSend(v38, "addObject:", v34);
              }

              v20 = (void *)v32;
            }

          }
          else
          {
            v39 = (void *)MEMORY[0x227676638]();
            v40 = v68;
            HMFGetOSLogHandle();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v84 = v42;
              v85 = 2112;
              v86 = v24;
              _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Did not find service for filtered object: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v39);
          }

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
      }
      while (v21);
    }

    if (objc_msgSend(v66, "hmf_isEmpty") && objc_msgSend(v65, "hmf_isEmpty"))
    {
      v43 = (void *)MEMORY[0x227676638]();
      v44 = v68;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v84 = v46;
        _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@Did not find any light profiles to set natural lighting on", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v43);
      -[HMDAssistantCommand reportResults:handler:](v44, "reportResults:handler:", 0, v61);
    }
    else if ((objc_msgSend(v65, "hmf_isEmpty") & 1) != 0)
    {
      v47 = (void *)MEMORY[0x227676638]();
      v48 = v68;
      HMFGetOSLogHandle();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "value");
        HMFBooleanToString();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v84 = v50;
        v85 = 2112;
        v86 = v51;
        v87 = 2112;
        v88 = v66;
        _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_INFO, "%{public}@Setting natural lighting for light profiles %@:%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v47);
      objc_initWeak((id *)buf, v48);
      objc_msgSend(v20, "naturalLightingCurveWriter");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v63, "value");
      v69[0] = MEMORY[0x24BDAC760];
      v69[1] = 3221225472;
      v69[2] = __95__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_completionHandler___block_invoke_90;
      v69[3] = &unk_24E777C40;
      objc_copyWeak(&v76, (id *)buf);
      v70 = v59;
      v71 = v66;
      v72 = v64;
      v73 = v60;
      v74 = obj;
      v75 = v61;
      objc_msgSend(v52, "setNaturalLightingEnabled:forLightProfiles:completion:", v53, v71, v69);

      objc_destroyWeak(&v76);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[HMDAssistantCommand handleSetNaturalLightingAction:serviceType:forObjects:hapLightProfiles:matterLightProfiles:home:completionHandler:](v68, "handleSetNaturalLightingAction:serviceType:forObjects:hapLightProfiles:matterLightProfiles:home:completionHandler:", v64, v60, obj, v66, v65, v20, v61);
    }

  }
  else
  {
    v54 = (void *)MEMORY[0x227676638]();
    v55 = v68;
    HMFGetOSLogHandle();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "value");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v84 = v57;
      v85 = 2112;
      v86 = v58;
      _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_ERROR, "%{public}@Specified value is not of BOOLean type %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v54);
    -[HMDAssistantCommand reportOutcome:results:handler:](v55, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], MEMORY[0x24BDBD1A8], v61);
  }

}

- (void)handleSetNaturalLightingAction:(id)a3 serviceType:(id)a4 forObjects:(id)a5 hapLightProfiles:(id)a6 matterLightProfiles:(id)a7 home:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  HMDAssistantCommand *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  _QWORD v67[5];
  id v68;
  id v69;
  _QWORD v70[5];
  id v71;
  id v72;
  _QWORD v73[5];
  _QWORD v74[5];
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  _QWORD v80[5];
  _QWORD v81[4];
  id v82;
  id v83;
  id v84;
  id v85;
  HMDAssistantCommand *v86;
  id v87;
  _QWORD v88[2];
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  id v94;
  __int16 v95;
  id v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v66 = a8;
  v64 = a9;
  v65 = v15;
  objc_msgSend(v15, "value");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  v23 = (void *)MEMORY[0x227676638]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  v63 = v22;
  if (v22)
  {
    v61 = v16;
    v62 = v17;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "value");
      HMFBooleanToString();
      v28 = v18;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v90 = v27;
      v91 = 2112;
      v92 = v29;
      v93 = 2112;
      v94 = v28;
      v95 = 2112;
      v96 = v19;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Setting natural lighting %@ for HAP light profiles: %@ and matter light profiles: %@", buf, 0x2Au);

      v18 = v28;
    }
    v60 = v18;

    objc_autoreleasePoolPop(v23);
    v30 = v22;
    v31 = v19;
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v19, "count") + objc_msgSend(v18, "count"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_alloc(MEMORY[0x24BE3F168]);
    -[HMDAssistantCommand queue](v24, "queue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v33, "initWithQueue:", v34);

    -[HMDAssistantCommand handleSetNaturalLightingActionOnHAPLightProfiles:home:value:](v24, "handleSetNaturalLightingActionOnHAPLightProfiles:home:value:", v18, v66, objc_msgSend(v30, "value"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = MEMORY[0x24BDAC760];
    v81[1] = 3221225472;
    v81[2] = __137__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_hapLightProfiles_matterLightProfiles_home_completionHandler___block_invoke;
    v81[3] = &unk_24E777C68;
    v82 = v18;
    v37 = v65;
    v83 = v37;
    v38 = v61;
    v84 = v38;
    v39 = v62;
    v85 = v39;
    v86 = v24;
    v40 = v32;
    v87 = v40;
    v41 = MEMORY[0x24BDAC760];
    v80[0] = MEMORY[0x24BDAC760];
    v80[1] = 3221225472;
    v80[2] = __137__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_hapLightProfiles_matterLightProfiles_home_completionHandler___block_invoke_94;
    v80[3] = &unk_24E797A18;
    v80[4] = v24;
    v59 = v36;
    v42 = (id)objc_msgSend(v36, "inContext:then:orRecover:", v35, v81, v80);
    objc_msgSend(v66, "handleSetNaturalLightingEnabled:forMatterLightProfiles:", objc_msgSend(v30, "value"), v31);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v41;
    v74[1] = 3221225472;
    v74[2] = __137__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_hapLightProfiles_matterLightProfiles_home_completionHandler___block_invoke_96;
    v74[3] = &unk_24E777C68;
    v74[4] = v24;
    v75 = v31;
    v76 = v37;
    v77 = v38;
    v78 = v39;
    v44 = v40;
    v79 = v44;
    v73[0] = v41;
    v73[1] = 3221225472;
    v73[2] = __137__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_hapLightProfiles_matterLightProfiles_home_completionHandler___block_invoke_97;
    v73[3] = &unk_24E797A18;
    v73[4] = v24;
    v45 = (id)objc_msgSend(v43, "inContext:then:orRecover:", v35, v74, v73);
    v46 = (void *)MEMORY[0x24BE3F180];
    v88[0] = v36;
    v88[1] = v43;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v46;
    v18 = v60;
    objc_msgSend(v48, "allSettled:", v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = MEMORY[0x24BDAC760];
    v70[0] = MEMORY[0x24BDAC760];
    v70[1] = 3221225472;
    v70[2] = __137__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_hapLightProfiles_matterLightProfiles_home_completionHandler___block_invoke_99;
    v70[3] = &unk_24E790890;
    v70[4] = v24;
    v71 = v44;
    v51 = v64;
    v72 = v64;
    v67[0] = v50;
    v17 = v62;
    v67[1] = 3221225472;
    v67[2] = __137__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_hapLightProfiles_matterLightProfiles_home_completionHandler___block_invoke_101;
    v67[3] = &unk_24E792F18;
    v67[4] = v24;
    v68 = v71;
    v69 = v72;
    v52 = v66;
    v53 = v71;
    v54 = (id)objc_msgSend(v49, "inContext:then:orRecover:", v35, v70, v67);

    v55 = v63;
    v16 = v61;
  }
  else
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "value");
      v57 = v18;
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v90 = v56;
      v91 = 2112;
      v92 = v58;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Specified value is not of BOOLean type %@", buf, 0x16u);

      v18 = v57;
    }

    objc_autoreleasePoolPop(v23);
    v51 = v64;
    -[HMDAssistantCommand reportOutcome:results:handler:](v24, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], MEMORY[0x24BDBD1A8], v64);
    v31 = v19;
    v52 = v66;
    v55 = 0;
  }

}

- (id)handleSetNaturalLightingActionOnHAPLightProfiles:(id)a3 home:(id)a4 value:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;
  id v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v17 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hmf_isEmpty"))
  {
    objc_msgSend(v17, "fulfillWithNoValue");
  }
  else
  {
    objc_initWeak(&location, self);
    objc_msgSend(v9, "naturalLightingCurveWriter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __83__HMDAssistantCommand_handleSetNaturalLightingActionOnHAPLightProfiles_home_value___block_invoke;
    v13[3] = &unk_24E777C90;
    objc_copyWeak(&v15, &location);
    v14 = v17;
    objc_msgSend(v11, "setNaturalLightingEnabled:forLightProfiles:completion:", v5, v8, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)handleSetActionTypes:(id)a3 serviceType:(id)a4 forObjects:(id)a5 completionHandler:(id)a6
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDAssistantCommand *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDAssistantCommand *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  HMDAssistantCommand *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  int v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t j;
  uint64_t v86;
  void *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  HMDAssistantCommand *v92;
  NSObject *v93;
  id v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  id obj;
  uint64_t v113;
  void *v114;
  void *v115;
  int v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  HMDAssistantCommand *val;
  _QWORD block[4];
  id v125;
  HMDAssistantCommand *v126;
  id v127;
  _BYTE *v128;
  _QWORD v129[4];
  NSObject *v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  _BYTE *v136;
  id v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _BYTE v150[128];
  _BYTE location[12];
  __int16 v152;
  void *v153;
  _BYTE v154[128];
  uint8_t v155[128];
  _BYTE buf[24];
  uint64_t (*v157)(uint64_t, uint64_t);
  void (*v158)(uint64_t);
  id v159;
  _QWORD v160[4];

  v160[1] = *MEMORY[0x24BDAC8D0];
  v122 = a3;
  v121 = a4;
  v120 = a5;
  v118 = a6;
  v11 = objc_alloc(MEMORY[0x24BE3F138]);
  v12 = (void *)MEMORY[0x24BDD17C8];
  val = self;
  MEMORY[0x227675180](self, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@, %s:%ld"), v13, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Assistant/HMDAssistantCommand.m", 2217);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = (void *)objc_msgSend(v11, "initWithName:", v14);

  objc_msgSend(v122, "attribute");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v22;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@In Set action types, There is no attribute in action - reporting as malformed command", buf, 0xCu);

    }
    goto LABEL_6;
  }
  objc_msgSend(v122, "actionType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = *MEMORY[0x24BE81C88];
  if ((objc_msgSend(v16, "isEqualToString:") & 1) != 0)
  {
    objc_msgSend(v122, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v21;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@No value field for SET actionType", buf, 0xCu);

      }
LABEL_6:

      objc_autoreleasePoolPop(v18);
      -[HMDAssistantCommand reportOutcome:results:handler:](v19, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v118);
      goto LABEL_86;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K =[d] %@"), CFSTR("objectType"), *MEMORY[0x24BE81F48]);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "filteredArrayUsingPredicate:", v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v107, "count"))
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Entity specified is an action set, executing it", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(v107, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    actionSetFromObject(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDAssistantCommand executeActionSet:action:withCompletionHandler:](v24, "executeActionSet:action:withCompletionHandler:", v28, v122, v118);
    goto LABEL_85;
  }
  objc_msgSend(v122, "attribute");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isEqualToString:", *MEMORY[0x24BE81D28]);

  if (v30)
  {
    -[HMDAssistantCommand handleSetColor:forObjects:service:completionHandler:](self, "handleSetColor:forObjects:service:completionHandler:", v122, v120, v121, v118);
    goto LABEL_85;
  }
  objc_msgSend(v122, "attribute");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isEqualToString:", *MEMORY[0x24BE81CA8]);

  if (v32)
  {
    -[HMDAssistantCommand handleSetNaturalLightingAction:serviceType:forObjects:completionHandler:](self, "handleSetNaturalLightingAction:serviceType:forObjects:completionHandler:", v122, v121, v120, v118);
    goto LABEL_85;
  }
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "attribute");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "mapWriteCharacteristicFromAssistantName:", v33);
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v101)
  {
    v35 = (void *)MEMORY[0x227676638]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "attribute");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v39;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot map actionAttribute(%@) to a characteristicType", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    -[HMDAssistantCommand reportOutcome:results:handler:](v36, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v118);
    goto LABEL_84;
  }
  objc_msgSend(v122, "attribute");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "mapCharacteristicValueType:", v34);
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v102, "getAliasedCharacteristicTypes:", v101);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v99, "count"))
  {
    objc_msgSend(v99, "arrayByAddingObject:", v101);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommand filterObjects:forCharacteristicTypes:](self, "filterObjects:forCharacteristicTypes:", v120, v98);
  }
  else
  {
    v160[0] = v101;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v160, 1);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommand filterObjects:forCharacteristicTypes:](self, "filterObjects:forCharacteristicTypes:", v120, v98);
  }
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v100, "count"))
  {
    -[HMDAssistantCommand returnResults:serviceType:forAction:completionHandler:](self, "returnResults:serviceType:forAction:completionHandler:", 0, v121, v122, v118);
    goto LABEL_83;
  }
  -[HMDAssistantCommand getValueOfType:action:](self, "getValueOfType:action:", v110, v122);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "value");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "units");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "attribute");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAssistantCommand adjustSetValue:type:units:attribute:](self, "adjustSetValue:type:units:attribute:", v97, v110, v41, v42);
  v119 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v157 = __Block_byref_object_copy__18838;
  v158 = __Block_byref_object_dispose__18839;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v159 = (id)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v122, "includeCompleteInformation");
  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  obj = v100;
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v155, 16);
  if (!v44)
    goto LABEL_54;
  v45 = *(_QWORD *)v147;
  v109 = *MEMORY[0x24BE81C90];
  v105 = *MEMORY[0x24BE81C98];
  v108 = *MEMORY[0x24BDD5A28];
  v104 = *MEMORY[0x24BE81C28];
  v103 = *MEMORY[0x24BE81BD8];
  v111 = *MEMORY[0x24BE81BF0];
  do
  {
    v46 = 0;
    do
    {
      if (*(_QWORD *)v147 != v45)
        objc_enumerationMutation(obj);
      v47 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * v46);
      objc_msgSend(v47, "metadata");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v47, "properties") & 4) == 0)
      {
        actionResultForAction(v122);
        v49 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "service");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setOutcome:", v111);
        entityForService(v50, v121, v120, v116);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setEntity:", v51);

        -[HMDAssistantCommand populateResult:withService:serviceType:characteristic:resultAttribute:action:](val, "populateResult:withService:serviceType:characteristic:resultAttribute:action:", v49, v50, v121, v47, 0, v122);
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "addObject:", v49);
        goto LABEL_34;
      }
      objc_msgSend(v122, "actionType");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "isEqualToString:", v113);

      if (v53)
      {
        v49 = v119;
        -[HMDAssistantCommand updateValueToBoundary:valueType:fudgeMinimum:metadata:](val, "updateValueToBoundary:valueType:fudgeMinimum:metadata:", v49, v110, 0, v48);
        v119 = (id)objc_claimAutoreleasedReturnValue();

        if (v49 == v119
          || (objc_msgSend(v47, "characteristicType"),
              v54 = (void *)objc_claimAutoreleasedReturnValue(),
              v55 = objc_msgSend(v54, "isEqual:", v108),
              v54,
              !v55))
        {
          objc_msgSend(v43, "setObject:forKey:", v119, v47);
        }
        else
        {
          actionResultForAction(v122);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "service");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (v49 >= v119)
            v57 = v104;
          else
            v57 = v103;
          objc_msgSend(v50, "setOutcome:", v57);
          entityForService(v56, v121, v120, v116);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setEntity:", v58);

          -[HMDAssistantCommand populateResult:withService:serviceType:characteristic:resultAttribute:action:](val, "populateResult:withService:serviceType:characteristic:resultAttribute:action:", v50, v56, v121, v47, 0, v122);
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "addObject:", v50);

LABEL_34:
        }
LABEL_46:

        goto LABEL_47;
      }
      objc_msgSend(v122, "actionType");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "isEqualToString:", v109);

      if (v60)
      {
        objc_msgSend(v48, "maximumValue");
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v61)
          goto LABEL_47;
        objc_msgSend(v48, "maximumValue");
        v49 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setObject:forKey:", v49, v47);
        goto LABEL_46;
      }
      objc_msgSend(v122, "actionType");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "isEqualToString:", v105);

      if (v63)
      {
        objc_msgSend(v48, "minimumValue");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (v64)
        {
          -[HMDAssistantCommand updateValueToBoundary:valueType:fudgeMinimum:metadata:](val, "updateValueToBoundary:valueType:fudgeMinimum:metadata:", v64, v110, 1, v48);
          v49 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v43, "setObject:forKey:", v49, v47);
        }
        else
        {
          v49 = 0;
        }
        goto LABEL_46;
      }
LABEL_47:
      -[HMDAssistantCommand addActivationCharacteristicsIfNeeded:forCharacteristic:](val, "addActivationCharacteristicsIfNeeded:forCharacteristic:", v43, v47);

      ++v46;
    }
    while (v44 != v46);
    v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v155, 16);
    v44 = v65;
  }
  while (v65);
LABEL_54:

  v66 = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  v117 = v43;
  v67 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v142, v154, 16);
  if (v67)
  {
    v68 = *(_QWORD *)v143;
    while (2)
    {
      for (i = 0; i != v67; ++i)
      {
        if (*(_QWORD *)v143 != v68)
          objc_enumerationMutation(v117);
        v70 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * i);
        objc_msgSend(v70, "service");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "accessory");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "home");
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v117, "objectForKey:", v70);
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v70, "type");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v72) = objc_msgSend(v75, "isEqual:", CFSTR("000000B0-0000-1000-8000-0026BB765291"));

        if ((_DWORD)v72)
        {
          v76 = v74;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v77 = v76;
          else
            v77 = 0;
          v78 = v77;

          if (!v78)
          {
            v91 = (void *)MEMORY[0x227676638]();
            v92 = val;
            HMFGetOSLogHandle();
            v93 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v94 = (id)objc_claimAutoreleasedReturnValue();
              v95 = (void *)objc_opt_class();
              *(_DWORD *)location = 138543618;
              *(_QWORD *)&location[4] = v94;
              v152 = 2112;
              v153 = v95;
              v96 = v95;
              _os_log_impl(&dword_2218F0000, v93, OS_LOG_TYPE_ERROR, "%{public}@Unknown value type found. Expected integer but got %@", location, 0x16u);

            }
            objc_autoreleasePoolPop(v91);
            -[HMDAssistantCommand reportOutcome:results:handler:](v92, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v118);

            v90 = v117;
            goto LABEL_82;
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v76, "unsignedIntegerValue"));
          v119 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v119 = v74;
        }
        objc_msgSend(v114, "objectForKey:", v73);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v79)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "setObject:forKey:", v79, v73);
        }
        objc_msgSend(v70, "authorizationData");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v70, v119, v80, 1);
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v79, "addObject:", v81);
      }
      v67 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v142, v154, 16);
      if (v67)
        continue;
      break;
    }
  }

  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v82 = v114;
  v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v138, v150, 16);
  if (v83)
  {
    v84 = *(_QWORD *)v139;
    do
    {
      for (j = 0; j != v83; ++j)
      {
        if (*(_QWORD *)v139 != v84)
          objc_enumerationMutation(v82);
        v86 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * j);
        dispatch_group_enter(v66);
        objc_msgSend(v82, "objectForKey:", v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak((id *)location, val);
        -[HMDAssistantCommand assistantCommandHelper](val, "assistantCommandHelper");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v129[0] = MEMORY[0x24BDAC760];
        v129[1] = 3221225472;
        v129[2] = __85__HMDAssistantCommand_handleSetActionTypes_serviceType_forObjects_completionHandler___block_invoke;
        v129[3] = &unk_24E777C18;
        objc_copyWeak(&v137, (id *)location);
        v130 = v66;
        v135 = v118;
        v131 = v122;
        v132 = v121;
        v136 = buf;
        v133 = v120;
        v134 = v115;
        objc_msgSend(v88, "addWriteRequests:home:completion:", v87, v86, v129);

        objc_destroyWeak(&v137);
        objc_destroyWeak((id *)location);

      }
      v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v138, v150, 16);
    }
    while (v83);
  }

  -[HMDAssistantCommand queue](val, "queue");
  v89 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__HMDAssistantCommand_handleSetActionTypes_serviceType_forObjects_completionHandler___block_invoke_105;
  block[3] = &unk_24E797938;
  v125 = v115;
  v126 = val;
  v128 = buf;
  v127 = v118;
  dispatch_group_notify(v66, v89, block);

  v90 = v125;
  v76 = v119;
LABEL_82:

  _Block_object_dispose(buf, 8);
LABEL_83:

LABEL_84:
LABEL_85:

LABEL_86:
}

- (id)updateValueToBoundary:(id)a3 valueType:(id)a4 fudgeMinimum:(BOOL)a5 metadata:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  double v26;
  void *v27;
  float v28;
  float v29;
  void *v30;
  float v31;
  float v32;
  void *v33;
  id v34;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = v9;
  v13 = v12;
  if (v11)
  {
    objc_opt_class();
    v13 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "maximumValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v12;
      if (v14)
      {
        objc_msgSend(v11, "maximumValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "compare:", v12);

        v13 = v12;
        if (v16 == -1)
        {
          objc_msgSend(v11, "maximumValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      objc_msgSend(v11, "minimumValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        if (v7
          && (objc_msgSend(v11, "stepValue"), v18 = (void *)objc_claimAutoreleasedReturnValue(), v18, v18))
        {
          v19 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDD56F0]);
          objc_msgSend(v11, "minimumValue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v19)
          {
            v22 = objc_msgSend(v20, "intValue");
            objc_msgSend(v11, "stepValue");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "intValue") + v22;

            v25 = (void *)MEMORY[0x24BDD16E0];
            *(float *)&v26 = (float)v24;
          }
          else
          {
            objc_msgSend(v20, "floatValue");
            v29 = v28;
            objc_msgSend(v11, "stepValue");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "floatValue");
            v32 = v29 + v31;

            v25 = (void *)MEMORY[0x24BDD16E0];
            *(float *)&v26 = v32;
          }
          objc_msgSend(v25, "numberWithFloat:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v11, "minimumValue");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v33 = v27;
        if (objc_msgSend(v27, "compare:", v12) == 1)
        {
          v34 = v33;

          v13 = v34;
        }

      }
    }
  }

  return v13;
}

- (id)updateValue:(id)a3 forAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  void *v26;
  char isKindOfClass;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  float v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  HMDAssistantCommand *v54;
  void *v55;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attribute");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mapCharacteristicValueType:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE81CA0]))
  {
    v13 = objc_msgSend(v8, "BOOLValue");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13 ^ 1u);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v54 = self;
  v55 = v9;
  v51 = v10;
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD56F0]))
    *(float *)&v15 = (float)(int)objc_msgSend(v8, "intValue");
  else
    objc_msgSend(v8, "floatValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "units");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attribute");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAssistantCommand adjustGetValue:type:units:attribute:](v54, "adjustGetValue:type:units:attribute:", v16, v12, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v20;
  objc_msgSend(v20, "floatValue");
  v23 = v22;
  objc_msgSend(v7, "value");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 5.0;
  if (v24)
  {
    objc_msgSend(v7, "value");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(v7, "value");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    v30 = v55;
    if ((isKindOfClass & 1) != 0)
    {
      v25 = (float)objc_msgSend(v28, "value");
LABEL_12:

      goto LABEL_13;
    }
    objc_opt_class();
    v31 = objc_opt_isKindOfClass();

    if ((v31 & 1) != 0)
    {
      objc_msgSend(v7, "value");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "value");
      v25 = v32;
      goto LABEL_12;
    }
  }
  else
  {
    v30 = v55;
  }
LABEL_13:
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attribute");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "mapWriteCharacteristicFromAssistantName:", v34);
  v35 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "service");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "characteristics");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "hmf_firstObjectWithCharacteristicType:", v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v37)
  {
    objc_msgSend(v33, "getCharacteristicTypeAlias:", v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "characteristics");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "hmf_firstObjectWithCharacteristicType:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v55;
  }
  v52 = v6;
  v49 = (void *)v35;
  v50 = v33;
  if (objc_msgSend(v30, "isEqualToString:", *MEMORY[0x24BE81C80]))
  {
    *(float *)&v40 = v23 + v25;
  }
  else
  {
    v41 = objc_msgSend(v30, "isEqualToString:", *MEMORY[0x24BE81C50]);
    LODWORD(v40) = 0;
    if (v41)
      *(float *)&v40 = v25;
    *(float *)&v40 = v23 - *(float *)&v40;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v40);
  v42 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "value");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "units");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attribute");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAssistantCommand adjustSetValue:type:units:attribute:](v54, "adjustSetValue:type:units:attribute:", v42, v12, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "metadata");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAssistantCommand updateValueToBoundary:valueType:fudgeMinimum:metadata:](v54, "updateValueToBoundary:valueType:fudgeMinimum:metadata:", v46, v12, 1, v47);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)v42;
  v10 = v51;
  v6 = v52;
  v9 = v55;
LABEL_21:

  return v14;
}

- (void)handleUpdateActionTypes:(id)a3 serviceType:(id)a4 forObjects:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDAssistantCommand *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDAssistantCommand *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  HMDAssistantCommand *v34;
  NSObject *v35;
  void *v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void *v38;
  uint64_t v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t k;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  HMDAssistantCommand *v75;
  NSObject *v76;
  id v77;
  void *v78;
  char v79;
  void *v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  NSObject *group;
  id obj;
  id obja;
  id v95;
  id v96;
  int v97;
  void *v98;
  HMDAssistantCommand *val;
  id *to;
  uint64_t v101;
  void *j;
  void *v103;
  void *v104;
  id v105;
  id v106;
  _QWORD block[4];
  id v108;
  HMDAssistantCommand *v109;
  id v110;
  _BYTE *v111;
  _QWORD v112[4];
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  NSObject *v119;
  uint64_t v120;
  id v121;
  _BYTE *v122;
  id v123;
  char v124;
  char v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE location[12];
  __int16 v147;
  void *v148;
  _BYTE buf[24];
  uint64_t (*v150)(uint64_t, uint64_t);
  __int128 v151;
  _QWORD v152[4];

  v152[1] = *MEMORY[0x24BDAC8D0];
  v106 = a3;
  v105 = a4;
  v11 = a5;
  v88 = a6;
  v12 = objc_alloc(MEMORY[0x24BE3F138]);
  v13 = (void *)MEMORY[0x24BDD17C8];
  val = self;
  MEMORY[0x227675180](self, a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@, %s:%ld"), v14, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Assistant/HMDAssistantCommand.m", 2537);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = (void *)objc_msgSend(v12, "initWithName:", v15);

  objc_msgSend(v106, "attribute");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v106, "attribute");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "actionType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommand filteredObjectsFromObjects:byAttribute:forActionType:](self, "filteredObjectsFromObjects:byAttribute:forActionType:", v11, v17, v18);
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v98;
    if (objc_msgSend(v98, "count"))
    {
      +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "attribute");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "mapReadCharacteristicFromAssistantName:", v19);
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v85)
      {
        v25 = (void *)MEMORY[0x227676638]();
        v26 = self;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "attribute");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v28;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v29;
          _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot map actionAttribute(%@) to a characteristicType", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
        -[HMDAssistantCommand reportOutcome:results:handler:](v26, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v88);
        goto LABEL_82;
      }
      objc_msgSend(v86, "getAliasedCharacteristicTypes:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "count"))
      {
        objc_msgSend(v20, "arrayByAddingObject:", v85);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAssistantCommand filterObjects:forCharacteristicTypes:](self, "filterObjects:forCharacteristicTypes:", v98, v83);
      }
      else
      {
        v152[0] = v85;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v152, 1);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAssistantCommand filterObjects:forCharacteristicTypes:](self, "filterObjects:forCharacteristicTypes:", v98, v83);
      }
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v84, "count"))
      {
        -[HMDAssistantCommand returnResults:serviceType:forAction:completionHandler:](self, "returnResults:serviceType:forAction:completionHandler:", 0, v105, v106, v88);
LABEL_81:

LABEL_82:
        v11 = v98;
        goto LABEL_83;
      }
      objc_msgSend(v106, "attribute");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "mapCharacteristicValueType:", v30);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v106, "actionType");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "isEqualToString:", *MEMORY[0x24BE81CA0]))
      {
        v32 = objc_msgSend(v82, "isEqualToString:", *MEMORY[0x24BDD56E0]);

        if ((v32 & 1) == 0)
        {
          v33 = (void *)MEMORY[0x227676638]();
          v34 = self;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "actionType");
            v37 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = v36;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[HMDAssistantCommand handleUpdateActionTypes:serviceType:forObjects:completionHandler:]";
            *(_WORD *)&buf[22] = 2112;
            v150 = v37;
            LOWORD(v151) = 2112;
            *(_QWORD *)((char *)&v151 + 2) = v82;
            _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@%s ### Siri passed an incorrect action (%@) to a %@ value type.", buf, 0x2Au);

          }
LABEL_79:

          objc_autoreleasePoolPop(v33);
          -[HMDAssistantCommand reportOutcome:results:handler:](v34, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v88);
LABEL_80:

          goto LABEL_81;
        }
      }
      else
      {

      }
      objc_msgSend(v106, "actionType");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = *MEMORY[0x24BE81C50];
      if ((objc_msgSend(v38, "isEqualToString:", *MEMORY[0x24BE81C50]) & 1) != 0)
      {
        if ((objc_msgSend(v82, "isEqualToString:", *MEMORY[0x24BDD56F0]) & 1) == 0)
        {
          v40 = objc_msgSend(v82, "isEqualToString:", *MEMORY[0x24BDD56E8]);

          if ((v40 & 1) == 0)
          {
LABEL_77:
            v33 = (void *)MEMORY[0x227676638]();
            v34 = self;
            HMFGetOSLogHandle();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "actionType");
              v81 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)&buf[4] = v80;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "-[HMDAssistantCommand handleUpdateActionTypes:serviceType:forObjects:completionHandler:]";
              *(_WORD *)&buf[22] = 2112;
              v150 = v81;
              LOWORD(v151) = 2112;
              *(_QWORD *)((char *)&v151 + 2) = v82;
              _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@%s ### Siri passed an incorrect action (%@) to a %@ value type.", buf, 0x2Au);

            }
            goto LABEL_79;
          }
LABEL_30:
          group = dispatch_group_create();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v150 = __Block_byref_object_copy__18838;
          *(_QWORD *)&v151 = __Block_byref_object_dispose__18839;
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          *((_QWORD *)&v151 + 1) = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "attribute");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "mapWriteCharacteristicFromAssistantName:", v42);
          v104 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v106, "actionType");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = objc_msgSend(v43, "isEqualToString:", v39);

          if (v104)
          {
            objc_msgSend(v86, "getAliasedCharacteristicTypes:");
            v103 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
            v95 = (id)objc_claimAutoreleasedReturnValue();
            v97 = objc_msgSend(v106, "includeCompleteInformation");
            v140 = 0u;
            v141 = 0u;
            v138 = 0u;
            v139 = 0u;
            obj = v84;
            v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v138, v145, 16);
            if (v44)
            {
              to = *(id **)v139;
              v89 = *MEMORY[0x24BE81BF0];
              do
              {
                v101 = v44;
                for (i = 0; i != v101; ++i)
                {
                  if (*(id **)v139 != to)
                    objc_enumerationMutation(obj);
                  v46 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * i);
                  objc_msgSend(v46, "service");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "characteristics");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "hmf_firstObjectWithCharacteristicType:", v104);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();

                  v136 = 0u;
                  v137 = 0u;
                  v134 = 0u;
                  v135 = 0u;
                  v50 = v103;
                  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v134, v144, 16);
                  if (v51)
                  {
                    v52 = *(_QWORD *)v135;
LABEL_38:
                    v53 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v135 != v52)
                        objc_enumerationMutation(v50);
                      if (v49)
                        break;
                      v54 = *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * v53);
                      objc_msgSend(v47, "characteristics");
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v55, "hmf_firstObjectWithCharacteristicType:", v54);
                      v49 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v51 == ++v53)
                      {
                        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v134, v144, 16);
                        if (v51)
                          goto LABEL_38;
                        break;
                      }
                    }
                  }

                  if ((objc_msgSend(v49, "properties") & 4) != 0)
                  {
                    objc_msgSend(v47, "accessory");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v58, "home");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v95, "objectForKey:", v56);
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v59)
                    {
                      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v95, "setObject:forKey:", v59, v56);
                    }
                    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v46);
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v59, "addObject:", v60);

                  }
                  else
                  {
                    actionResultForAction(v106);
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v56, "setOutcome:", v89);
                    entityForService(v47, v105, v98, v97);
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v56, "setEntity:", v57);

                    -[HMDAssistantCommand populateResult:withService:serviceType:characteristic:resultAttribute:action:](val, "populateResult:withService:serviceType:characteristic:resultAttribute:action:", v56, v47, v105, v46, 0, v106);
                    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "addObject:", v56);
                  }

                }
                v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v138, v145, 16);
              }
              while (v44);
            }

            objc_initWeak((id *)location, val);
            v132 = 0u;
            v133 = 0u;
            v130 = 0u;
            v131 = 0u;
            v96 = v95;
            obja = (id)objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v130, v143, 16);
            if (obja)
            {
              v90 = *(_QWORD *)v131;
              do
              {
                for (j = 0; j != obja; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v131 != v90)
                    objc_enumerationMutation(v96);
                  v61 = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * (_QWORD)j);
                  dispatch_group_enter(group);
                  objc_msgSend(v96, "objectForKey:", v61);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v91)
                  {
                    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v62);
                    v128 = 0u;
                    v129 = 0u;
                    v126 = 0u;
                    v127 = 0u;
                    v64 = v62;
                    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v126, v142, 16);
                    if (v65)
                    {
                      v66 = *(_QWORD *)v127;
                      do
                      {
                        for (k = 0; k != v65; ++k)
                        {
                          if (*(_QWORD *)v127 != v66)
                            objc_enumerationMutation(v64);
                          objc_msgSend(*(id *)(*((_QWORD *)&v126 + 1) + 8 * k), "characteristic");
                          v68 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v68, "service");
                          v69 = (void *)objc_claimAutoreleasedReturnValue();
                          getActivationCharacteristicFromServiceIfAny(v69);
                          v70 = (void *)objc_claimAutoreleasedReturnValue();

                          +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v70);
                          v71 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v70 && (objc_msgSend(v63, "containsObject:", v71) & 1) == 0)
                            objc_msgSend(v63, "addObject:", v71);

                        }
                        v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v126, v142, 16);
                      }
                      while (v65);
                    }

                    v62 = (void *)objc_msgSend(v63, "copy");
                  }
                  else
                  {
                    v63 = 0;
                  }
                  -[HMDAssistantCommand assistantCommandHelper](val, "assistantCommandHelper");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  v112[0] = MEMORY[0x24BDAC760];
                  v112[1] = 3221225472;
                  v112[2] = __88__HMDAssistantCommand_handleUpdateActionTypes_serviceType_forObjects_completionHandler___block_invoke;
                  v112[3] = &unk_24E777CE0;
                  objc_copyWeak(&v123, (id *)location);
                  v113 = v87;
                  v124 = v91;
                  v114 = v106;
                  v115 = v105;
                  v116 = v98;
                  v122 = buf;
                  v125 = v97;
                  v117 = v104;
                  v118 = v103;
                  v121 = v88;
                  v119 = group;
                  v120 = v61;
                  objc_msgSend(v72, "addReadRequests:home:completion:", v62, v61, v112);

                  objc_destroyWeak(&v123);
                }
                obja = (id)objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v130, v143, 16);
              }
              while (obja);
            }

            -[HMDAssistantCommand queue](val, "queue");
            v73 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __88__HMDAssistantCommand_handleUpdateActionTypes_serviceType_forObjects_completionHandler___block_invoke_108;
            block[3] = &unk_24E797938;
            v108 = v87;
            v109 = val;
            v111 = buf;
            v110 = v88;
            dispatch_group_notify(group, v73, block);

            objc_destroyWeak((id *)location);
            v20 = v103;
          }
          else
          {
            v74 = (void *)MEMORY[0x227676638]();
            v75 = self;
            HMFGetOSLogHandle();
            v76 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v77 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "attribute");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)location = 138543618;
              *(_QWORD *)&location[4] = v77;
              v147 = 2112;
              v148 = v78;
              _os_log_impl(&dword_2218F0000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot map actionAttribute(%@) to a characteristicType", location, 0x16u);

            }
            objc_autoreleasePoolPop(v74);
            -[HMDAssistantCommand reportOutcome:results:handler:](v75, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v88);
          }

          _Block_object_dispose(buf, 8);
          goto LABEL_80;
        }
      }
      else
      {
        objc_msgSend(v106, "actionType");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v41, "isEqualToString:", *MEMORY[0x24BE81C80]) & 1) != 0
          && (objc_msgSend(v82, "isEqualToString:", *MEMORY[0x24BDD56F0]) & 1) == 0)
        {
          v79 = objc_msgSend(v82, "isEqualToString:", *MEMORY[0x24BDD56E8]);

          if ((v79 & 1) == 0)
            goto LABEL_77;
          goto LABEL_30;
        }

      }
      goto LABEL_30;
    }
    -[HMDAssistantCommand returnResults:serviceType:forAction:completionHandler:](self, "returnResults:serviceType:forAction:completionHandler:", 0, v105, v106, v88);
  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@In Update action types, There is no attribute in action - reporting as malformed command", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    -[HMDAssistantCommand reportOutcome:results:handler:](v22, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v88);
  }
LABEL_83:

}

- (void)_handleCommandForMediaAccessoryAction:(id)a3 objects:(id)a4 serviceType:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  HMDAssistantCommand *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "actionType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE81C58]);

  if (v15)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    goto LABEL_8;
  }
  objc_msgSend(v10, "actionType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BE81C88]);

  if (!v20)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "actionType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v21;
      v25 = 2080;
      v26 = "-[HMDAssistantCommand _handleCommandForMediaAccessoryAction:objects:serviceType:completionHandler:]";
      v27 = 2112;
      v28 = v22;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@%s ### Siri sent an unsupported action type: %@", (uint8_t *)&v23, 0x20u);

    }
LABEL_8:

    objc_autoreleasePoolPop(v16);
    -[HMDAssistantCommand reportOutcome:results:handler:](v17, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v13);
    goto LABEL_9;
  }
  -[HMDAssistantCommand handleMediaAccessorySetActionType:forObjects:withServiceType:completionHandler:](self, "handleMediaAccessorySetActionType:forObjects:withServiceType:completionHandler:", v10, v11, v12, v13);
LABEL_9:

}

- (void)_handleCommandForHAPAction:(id)a3 serviceType:(id)a4 objects:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  HMDAssistantCommand *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "actionType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE81C58]))
  {

LABEL_4:
    -[HMDAssistantCommand handleGetActionTypes:serviceType:forObjects:completionHandler:](self, "handleGetActionTypes:serviceType:forObjects:completionHandler:", v10, v11, v12, v13);
    goto LABEL_10;
  }
  objc_msgSend(v10, "actionType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BE81C78]);

  if (v16)
    goto LABEL_4;
  objc_msgSend(v10, "actionType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BE81C68]) & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v10, "actionType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BE81C60]))
  {

LABEL_8:
LABEL_9:
    -[HMDAssistantCommand handleGetMetadataActionTypes:serviceType:forObjects:completionHandler:](self, "handleGetMetadataActionTypes:serviceType:forObjects:completionHandler:", v10, v11, v12, v13);
    goto LABEL_10;
  }
  objc_msgSend(v10, "actionType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BE81C70]);

  if ((v20 & 1) != 0)
    goto LABEL_9;
  objc_msgSend(v10, "actionType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BE81C88]) & 1) != 0)
    goto LABEL_15;
  objc_msgSend(v10, "actionType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BE81C98]))
  {

LABEL_15:
LABEL_16:
    -[HMDAssistantCommand handleSetActionTypes:serviceType:forObjects:completionHandler:](self, "handleSetActionTypes:serviceType:forObjects:completionHandler:", v10, v11, v12, v13);
    goto LABEL_10;
  }
  objc_msgSend(v10, "actionType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqualToString:", *MEMORY[0x24BE81C90]);

  if ((v24 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(v10, "actionType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v25, "isEqualToString:", *MEMORY[0x24BE81C80]) & 1) != 0)
    goto LABEL_21;
  objc_msgSend(v10, "actionType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "isEqualToString:", *MEMORY[0x24BE81C50]))
  {

LABEL_21:
LABEL_22:
    -[HMDAssistantCommand handleUpdateActionTypes:serviceType:forObjects:completionHandler:](self, "handleUpdateActionTypes:serviceType:forObjects:completionHandler:", v10, v11, v12, v13);
    goto LABEL_10;
  }
  objc_msgSend(v10, "actionType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqualToString:", *MEMORY[0x24BE81CA0]);

  if ((v28 & 1) != 0)
    goto LABEL_22;
  v29 = (void *)MEMORY[0x227676638]();
  v30 = self;
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionType");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138543874;
    v35 = v32;
    v36 = 2080;
    v37 = "-[HMDAssistantCommand _handleCommandForHAPAction:serviceType:objects:completionHandler:]";
    v38 = 2112;
    v39 = v33;
    _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@%s ### Siri sent an unsupported action type: %@", (uint8_t *)&v34, 0x20u);

  }
  objc_autoreleasePoolPop(v29);
  -[HMDAssistantCommand reportOutcome:results:handler:](v30, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v13);
LABEL_10:

}

- (void)handleCommandWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMDAssistantCommand *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  BOOL v34;
  BOOL v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *i;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  HMDAssistantCommand *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  char isKindOfClass;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  HMDAssistantCommand *v61;
  NSObject *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  HMDAssistantCommand *v67;
  NSObject *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  NSObject *v74;
  void *v75;
  void *v76;
  HMDAssistantCommand *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  HMDAssistantCommand *v86;
  NSObject *v87;
  id v88;
  void *v89;
  void *v90;
  HMDAssistantCommand *v91;
  NSObject *v92;
  id v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  char v104;
  id v105;
  id v106;
  void *v107;
  HMDAssistantCommand *v108;
  NSObject *v109;
  void *v110;
  void *v111;
  void *v112;
  HMDAssistantCommand *v113;
  NSObject *v114;
  void *v115;
  void *v116;
  HMDAssistantCommand *v117;
  NSObject *v118;
  _BOOL4 v119;
  void *v120;
  void *v121;
  void *v122;
  id v123;
  id v124;
  void *v125;
  id v126;
  id v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  id v139;
  id v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  uint8_t v145[128];
  uint8_t buf[4];
  void *v147;
  __int16 v148;
  id v149;
  __int16 v150;
  void *v151;
  __int16 v152;
  void *v153;
  uint64_t v154;

  v154 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAssistantCommand actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  mach_absolute_time();
  v7 = -[HMDAssistantCommand setStartTime:](self, "setStartTime:", UpTicksToMilliseconds());
  v8 = (void *)MEMORY[0x227676638](v7);
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "aceId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommand serverValidity](v9, "serverValidity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommand hm_shortDescription](v9, "hm_shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v147 = v11;
    v148 = 2114;
    v149 = v12;
    v150 = 2114;
    v151 = v13;
    v152 = 2112;
    v153 = v14;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Executing Siri command(%{public}@) serverValidity %{public}@:\n%@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "actionType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[HMDAssistantCommand homeManager](v9, "homeManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommand filter](v9, "filter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    if (v19)
    {
      v20 = v16;
      objc_msgSend(v19, "serviceType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BE82050]);

      objc_msgSend(v6, "attribute");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", *MEMORY[0x24BE81D60]);

      if (v24)
      {
        objc_msgSend(v6, "actionType");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", *MEMORY[0x24BE81C88]);

        objc_msgSend(v19, "entityType");
        v27 = v19;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isEqualToString:", *MEMORY[0x24BE81F48]);

        objc_msgSend(v27, "sceneName");
        v30 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "sceneType");
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v4;
        v33 = v30 | v31;
        v19 = v27;

        v34 = v33 == 0;
        v4 = v32;
        v35 = !v34;
        if (!v26 || !v29 || !v35)
        {
          v76 = (void *)MEMORY[0x227676638]();
          v77 = v9;
          HMFGetOSLogHandle();
          v78 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v129 = v76;
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "actionType");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "sceneName");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "sceneType");
            v82 = v6;
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v147 = v79;
            v148 = 2112;
            v149 = v80;
            v150 = 2112;
            v151 = v81;
            v152 = 2112;
            v153 = v83;
            _os_log_impl(&dword_2218F0000, v78, OS_LOG_TYPE_INFO, "%{public}@entityType is SCENE with ENABLED action attribute but either action(%@) is not SET action/empty sceneName(%@)/Type(%@)", buf, 0x2Au);

            v6 = v82;
            v4 = v32;

            v19 = v27;
            v76 = v129;
          }

          objc_autoreleasePoolPop(v76);
          -[HMDAssistantCommand reportOutcome:results:handler:](v77, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v4);
          v16 = v20;
          goto LABEL_85;
        }
      }
      objc_msgSend(v19, "homeIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36 || (objc_msgSend(v19, "homeName"), (v36 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

        v16 = v20;
      }
      else
      {
        objc_msgSend(v6, "actionType");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = objc_msgSend(v103, "isEqualToString:", *MEMORY[0x24BE81C58]);

        v16 = v20;
        if ((v104 & 1) == 0)
        {
          v105 = v4;
          v106 = v19;
          v107 = (void *)MEMORY[0x227676638]();
          v108 = v9;
          HMFGetOSLogHandle();
          v109 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v109, OS_LOG_TYPE_FAULT))
          {
            HMFGetLogIdentifier();
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v147 = v110;
            _os_log_impl(&dword_2218F0000, v109, OS_LOG_TYPE_FAULT, "%{public}@Search filter must specify homeName or homeIdentifier for actions not of type GET", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v107);
          v19 = v106;
          v4 = v105;
        }
      }
      -[HMDAssistantCommand _homeWithSearchFilter:](v9, "_homeWithSearchFilter:", v19);
      v37 = objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        v38 = (void *)v37;
        v140 = 0;
        -[HMDAssistantCommand objectsWithSearchFilter:inHome:serviceTypeIsATV:overrideServiceTypeIfNeeded:](v9, "objectsWithSearchFilter:inHome:serviceTypeIsATV:overrideServiceTypeIfNeeded:", v19, v37, v22, &v140);
        v39 = (id)objc_claimAutoreleasedReturnValue();
        v40 = v140;
LABEL_20:

        if (objc_msgSend(v39, "count"))
        {
          v41 = v4;
          v133 = v6;
          -[HMDAssistantCommand home](v9, "home");
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v42)
          {
            v124 = v40;
            objc_msgSend(v39, "firstObject");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v125, "hmf_stringForKey:", CFSTR("objectHomeIdentifier"));
            v43 = (id)objc_claimAutoreleasedReturnValue();
            v141 = 0u;
            v142 = 0u;
            v143 = 0u;
            v144 = 0u;
            objc_msgSend(v16, "homes");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = (id)objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v141, buf, 16);
            if (v45)
            {
              v123 = v39;
              v128 = v19;
              v131 = v16;
              v126 = v41;
              v46 = *(_QWORD *)v142;
              while (2)
              {
                for (i = 0; i != v45; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v142 != v46)
                    objc_enumerationMutation(v44);
                  v48 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * (_QWORD)i);
                  objc_msgSend(v48, "urlString");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = objc_msgSend(v43, "isEqualToString:", v49);

                  if ((v50 & 1) != 0)
                  {
                    v45 = v48;
                    goto LABEL_70;
                  }
                }
                v45 = (id)objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v141, buf, 16);
                if (v45)
                  continue;
                break;
              }
LABEL_70:
              v41 = v126;
              v19 = v128;
              v16 = v131;
              v39 = v123;
            }

            -[HMDAssistantCommand setHome:](v9, "setHome:", v45);
            -[HMDAssistantCommand home](v9, "home");
            v111 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v111)
            {
              v112 = (void *)MEMORY[0x227676638]();
              v113 = v9;
              HMFGetOSLogHandle();
              v114 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v130 = v112;
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v147 = v115;
                v148 = 2112;
                v149 = v125;
                _os_log_impl(&dword_2218F0000, v114, OS_LOG_TYPE_ERROR, "%{public}@Cannot evaluate home for Siri command with filtered result: %@", buf, 0x16u);

                v112 = v130;
              }

              objc_autoreleasePoolPop(v112);
            }

            v40 = v124;
          }
          v116 = (void *)MEMORY[0x227676638]();
          v117 = v9;
          HMFGetOSLogHandle();
          v118 = objc_claimAutoreleasedReturnValue();
          v119 = os_log_type_enabled(v118, OS_LOG_TYPE_INFO);
          if ((_DWORD)v22)
          {
            if (v119)
            {
              HMFGetLogIdentifier();
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v147 = v120;
              _os_log_impl(&dword_2218F0000, v118, OS_LOG_TYPE_INFO, "%{public}@Start handling command for Apple Media Accessory", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v116);
            objc_msgSend(v19, "serviceType");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = v133;
            -[HMDAssistantCommand _handleCommandForMediaAccessoryAction:objects:serviceType:completionHandler:](v117, "_handleCommandForMediaAccessoryAction:objects:serviceType:completionHandler:", v133, v39, v121, v41);

            v4 = v41;
          }
          else
          {
            if (v119)
            {
              HMFGetLogIdentifier();
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v147 = v122;
              _os_log_impl(&dword_2218F0000, v118, OS_LOG_TYPE_INFO, "%{public}@Start handling command for HAP Characteristic", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v116);
            v6 = v133;
            v4 = v41;
            -[HMDAssistantCommand _handleCommandForHAPAction:serviceType:objects:completionHandler:](v117, "_handleCommandForHAPAction:serviceType:objects:completionHandler:", v133, v40, v39, v41);
          }

        }
        else
        {
          v84 = v40;
          v85 = (void *)MEMORY[0x227676638]();
          v86 = v9;
          HMFGetOSLogHandle();
          v87 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v88 = v4;
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v147 = v89;
            _os_log_impl(&dword_2218F0000, v87, OS_LOG_TYPE_INFO, "%{public}@No matches found after filtering, bailing out", buf, 0xCu);

            v4 = v88;
          }

          objc_autoreleasePoolPop(v85);
          -[HMDAssistantCommand returnResults:serviceType:forAction:completionHandler:](v86, "returnResults:serviceType:forAction:completionHandler:", 0, v84, v6, v4);

        }
        goto LABEL_85;
      }
      v66 = (void *)MEMORY[0x227676638]();
      v67 = v9;
      HMFGetOSLogHandle();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v147 = v75;
        _os_log_impl(&dword_2218F0000, v74, OS_LOG_TYPE_INFO, "%{public}@Could not figure out the home to apply the command to", buf, 0xCu);

      }
    }
    else
    {
      -[HMDAssistantCommand filter](v9, "filter");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[HMDAssistantCommand filter](v9, "filter");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "identifiers");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v139 = 0;
        -[HMDAssistantCommand objectsWithIdentifierList:error:](v9, "objectsWithIdentifierList:error:", v57, &v139);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v139;

        v132 = v16;
        if (!v59)
        {
          if (!objc_msgSend(v58, "count"))
          {
            v90 = (void *)MEMORY[0x227676638]();
            v91 = v9;
            HMFGetOSLogHandle();
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v93 = v4;
              v94 = v6;
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v147 = v95;
              _os_log_impl(&dword_2218F0000, v92, OS_LOG_TYPE_INFO, "%{public}@Identifier list filter results in no matches - re-generating sync data and requesting re-sync", buf, 0xCu);

              v6 = v94;
              v4 = v93;
            }

            objc_autoreleasePoolPop(v90);
            objc_msgSend(v16, "assistantSyncDataChanged:", CFSTR("HMDIdentifierListFilterNoMatches"));
          }
          v134 = v6;
          v137 = 0u;
          v138 = 0u;
          v135 = 0u;
          v136 = 0u;
          v39 = v58;
          v96 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v135, v145, 16);
          if (v96)
          {
            v97 = v96;
            v98 = v39;
            v127 = v4;
            v99 = *(_QWORD *)v136;
            v100 = *MEMORY[0x24BE82050];
LABEL_58:
            v101 = 0;
            while (1)
            {
              if (*(_QWORD *)v136 != v99)
                objc_enumerationMutation(v98);
              objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * v101), "objectForKeyedSubscript:", CFSTR("objectServiceType"));
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v22) = objc_msgSend(v102, "isEqualToString:", v100);

              if ((v22 & 1) != 0)
                break;
              if (v97 == ++v101)
              {
                v97 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v135, v145, 16);
                if (v97)
                  goto LABEL_58;
                break;
              }
            }
            v39 = v98;

            v40 = 0;
            v4 = v127;
          }
          else
          {

            LODWORD(v22) = 0;
            v40 = 0;
          }
          v16 = v132;
          v6 = v134;
          v19 = 0;
          goto LABEL_20;
        }
        v60 = (void *)MEMORY[0x227676638]();
        v61 = v9;
        HMFGetOSLogHandle();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v63 = v4;
          v64 = v6;
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v147 = v65;
          v148 = 2114;
          v149 = v59;
          _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_INFO, "%{public}@Identifier list filter resolution failed with error %{public}@", buf, 0x16u);

          v6 = v64;
          v4 = v63;
        }

        objc_autoreleasePoolPop(v60);
        -[HMDAssistantCommand reportOutcome:results:handler:](v61, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v4);

        v19 = 0;
LABEL_85:

        goto LABEL_86;
      }
      v66 = (void *)MEMORY[0x227676638]();
      v67 = v9;
      HMFGetOSLogHandle();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v69 = v4;
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAssistantCommand filter](v67, "filter");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v147 = v70;
        v148 = 2112;
        v149 = v72;
        v73 = v72;
        _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_INFO, "%{public}@Unsupported filter type - %@", buf, 0x16u);

        v19 = 0;
        v4 = v69;
      }

    }
    objc_autoreleasePoolPop(v66);
    -[HMDAssistantCommand reportOutcome:results:handler:](v67, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v4);
    goto LABEL_85;
  }
  v51 = (void *)MEMORY[0x227676638]();
  v52 = v9;
  HMFGetOSLogHandle();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v147 = v54;
    _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_INFO, "%{public}@There is no actionType, reporting malformed command", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v51);
  -[HMDAssistantCommand reportOutcome:results:handler:](v52, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v4);
LABEL_86:

}

- (id)parseColorEncoding:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  HMDAssistantCommand *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  const char *v39;
  uint32_t v40;
  void *v41;
  void *v42;
  HMDAssistantCommand *v43;
  NSObject *v44;
  _BOOL4 v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  HMDAssistantCommand *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  HMDAssistantCommand *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  HMDAssistantCommand *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  HMDAssistantCommand *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v74;
  void *v75;
  uint64_t v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  void *v86;
  HMDAssistantCommand *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  id v103;
  __int16 v104;
  uint64_t v105;
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)*MEMORY[0x24BE81C58];
  objc_msgSend(v4, "actionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v5;
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {

  }
  else
  {
    v7 = (void *)*MEMORY[0x24BE81C88];
    objc_msgSend(v4, "actionType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v7 & 1) == 0)
    {
      v59 = (void *)MEMORY[0x227676638]();
      v60 = self;
      HMFGetOSLogHandle();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "actionType");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v99 = v62;
        v100 = 2112;
        v101 = v66;
        _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@Action type for COLOR attribute is not GET/SET - %@", buf, 0x16u);

        goto LABEL_68;
      }
LABEL_69:

      objc_autoreleasePoolPop(v59);
      v67 = 0;
      goto LABEL_76;
    }
  }
  objc_msgSend(v4, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v59 = (void *)MEMORY[0x227676638]();
    v60 = self;
    HMFGetOSLogHandle();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "value");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "value");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v99 = v62;
      v100 = 2112;
      v101 = v63;
      v102 = 2112;
      v103 = (id)objc_opt_class();
      v65 = v103;
      _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@Value %@ for COLOR attribute is not string but %@", buf, 0x20u);

LABEL_68:
      goto LABEL_69;
    }
    goto LABEL_69;
  }
  objc_msgSend(v4, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v74 = v12;
  objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(";"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
  if (!v14)
    goto LABEL_74;
  v15 = v14;
  v16 = (id *)&unk_255764000;
  v88 = (void *)*MEMORY[0x24BDD56E8];
  v82 = (void *)*MEMORY[0x24BDD56F0];
  v83 = *(_QWORD *)v95;
  v79 = (void *)*MEMORY[0x24BDD56E0];
  v87 = self;
  v77 = v4;
  v75 = v13;
LABEL_7:
  v17 = 0;
  v76 = v15;
LABEL_8:
  if (*(_QWORD *)v95 != v83)
    objc_enumerationMutation(v13);
  v18 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v17);
  if (!objc_msgSend(v18, "length"))
    goto LABEL_61;
  v85 = v17;
  objc_msgSend(v18, "componentsSeparatedByString:", CFSTR(":"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count") == 2)
  {
    objc_msgSend(v19, "firstObject");
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16[326], "allKeys");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = (void *)v20;
    if ((objc_msgSend(v86, "containsObject:", v20) & 1) == 0)
    {
      v49 = (void *)MEMORY[0x227676638]();
      v50 = self;
      HMFGetOSLogHandle();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v99 = v52;
        v100 = 2112;
        v101 = v90;
        v102 = 2112;
        v103 = v86;
        _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_INFO, "%{public}@Unsupported color space: %@; only support %@. Ignoring...",
          buf,
          0x20u);

      }
      objc_autoreleasePoolPop(v49);
      v16 = (id *)&unk_255764000;
      goto LABEL_60;
    }
    objc_msgSend(v16[326], "objectForKey:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndex:", 1);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "componentsSeparatedByString:", CFSTR(","));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");
    v92 = v21;
    v91 = v22;
    if (v23 != objc_msgSend(v21, "count"))
    {
      v53 = (void *)MEMORY[0x227676638]();
      v54 = self;
      HMFGetOSLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (void *)objc_msgSend(v92, "count");
        v58 = objc_msgSend(v91, "count");
        *(_DWORD *)buf = 138544130;
        v99 = v56;
        v100 = 2112;
        v101 = v90;
        v102 = 2048;
        v103 = v57;
        v104 = 2048;
        v105 = v58;
        _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_INFO, "%{public}@Color space %@ requires %tu values - %tu provided. Ignoring...", buf, 0x2Au);

        v22 = v91;
      }

      objc_autoreleasePoolPop(v53);
      v16 = (id *)&unk_255764000;
      goto LABEL_59;
    }
    if (!objc_msgSend(v22, "count"))
      goto LABEL_73;
    v78 = v19;
    v24 = 0;
    v25 = 0;
    while (1)
    {
      v26 = (void *)MEMORY[0x24BDD17A8];
      objc_msgSend(v22, "objectAtIndex:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "scannerWithString:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v92, "objectAtIndex:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "format");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "actionType");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v27) = objc_msgSend(v89, "isEqualToString:", v31);

      if ((_DWORD)v27)
        objc_msgSend(v29, "readCharacteristicType");
      else
        objc_msgSend(v29, "writeCharacteristicType");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        if (objc_msgSend(v30, "isEqualToString:", v88))
        {
          v93 = 0.0;
          if (objc_msgSend(v28, "scanDouble:", &v93))
          {
            v84 = v24;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v93);
            v33 = objc_claimAutoreleasedReturnValue();
            goto LABEL_33;
          }
          v34 = (void *)MEMORY[0x227676638]();
          v35 = self;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v99 = v37;
            v100 = 2112;
            v101 = v90;
            v102 = 2112;
            v103 = v32;
            v104 = 2112;
            v105 = (uint64_t)v88;
            v38 = v36;
            v39 = "%{public}@Color space %@ value for attribute %@ is not of format '%@'. Ignoring...";
            goto LABEL_46;
          }
        }
        else if (objc_msgSend(v30, "isEqualToString:", v82))
        {
          v93 = 0.0;
          if (objc_msgSend(v28, "scanLongLong:", &v93))
          {
            v84 = v24;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)&v93);
            v33 = objc_claimAutoreleasedReturnValue();
            goto LABEL_33;
          }
          v34 = (void *)MEMORY[0x227676638]();
          v35 = self;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v99 = v37;
            v100 = 2112;
            v101 = v90;
            v102 = 2112;
            v103 = v32;
            v104 = 2112;
            v105 = (uint64_t)v82;
            v38 = v36;
            v39 = "%{public}@Color space %@ value for attribute %@ is not of format '%@'. Ignoring...";
            goto LABEL_46;
          }
        }
        else if (objc_msgSend(v30, "isEqualToString:", v79))
        {
          LODWORD(v93) = 0;
          if (objc_msgSend(v28, "scanInt:", &v93))
          {
            v84 = v24;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", LODWORD(v93) != 0);
            v33 = objc_claimAutoreleasedReturnValue();
LABEL_33:
            v41 = (void *)v33;
            v42 = (void *)MEMORY[0x227676638]();
            v43 = self;
            HMFGetOSLogHandle();
            v44 = objc_claimAutoreleasedReturnValue();
            v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);
            if (v41)
            {
              if (v45)
              {
                HMFGetLogIdentifier();
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v99 = v46;
                v100 = 2112;
                v101 = v90;
                v102 = 2112;
                v103 = v32;
                v104 = 2112;
                v105 = (uint64_t)v41;
                _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@Color space %@:  %@=%@", buf, 0x2Au);

                v4 = v77;
              }

              objc_autoreleasePoolPop(v42);
              objc_msgSend(v80, "setObject:forKey:", v41, v32);

              v47 = 1;
              self = v87;
              v24 = v84;
            }
            else
            {
              if (v45)
              {
                HMFGetLogIdentifier();
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v99 = v48;
                v100 = 2112;
                v101 = v90;
                v102 = 2112;
                v103 = v32;
                _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@Color space %@ characteristicType %@ value is nil", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v42);
              v47 = 0;
              v24 = 1;
              self = v87;
            }
            goto LABEL_49;
          }
          v34 = (void *)MEMORY[0x227676638]();
          v35 = self;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v99 = v37;
            v100 = 2112;
            v101 = v90;
            v102 = 2112;
            v103 = v32;
            v104 = 2112;
            v105 = (uint64_t)v79;
            v38 = v36;
            v39 = "%{public}@Color space %@ value for attribute %@ is not of format '%@'. Ignoring...";
LABEL_46:
            v40 = 42;
LABEL_47:
            _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, v39, buf, v40);

            self = v87;
          }
        }
        else
        {
          v34 = (void *)MEMORY[0x227676638]();
          v35 = self;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v99 = v37;
            v100 = 2112;
            v101 = v90;
            v102 = 2112;
            v103 = v32;
            v104 = 2112;
            v105 = (uint64_t)v30;
            v38 = v36;
            v39 = "%{public}@Color space %@ value for attribute %@ is not of a recognized format: %@. Ignoring...";
            goto LABEL_46;
          }
        }
      }
      else
      {
        v34 = (void *)MEMORY[0x227676638]();
        v35 = self;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v99 = v37;
          v100 = 2112;
          v101 = v90;
          v102 = 2112;
          v103 = v4;
          v38 = v36;
          v39 = "%{public}@Color space %@ characteristicType is nil for action %@.";
          v40 = 32;
          goto LABEL_47;
        }
      }

      objc_autoreleasePoolPop(v34);
      v47 = 0;
      v24 = 1;
LABEL_49:

      v22 = v91;
      if ((v47 & 1) != 0 && ++v25 < (unint64_t)objc_msgSend(v91, "count"))
        continue;
      v13 = v75;
      v15 = v76;
      v19 = v78;
      v16 = (id *)&unk_255764000;
      if ((v24 & 1) == 0)
      {
LABEL_73:

        goto LABEL_74;
      }
LABEL_59:

LABEL_60:
      v17 = v85;
LABEL_61:
      if (++v17 == v15)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
        if (!v15)
        {
LABEL_74:

          v72 = v80;
          v67 = v80;
          goto LABEL_75;
        }
        goto LABEL_7;
      }
      goto LABEL_8;
    }
  }
  v68 = (void *)MEMORY[0x227676638]();
  v69 = self;
  HMFGetOSLogHandle();
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v99 = v71;
    v100 = 2112;
    v101 = v19;
    _os_log_impl(&dword_2218F0000, v70, OS_LOG_TYPE_ERROR, "%{public}@Color space encoding does not have two components: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v68);

  v67 = 0;
  v72 = v80;
LABEL_75:

LABEL_76:
  return v67;
}

- (BOOL)populateColorResult:(id)a3 serviceType:(id)a4 service:(id)a5 action:(id)a6 responses:(id)a7 forObjects:(id)a8
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  id v34;
  void *v35;
  void *v36;
  int v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  BOOL v45;
  void *v46;
  void *v47;
  void *v48;
  id v51;
  id v52;
  id v53;
  id obj;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v53 = a4;
  v52 = a5;
  v14 = a6;
  v64 = a7;
  v51 = a8;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attribute");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v13;
  objc_msgSend(v13, "setResultAttribute:", v16);

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  objc_msgSend((id)supportedColorSpaces, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v59 = v15;
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
  if (v56)
  {
    v55 = *(_QWORD *)v77;
    v63 = *MEMORY[0x24BE81C58];
    v61 = v14;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v77 != v55)
          objc_enumerationMutation(obj);
        v57 = v17;
        v58 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v17);
        objc_msgSend((id)supportedColorSpaces, "objectForKeyedSubscript:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v19 = v18;
        v66 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
        if (v66)
        {
          v65 = *(_QWORD *)v73;
          v62 = v19;
          do
          {
            for (i = 0; i != v66; ++i)
            {
              if (*(_QWORD *)v73 != v65)
                objc_enumerationMutation(v19);
              v21 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
              objc_msgSend(v14, "actionType");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "isEqualToString:", v63);

              if (v23)
                objc_msgSend(v21, "readCharacteristicType");
              else
                objc_msgSend(v21, "writeCharacteristicType");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = 0u;
              v71 = 0u;
              v68 = 0u;
              v69 = 0u;
              v25 = v64;
              v26 = (void *)objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
              if (v26)
              {
                v67 = i;
                v27 = *(_QWORD *)v69;
                while (2)
                {
                  for (j = 0; j != v26; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v69 != v27)
                      objc_enumerationMutation(v25);
                    v29 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)j);
                    objc_msgSend(v29, "request");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "characteristic");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "characteristicType");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = objc_msgSend(v32, "isEqualToString:", v24);

                    if ((v33 & 1) != 0)
                    {
                      v34 = v29;
                      objc_msgSend(v34, "request");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v35, "characteristic");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v26)
                      {
                        objc_msgSend(v60, "outcome");
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        v37 = isOutcomeSuccess(v36);

                        v14 = v61;
                        if (v37)
                        {
                          objc_msgSend(v25, "removeObject:", v34);
                          v19 = v62;
                          if (objc_msgSend(v59, "length"))
                            objc_msgSend(v59, "appendString:", CFSTR(","));
                          else
                            objc_msgSend(v59, "appendFormat:", CFSTR("%@%@"), v58, CFSTR(":"));
                          objc_msgSend(v26, "value");
                          v25 = (id)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v59, "appendFormat:", CFSTR("%@"), v25);
                          goto LABEL_32;
                        }
                      }
                      else
                      {
                        v14 = v61;
                      }
                      v19 = v62;
                      i = v67;
                      goto LABEL_34;
                    }
                  }
                  v26 = (void *)objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
                  if (v26)
                    continue;
                  break;
                }
                v34 = 0;
                v14 = v61;
                v19 = v62;
LABEL_32:
                i = v67;
              }
              else
              {
                v34 = 0;
              }

LABEL_34:
            }
            v66 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
          }
          while (v66);
        }

        v15 = v59;
        if (objc_msgSend(v59, "length"))
        {
          objc_msgSend(v59, "appendString:", CFSTR(";"));

          goto LABEL_41;
        }

        v17 = v57 + 1;
      }
      while (v57 + 1 != v56);
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
      if (v56)
        continue;
      break;
    }
  }
LABEL_41:

  if (objc_msgSend(v15, "length"))
  {
    v38 = objc_alloc_init(MEMORY[0x24BE812F0]);
    objc_msgSend(v38, "setValue:", v15);
    objc_msgSend(v60, "setResultValue:", v38);
    objc_msgSend(v14, "value");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      v40 = (void *)v39;
      objc_msgSend(v14, "actionType");
      v41 = objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        v42 = (void *)v41;
        objc_msgSend(v14, "actionType");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "isEqualToString:", *MEMORY[0x24BE81C58]);

        if (!v44)
          goto LABEL_45;
      }
      else
      {

      }
      objc_msgSend(v14, "value");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "resultValue");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[HMDAssistantCommand isAttributeValue:equalTo:](self, "isAttributeValue:equalTo:", v46, v47);

      goto LABEL_49;
    }
LABEL_45:
    v45 = 1;
LABEL_49:

    goto LABEL_50;
  }
  v45 = 1;
LABEL_50:
  entityForService(v52, v53, v51, objc_msgSend(v14, "includeCompleteInformation"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setEntity:", v48);

  return v45;
}

- (id)handleReadWriteResponses:(id)a3 error:(id)a4 forAction:(id)a5 inServiceType:(id)a6 results:(id)a7 forObjects:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  HMDAssistantCommand *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  int v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  uint64_t v59;
  void *v60;
  id v62;
  id v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  HMDAssistantCommand *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  uint64_t v77;
  void *v78;
  id obj;
  id obja;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint8_t v102[128];
  uint8_t buf[4];
  void *v104;
  __int16 v105;
  uint64_t v106;
  __int16 v107;
  void *v108;
  __int16 v109;
  void *v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  void *v114;
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v85 = a6;
  v17 = a7;
  v18 = a8;
  v19 = objc_msgSend(v15, "code");
  v20 = 82;
  if (unlockErrorCode)
    v20 = 2003;
  if (v19 == v20)
  {
    v21 = 0;
  }
  else
  {
    v62 = v15;
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v63 = v14;
    obj = v14;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v117, 16);
    if (v22)
    {
      v23 = v22;
      v81 = *(_QWORD *)v99;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v99 != v81)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
          objc_msgSend(v25, "request");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "characteristic");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "service");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v83, "objectForKey:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v29)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "setObject:forKey:", v29, v28);
          }
          objc_msgSend(v29, "addObject:", v25);

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v117, 16);
      }
      while (v23);
    }

    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v75 = v83;
    v74 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v94, v116, 16);
    if (v74)
    {
      v78 = 0;
      v73 = *(_QWORD *)v95;
      v82 = *MEMORY[0x24BE81C30];
      v72 = *MEMORY[0x24BE81D28];
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v95 != v73)
            objc_enumerationMutation(v75);
          v76 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v30);
          v77 = v30;
          objc_msgSend(v75, "objectForKey:");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(v31, "mutableCopy");

          actionResultForAction(v16);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = 0u;
          v91 = 0u;
          v92 = 0u;
          v93 = 0u;
          v33 = v32;
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v90, v115, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v91;
            v37 = v78;
            obja = v33;
            while (2)
            {
              for (j = 0; j != v35; ++j)
              {
                if (*(_QWORD *)v91 != v36)
                  objc_enumerationMutation(obja);
                v39 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * j);
                objc_msgSend(v39, "error");
                v40 = (void *)objc_claimAutoreleasedReturnValue();

                if (v40)
                {
                  v41 = (void *)MEMORY[0x227676638]();
                  v42 = self;
                  HMFGetOSLogHandle();
                  v43 = objc_claimAutoreleasedReturnValue();
                  v78 = v40;
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v70 = v41;
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    v65 = objc_msgSend(v40, "code");
                    objc_msgSend(v76, "accessory");
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v69, "name");
                    v68 = v42;
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v76, "accessory");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v67, "uuid");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v66, "UUIDString");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v76, "instanceID");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "request");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "characteristic");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "instanceID");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544642;
                    v104 = v71;
                    v105 = 2048;
                    v106 = v65;
                    v107 = 2112;
                    v108 = v44;
                    v109 = 2112;
                    v110 = v45;
                    v111 = 2112;
                    v112 = v46;
                    v113 = 2112;
                    v114 = v48;
                    _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@Error %tu for %@/%@/%@/%@", buf, 0x3Eu);

                    v42 = v68;
                    v40 = v78;

                    v41 = v70;
                  }

                  objc_autoreleasePoolPop(v41);
                  v49 = objc_msgSend(v40, "code");
                  v50 = 82;
                  if (unlockErrorCode)
                    v50 = 2003;
                  v33 = obja;
                  if (v49 != v50)
                  {
                    -[HMDAssistantCommand actionOutcomeFromError:](v42, "actionOutcomeFromError:", v40);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v84, "setOutcome:", v51);

                  }
                  goto LABEL_34;
                }
                objc_msgSend(v84, "setOutcome:", v82);
                v37 = 0;
              }
              v33 = obja;
              v35 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v90, v115, 16);
              v37 = 0;
              v78 = 0;
              if (v35)
                continue;
              break;
            }
          }
LABEL_34:

          objc_msgSend(v16, "attribute");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "isEqual:", v72);

          if (v53)
          {
            -[HMDAssistantCommand populateColorResult:serviceType:service:action:responses:forObjects:](self, "populateColorResult:serviceType:service:action:responses:forObjects:", v84, v85, v76, v16, v33, v18);
            objc_msgSend(v17, "addObject:", v84);
          }
          v88 = 0u;
          v89 = 0u;
          v86 = 0u;
          v87 = 0u;
          v54 = v33;
          v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v86, v102, 16);
          if (v55)
          {
            v56 = v55;
            v57 = *(_QWORD *)v87;
            do
            {
              for (k = 0; k != v56; ++k)
              {
                if (*(_QWORD *)v87 != v57)
                  objc_enumerationMutation(v54);
                v59 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * k);
                actionResultForAction(v16);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMDAssistantCommand populateResult:fromResponse:responses:forAction:serviceType:forObjects:](self, "populateResult:fromResponse:responses:forAction:serviceType:forObjects:", v60, v59, v54, v16, v85, v18);
                objc_msgSend(v17, "addObject:", v60);

              }
              v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v86, v102, 16);
            }
            while (v56);
          }

          v30 = v77 + 1;
        }
        while (v77 + 1 != v74);
        v74 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v94, v116, 16);
      }
      while (v74);
    }
    else
    {
      v78 = 0;
    }

    v15 = v62;
    v14 = v63;
    v21 = v78;
  }

  return v21;
}

- (void)handleMediaReadWriteResponse:(id)a3 forAction:(id)a4 inServiceType:(id)a5 inHome:(id)a6 requestProperty:(id)a7 results:(id)a8 forObjects:(id)a9
{
  id v14;
  id v15;
  __CFString *v16;
  id v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  char isKindOfClass;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v49 = a5;
  v48 = a6;
  v16 = (__CFString *)a7;
  v17 = a8;
  v47 = a9;
  if (!v16)
  {
    v16 = CFSTR("HMDMediaProfileSetValueUnsupportedAttributeKey");
    v18 = CFSTR("HMDMediaProfileSetValueUnsupportedAttributeKey");
  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v43 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
  if (v43)
  {
    v55 = 0;
    v41 = *(_QWORD *)v61;
    v45 = *MEMORY[0x24BE81C30];
    v46 = v17;
    v42 = v14;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v61 != v41)
          objc_enumerationMutation(v14);
        v44 = v19;
        v20 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v19);
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v21 = v20;
        v54 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
        if (v54)
        {
          v53 = *(_QWORD *)v57;
          v50 = v21;
          do
          {
            for (i = 0; i != v54; ++i)
            {
              if (*(_QWORD *)v57 != v53)
                objc_enumerationMutation(v21);
              v23 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
              objc_msgSend(v21, "objectForKeyedSubscript:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v25 = v24;
              else
                v25 = 0;
              v26 = v25;

              if (v26)
              {
                actionResultForAction(v15);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "objectForKeyedSubscript:", v16);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (v28)
                {
                  objc_opt_class();
                  isKindOfClass = objc_opt_isKindOfClass();
                  if ((isKindOfClass & 1) != 0)
                    v30 = v28;
                  else
                    v30 = 0;
                  v51 = v30;
                  if ((isKindOfClass & 1) != 0)
                  {
                    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v28, 0);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HMDAssistantCommand actionOutcomeFromError:](self, "actionOutcomeFromError:", v31);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "setOutcome:", v32);

                    v17 = v46;
                    -[HMDAssistantCommand getValueOfType:action:](self, "getValueOfType:action:", 0, v15);
                    v33 = objc_claimAutoreleasedReturnValue();

                    v34 = (id)v33;
                  }
                  else
                  {
                    v35 = v28;
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      v36 = v35;
                    else
                      v36 = 0;
                    v37 = v36;

                    objc_msgSend(v27, "setOutcome:", v45);
                    v34 = v37;
                  }
                }
                else
                {
                  v34 = v55;
                }
                v55 = v34;
                -[HMDAssistantCommand populateMediaProfileWriteResult:withValue:serviceType:action:](self, "populateMediaProfileWriteResult:withValue:serviceType:action:", v27);
                v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v23);
                objc_msgSend(v48, "mediaProfileWithUUID:", v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                entityForMediaProfile(v39, v47, objc_msgSend(v15, "includeCompleteInformation"));
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setEntity:", v40);

                objc_msgSend(v17, "addObject:", v27);
                v21 = v50;
              }

            }
            v54 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
          }
          while (v54);
        }

        v19 = v44 + 1;
        v14 = v42;
      }
      while (v44 + 1 != v43);
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    }
    while (v43);
  }
  else
  {
    v55 = 0;
  }

}

- (void)addIfNeededActivationCharacteristic:(id)a3 fromService:(id)a4 toCollection:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a4, "characteristics", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v15, "type");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", v7);

        if (v17)
        {
          objc_msgSend(v8, "objectForKey:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
            objc_msgSend(v8, "setObject:forKey:", MEMORY[0x24BDBD1C8], v15);
          goto LABEL_12;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_12:

}

- (void)addActivationCharacteristicsIfNeeded:(id)a3 forCharacteristic:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  id v13;
  char v14;
  char v15;
  id v16;

  v16 = a3;
  v6 = a4;
  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isActivationCharacteristicType(v7) & 1) == 0)
  {
    objc_msgSend(v6, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqual:", *MEMORY[0x24BDD6C00]))
    {
      v10 = v7;
      if ((objc_msgSend(v10, "isEqual:", *MEMORY[0x24BDD57A0]) & 1) == 0
        && (objc_msgSend(v10, "isEqual:", *MEMORY[0x24BDD58D0]) & 1) == 0
        && (objc_msgSend(v10, "isEqual:", *MEMORY[0x24BDD59A8]) & 1) == 0)
      {
        v11 = (_QWORD *)MEMORY[0x24BDD57F0];
LABEL_21:
        v14 = objc_msgSend(v10, "isEqual:", *v11);

        if ((v14 & 1) == 0)
          goto LABEL_18;
        v12 = (_QWORD *)MEMORY[0x24BDD5970];
LABEL_17:
        -[HMDAssistantCommand addIfNeededActivationCharacteristic:fromService:toCollection:](self, "addIfNeededActivationCharacteristic:fromService:toCollection:", *v12, v8, v16);
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      if (!objc_msgSend(v9, "isEqual:", *MEMORY[0x24BDD6BA8]))
      {
        if ((objc_msgSend(v9, "isEqual:", *MEMORY[0x24BDD6C90]) & 1) == 0
          && (objc_msgSend(v9, "isEqual:", *MEMORY[0x24BDD6B40]) & 1) == 0
          && !objc_msgSend(v9, "isEqual:", *MEMORY[0x24BDD6BC8]))
        {
          goto LABEL_18;
        }
        v13 = v7;
        if ((objc_msgSend(v13, "isEqual:", *MEMORY[0x24BDD5998]) & 1) == 0
          && (objc_msgSend(v13, "isEqual:", *MEMORY[0x24BDD59A0]) & 1) == 0)
        {
          v15 = objc_msgSend(v13, "isEqual:", *MEMORY[0x24BDD5A08]);

          if ((v15 & 1) == 0)
            goto LABEL_18;
          v12 = (_QWORD *)MEMORY[0x24BDD5770];
          goto LABEL_17;
        }
        v12 = (_QWORD *)MEMORY[0x24BDD5770];
        goto LABEL_16;
      }
      v10 = v7;
      if ((objc_msgSend(v10, "isEqual:", *MEMORY[0x24BDD5998]) & 1) == 0)
      {
        v11 = (_QWORD *)MEMORY[0x24BDD59A0];
        goto LABEL_21;
      }
    }
    v12 = (_QWORD *)MEMORY[0x24BDD5970];
LABEL_16:

    goto LABEL_17;
  }
LABEL_19:

}

- (void)addCharacteristicWithType:(id)a3 fromService:(id)a4 toCollection:(id)a5 assistantObjects:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v9 = a5;
  v10 = a6;
  objc_msgSend(v13, "findCharacteristicWithType:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if ((objc_msgSend(v9, "containsObject:", v11) & 1) == 0)
    {
      objc_msgSend(v9, "addObject:", v11);
      if (v10)
      {
        objc_msgSend(v13, "assistantObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && (objc_msgSend(v10, "containsObject:", v12) & 1) == 0)
          objc_msgSend(v10, "addObject:", v12);

      }
    }
  }

}

- (id)addCharacteristicsFromRelatedServicesFor:(id)a3 assistantObjects:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[HMDAssistantCommand addBridgedAccessoryCharacteristicsFor:toCollection:assistantObjects:](self, "addBridgedAccessoryCharacteristicsFor:toCollection:assistantObjects:", v14, v8, v7, (_QWORD)v17);
        -[HMDAssistantCommand addLinkedServiceCharacteristicsFor:toCollection:assistantObjects:](self, "addLinkedServiceCharacteristicsFor:toCollection:assistantObjects:", v14, v8, v7);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_msgSend(v8, "copy");
  return v15;
}

- (void)addBridgedAccessoryCharacteristicsFor:(id)a3 toCollection:(id)a4 assistantObjects:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id obj;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v42 = a4;
  v41 = a5;
  objc_msgSend(v8, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mapReadCharacteristicFromAssistantName:", *MEMORY[0x24BE81DC0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mapFromAssistantServiceName:", *MEMORY[0x24BE82158]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mapFromAssistantServiceName:", *MEMORY[0x24BE820C8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "type");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqual:", v11) & 1) != 0)
  {
    objc_msgSend(v9, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", v13);

    if (v16)
    {
      v31 = v13;
      v32 = v10;
      v33 = v9;
      v34 = v8;
      objc_msgSend(v8, "accessory");
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "identifiersForBridgedAccessories");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v38)
      {
        v36 = *(_QWORD *)v48;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v48 != v36)
              objc_enumerationMutation(obj);
            v40 = v17;
            v18 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v17);
            objc_msgSend(v37, "home");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "accessoryWithUUID:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v21 = v20;
            else
              v21 = 0;
            v22 = v21;

            v45 = 0u;
            v46 = 0u;
            v43 = 0u;
            v44 = 0u;
            v39 = v22;
            objc_msgSend(v22, "services");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v44;
              do
              {
                for (i = 0; i != v25; ++i)
                {
                  if (*(_QWORD *)v44 != v26)
                    objc_enumerationMutation(v23);
                  v28 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
                  objc_msgSend(v28, "type");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v29, "isEqual:", v12);

                  if (v30)
                    -[HMDAssistantCommand addCharacteristicWithType:fromService:toCollection:assistantObjects:](self, "addCharacteristicWithType:fromService:toCollection:assistantObjects:", v11, v28, v42, v41);
                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
              }
              while (v25);
            }

            v17 = v40 + 1;
          }
          while (v40 + 1 != v38);
          v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        }
        while (v38);
      }

      v9 = v33;
      v8 = v34;
      v13 = v31;
      v10 = v32;
    }
  }
  else
  {

  }
}

- (void)addLinkedServiceCharacteristicsFor:(id)a3 toCollection:(id)a4 assistantObjects:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v32 = a4;
  v31 = a5;
  objc_msgSend(v7, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mapReadCharacteristicFromAssistantName:", *MEMORY[0x24BE81DC0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mapFromAssistantServiceName:", *MEMORY[0x24BE820C8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mapFromAssistantServiceName:", *MEMORY[0x24BE82158]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqual:", v10) & 1) != 0)
  {
    objc_msgSend(v8, "type");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqual:", v11);

    if (v15)
    {
      v26 = v11;
      v27 = v9;
      v29 = v7;
      objc_msgSend(v7, "accessory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v28 = v8;
      objc_msgSend(v8, "linkedServices");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "copy");

      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v34;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v34 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(v16, "findService:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v22));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "type");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "isEqual:", v12);

            if (v25)
              -[HMDAssistantCommand addCharacteristicWithType:fromService:toCollection:assistantObjects:](self, "addCharacteristicWithType:fromService:toCollection:assistantObjects:", v10, v23, v32, v31);

            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v20);
      }

      v8 = v28;
      v7 = v29;
      v11 = v26;
      v9 = v27;
    }
  }
  else
  {

  }
}

- (id)addStatusCharacteristicsIfNeeded:(id)a3
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v35 = (void *)objc_msgSend(v3, "mutableCopy");
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v3;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v46 != v28)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v5, "type");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "service");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "type");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "getStatusCharacteristicTypes:forServiceType:", v6, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = v9;
        if (objc_msgSend(v9, "count"))
        {
          v32 = v6;
          v33 = i;
          objc_msgSend(v5, "service");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v31 = v10;
          objc_msgSend(v10, "characteristics");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v11, "copy");

          v34 = v12;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v42;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v42 != v15)
                  objc_enumerationMutation(v34);
                v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
                v37 = 0u;
                v38 = 0u;
                v39 = 0u;
                v40 = 0u;
                v18 = v36;
                v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
                if (v19)
                {
                  v20 = v19;
                  v21 = *(_QWORD *)v38;
                  while (2)
                  {
                    for (k = 0; k != v20; ++k)
                    {
                      if (*(_QWORD *)v38 != v21)
                        objc_enumerationMutation(v18);
                      v23 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k);
                      objc_msgSend(v17, "type");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      LODWORD(v23) = objc_msgSend(v24, "isEqual:", v23);

                      if ((_DWORD)v23)
                      {
                        if ((objc_msgSend(v35, "containsObject:", v17) & 1) == 0)
                          objc_msgSend(v35, "addObject:", v17);
                        goto LABEL_23;
                      }
                    }
                    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
                    if (v20)
                      continue;
                    break;
                  }
                }
LABEL_23:

              }
              v14 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
            }
            while (v14);
          }

          v6 = v32;
          i = v33;
        }

      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v30);
  }

  v25 = (void *)objc_msgSend(v35, "copy");
  return v25;
}

- (id)readRequestsForCharacteristic:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", CFSTR("00000064-0000-1000-8000-0026BB765291")))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v5, "characteristics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v19 = v7;
      v20 = v5;
      v21 = v4;
      v12 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v14, "type");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqual:", CFSTR("00000065-0000-1000-8000-0026BB765291"));

          if (v16)
          {
            +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v14);
            v17 = objc_claimAutoreleasedReturnValue();

            v7 = v19;
            objc_msgSend(v19, "addObject:", v17);
            v6 = (void *)v17;
            v5 = v20;
            v4 = v21;
            goto LABEL_12;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v11)
          continue;
        break;
      }
      v5 = v20;
      v4 = v21;
      v7 = v19;
    }
LABEL_12:

  }
  return v7;
}

- (void)handleSetColor:(id)a3 forObjects:(id)a4 service:(id)a5 completionHandler:(id)a6
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  uint64_t v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  id obj;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  id v59;
  id v60;
  NSObject *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  HMDAssistantCommand *val;
  _QWORD block[4];
  id v69;
  HMDAssistantCommand *v70;
  id v71;
  uint64_t *v72;
  _QWORD v73[4];
  NSObject *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  uint64_t *v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  id location;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  v64 = a3;
  v59 = a4;
  v63 = a5;
  v55 = a6;
  v11 = objc_alloc(MEMORY[0x24BE3F138]);
  v12 = (void *)MEMORY[0x24BDD17C8];
  val = self;
  MEMORY[0x227675180](self, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@, %s:%ld"), v13, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Assistant/HMDAssistantCommand.m", 3532);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v11, "initWithName:", v14);

  -[HMDAssistantCommand parseColorEncoding:](self, "parseColorEncoding:", v64);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v62, "count"))
  {
    objc_msgSend(v62, "allKeys");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommand filterObjects:forCharacteristics:](self, "filterObjects:forCharacteristics:", v59, v49);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v65 = (id)objc_claimAutoreleasedReturnValue();
    v99 = 0;
    v100 = &v99;
    v101 = 0x3032000000;
    v102 = __Block_byref_object_copy__18838;
    v103 = __Block_byref_object_dispose__18839;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v104 = (id)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v64, "includeCompleteInformation");
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    obj = v15;
    v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
    if (v52)
    {
      v51 = *(_QWORD *)v96;
      v57 = *MEMORY[0x24BDD56E8];
      v56 = *MEMORY[0x24BE81BF0];
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v96 != v51)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
          v91 = 0u;
          v92 = 0u;
          v93 = 0u;
          v94 = 0u;
          objc_msgSend(v16, "allKeys");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
          if (v18)
          {
            v19 = *(_QWORD *)v92;
            v60 = v17;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v92 != v19)
                  objc_enumerationMutation(v60);
                v21 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * j);
                objc_msgSend(v16, "objectForKey:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "hmf_numberForKey:", v21);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "metadata");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v22, "properties") & 4) != 0)
                {
                  -[HMDAssistantCommand updateValueToBoundary:valueType:fudgeMinimum:metadata:](val, "updateValueToBoundary:valueType:fudgeMinimum:metadata:", v23, v57, 0, v24);
                  v28 = objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v65, "setObject:forKey:", v28, v22);
                  v23 = (void *)v28;
                }
                else
                {
                  actionResultForAction(v64);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "service");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setOutcome:", v56);
                  entityForService(v26, v63, v59, v58);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setEntity:", v27);

                  -[HMDAssistantCommand populateResult:withService:serviceType:characteristic:resultAttribute:action:](val, "populateResult:withService:serviceType:characteristic:resultAttribute:action:", v25, v26, v63, v22, 0, v64);
                  objc_msgSend((id)v100[5], "addObject:", v25);

                }
                -[HMDAssistantCommand addActivationCharacteristicsIfNeeded:forCharacteristic:](val, "addActivationCharacteristicsIfNeeded:forCharacteristic:", v65, v22);

              }
              v17 = v60;
              v18 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
            }
            while (v18);
          }

        }
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
      }
      while (v52);
    }

    v61 = dispatch_group_create();
    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v66 = v65;
    v30 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v87, v106, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v88;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v88 != v31)
            objc_enumerationMutation(v66);
          v33 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * k);
          objc_msgSend(v33, "service");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "accessory");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "home");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v66, "objectForKey:", v33);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKey:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v38)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKey:", v38, v36);
          }
          objc_msgSend(v33, "authorizationData");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v33, v37, v39, 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v38, "addObject:", v40);
        }
        v30 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v87, v106, 16);
      }
      while (v30);
    }

    objc_initWeak(&location, val);
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v41 = v29;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v82, v105, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v83;
      do
      {
        for (m = 0; m != v42; ++m)
        {
          if (*(_QWORD *)v83 != v43)
            objc_enumerationMutation(v41);
          v45 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * m);
          dispatch_group_enter(v61);
          objc_msgSend(v41, "objectForKey:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAssistantCommand assistantCommandHelper](val, "assistantCommandHelper");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v73[0] = MEMORY[0x24BDAC760];
          v73[1] = 3221225472;
          v73[2] = __75__HMDAssistantCommand_handleSetColor_forObjects_service_completionHandler___block_invoke;
          v73[3] = &unk_24E777C18;
          objc_copyWeak(&v81, &location);
          v74 = v61;
          v79 = v55;
          v75 = v64;
          v76 = v63;
          v80 = &v99;
          v77 = v59;
          v78 = v54;
          objc_msgSend(v47, "addWriteRequests:home:completion:", v46, v45, v73);

          objc_destroyWeak(&v81);
        }
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v82, v105, 16);
      }
      while (v42);
    }

    -[HMDAssistantCommand queue](val, "queue");
    v48 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__HMDAssistantCommand_handleSetColor_forObjects_service_completionHandler___block_invoke_121;
    block[3] = &unk_24E797938;
    v69 = v54;
    v70 = val;
    v72 = &v99;
    v71 = v55;
    dispatch_group_notify(v61, v48, block);

    objc_destroyWeak(&location);
    _Block_object_dispose(&v99, 8);

  }
  else
  {
    -[HMDAssistantCommand reportOutcome:results:handler:](self, "reportOutcome:results:handler:", *MEMORY[0x24BE81EA8], 0, v55);
  }

}

- (void)handleGetColor:(id)a3 forObjects:(id)a4 serviceType:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char *v25;
  char *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t m;
  uint64_t v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  HMDAssistantCommand *v52;
  NSObject *v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  char *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  id obj;
  char *obja;
  id objb;
  id objc;
  uint64_t v68;
  void *v69;
  _QWORD block[4];
  id v71;
  HMDAssistantCommand *v72;
  id v73;
  __int128 *v74;
  _QWORD v75[4];
  NSObject *v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  __int128 *p_buf;
  id v83;
  id location;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[5];
  uint8_t v110[128];
  __int128 buf;
  uint64_t v112;
  uint64_t (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t);
  id v115;
  void *v116;
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  v61 = a3;
  v11 = a4;
  v60 = a5;
  v63 = a6;
  v12 = objc_alloc(MEMORY[0x24BE3F138]);
  v13 = (void *)MEMORY[0x24BDD17C8];
  MEMORY[0x227675180](self, a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@, %s:%ld"), v14, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Assistant/HMDAssistantCommand.m", 3654);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend(v12, "initWithName:", v15);

  v55 = v11;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  objc_msgSend((id)supportedColorSpaces, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v120, 16);
  v17 = v55;
  if (v16)
  {
    v68 = *(_QWORD *)v106;
    v17 = v55;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v106 != v68)
          objc_enumerationMutation(obj);
        objc_msgSend((id)supportedColorSpaces, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * i));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = 0u;
        v104 = 0u;
        v101 = 0u;
        v102 = 0u;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v101, v119, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v102;
          do
          {
            v22 = 0;
            v23 = v17;
            do
            {
              if (*(_QWORD *)v102 != v21)
                objc_enumerationMutation(v19);
              objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * v22), "readCharacteristicType");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDAssistantCommand filteredObjectsFromObjects:byCharacteristicType:](self, "filteredObjectsFromObjects:byCharacteristicType:", v23, v24);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              ++v22;
              v23 = v17;
            }
            while (v20 != v22);
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v101, v119, 16);
          }
          while (v20);
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v120, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  objc_msgSend((id)supportedColorSpaces, "allKeys");
  v56 = (id)objc_claimAutoreleasedReturnValue();
  v58 = (char *)objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v97, v118, 16);
  if (v58)
  {
    v57 = *(_QWORD *)v98;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v98 != v57)
        {
          v26 = v25;
          objc_enumerationMutation(v56);
          v25 = v26;
        }
        obja = v25;
        objc_msgSend((id)supportedColorSpaces, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)v25));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v93, v117, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v94;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v94 != v29)
                objc_enumerationMutation(v27);
              objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * j), "readCharacteristicType");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v116 = v31;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v116, 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDAssistantCommand filterObjects:forCharacteristicTypes:](self, "filterObjects:forCharacteristicTypes:", v17, v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v69, "addObjectsFromArray:", v33);
            }
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v93, v117, 16);
          }
          while (v28);
        }

        v25 = obja + 1;
      }
      while (obja + 1 != v58);
      v58 = (char *)objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v97, v118, 16);
    }
    while (v58);
  }

  if (objc_msgSend(v69, "count"))
  {
    v34 = dispatch_group_create();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v112 = 0x3032000000;
    v113 = __Block_byref_object_copy__18838;
    v114 = __Block_byref_object_dispose__18839;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v115 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v59 = v69;
    v36 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v89, v110, 16);
    if (v36)
    {
      objb = *(id *)v90;
      do
      {
        for (k = 0; k != v36; ++k)
        {
          if (*(id *)v90 != objb)
            objc_enumerationMutation(v59);
          v38 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * k);
          objc_msgSend(v38, "service");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "accessory");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "home");
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v35, "objectForKey:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v42)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setObject:forKey:", v42, v41);
          }
          +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v38);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addObject:", v43);

        }
        v36 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v89, v110, 16);
      }
      while (v36);
    }

    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v44 = v35;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v85, v109, 16);
    if (v45)
    {
      objc = *(id *)v86;
      do
      {
        for (m = 0; m != v45; ++m)
        {
          if (*(id *)v86 != objc)
            objc_enumerationMutation(v44);
          v47 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * m);
          dispatch_group_enter(v34);
          objc_msgSend(v44, "objectForKey:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_initWeak(&location, self);
          -[HMDAssistantCommand assistantCommandHelper](self, "assistantCommandHelper");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v75[0] = MEMORY[0x24BDAC760];
          v75[1] = 3221225472;
          v75[2] = __79__HMDAssistantCommand_handleGetColor_forObjects_serviceType_completionHandler___block_invoke;
          v75[3] = &unk_24E777C18;
          objc_copyWeak(&v83, &location);
          v76 = v34;
          v81 = v63;
          v77 = v61;
          v78 = v60;
          p_buf = &buf;
          v79 = v17;
          v80 = v62;
          objc_msgSend(v49, "addReadRequests:home:completion:", v48, v47, v75);

          objc_destroyWeak(&v83);
          objc_destroyWeak(&location);

        }
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v85, v109, 16);
      }
      while (v45);
    }

    -[HMDAssistantCommand queue](self, "queue");
    v50 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __79__HMDAssistantCommand_handleGetColor_forObjects_serviceType_completionHandler___block_invoke_122;
    block[3] = &unk_24E797938;
    v71 = v62;
    v72 = self;
    v74 = &buf;
    v73 = v63;
    dispatch_group_notify(v34, v50, block);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v51 = (void *)MEMORY[0x227676638]();
    v52 = self;
    HMFGetOSLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v54;
      _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_INFO, "%{public}@No characteristics found after filtering objects", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v51);
    -[HMDAssistantCommand returnResults:serviceType:forAction:completionHandler:](v52, "returnResults:serviceType:forAction:completionHandler:", 0, v60, v61, v63);
  }

}

- (void)performWithGather:(id)a3 queue:(id)a4 msgDispatcher:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  SEL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDAssistantCommand *v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HMDAssistantCommandHelper *v44;
  void *v45;
  HMDAssistantCommand *v46;
  NSObject *v47;
  void *v48;
  HMDAssistantCommand *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  _QWORD aBlock[4];
  id v59;
  id v60[2];
  id location;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v55 = a5;
  v13 = a6;
  v14 = objc_alloc(MEMORY[0x24BE3F138]);
  v15 = (void *)MEMORY[0x24BDD17C8];
  v16 = a2;
  v17 = v12;
  MEMORY[0x227675180](self, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@, %s:%ld"), v18, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Assistant/HMDAssistantCommand.m", 3754);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v14, "initWithName:", v19);

  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v21 = v20;
  -[HMDAssistantCommand setGather:](self, "setGather:", v11);
  -[HMDAssistantCommand setQueue:](self, "setQueue:", v12);
  -[HMDAssistantCommand setCompletionHandlerCalled:](self, "setCompletionHandlerCalled:", 0);
  -[HMDAssistantCommand actions](self, "actions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v57, "aceId");
  objc_msgSend(v57, "actionType");

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__HMDAssistantCommand_performWithGather_queue_msgDispatcher_completion___block_invoke;
  aBlock[3] = &unk_24E777D08;
  objc_copyWeak(v60, &location);
  v60[1] = v21;
  v53 = v13;
  v59 = v53;
  v56 = _Block_copy(aBlock);
  v23 = objc_msgSend(v11, "homeCount");
  if (!v23)
  {
    v45 = (void *)MEMORY[0x227676638]();
    v46 = self;
    HMFGetOSLogHandle();
    v47 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v48;
      _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@There are no homes, reporting the result right away", buf, 0xCu);

    }
    goto LABEL_10;
  }
  -[HMDAssistantCommand setNumberOfHomes:](self, "setNumberOfHomes:", v23);
  -[HMDAssistantCommand gather](self, "gather");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "primaryHomeName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAssistantCommand setPrimaryHomeName:](self, "setPrimaryHomeName:", v25);

  -[HMDAssistantCommand gather](self, "gather");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "primaryHomeAssistantIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAssistantCommand setPrimaryHomeAssistantIdentifier:](self, "setPrimaryHomeAssistantIdentifier:", v27);

  -[HMDAssistantCommand gather](self, "gather");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "currentHomeName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAssistantCommand setCurrentHomeName:](self, "setCurrentHomeName:", v29);

  -[HMDAssistantCommand gather](self, "gather");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "currentHomeAssistantIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAssistantCommand setCurrentHomeAssistantIdentifier:](self, "setCurrentHomeAssistantIdentifier:", v31);

  v32 = (void *)MEMORY[0x227676638]();
  v33 = self;
  HMFGetOSLogHandle();
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v51 = v12;
    v52 = v11;
    HMFGetLogIdentifier();
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v36 = -[HMDAssistantCommand numberOfHomes](v33, "numberOfHomes");
    -[HMDAssistantCommand primaryHomeName](v33, "primaryHomeName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommand primaryHomeAssistantIdentifier](v33, "primaryHomeAssistantIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommand currentHomeName](v33, "currentHomeName");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommand currentHomeAssistantIdentifier](v33, "currentHomeAssistantIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v63 = v35;
    v64 = 2048;
    v65 = v36;
    v66 = 2112;
    v67 = v37;
    v68 = 2112;
    v69 = v38;
    v70 = 2112;
    v71 = v39;
    v72 = 2112;
    v73 = v40;
    _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Number of homes: %tu, Primary home: %@, Primary home ID: %@, Current home: %@, Current home ID: %@", buf, 0x3Eu);

    v17 = v51;
    v11 = v52;

  }
  objc_autoreleasePoolPop(v32);
  -[HMDAssistantCommand gather](v33, "gather");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "homeKitObjects");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAssistantCommand setHomeKitObjects:](v33, "setHomeKitObjects:", v42);

  -[HMDAssistantCommand homeKitObjects](v33, "homeKitObjects");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v42) = objc_msgSend(v43, "count") == 0;

  if ((_DWORD)v42)
  {
    v45 = (void *)MEMORY[0x227676638]();
    v49 = v33;
    HMFGetOSLogHandle();
    v47 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v50;
      _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@There are no homekit objects, calling completion", buf, 0xCu);

    }
LABEL_10:

    objc_autoreleasePoolPop(v45);
    -[HMDAssistantCommand reportResults:handler:](self, "reportResults:handler:", 0, v56);
    goto LABEL_11;
  }
  v44 = -[HMDAssistantCommandHelper initWithQueue:msgDispatcher:]([HMDAssistantCommandHelper alloc], "initWithQueue:msgDispatcher:", v17, v55);
  -[HMDAssistantCommand setAssistantCommandHelper:](v33, "setAssistantCommandHelper:", v44);

  -[HMDAssistantCommand handleCommandWithCompletionHandler:](v33, "handleCommandWithCompletionHandler:", v56);
LABEL_11:

  objc_destroyWeak(v60);
  objc_destroyWeak(&location);

}

- (void)timeoutAndReportResults
{
  id v2;

  -[HMDAssistantCommand assistantCommandHelper](self, "assistantCommandHelper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeoutAndReportResults");

}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (HMDAssistantGather)gather
{
  return self->_gather;
}

- (void)setGather:(id)a3
{
  objc_storeStrong((id *)&self->_gather, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSArray)homeKitObjects
{
  return self->_homeKitObjects;
}

- (void)setHomeKitObjects:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitObjects, a3);
}

- (int64_t)numberOfHomes
{
  return self->_numberOfHomes;
}

- (void)setNumberOfHomes:(int64_t)a3
{
  self->_numberOfHomes = a3;
}

- (NSString)primaryHomeName
{
  return self->_primaryHomeName;
}

- (void)setPrimaryHomeName:(id)a3
{
  objc_storeStrong((id *)&self->_primaryHomeName, a3);
}

- (NSString)primaryHomeAssistantIdentifier
{
  return self->_primaryHomeAssistantIdentifier;
}

- (void)setPrimaryHomeAssistantIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_primaryHomeAssistantIdentifier, a3);
}

- (NSString)currentHomeName
{
  return self->_currentHomeName;
}

- (void)setCurrentHomeName:(id)a3
{
  objc_storeStrong((id *)&self->_currentHomeName, a3);
}

- (NSString)currentHomeAssistantIdentifier
{
  return self->_currentHomeAssistantIdentifier;
}

- (void)setCurrentHomeAssistantIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentHomeAssistantIdentifier, a3);
}

- (HMDAssistantCommandHelper)assistantCommandHelper
{
  return self->_assistantCommandHelper;
}

- (void)setAssistantCommandHelper:(id)a3
{
  objc_storeStrong((id *)&self->_assistantCommandHelper, a3);
}

- (BOOL)completionHandlerCalled
{
  return self->_completionHandlerCalled;
}

- (void)setCompletionHandlerCalled:(BOOL)a3
{
  self->_completionHandlerCalled = a3;
}

- (HMDHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_assistantCommandHelper, 0);
  objc_storeStrong((id *)&self->_currentHomeAssistantIdentifier, 0);
  objc_storeStrong((id *)&self->_currentHomeName, 0);
  objc_storeStrong((id *)&self->_primaryHomeAssistantIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryHomeName, 0);
  objc_storeStrong((id *)&self->_homeKitObjects, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_gather, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

void __72__HMDAssistantCommand_performWithGather_queue_msgDispatcher_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v7 = v6;
    v8 = *(double *)(a1 + 48);
    v9 = (void *)MEMORY[0x227676638](v5);
    v10 = WeakRetained;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v12;
      v23 = 2048;
      v24 = v7 - v8;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Siri command took %.4f seconds", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    if ((objc_msgSend(v10, "completionHandlerCalled") & 1) != 0)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = v10;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v22 = v16;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Completion handler already called, not calling again", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
    }
    else
    {
      objc_msgSend(v10, "setCompletionHandlerCalled:", 1);
      objc_msgSend(v10, "queue");
      v17 = objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __72__HMDAssistantCommand_performWithGather_queue_msgDispatcher_completion___block_invoke_127;
      v18[3] = &unk_24E79C2B8;
      v20 = *(id *)(a1 + 32);
      v19 = v3;
      dispatch_async(v17, v18);

    }
  }

}

uint64_t __72__HMDAssistantCommand_performWithGather_queue_msgDispatcher_completion___block_invoke_127(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __79__HMDAssistantCommand_handleGetColor_forObjects_serviceType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v11;
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received error %@ for read request with response tuples: %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "handleReadWriteResponses:error:forAction:inServiceType:results:forObjects:", v6, v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v5, "code");
    v14 = 82;
    if (unlockErrorCode)
      v14 = 2003;
    if (v13 == v14)
      goto LABEL_10;
    v15 = objc_msgSend(v12, "code");
    v16 = 82;
    if (unlockErrorCode)
      v16 = 2003;
    if (v15 == v16)
    {
LABEL_10:
      objc_msgSend(*(id *)(a1 + 64), "begin");
      objc_msgSend(v9, "reportUnlockRequired:", *(_QWORD *)(a1 + 72));
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 64), "end");
    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

uint64_t __79__HMDAssistantCommand_handleGetColor_forObjects_serviceType_completionHandler___block_invoke_122(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "begin"));
  v3 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@All results have been received for set-action-types, calling result handler", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "reportResults:handler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "end");
}

void __75__HMDAssistantCommand_handleSetColor_forObjects_service_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v11;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received response %@ for write request with %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "handleReadWriteResponses:error:forAction:inServiceType:results:forObjects:", v6, v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v5, "code");
    v14 = 82;
    if (unlockErrorCode)
      v14 = 2003;
    if (v13 == v14)
      goto LABEL_10;
    v15 = objc_msgSend(v12, "code");
    v16 = 82;
    if (unlockErrorCode)
      v16 = 2003;
    if (v15 == v16)
    {
LABEL_10:
      objc_msgSend(*(id *)(a1 + 64), "begin");
      objc_msgSend(v9, "reportUnlockRequired:", *(_QWORD *)(a1 + 72));
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 64), "end");
    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

uint64_t __75__HMDAssistantCommand_handleSetColor_forObjects_service_completionHandler___block_invoke_121(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "begin"));
  v3 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@All results have been received for set-action-types, calling result handler", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "reportResults:handler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "end");
}

void __88__HMDAssistantCommand_handleUpdateActionTypes_serviceType_forObjects_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _BOOL4 v28;
  void *v29;
  _BOOL4 v30;
  objc_class *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t j;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id *from;
  id v91;
  id v92;
  id v93;
  void *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  id obj;
  uint64_t v99;
  id v100;
  void *v101;
  void *v102;
  uint64_t v103;
  _QWORD v104[4];
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  uint64_t v110;
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  _BYTE v128[128];
  _BYTE v129[128];
  uint8_t v130[128];
  uint8_t buf[4];
  void *v132;
  __int16 v133;
  id v134;
  __int16 v135;
  id v136;
  uint64_t v137;

  v137 = *MEMORY[0x24BDAC8D0];
  v93 = a2;
  v92 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  if (!WeakRetained)
    goto LABEL_82;
  from = (id *)(a1 + 112);
  v103 = a1;
  v6 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "begin"));
  v91 = WeakRetained;
  v100 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v132 = v8;
    v133 = 2112;
    v134 = v92;
    v135 = 2112;
    v136 = v93;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received response %@ for read request with error %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v93, "code");
  v10 = 82;
  if (unlockErrorCode)
    v10 = 2003;
  if (v9 == v10)
  {
    v11 = 0;
    goto LABEL_63;
  }
  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  obj = v92;
  v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v130, 16);
  if (!v99)
  {
    v12 = 0;
    goto LABEL_62;
  }
  v12 = 0;
  v97 = *(_QWORD *)v121;
  v89 = *MEMORY[0x24BE81C30];
  v88 = *MEMORY[0x24BE81E28];
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v121 != v97)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * v13);
      objc_msgSend(v14, "request", v88);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "characteristic");
      v101 = (void *)objc_claimAutoreleasedReturnValue();

      if (!*(_BYTE *)(v103 + 120)
        || (objc_msgSend(v101, "type"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = isActivationCharacteristicType(v16),
            v16,
            (v17 & 1) == 0))
      {
        objc_msgSend(v14, "error");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = objc_msgSend(v18, "code");
          v20 = 82;
          if (unlockErrorCode)
            v20 = 2003;
          if (v19 == v20)
          {

            v12 = v18;
            goto LABEL_62;
          }
          actionResultForAction(*(void **)(v103 + 40));
          v21 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "populateResult:fromResponse:responses:forAction:serviceType:forObjects:", v21, v14, obj, *(_QWORD *)(v103 + 40), *(_QWORD *)(v103 + 48), *(_QWORD *)(v103 + 56));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v103 + 104) + 8) + 40), "addObject:", v21);
          goto LABEL_54;
        }
        objc_msgSend(v101, "service");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v22;
        if (*(_BYTE *)(v103 + 120))
        {
          getActivationCharacteristicFromServiceIfAny(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23)
          {
            objc_msgSend(v23, "value");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v26 = v25;
            else
              v26 = 0;
            v27 = v26;

            if (v27)
            {
              v28 = objc_msgSend(v27, "intValue") == 0;

              if (v28)
              {
                v29 = *(void **)(v103 + 48);
                v30 = *(_BYTE *)(v103 + 121) != 0;
                v31 = (objc_class *)MEMORY[0x24BE812A0];
                v32 = *(id *)(v103 + 56);
                v33 = v29;
                v21 = v21;
                v34 = objc_alloc_init(v31);
                objc_msgSend(v34, "setOutcome:", v89);
                entityForService(v21, v33, v32, v30);
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v34, "setEntity:", v35);
                objc_msgSend(v34, "setResultAttribute:", v88);
                v36 = objc_alloc_init(MEMORY[0x24BE812A8]);
                objc_msgSend(v36, "setValue:", objc_msgSend(&unk_24E96A6A0, "BOOLValue"));
                objc_msgSend(v34, "setResultValue:", v36);

                objc_msgSend(*(id *)(v103 + 40), "identifier");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "absoluteString");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "setRequestActionId:", v38);

                v39 = *(id *)(*(_QWORD *)(*(_QWORD *)(v103 + 104) + 8) + 40);
                v40 = v34;
                v124 = 0u;
                v125 = 0u;
                v126 = 0u;
                v127 = 0u;
                v95 = v39;
                v41 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v124, buf, 16);
                if (v41)
                {
                  v96 = *(_QWORD *)v125;
                  do
                  {
                    for (i = 0; i != v41; ++i)
                    {
                      if (*(_QWORD *)v125 != v96)
                        objc_enumerationMutation(v95);
                      v43 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * i);
                      objc_msgSend(v40, "entity");
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v43, "entity");
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((objc_msgSend(v44, "isEqual:", v45) & 1) != 0)
                      {
                        objc_msgSend(v40, "resultAttribute");
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v43, "resultAttribute");
                        v47 = (void *)objc_claimAutoreleasedReturnValue();
                        v48 = objc_msgSend(v46, "isEqualToString:", v47);

                        if ((v48 & 1) != 0)
                        {

                          goto LABEL_57;
                        }
                      }
                      else
                      {

                      }
                    }
                    v41 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v124, buf, 16);
                  }
                  while (v41);
                }

                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v103 + 104) + 8) + 40), "addObject:", v40);
LABEL_57:

LABEL_53:
                v18 = 0;
LABEL_54:

                v12 = v18;
                goto LABEL_55;
              }
            }
            else
            {

            }
          }
        }
        else
        {
          objc_msgSend(v100, "addActivationCharacteristicsIfNeeded:forCharacteristic:", v94, v101);
        }
        objc_msgSend(v14, "request");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "characteristic");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "updateValue:forAction:", v50, *(_QWORD *)(v103 + 40));
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "request");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "characteristic");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "value");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "request");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "characteristic");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "metadata");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "compareCurrentValue:newValue:withMetadata:", v54, v51, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        if (v58)
        {
          actionResultForAction(*(void **)(v103 + 40));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setOutcome:", v58);
          entityForService(v21, *(void **)(v103 + 48), *(void **)(v103 + 56), *(unsigned __int8 *)(v103 + 121));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setEntity:", v60);

          objc_msgSend(v100, "populateResult:withService:serviceType:characteristic:resultAttribute:action:", v59, v21, *(_QWORD *)(v103 + 48), v101, 0, *(_QWORD *)(v103 + 40));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v103 + 104) + 8) + 40), "addObject:", v59);
        }
        else
        {
          objc_msgSend(v21, "characteristics");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "hmf_firstObjectWithCharacteristicType:", *(_QWORD *)(v103 + 64));
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          v118 = 0u;
          v119 = 0u;
          v116 = 0u;
          v117 = 0u;
          v62 = *(id *)(v103 + 72);
          v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
          if (v63)
          {
            v64 = *(_QWORD *)v117;
LABEL_45:
            v65 = 0;
            while (1)
            {
              if (*(_QWORD *)v117 != v64)
                objc_enumerationMutation(v62);
              if (v59)
                break;
              v66 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * v65);
              objc_msgSend(v21, "characteristics");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "hmf_firstObjectWithCharacteristicType:", v66);
              v59 = (void *)objc_claimAutoreleasedReturnValue();

              if (v63 == ++v65)
              {
                v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
                if (v63)
                  goto LABEL_45;
                break;
              }
            }
          }

          objc_msgSend(v94, "setObject:forKey:", v51, v59);
        }

        goto LABEL_53;
      }
LABEL_55:

      ++v13;
    }
    while (v13 != v99);
    v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v130, 16);
    v99 = v68;
  }
  while (v68);
LABEL_62:

  objc_msgSend(v100, "assistantCommandHelper");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "removeResponses:", obj);

  v11 = v12;
LABEL_63:
  v102 = v11;
  v70 = objc_msgSend(v11, "code");
  v71 = 82;
  if (unlockErrorCode)
    v71 = 2003;
  if (v70 == v71)
    goto LABEL_69;
  v72 = objc_msgSend(v93, "code");
  v73 = 82;
  if (unlockErrorCode)
    v73 = 2003;
  if (v72 == v73)
  {
LABEL_69:
    objc_msgSend(v100, "reportUnlockRequired:", *(_QWORD *)(v103 + 96));
  }
  else
  {
    if (objc_msgSend(v94, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = 0u;
      v113 = 0u;
      v114 = 0u;
      v112 = 0u;
      v75 = v94;
      v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v112, v128, 16);
      if (v76)
      {
        v77 = *(_QWORD *)v113;
        do
        {
          for (j = 0; j != v76; ++j)
          {
            if (*(_QWORD *)v113 != v77)
              objc_enumerationMutation(v75);
            v79 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * j);
            objc_msgSend(v75, "objectForKey:", v79);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "authorizationData");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v79, v80, v81, 0);
            v82 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v74, "addObject:", v82);
          }
          v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v112, v128, 16);
        }
        while (v76);
      }

      objc_msgSend(v100, "assistantCommandHelper");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = *(_QWORD *)(v103 + 88);
      v104[0] = MEMORY[0x24BDAC760];
      v104[1] = 3221225472;
      v104[2] = __88__HMDAssistantCommand_handleUpdateActionTypes_serviceType_forObjects_completionHandler___block_invoke_107;
      v104[3] = &unk_24E777CB8;
      objc_copyWeak(&v111, from);
      v105 = *(id *)(v103 + 80);
      v109 = *(id *)(v103 + 96);
      v106 = *(id *)(v103 + 40);
      v85 = *(id *)(v103 + 48);
      v86 = *(_QWORD *)(v103 + 104);
      v107 = v85;
      v110 = v86;
      v108 = *(id *)(v103 + 56);
      objc_msgSend(v83, "addWriteRequests:home:completion:", v74, v84, v104);

      objc_destroyWeak(&v111);
      v87 = v103;
    }
    else
    {
      v87 = v103;
      dispatch_group_leave(*(dispatch_group_t *)(v103 + 80));
    }
    objc_msgSend(*(id *)(v87 + 32), "end");
  }

  WeakRetained = v91;
LABEL_82:

}

uint64_t __88__HMDAssistantCommand_handleUpdateActionTypes_serviceType_forObjects_completionHandler___block_invoke_108(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "begin"));
  v3 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@All results have been received for update-action-types, calling result handler", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "reportResults:handler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "end");
}

void __88__HMDAssistantCommand_handleUpdateActionTypes_serviceType_forObjects_completionHandler___block_invoke_107(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v11;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received response %@ for write request with %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "handleReadWriteResponses:error:forAction:inServiceType:results:forObjects:", v6, v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v5, "code");
    v14 = 82;
    if (unlockErrorCode)
      v14 = 2003;
    if (v13 == v14)
      goto LABEL_10;
    v15 = objc_msgSend(v12, "code");
    v16 = 82;
    if (unlockErrorCode)
      v16 = 2003;
    if (v15 == v16)
LABEL_10:
      objc_msgSend(v9, "reportUnlockRequired:", *(_QWORD *)(a1 + 64));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __85__HMDAssistantCommand_handleSetActionTypes_serviceType_forObjects_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v11;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received response %@ for write request with %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "handleReadWriteResponses:error:forAction:inServiceType:results:forObjects:", v6, v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v5, "code");
    v14 = 82;
    if (unlockErrorCode)
      v14 = 2003;
    if (v13 == v14)
      goto LABEL_10;
    v15 = objc_msgSend(v12, "code");
    v16 = 82;
    if (unlockErrorCode)
      v16 = 2003;
    if (v15 == v16)
    {
LABEL_10:
      objc_msgSend(*(id *)(a1 + 64), "begin");
      objc_msgSend(v9, "reportUnlockRequired:", *(_QWORD *)(a1 + 72));
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 64), "end");
    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

uint64_t __85__HMDAssistantCommand_handleSetActionTypes_serviceType_forObjects_completionHandler___block_invoke_105(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "begin"));
  v3 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@All results have been received for set-action-types, calling result handler", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "reportResults:handler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "end");
}

void __83__HMDAssistantCommand_handleSetNaturalLightingActionOnHAPLightProfiles_home_value___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = *(void **)(a1 + 32);
  if (WeakRetained)
  {
    objc_msgSend(v4, "fulfillWithValue:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rejectWithError:", v5);

  }
}

uint64_t __137__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_hapLightProfiles_matterLightProfiles_home_completionHandler___block_invoke(id *a1, void *a2)
{
  __int128 v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v23 = a2;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = a1[4];
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v24)
  {
    v22 = *(_QWORD *)v26;
    v21 = *MEMORY[0x24BE81BC0];
    v20 = *MEMORY[0x24BE81C30];
    *(_QWORD *)&v3 = 138543874;
    v18 = v3;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v5, "service", v18);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKey:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        actionResultForAction(a1[5]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        entityForService(v6, a1[6], a1[7], objc_msgSend(a1[5], "includeCompleteInformation"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setEntity:", v9);

        v10 = (void *)MEMORY[0x227676638]();
        v11 = a1[8];
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v7)
        {
          v14 = v21;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v18;
            v30 = v15;
            v31 = 2112;
            v32 = v5;
            v33 = 2112;
            v34 = v7;
            _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to set natural lighting for hap light profile %@:%@", buf, 0x20u);

            v14 = v21;
          }
        }
        else
        {
          v14 = v20;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v18;
            v30 = v16;
            v31 = 2112;
            v32 = v5;
            v33 = 2112;
            v34 = 0;
            _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully set natural lighting for hap light profile %@:%@", buf, 0x20u);

            v14 = v20;
          }
        }

        objc_autoreleasePoolPop(v10);
        objc_msgSend(v8, "setOutcome:", v14);
        objc_msgSend(a1[9], "addObject:", v8);

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v24);
  }

  return 1;
}

uint64_t __137__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_hapLightProfiles_matterLightProfiles_home_completionHandler___block_invoke_94(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to set natural lighting for all hap light profiles with error: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

  return 1;
}

uint64_t __137__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_hapLightProfiles_matterLightProfiles_home_completionHandler___block_invoke_96(id *a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  __int128 v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v27 = a2;
  v3 = (void *)MEMORY[0x227676638]();
  v4 = a1[4];
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v6;
    v36 = 2112;
    v37 = v27;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEBUG, "%{public}@handleSetNaturalLightingEnabled returned resultByLightProfile: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = a1[5];
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v30;
    v25 = *MEMORY[0x24BE81BC0];
    v24 = *MEMORY[0x24BE81C30];
    *(_QWORD *)&v7 = 138543618;
    v22 = v7;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v30 != v26)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v9, "service", v22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        actionResultForAction(a1[6]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        entityForService(v10, a1[7], a1[8], objc_msgSend(a1[6], "includeCompleteInformation"));
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setEntity:", v13);

        LOBYTE(v13) = objc_msgSend(v11, "BOOLValue");
        v14 = (void *)MEMORY[0x227676638]();
        v15 = a1[4];
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if ((v13 & 1) != 0)
        {
          v18 = v24;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v22;
            v35 = v19;
            v36 = 2112;
            v37 = v9;
            _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Successfully set natural lighting for matter light profile %@", buf, 0x16u);

            v18 = v24;
          }
        }
        else
        {
          v18 = v25;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v22;
            v35 = v20;
            v36 = 2112;
            v37 = v9;
            _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to set natural lighting for matter light profile %@", buf, 0x16u);

            v18 = v25;
          }
        }

        objc_autoreleasePoolPop(v14);
        objc_msgSend(v12, "setOutcome:", v18);
        objc_msgSend(a1[9], "addObject:", v12);

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v28);
  }

  return 1;
}

uint64_t __137__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_hapLightProfiles_matterLightProfiles_home_completionHandler___block_invoke_97(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to set natural lighting for all matter light profiles with error: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

  return 1;
}

uint64_t __137__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_hapLightProfiles_matterLightProfiles_home_completionHandler___block_invoke_99(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v12 = 138543618;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@handleSetNaturalLightingAction success reporting actionResults: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reportResults:handler:", v10, *(_QWORD *)(a1 + 48));

  return 1;
}

uint64_t __137__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_hapLightProfiles_matterLightProfiles_home_completionHandler___block_invoke_101(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v12 = 138543618;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@handleSetNaturalLightingAction failed reporting actionResults: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reportResults:handler:", v10, *(_QWORD *)(a1 + 48));

  return 1;
}

uint64_t __95__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __95__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_completionHandler___block_invoke_90(uint64_t a1, void *a2)
{
  id WeakRetained;
  __int128 v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v27 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "begin");
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = *(id *)(a1 + 40);
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    if (v28)
    {
      v24 = *(_QWORD *)v30;
      v23 = *MEMORY[0x24BE81BC0];
      v22 = *MEMORY[0x24BE81C30];
      *(_QWORD *)&v4 = 138543874;
      v20 = v4;
      v25 = a1;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v30 != v24)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v6, "service", v20);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKey:", v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          actionResultForAction(*(void **)(a1 + 48));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          entityForService(v7, *(void **)(a1 + 56), *(void **)(a1 + 64), objc_msgSend(*(id *)(a1 + 48), "includeCompleteInformation"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setEntity:", v10);

          v11 = (void *)MEMORY[0x227676638]();
          v12 = WeakRetained;
          v13 = WeakRetained;
          HMFGetOSLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v8)
          {
            v16 = v23;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v20;
              v34 = v17;
              v35 = 2112;
              v36 = v6;
              v37 = 2112;
              v38 = v8;
              _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to set natural lighting for light profile %@:%@", buf, 0x20u);

              v16 = v23;
            }
          }
          else
          {
            v16 = v22;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v20;
              v34 = v18;
              v35 = 2112;
              v36 = v6;
              v37 = 2112;
              v38 = 0;
              _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Successfully set natural lighting for light profile %@:%@", buf, 0x20u);

              v16 = v22;
            }
          }

          objc_autoreleasePoolPop(v11);
          objc_msgSend(v9, "setOutcome:", v16);
          objc_msgSend(v26, "addObject:", v9);

          WeakRetained = v12;
          a1 = v25;
        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      }
      while (v28);
    }

    objc_msgSend(v26, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "reportResults:handler:", v19, *(_QWORD *)(a1 + 72));

    objc_msgSend(*(id *)(a1 + 32), "end");
  }

}

uint64_t __95__HMDAssistantCommand_handleGetNaturalLightingAction_forObjects_serviceType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __85__HMDAssistantCommand_handleGetActionTypes_serviceType_forObjects_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v11;
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received error %@ for read request with response tuples: %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "handleReadWriteResponses:error:forAction:inServiceType:results:forObjects:", v6, v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v5, "code");
    v14 = 82;
    if (unlockErrorCode)
      v14 = 2003;
    if (v13 == v14)
      goto LABEL_10;
    v15 = objc_msgSend(v12, "code");
    v16 = 82;
    if (unlockErrorCode)
      v16 = 2003;
    if (v15 == v16)
    {
LABEL_10:
      objc_msgSend(*(id *)(a1 + 64), "begin");
      objc_msgSend(v9, "reportUnlockRequired:", *(_QWORD *)(a1 + 72));
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 64), "end");
    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

uint64_t __85__HMDAssistantCommand_handleGetActionTypes_serviceType_forObjects_completionHandler___block_invoke_86(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "begin"));
  v3 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@All results have been received for get-action-types, calling result handler", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "reportResults:handler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "end");
}

void __102__HMDAssistantCommand_handleMediaAccessorySetActionType_forObjects_withServiceType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v13 = v11;
      v14 = 2112;
      v15 = v5;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received error %@ for read/write request with responses %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "handleMediaReadWriteResponse:forAction:inServiceType:inHome:requestProperty:results:forObjects:", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), *(_QWORD *)(a1 + 72));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }

}

uint64_t __102__HMDAssistantCommand_handleMediaAccessorySetActionType_forObjects_withServiceType_completionHandler___block_invoke_83(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "begin"));
  v3 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@All results have been received for Apple Media Accessory get-action-types, calling result handler", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "reportResults:handler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "end");
}

void __69__HMDAssistantCommand_executeActionSet_action_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
    goto LABEL_22;
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v8 = objc_msgSend(v5, "code");
  v9 = 82;
  if (unlockErrorCode)
    v9 = 2003;
  if (v8 == v9)
  {
    objc_msgSend(WeakRetained, "reportUnlockRequired:", *(_QWORD *)(a1 + 56));
    goto LABEL_22;
  }
  actionResultForAction(*(void **)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BE812A8]);
  objc_msgSend(WeakRetained, "entityFromActionSet:", *(_QWORD *)(a1 + 48));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "populateResultWithEntity:action:entity:", v10, *(_QWORD *)(a1 + 40));
  v12 = (id)*MEMORY[0x24BE81EB0];
  objc_msgSend(v11, "setValue:", 1);
  if (!v5)
  {
    v24 = v12;
    objc_msgSend(v10, "setOutcome:", *MEMORY[0x24BE81C30]);
LABEL_16:
    v15 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v10, "setOutcome:", *MEMORY[0x24BE81BC0]);
  if (objc_msgSend(v5, "code") == 25)
  {
    v13 = (id)*MEMORY[0x24BE81EE8];

    v14 = (_QWORD *)MEMORY[0x24BE81C00];
LABEL_12:
    objc_msgSend(v10, "setOutcome:", *v14);
LABEL_13:
    v12 = v13;
    goto LABEL_14;
  }
  if (objc_msgSend(v5, "code") == 4000)
  {
    v13 = (id)*MEMORY[0x24BE81EF8];

    v14 = (_QWORD *)MEMORY[0x24BE81C10];
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "code") == 64)
  {
    v13 = (id)*MEMORY[0x24BE81EF0];

    goto LABEL_13;
  }
  if (objc_msgSend(v5, "code") == 65)
  {
    v13 = (id)*MEMORY[0x24BE81EE0];

    v14 = (_QWORD *)MEMORY[0x24BE81BD0];
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "code") == 15)
    objc_msgSend(v10, "setOutcome:", *MEMORY[0x24BE81BD0]);
LABEL_14:
  v24 = v12;
  if (!v6)
    goto LABEL_16;
  objc_msgSend(WeakRetained, "failedActionResultsFromResponse:inActionSet:withAction:", v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
  v16 = (void *)MEMORY[0x227676638](objc_msgSend(v10, "setResultValue:", v11));
  v17 = WeakRetained;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = v6;
    v19 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v20;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Result received for execute action set: %@, calling result handler", buf, 0x16u);

    v11 = v19;
    v6 = v23;
  }

  objc_autoreleasePoolPop(v16);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v10, 0);
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v21, "addObjectsFromArray:", v15);
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v17, "reportOutcome:results:handler:", v24, v22, *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "end");
LABEL_22:

}

@end
