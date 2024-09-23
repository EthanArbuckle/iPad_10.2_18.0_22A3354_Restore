@implementation HFCharacteristicValueDisplayMetadata

uint64_t __109__HFCharacteristicValueDisplayMetadata__unknownStatePriorityForServiceDescriptor_characteristicReadResponse___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allCharacteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __109__HFCharacteristicValueDisplayMetadata__unknownStatePriorityForServiceDescriptor_characteristicReadResponse___block_invoke_4;
  v9[3] = &unk_1EA72BB50;
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_filter:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_111_0);
  return v7;
}

+ (id)displayMetadataForService:(id)a3 characteristicReadResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  int v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
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
  void *v55;
  void *v56;
  int v57;
  objc_class *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  id v74;
  HFCharacteristicValueDisplayMetadata *v75;
  id obj;
  void *v77;
  void *v78;
  _QWORD v79[4];
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t buf[4];
  id v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  int v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v77 = v6;
  objc_msgSend(v6, "hf_serviceDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serviceType");
  v9 = objc_claimAutoreleasedReturnValue();
  v74 = a1;
  v71 = v8;
  v78 = v7;
  v75 = objc_alloc_init(HFCharacteristicValueDisplayMetadata);
  -[HFCharacteristicValueDisplayMetadata setPriority:](v75, "setPriority:", objc_msgSend(a1, "_unknownStatePriorityForServiceDescriptor:characteristicReadResponse:", v8, v7));
  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_sensorServiceTypes");
  v69 = objc_claimAutoreleasedReturnValue();
  __HFSimplePowerStateServices_block_invoke();
  v68 = objc_claimAutoreleasedReturnValue();
  __HFSimpleActiveStateServices_block_invoke();
  v67 = objc_claimAutoreleasedReturnValue();
  __HFCurrentTargetPositionServices_block_invoke();
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_requiredCharacteristicTypesForDisplayMetadataWithServiceType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBA458], "hf_characteristicSortComparator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingComparator:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = v13;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v99, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v82;
    v17 = 1;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v82 != v16)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i);
        objc_msgSend(v78, "responseForCharacteristicType:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "error");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v20)
          v23 = objc_msgSend(v21, "hf_isHFErrorWithCode:", 4);
        else
          v23 = 0;
        HFLogForCategory(0x38uLL);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413826;
          v86 = v74;
          v87 = 2112;
          v88 = v31;
          v89 = 2112;
          v90 = v77;
          v91 = 2112;
          v92 = v19;
          v93 = 2112;
          v94 = v20;
          v95 = 2112;
          v96 = v22;
          v97 = 1024;
          v98 = v23;
          _os_log_debug_impl(&dword_1DD34E000, v24, OS_LOG_TYPE_DEBUG, "%@:%@ Service: %@ CharacteristicType: %@, aReadResponse: %@, readError: %@, readPolicyDisallowedRead: %{BOOL}d", buf, 0x44u);

        }
        v17 &= v20 != 0;
        if (v23)
        {
          objc_msgSend(v77, "accessory");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "hf_isHomePod");

          v17 &= v26;
        }
        if (objc_msgSend(v22, "hf_isHFErrorWithCode:", 103))
        {

          v22 = 0;
        }
        else if (v22)
        {
          objc_msgSend(v20, "readTraits");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "contextProvider");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[HFCharacteristicValueDisplayError errorWithUnderlyingError:readTraits:contextProvider:](HFCharacteristicValueDisplayError, "errorWithUnderlyingError:readTraits:contextProvider:", v22, v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFCharacteristicValueDisplayMetadata setError:](v75, "setError:", v29);

          -[HFCharacteristicValueDisplayMetadata error](v75, "error");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {

            goto LABEL_22;
          }
        }

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v99, 16);
      if (v15)
        continue;
      break;
    }
  }
  else
  {
    v17 = 1;
  }
LABEL_22:

  -[HFCharacteristicValueDisplayMetadata error](v75, "error");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32 && (v17 & 1) == 0)
  {
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __93__HFCharacteristicValueDisplayMetadata_displayMetadataForService_characteristicReadResponse___block_invoke;
    v79[3] = &unk_1EA726EA8;
    v33 = v78;
    v80 = v33;
    v34 = objc_msgSend(obj, "na_any:", v79);
    objc_msgSend(v33, "allCharacteristics");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

    if (v36)
    {
      if (!v34)
      {
        -[HFCharacteristicValueDisplayMetadata setPriority:](v75, "setPriority:", -1);
LABEL_31:

        goto LABEL_32;
      }
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v77, "accessory");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v86 = v77;
        v87 = 2112;
        v88 = v65;
        _os_log_error_impl(&dword_1DD34E000, v37, OS_LOG_TYPE_ERROR, "Read response empty for service %@ in accessory %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "contextProvider");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFCharacteristicValueDisplayError errorWithUnderlyingError:readTraits:contextProvider:](HFCharacteristicValueDisplayError, "errorWithUnderlyingError:readTraits:contextProvider:", v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueDisplayMetadata setError:](v75, "setError:", v41);

    goto LABEL_31;
  }
LABEL_32:
  objc_msgSend(v77, "accessory");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "hf_siriEndpointProfile");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[HFCharacteristicValueDisplayMetadata error](v75, "error");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = (void *)v69;
    v46 = v70;
    v49 = (void *)v67;
    v48 = (void *)v68;
    if (v45)
      goto LABEL_38;
    objc_msgSend(v77, "accessory");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "hf_errorForCurrentSessionState");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "contextProvider");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFCharacteristicValueDisplayError errorWithUnderlyingError:readTraits:contextProvider:](HFCharacteristicValueDisplayError, "errorWithUnderlyingError:readTraits:contextProvider:", v42, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCharacteristicValueDisplayMetadata setError:](v75, "setError:", v53);

    }
  }
  else
  {
    v47 = (void *)v69;
    v46 = v70;
    v49 = (void *)v67;
    v48 = (void *)v68;
  }

LABEL_38:
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
  {
    -[HFCharacteristicValueDisplayMetadata error](v75, "error");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      objc_msgSend(v77, "accessory");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "_overrideDisplayErrorCategoryWithThreadNetworkErrorForDisplayMetadata:withAccessory:", v75, v55);

    }
  }
  -[HFCharacteristicValueDisplayMetadata error](v75, "error");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "isPersistentError");

  if (v57)
    -[HFCharacteristicValueDisplayMetadata setPriority:](v75, "setPriority:", 0);
  v58 = +[HFServiceState stateClassForServiceDescriptor:](HFServiceState, "stateClassForServiceDescriptor:", v71);
  if (v58)
  {
    v59 = (id)objc_msgSend([v58 alloc], "initWithBatchReadResponse:", v78);
    if (v59)
    {
      -[HFCharacteristicValueDisplayMetadata setServiceState:](v75, "setServiceState:", v59);
      -[HFCharacteristicValueDisplayMetadata setPrimaryState:](v75, "setPrimaryState:", objc_msgSend(v59, "primaryState"));
      -[HFCharacteristicValueDisplayMetadata setPriority:](v75, "setPriority:", objc_msgSend(v59, "priority"));
      if (objc_msgSend(v59, "isTransitioning"))
      {
        v60 = objc_msgSend(v59, "primaryState");
        if (v60 == 2)
          v61 = 1;
        else
          v61 = 2 * (v60 == 1);
        -[HFCharacteristicValueDisplayMetadata setTransitioningPrimaryState:](v75, "setTransitioningPrimaryState:", v61);
      }
      v62 = (void *)MEMORY[0x1E0CBA7E0];
      objc_msgSend(v71, "serviceType");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "localizedDescriptionForServiceType:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCharacteristicValueDisplayMetadata setSortKey:](v75, "setSortKey:", v64);

    }
LABEL_52:

    goto LABEL_76;
  }
  if (objc_msgSend(v46, "isEqualToString:", *MEMORY[0x1E0CB99A0]))
  {
    -[HFCharacteristicValueDisplayMetadata setPrimaryState:](v75, "setPrimaryState:", 1);
    -[HFCharacteristicValueDisplayMetadata setPriority:](v75, "setPriority:", -1);
    goto LABEL_76;
  }
  if (objc_msgSend(v47, "containsObject:", v46))
  {
    if (qword_1ED379088 != -1)
      dispatch_once(&qword_1ED379088, &__block_literal_global_102_0);
    v59 = (id)qword_1ED379090;
    if (objc_msgSend(v59, "containsObject:", v46))
      -[HFCharacteristicValueDisplayMetadata parseWarningSensorWithServiceType:response:](v75, "parseWarningSensorWithServiceType:response:", v46, v78);
    else
      -[HFCharacteristicValueDisplayMetadata parseInformationalSensorWithServiceType:response:](v75, "parseInformationalSensorWithServiceType:response:", v46, v78);
    goto LABEL_52;
  }
  if (objc_msgSend(v48, "containsObject:", v46))
  {
    -[HFCharacteristicValueDisplayMetadata parsePowerStateForServiceType:response:](v75, "parsePowerStateForServiceType:response:", v46, v78);
  }
  else if (objc_msgSend(v49, "containsObject:", v46))
  {
    -[HFCharacteristicValueDisplayMetadata parseActiveStateForServiceType:response:](v75, "parseActiveStateForServiceType:response:", v46, v78);
  }
  else if (objc_msgSend(v72, "containsObject:", v46))
  {
    -[HFCharacteristicValueDisplayMetadata parseCurrentTargetPositionForServiceType:response:](v75, "parseCurrentTargetPositionForServiceType:response:", v46, v78);
  }
  else if (objc_msgSend(v46, "isEqualToString:", *MEMORY[0x1E0CB9A28]))
  {
    -[HFCharacteristicValueDisplayMetadata parseGarageDoorOpenerResponse:](v75, "parseGarageDoorOpenerResponse:", v78);
  }
  else if (objc_msgSend(v46, "isEqualToString:", *MEMORY[0x1E0CB9A80]))
  {
    -[HFCharacteristicValueDisplayMetadata parseLockMechanismResponse:](v75, "parseLockMechanismResponse:", v78);
  }
  else if (objc_msgSend(v46, "isEqualToString:", *MEMORY[0x1E0CB9AA8]))
  {
    -[HFCharacteristicValueDisplayMetadata parseSecuritySystemResponse:](v75, "parseSecuritySystemResponse:", v78);
  }
  else if ((objc_msgSend(v46, "isEqualToString:", *MEMORY[0x1E0CB9B00]) & 1) != 0
         || objc_msgSend(v46, "isEqualToString:", *MEMORY[0x1E0CB9A30]))
  {
    -[HFCharacteristicValueDisplayMetadata parseThermostatResponse:serviceType:](v75, "parseThermostatResponse:serviceType:", v78, v46);
  }
  else if (objc_msgSend(v46, "isEqualToString:", *MEMORY[0x1E0CB99A8]))
  {
    -[HFCharacteristicValueDisplayMetadata parseAirPurifierResponse:](v75, "parseAirPurifierResponse:", v78);
  }
  else if (objc_msgSend(v46, "isEqualToString:", *MEMORY[0x1E0CB9A38]))
  {
    -[HFCharacteristicValueDisplayMetadata parseHumidifierDehumidifierResponse:](v75, "parseHumidifierDehumidifierResponse:", v78);
  }
  else if ((objc_msgSend(v46, "isEqualToString:", *MEMORY[0x1E0CB9AD0]) & 1) != 0
         || objc_msgSend(v46, "isEqualToString:", *MEMORY[0x1E0CB9AC8]))
  {
    -[HFCharacteristicValueDisplayMetadata parseProgammableSwitchOfType:response:](v75, "parseProgammableSwitchOfType:response:", v46, v78);
  }
  else
  {
    NSLog(CFSTR("Unknown or unimplemented service type \"%@\"), v46);
  }
LABEL_76:

  return v75;
}

- (HFCharacteristicValueDisplayError)error
{
  return self->_error;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

+ (int64_t)_unknownStatePriorityForServiceDescriptor:(id)a3 characteristicReadResponse:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  v6 = a4;
  if (qword_1ED379098 != -1)
    dispatch_once(&qword_1ED379098, &__block_literal_global_110_1);
  v7 = (id)qword_1ED3790A0;
  objc_msgSend(v5, "serviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = 2;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CBA7E0];
    objc_msgSend(v5, "serviceType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hf_requiredCharacteristicTypesForDisplayMetadataWithServiceType:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __109__HFCharacteristicValueDisplayMetadata__unknownStatePriorityForServiceDescriptor_characteristicReadResponse___block_invoke_3;
    v16[3] = &unk_1EA726EA8;
    v17 = v6;
    v14 = objc_msgSend(v13, "na_any:", v16);

    if (v14)
      v10 = -1;
    else
      v10 = 1;

  }
  return v10;
}

- (void)parseLockMechanismResponse:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v4 = *MEMORY[0x1E0CB8868];
  v5 = a3;
  objc_msgSend(v5, "responseForCharacteristicType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueWithExpectedClass:", objc_opt_class());
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "responseForCharacteristicType:", *MEMORY[0x1E0CB8AE0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valueWithExpectedClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v10 = objc_msgSend(v17, "integerValue");
    v11 = objc_msgSend(v8, "integerValue");
    if (v10 > 3)
      v12 = 0;
    else
      v12 = qword_1DD6697D8[v10];
    -[HFCharacteristicValueDisplayMetadata setPrimaryState:](self, "setPrimaryState:", v12);
    if (v11 == v10 || (v10 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      if (-[HFCharacteristicValueDisplayMetadata primaryState](self, "primaryState") == 1)
        v14 = -1;
      else
        v14 = 1;
    }
    else
    {
      if (v11 > 3)
        v15 = 0;
      else
        v15 = qword_1DD6697D8[v11];
      -[HFCharacteristicValueDisplayMetadata setTransitioningPrimaryState:](self, "setTransitioningPrimaryState:", v15);
      v14 = 1;
    }
    -[HFCharacteristicValueDisplayMetadata setPriority:](self, "setPriority:", v14);
  }
  _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusSortKeyLock"), CFSTR("HFStatusSortKeyLock"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicValueDisplayMetadata setSortKey:](self, "setSortKey:", v16);

}

- (void)setServiceState:(id)a3
{
  objc_storeStrong((id *)&self->_serviceState, a3);
}

- (void)parseWarningSensorWithServiceType:(id)a3 response:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = *MEMORY[0x1E0CB8A68];
  v7 = a4;
  objc_msgSend(v7, "responseForCharacteristicType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueWithExpectedClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "responseForCharacteristicType:", *MEMORY[0x1E0CB8A50]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueWithExpectedClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_sensorCharacteristicTypeForServiceType:", v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "responseForCharacteristicType:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_16;
  -[HFCharacteristicValueDisplayMetadata setPrimaryState:](self, "setPrimaryState:", 1);
  -[HFCharacteristicValueDisplayMetadata setPriority:](self, "setPriority:", -1);
  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB87D8]) & 1) == 0
    && (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB87F0]) & 1) == 0
    && (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB8A38]) & 1) == 0
    && !objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB8930]))
  {
    if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB8958]) & 1) != 0
      || (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB8988]) & 1) != 0
      || objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB8820]))
    {
      if ((objc_msgSend(v14, "BOOLValue") & 1) == 0)
        goto LABEL_10;
    }
    else
    {
      if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB87B0]))
        goto LABEL_10;
      if ((objc_msgSend(v14, "integerValue") & 0xFFFFFFFFFFFFFFFELL) != 4)
      {
        v15 = 0;
        goto LABEL_9;
      }
    }
    v15 = 1;
LABEL_8:
    -[HFCharacteristicValueDisplayMetadata setPrimaryState:](self, "setPrimaryState:", 2);
LABEL_9:
    -[HFCharacteristicValueDisplayMetadata setPriority:](self, "setPriority:", v15);
    goto LABEL_10;
  }
  if ((objc_msgSend(v14, "BOOLValue") & 1) != 0)
  {
    v15 = 2;
    goto LABEL_8;
  }
LABEL_10:
  if (objc_msgSend(v9, "integerValue") || objc_msgSend(v11, "integerValue"))
  {
    -[HFCharacteristicValueDisplayMetadata setPrimaryState:](self, "setPrimaryState:", 2);
    v16 = -[HFCharacteristicValueDisplayMetadata priority](self, "priority");
    if (v16 <= 1)
      v17 = 1;
    else
      v17 = v16;
    -[HFCharacteristicValueDisplayMetadata setPriority:](self, "setPriority:", v17);
  }
LABEL_16:
  if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB99B0]) & 1) != 0)
  {
    v18 = CFSTR("HFStatusSortKeyAirQualitySensor");
LABEL_37:
    _HFLocalizedStringWithDefaultValue(v18, v18, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueDisplayMetadata setSortKey:](self, "setSortKey:", v19);

    goto LABEL_38;
  }
  if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB99E0]) & 1) != 0)
  {
    v18 = CFSTR("HFStatusSortKeyCO2Alarm");
    goto LABEL_37;
  }
  if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB99E8]) & 1) != 0)
  {
    v18 = CFSTR("HFStatusSortKeyCOAlarm");
    goto LABEL_37;
  }
  if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB99F0]) & 1) != 0)
  {
    v18 = CFSTR("HFStatusSortKeyContactSensor");
    goto LABEL_37;
  }
  if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB9A60]) & 1) != 0)
  {
    v18 = CFSTR("HFStatusSortKeyLeakAlarm");
    goto LABEL_37;
  }
  if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB9A90]) & 1) != 0)
  {
    v18 = CFSTR("HFStatusSortKeyMotionAlarm");
    goto LABEL_37;
  }
  if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB9A98]) & 1) != 0)
  {
    v18 = CFSTR("HFStatusSortKeyOccupancyAlarm");
    goto LABEL_37;
  }
  if (objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB9AB8]))
  {
    v18 = CFSTR("HFStatusSortKeySmokeAlarm");
    goto LABEL_37;
  }
LABEL_38:

}

uint64_t __109__HFCharacteristicValueDisplayMetadata__unknownStatePriorityForServiceDescriptor_characteristicReadResponse___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __93__HFCharacteristicValueDisplayMetadata_displayMetadataForService_characteristicReadResponse___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)parseInformationalSensorWithServiceType:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  _QWORD *v14;
  id *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "responseForCharacteristicType:", *MEMORY[0x1E0CB8A68]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueWithExpectedClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "responseForCharacteristicType:", *MEMORY[0x1E0CB8A50]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueWithExpectedClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *MEMORY[0x1E0CB9AF8];
  v13 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB9AF8]);
  v14 = (_QWORD *)MEMORY[0x1E0CB9A68];
  if (v13)
  {
    v15 = (id *)MEMORY[0x1E0CB8890];
LABEL_7:
    v16 = *v15;
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB9A68]))
  {
    v15 = (id *)MEMORY[0x1E0CB8860];
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB9A40]))
  {
    v15 = (id *)MEMORY[0x1E0CB8880];
    goto LABEL_7;
  }
  NSLog(CFSTR("Service type \"%@\" not implemented"), v6);
  v16 = 0;
LABEL_8:
  objc_msgSend(v7, "responseForCharacteristicType:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "valueWithExpectedClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HFCharacteristicValueDisplayMetadata setPrimaryState:](self, "setPrimaryState:", 1);
    v19 = *MEMORY[0x1E0CB9A40];
    v25[0] = v12;
    v25[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueDisplayMetadata setPriority:](self, "setPriority:", objc_msgSend(v20, "containsObject:", v6) - 1);

    if (objc_msgSend(v9, "integerValue") || objc_msgSend(v11, "integerValue"))
    {
      -[HFCharacteristicValueDisplayMetadata setPrimaryState:](self, "setPrimaryState:", 2);
      v21 = -[HFCharacteristicValueDisplayMetadata priority](self, "priority");
      if (v21 <= 1)
        v22 = 1;
      else
        v22 = v21;
      -[HFCharacteristicValueDisplayMetadata setPriority:](self, "setPriority:", v22);
    }
    v14 = (_QWORD *)MEMORY[0x1E0CB9A68];
  }
  else
  {
    v19 = *MEMORY[0x1E0CB9A40];
  }
  if ((objc_msgSend(v6, "isEqualToString:", v19) & 1) != 0)
  {
    v23 = CFSTR("HFStatusSortKeyHumiditySensor");
LABEL_23:
    _HFLocalizedStringWithDefaultValue(v23, v23, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueDisplayMetadata setSortKey:](self, "setSortKey:", v24);

    goto LABEL_24;
  }
  if ((objc_msgSend(v6, "isEqualToString:", *v14) & 1) != 0)
  {
    v23 = CFSTR("HFStatusSortKeyLightSensor");
    goto LABEL_23;
  }
  if (objc_msgSend(v6, "isEqualToString:", v12))
  {
    v23 = CFSTR("HFStatusSortKeyTemperatureSensor");
    goto LABEL_23;
  }
LABEL_24:

}

- (void)parseActiveStateForServiceType:(id)a3 response:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(a4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8790]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueWithExpectedClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v7, "BOOLValue"))
      v8 = 2;
    else
      v8 = 1;
    -[HFCharacteristicValueDisplayMetadata setPrimaryState:](self, "setPrimaryState:", v8);
    if (-[HFCharacteristicValueDisplayMetadata primaryState](self, "primaryState") == 2)
      v9 = 0;
    else
      v9 = -1;
    -[HFCharacteristicValueDisplayMetadata setPriority:](self, "setPriority:", v9);
  }
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB9B10]))
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusSortKeyFan"), CFSTR("HFStatusSortKeyFan"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueDisplayMetadata setSortKey:](self, "setSortKey:", v10);

  }
}

- (void)parseGarageDoorOpenerResponse:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  v4 = *MEMORY[0x1E0CB8838];
  v5 = a3;
  objc_msgSend(v5, "responseForCharacteristicType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueWithExpectedClass:", objc_opt_class());
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "responseForCharacteristicType:", *MEMORY[0x1E0CB8AA8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueWithExpectedClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "responseForCharacteristicType:", *MEMORY[0x1E0CB8980]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "valueWithExpectedClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    v11 = v8 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    v12 = objc_msgSend(v20, "integerValue");
    v13 = objc_msgSend(v8, "integerValue");
    if (v12 > 4)
      v14 = 0;
    else
      v14 = qword_1DD6697B0[v12];
    -[HFCharacteristicValueDisplayMetadata setPrimaryState:](self, "setPrimaryState:", v14);
    if (v13 == v12)
    {
      if (-[HFCharacteristicValueDisplayMetadata primaryState](self, "primaryState") == 1)
        v15 = -1;
      else
        v15 = 1;
    }
    else
    {
      if (v13 > 4)
        v16 = 0;
      else
        v16 = qword_1DD6697B0[v13];
      -[HFCharacteristicValueDisplayMetadata setTransitioningPrimaryState:](self, "setTransitioningPrimaryState:", v16);
      v15 = 1;
    }
    -[HFCharacteristicValueDisplayMetadata setPriority:](self, "setPriority:", v15);
  }
  if (objc_msgSend(v10, "BOOLValue"))
  {
    -[HFCharacteristicValueDisplayMetadata setPrimaryState:](self, "setPrimaryState:", 2);
    v17 = -[HFCharacteristicValueDisplayMetadata priority](self, "priority");
    if (v17 <= 1)
      v18 = 1;
    else
      v18 = v17;
    -[HFCharacteristicValueDisplayMetadata setPriority:](self, "setPriority:", v18);
  }
  _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusSortKeyGarageDoor"), CFSTR("HFStatusSortKeyGarageDoor"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicValueDisplayMetadata setSortKey:](self, "setSortKey:", v19);

}

- (void)parseThermostatResponse:(id)a3 serviceType:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = *MEMORY[0x1E0CB8890];
  v7 = a4;
  objc_msgSend(v23, "responseForCharacteristicType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueWithExpectedClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "responseForCharacteristicType:", *MEMORY[0x1E0CB8B08]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueWithExpectedClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[HFTemperatureItemUtilities currentHeatingCoolingModeValueInResponse:](HFTemperatureItemUtilities, "currentHeatingCoolingModeValueInResponse:", v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFTemperatureItemUtilities targetHeatingCoolingModeValueInResponse:](HFTemperatureItemUtilities, "targetHeatingCoolingModeValueInResponse:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB9B00]);

  objc_msgSend(v23, "allServices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "na_firstObjectPassingTest:", &__block_literal_global_152_1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v23, "responseForCharacteristicType:inService:", *MEMORY[0x1E0CB8790], v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueWithExpectedClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_17;
  }
  else
  {
    v18 = 0;
    if (!v9)
      goto LABEL_17;
  }
  if (v11)
  {
    if (!v12)
      goto LABEL_17;
  }
  else
  {
    if (v12)
      v19 = v14;
    else
      v19 = 1;
    if ((v19 & 1) != 0)
      goto LABEL_17;
  }
  if (v13)
  {
    v20 = objc_msgSend(v13, "integerValue");
    if ((unint64_t)(v20 - 1) < 3)
      goto LABEL_14;
    if (v20)
      goto LABEL_16;
    if (objc_msgSend(v12, "integerValue") || v18 && (objc_msgSend(v18, "isEqual:", MEMORY[0x1E0C9AAA0]) & 1) == 0)
LABEL_14:
      v21 = 2;
    else
      v21 = 1;
    -[HFCharacteristicValueDisplayMetadata setPrimaryState:](self, "setPrimaryState:", v21);
LABEL_16:
    -[HFCharacteristicValueDisplayMetadata setPriority:](self, "setPriority:", 0);
  }
LABEL_17:
  _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusSortKeyThermostat"), CFSTR("HFStatusSortKeyThermostat"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicValueDisplayMetadata setSortKey:](self, "setSortKey:", v22);

}

- (void)parsePowerStateForServiceType:(id)a3 response:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(a4, "responseForCharacteristicType:", *MEMORY[0x1E0CB89C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueWithExpectedClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v7, "BOOLValue"))
      v8 = 2;
    else
      v8 = 1;
    -[HFCharacteristicValueDisplayMetadata setPrimaryState:](self, "setPrimaryState:", v8);
    if (-[HFCharacteristicValueDisplayMetadata primaryState](self, "primaryState") == 2)
      v9 = 0;
    else
      v9 = -1;
    -[HFCharacteristicValueDisplayMetadata setPriority:](self, "setPriority:", v9);
  }
  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB9A10]) & 1) != 0)
  {
    v10 = CFSTR("HFStatusSortKeyFan");
LABEL_17:
    _HFLocalizedStringWithDefaultValue(v10, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueDisplayMetadata setSortKey:](self, "setSortKey:", v11);

    goto LABEL_18;
  }
  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB9A70]) & 1) != 0)
  {
    v10 = CFSTR("HFStatusSortKeyLightbulb");
    goto LABEL_17;
  }
  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB9AA0]) & 1) != 0)
  {
    v10 = CFSTR("HFStatusSortKeyOutlet");
    goto LABEL_17;
  }
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB9AD8]))
  {
    v10 = CFSTR("HFStatusSortKeySwitch");
    goto LABEL_17;
  }
LABEL_18:

}

- (void)setSortKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setPrimaryState:(int64_t)a3
{
  self->_primaryState = a3;
}

uint64_t __109__HFCharacteristicValueDisplayMetadata__unknownStatePriorityForServiceDescriptor_characteristicReadResponse___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_isSuspended");

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splitAccountFuture, 0);
  objc_storeStrong((id *)&self->_serviceState, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sortKey, 0);
}

uint64_t __93__HFCharacteristicValueDisplayMetadata_displayMetadataForService_characteristicReadResponse___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_msgSend(v3, "isReachable") & 1) == 0)
  {
    HFLogForCategory(0x38uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "hf_prettyDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Displaying unreachable for accessory: %@", (uint8_t *)&v8, 0xCu);

    }
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)displayMetadataForAccessory:(id)a3 withContextProvider:(id)a4
{
  id v6;
  id v7;
  HFCharacteristicValueDisplayMetadata *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(HFCharacteristicValueDisplayMetadata);
  -[HFCharacteristicValueDisplayMetadata setPrimaryState:](v8, "setPrimaryState:", 1);
  -[HFCharacteristicValueDisplayMetadata setPriority:](v8, "setPriority:", -1);
  if ((objc_msgSend(v6, "isReachable") & 1) == 0)
  {
    -[HFCharacteristicValueDisplayMetadata setPrimaryState:](v8, "setPrimaryState:", 0);
    -[HFCharacteristicValueDisplayMetadata setPriority:](v8, "setPriority:", 1);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 35);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFCharacteristicValueDisplayError errorWithUnderlyingError:readTraits:contextProvider:](HFCharacteristicValueDisplayError, "errorWithUnderlyingError:readTraits:contextProvider:", v9, v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueDisplayMetadata setError:](v8, "setError:", v11);

  }
  objc_msgSend(v6, "hf_siriEndpointProfile");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[HFCharacteristicValueDisplayMetadata error](v8, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(v6, "hf_errorForCurrentSessionState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[HFCharacteristicValueDisplayError errorWithUnderlyingError:readTraits:contextProvider:](HFCharacteristicValueDisplayError, "errorWithUnderlyingError:readTraits:contextProvider:", v15, v16, v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFCharacteristicValueDisplayMetadata setError:](v8, "setError:", v17);

      }
    }
  }
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
  {
    -[HFCharacteristicValueDisplayMetadata error](v8, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      objc_msgSend(a1, "_overrideDisplayErrorCategoryWithThreadNetworkErrorForDisplayMetadata:withAccessory:", v8, v6);
  }
  -[HFCharacteristicValueDisplayMetadata error](v8, "error");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    +[HFSymptomFixManager sharedManager](HFSymptomFixManager, "sharedManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "anySymptomIsBeingFixedForFixableObject:", v6);

    objc_msgSend(v6, "symptomsHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_errorForSymptomHandler:isFixingCurrently:withContextProvider:", v22, v21, v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueDisplayMetadata setError:](v8, "setError:", v23);

  }
  -[HFCharacteristicValueDisplayMetadata error](v8, "error");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isPersistentError");

  if (v25)
    -[HFCharacteristicValueDisplayMetadata setPriority:](v8, "setPriority:", 0);

  return v8;
}

+ (id)_errorForSymptomHandler:(id)a3 isFixingCurrently:(BOOL)a4 withContextProvider:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v7 = a5;
  objc_msgSend(a3, "hf_symptomsSortedByPriority");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFCharacteristicValueDisplayError errorWithUnderlyingSymptom:isFixingCurrently:contextProvider:](HFCharacteristicValueDisplayError, "errorWithUnderlyingSymptom:isFixingCurrently:contextProvider:", v9, v5, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)primaryState
{
  return self->_primaryState;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HFCharacteristicValueDisplayMetadata splitAccountFuture](self, "splitAccountFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)HFCharacteristicValueDisplayMetadata;
  -[HFCharacteristicValueDisplayMetadata dealloc](&v4, sel_dealloc);
}

- (NAFuture)splitAccountFuture
{
  return self->_splitAccountFuture;
}

- (int64_t)transitioningPrimaryState
{
  return self->_transitioningPrimaryState;
}

- (NSString)sortKey
{
  return self->_sortKey;
}

- (int64_t)priority
{
  return self->_priority;
}

- (HFServiceState)serviceState
{
  return self->_serviceState;
}

uint64_t __93__HFCharacteristicValueDisplayMetadata_displayMetadataForService_characteristicReadResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allCharacteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__HFCharacteristicValueDisplayMetadata_displayMetadataForService_characteristicReadResponse___block_invoke_2;
  v9[3] = &unk_1EA72BB50;
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_filter:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_90_1);
  return v7;
}

uint64_t __76__HFCharacteristicValueDisplayMetadata_parseThermostatResponse_serviceType___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9B10]);

  return v3;
}

void __109__HFCharacteristicValueDisplayMetadata__unknownStatePriorityForServiceDescriptor_characteristicReadResponse___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB9A00];
  v7[0] = *MEMORY[0x1E0CB99E8];
  v7[1] = v1;
  v2 = *MEMORY[0x1E0CB9A80];
  v7[2] = *MEMORY[0x1E0CB9A28];
  v7[3] = v2;
  v3 = *MEMORY[0x1E0CB9AB8];
  v7[4] = *MEMORY[0x1E0CB9AA8];
  v7[5] = v3;
  v7[6] = *MEMORY[0x1E0CB9B28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED3790A0;
  qword_1ED3790A0 = v5;

}

void __93__HFCharacteristicValueDisplayMetadata_displayMetadataForService_characteristicReadResponse___block_invoke_2_101()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[9];

  v8[8] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB99E0];
  v8[0] = *MEMORY[0x1E0CB99B0];
  v8[1] = v1;
  v2 = *MEMORY[0x1E0CB99F0];
  v8[2] = *MEMORY[0x1E0CB99E8];
  v8[3] = v2;
  v3 = *MEMORY[0x1E0CB9A90];
  v8[4] = *MEMORY[0x1E0CB9A60];
  v8[5] = v3;
  v4 = *MEMORY[0x1E0CB9AB8];
  v8[6] = *MEMORY[0x1E0CB9A98];
  v8[7] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1ED379090;
  qword_1ED379090 = v6;

}

+ (void)_overrideDisplayErrorCategoryWithThreadNetworkErrorForDisplayMetadata:(id)a3 withAccessory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "supportsCHIP") || !objc_msgSend(v6, "requiresThreadRouter"))
    goto LABEL_6;
  objc_msgSend(v5, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "category") == 1)
  {

    goto LABEL_8;
  }
  objc_msgSend(v5, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "category");

  if (v9)
  {
LABEL_6:
    HFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v6, "supportsCHIP");
      v12 = +[HFUtilities supportsThreadService](HFUtilities, "supportsThreadService");
      objc_msgSend(v6, "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hf_hasResident");
      objc_msgSend(v5, "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 136316162;
      v26 = "+[HFCharacteristicValueDisplayMetadata _overrideDisplayErrorCategoryWithThreadNetworkErrorForDisplayMetadata"
            ":withAccessory:]";
      v27 = 1024;
      v28 = v11;
      v29 = 1024;
      v30 = v12;
      v31 = 1024;
      v32 = v14;
      v33 = 2048;
      v34 = objc_msgSend(v15, "category");
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "%s not overriding error category due to no thread network: [accessory supportsCHIP = %d], [HFUtilities supportsThreadService] = %d, hasResident = %d, displayMetadata.error.category = %lu", (uint8_t *)&v25, 0x28u);

    }
    goto LABEL_21;
  }
LABEL_8:
  if (!+[HFUtilities supportsThreadService](HFUtilities, "supportsThreadService"))
  {
    HFLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 136315138;
      v26 = "+[HFCharacteristicValueDisplayMetadata _overrideDisplayErrorCategoryWithThreadNetworkErrorForDisplayMetadata"
            ":withAccessory:]";
      _os_log_impl(&dword_1DD34E000, v23, OS_LOG_TYPE_DEFAULT, "%s overriding error category to HFCharacteristicValueDisplayErrorCategoryUnreachableCurrentDeviceNoThreadNetwork", (uint8_t *)&v25, 0xCu);
    }

    objc_msgSend(v5, "error");
    v21 = objc_claimAutoreleasedReturnValue();
    v10 = v21;
    v22 = 4;
    goto LABEL_20;
  }
  objc_msgSend(v6, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hf_hasResident");

  if ((v17 & 1) == 0)
  {
    HFLogForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 136315138;
      v26 = "+[HFCharacteristicValueDisplayMetadata _overrideDisplayErrorCategoryWithThreadNetworkErrorForDisplayMetadata"
            ":withAccessory:]";
      _os_log_impl(&dword_1DD34E000, v24, OS_LOG_TYPE_DEFAULT, "%s overriding error category to HFCharacteristicValueDisplayErrorCategoryUnreachableNoThreadNetworkNoResident", (uint8_t *)&v25, 0xCu);
    }

    objc_msgSend(v5, "error");
    v21 = objc_claimAutoreleasedReturnValue();
    v10 = v21;
    v22 = 2;
    goto LABEL_20;
  }
  objc_msgSend(v6, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hf_hasResidentDeviceCapableOfSupportingThreadBorderRouter");

  if ((v19 & 1) == 0)
  {
    HFLogForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 136315138;
      v26 = "+[HFCharacteristicValueDisplayMetadata _overrideDisplayErrorCategoryWithThreadNetworkErrorForDisplayMetadata"
            ":withAccessory:]";
      _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "%s overriding error category to HFCharacteristicValueDisplayErrorCategoryUnreachableNoThreadNetworkResidentWithoutThread", (uint8_t *)&v25, 0xCu);
    }

    objc_msgSend(v5, "error");
    v21 = objc_claimAutoreleasedReturnValue();
    v10 = v21;
    v22 = 3;
LABEL_20:
    -[NSObject setCategory:](v21, "setCategory:", v22);
LABEL_21:

  }
}

+ (id)displayMetadataForMediaProfile:(id)a3 withContextProvider:(id)a4
{
  id v6;
  id v7;
  HFCharacteristicValueDisplayMetadata *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  void *v50;
  int v51;
  void *v52;
  int v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[5];
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  int v71;
  __int16 v72;
  int v73;
  __int16 v74;
  int v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(HFCharacteristicValueDisplayMetadata);
  -[HFCharacteristicValueDisplayMetadata setPriority:](v8, "setPriority:", -1);
  v9 = MEMORY[0x1E0C809B0];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __91__HFCharacteristicValueDisplayMetadata_displayMetadataForMediaProfile_withContextProvider___block_invoke;
  v63[3] = &unk_1EA7324A0;
  v10 = v6;
  v63[4] = v10;
  -[HFCharacteristicValueDisplayMetadata setPrimaryState:](v8, "setPrimaryState:", __91__HFCharacteristicValueDisplayMetadata_displayMetadataForMediaProfile_withContextProvider___block_invoke((uint64_t)v63));
  objc_msgSend(v10, "hf_mediaValueSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hf_mediaRouteIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v11;
  objc_msgSend(v11, "cachedPlaybackStateWriteErrorForRouteID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = v13;
  if (!objc_msgSend(v10, "hf_isReachable") || v13)
  {
    -[HFCharacteristicValueDisplayMetadata setPrimaryState:](v8, "setPrimaryState:", 0);
    -[HFCharacteristicValueDisplayMetadata setPriority:](v8, "setPriority:", 1);
    if (v13)
    {
      v18 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 35);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v18;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFCharacteristicValueDisplayError errorWithUnderlyingError:readTraits:contextProvider:](HFCharacteristicValueDisplayError, "errorWithUnderlyingError:readTraits:contextProvider:", v17, v19, v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueDisplayMetadata setError:](v8, "setError:", v20);

    goto LABEL_11;
  }
  objc_msgSend(v10, "hf_backingAccessory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hf_siriEndpointProfile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_12;
  objc_msgSend(v10, "hf_backingAccessory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hf_errorForCurrentSessionState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    goto LABEL_10;
LABEL_11:

LABEL_12:
  -[HFCharacteristicValueDisplayMetadata error](v8, "error");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {

    goto LABEL_14;
  }
  objc_msgSend(v10, "symptomsHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
LABEL_14:
    objc_msgSend(v10, "symptoms");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v9;
    v61[1] = 3221225472;
    v61[2] = __91__HFCharacteristicValueDisplayMetadata_displayMetadataForMediaProfile_withContextProvider___block_invoke_2;
    v61[3] = &unk_1EA7324C8;
    v62 = v10;
    v23 = objc_msgSend(v22, "na_any:", v61);

    if (!v23)
      goto LABEL_18;
  }
  +[HFSymptomFixManager sharedManager](HFSymptomFixManager, "sharedManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "anySymptomIsBeingFixedForFixableObject:", v10);

  objc_msgSend(v10, "symptomsHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_errorForSymptomHandler:isFixingCurrently:withContextProvider:", v27, v26, v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicValueDisplayMetadata setError:](v8, "setError:", v28);

LABEL_18:
  if (objc_msgSend(v10, "hf_homePodIsCapableOfShowingSplitAccountError"))
  {
    -[HFCharacteristicValueDisplayMetadata error](v8, "error");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "underlyingSymptom");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
      objc_msgSend(a1, "_displayAppleIDSplitErrorForMediaProfile:havingMetadata:withContextProvider:", v10, v8, v7);
  }
  -[HFCharacteristicValueDisplayMetadata error](v8, "error");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isPersistentError");

  if (v32)
    -[HFCharacteristicValueDisplayMetadata setPriority:](v8, "setPriority:", 0);
  +[HFMediaAccessoryUtility sharedInstance](HFMediaAccessoryUtility, "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "UUIDString");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v33, "isHomePodRestartingCurrently:", v35);

  +[HFMediaAccessoryUtility sharedInstance](HFMediaAccessoryUtility, "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hf_backingAccessory");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "uniqueIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "UUIDString");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v37, "isHomePodRestartingCurrently:", v40);

  if ((v36 & 1) != 0 || v41)
  {
    HFLogForCategory(0);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "hf_backingAccessory");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "uniqueIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hf_backingAccessory");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "hf_isHomePod");
      *(_DWORD *)buf = 136316418;
      v65 = "+[HFCharacteristicValueDisplayMetadata displayMetadataForMediaProfile:withContextProvider:]";
      v66 = 2112;
      v67 = v44;
      v68 = 2112;
      v69 = v45;
      v70 = 1024;
      v71 = v47;
      v72 = 1024;
      v73 = v36;
      v74 = 1024;
      v75 = v41;
      _os_log_impl(&dword_1DD34E000, v42, OS_LOG_TYPE_DEFAULT, "%s mediaProfile.hf_backingAccessory.uniqueIdentifier: %@ mediaProfile.uniqueIdentifier: %@ HomePod: %{BOOL}d IsGroupedAccessoryRestarting: %{BOOL}d IsSoloAccessoryRestarting: %{BOOL}d", buf, 0x32u);

    }
  }
  objc_msgSend(v10, "uniqueIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
    v49 = v36;
  else
    v49 = 0;

  if (v49 == 1)
    goto LABEL_40;
  -[HFCharacteristicValueDisplayMetadata error](v8, "error");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
    v51 = 0;
  else
    v51 = v41;
  if (v51 != 1)
    goto LABEL_41;
  objc_msgSend(v10, "hf_backingAccessory");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "hf_isHomePod");

  v54 = v60;
  if (v53)
  {
    HFLogForCategory(0);
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v65 = "+[HFCharacteristicValueDisplayMetadata displayMetadataForMediaProfile:withContextProvider:]";
      _os_log_impl(&dword_1DD34E000, v55, OS_LOG_TYPE_DEFAULT, "%s HomePodDeviceRestarting setting displayMetadata", buf, 0xCu);
    }

LABEL_40:
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 58);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFCharacteristicValueDisplayError errorWithUnderlyingError:readTraits:contextProvider:](HFCharacteristicValueDisplayError, "errorWithUnderlyingError:readTraits:contextProvider:", v50, v56, v7);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueDisplayMetadata setError:](v8, "setError:", v57);

    -[HFCharacteristicValueDisplayMetadata setPriority:](v8, "setPriority:", 0);
LABEL_41:

    v54 = v60;
  }

  return v8;
}

uint64_t __91__HFCharacteristicValueDisplayMetadata_displayMetadataForMediaProfile_withContextProvider___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaSession");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "playbackState") == 1)
    v2 = 2;
  else
    v2 = 1;

  return v2;
}

uint64_t __91__HFCharacteristicValueDisplayMetadata_displayMetadataForMediaProfile_withContextProvider___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = objc_msgSend(a2, "type");
  if (v3 > 0x14)
    return 0;
  v4 = v3;
  if (((1 << v3) & 0x180806) == 0)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hf_shouldDisplayManualFixOptionForSymptom:", v4);

  return v7;
}

+ (void)_displayAppleIDSplitErrorForMediaProfile:(id)a3 havingMetadata:(id)a4 withContextProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24[2];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "hf_settingsValueManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForSettingAtKeyPath:", CFSTR("root.home.dismissedHomePodHasNonMemberMediaAccountWarning"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  HFLogForCategory(5uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v26 = a1;
    v27 = 2112;
    v28 = v16;
    v29 = 1024;
    v30 = v14;
    _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ Was the Split Account warning dismissed? [%d]", buf, 0x1Cu);

  }
  objc_initWeak((id *)buf, a1);
  objc_msgSend(v9, "hf_homePodSupportsMultiUserLanguage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    v18 = v14;
  else
    v18 = 1;
  if ((v18 & 1) == 0)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __116__HFCharacteristicValueDisplayMetadata__displayAppleIDSplitErrorForMediaProfile_havingMetadata_withContextProvider___block_invoke;
    v20[3] = &unk_1EA732518;
    objc_copyWeak(v24, (id *)buf);
    v21 = v10;
    v22 = v9;
    v23 = v11;
    v24[1] = (id)a2;
    v19 = (id)objc_msgSend(v17, "addCompletionBlock:", v20);

    objc_destroyWeak(v24);
  }

  objc_destroyWeak((id *)buf);
}

void __116__HFCharacteristicValueDisplayMetadata__displayAppleIDSplitErrorForMediaProfile_havingMetadata_withContextProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17[2];
  _BYTE location[12];
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v6)
  {
    HFLogForCategory(5uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412802;
      *(_QWORD *)&location[4] = WeakRetained;
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v6;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "%@:%@ Other Error returned %@", location, 0x20u);

    }
  }
  else
  {
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    if ((objc_msgSend(*(id *)(a1 + 40), "hf_supportsPreferredMediaUser") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "hf_homePodMediaAccountIsMismatchedWithHomeMediaAccount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSplitAccountFuture:", v9);

    }
    objc_msgSend(*(id *)(a1 + 32), "splitAccountFuture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __116__HFCharacteristicValueDisplayMetadata__displayAppleIDSplitErrorForMediaProfile_havingMetadata_withContextProvider___block_invoke_2;
    v15[3] = &unk_1EA7324F0;
    objc_copyWeak(v17, (id *)location);
    v15[4] = WeakRetained;
    v11 = *(id *)(a1 + 48);
    v12 = *(void **)(a1 + 64);
    v16 = v11;
    v17[1] = v12;
    v13 = (id)objc_msgSend(v10, "addCompletionBlock:", v15);

    objc_destroyWeak(v17);
    objc_destroyWeak((id *)location);
  }

}

void __116__HFCharacteristicValueDisplayMetadata__displayAppleIDSplitErrorForMediaProfile_havingMetadata_withContextProvider___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!v4)
  {
    HFLogForCategory(5uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_8:

      goto LABEL_9;
    }
    v7 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ No Error returned. Accounts don't appear to be split", (uint8_t *)&v10, 0x16u);
LABEL_6:

    goto LABEL_8;
  }
  if (objc_msgSend(v4, "code") != 56)
  {
    HFLogForCategory(5uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v9 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v9;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "%@:%@ Other Error returned %@", (uint8_t *)&v10, 0x20u);
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "_populateSplitMediaAccountErrorForMedatadata:withContextProvider:", WeakRetained, *(_QWORD *)(a1 + 40));
LABEL_9:

}

+ (void)_populateSplitMediaAccountErrorForMedatadata:(id)a3 withContextProvider:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "hf_errorWithCode:", 56);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCharacteristicValueDisplayError errorWithUnderlyingError:readTraits:contextProvider:](HFCharacteristicValueDisplayError, "errorWithUnderlyingError:readTraits:contextProvider:", v10, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setError:", v9);
}

- (void)parseSecuritySystemResponse:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  v4 = *MEMORY[0x1E0CB8888];
  v5 = a3;
  objc_msgSend(v5, "responseForCharacteristicType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueWithExpectedClass:", objc_opt_class());
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "responseForCharacteristicType:", *MEMORY[0x1E0CB8B00]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueWithExpectedClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "responseForCharacteristicType:", *MEMORY[0x1E0CB8A68]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueWithExpectedClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "responseForCharacteristicType:", *MEMORY[0x1E0CB8A50]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "valueWithExpectedClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    v13 = v8 == 0;
  else
    v13 = 1;
  if (v13)
    goto LABEL_27;
  v14 = objc_msgSend(v22, "integerValue");
  v15 = objc_msgSend(v8, "integerValue");
  if (v14 >= 3)
  {
    if (v14 == 3)
    {
      v17 = 1;
    }
    else
    {
      if (v14 == 4)
        goto LABEL_8;
      v17 = 0;
    }
    -[HFCharacteristicValueDisplayMetadata setPrimaryState:](self, "setPrimaryState:", v17);
    goto LABEL_13;
  }
LABEL_8:
  v16 = 2;
  -[HFCharacteristicValueDisplayMetadata setPrimaryState:](self, "setPrimaryState:", 2);
  if (v14 != 4)
  {
LABEL_13:
    if (v15 != v14)
    {
      if (v15 > 4)
        v18 = 0;
      else
        v18 = qword_1DD6697F8[v15];
      -[HFCharacteristicValueDisplayMetadata setTransitioningPrimaryState:](self, "setTransitioningPrimaryState:", v18);
      v14 = v15;
    }
    if (v14 == 4)
      v16 = 2;
    else
      v16 = v14 == 3;
  }
  -[HFCharacteristicValueDisplayMetadata setPriority:](self, "setPriority:", v16);
  if (objc_msgSend(v10, "integerValue") || objc_msgSend(v12, "integerValue"))
  {
    -[HFCharacteristicValueDisplayMetadata setPrimaryState:](self, "setPrimaryState:", 2);
    v19 = -[HFCharacteristicValueDisplayMetadata priority](self, "priority");
    if (v19 <= 2)
      v20 = 2;
    else
      v20 = v19;
    -[HFCharacteristicValueDisplayMetadata setPriority:](self, "setPriority:", v20);
  }
LABEL_27:
  _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusSortKeySecurityAlarm"), CFSTR("HFStatusSortKeySecurityAlarm"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicValueDisplayMetadata setSortKey:](self, "setSortKey:", v21);

}

- (void)parseAirPurifierResponse:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "responseForCharacteristicType:", *MEMORY[0x1E0CB8790]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueWithExpectedClass:", objc_opt_class());
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v8, "BOOLValue"))
      v5 = 2;
    else
      v5 = 1;
    -[HFCharacteristicValueDisplayMetadata setPrimaryState:](self, "setPrimaryState:", v5);
    if (-[HFCharacteristicValueDisplayMetadata primaryState](self, "primaryState") == 2)
      v6 = 0;
    else
      v6 = -1;
    -[HFCharacteristicValueDisplayMetadata setPriority:](self, "setPriority:", v6);
  }
  _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusSortKeyAirPurifier"), CFSTR("HFStatusSortKeyAirPurifier"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicValueDisplayMetadata setSortKey:](self, "setSortKey:", v7);

}

- (void)parseHumidifierDehumidifierResponse:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v16;
  void *v17;
  id v18;

  v4 = *MEMORY[0x1E0CB8880];
  v5 = a3;
  objc_msgSend(v5, "responseForCharacteristicType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueWithExpectedClass:", objc_opt_class());
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "responseForCharacteristicType:", *MEMORY[0x1E0CB8858]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueWithExpectedClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "responseForCharacteristicType:", *MEMORY[0x1E0CB8AD0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueWithExpectedClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "responseForCharacteristicType:", *MEMORY[0x1E0CB8790]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "valueWithExpectedClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    v13 = v8 == 0;
  else
    v13 = 1;
  if (!v13 && v10 != 0 && v12 != 0)
  {
    if (objc_msgSend(v12, "BOOLValue"))
    {
      if ((unint64_t)objc_msgSend(v10, "integerValue") > 2)
      {
LABEL_16:
        -[HFCharacteristicValueDisplayMetadata setPriority:](self, "setPriority:", 0);
        goto LABEL_17;
      }
      v16 = 2;
    }
    else
    {
      v16 = 1;
    }
    -[HFCharacteristicValueDisplayMetadata setPrimaryState:](self, "setPrimaryState:", v16);
    goto LABEL_16;
  }
LABEL_17:
  _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusSortKeyHumidifierDehumidifier"), CFSTR("HFStatusSortKeyHumidifierDehumidifier"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicValueDisplayMetadata setSortKey:](self, "setSortKey:", v17);

}

- (void)parseCurrentTargetPositionForServiceType:(id)a3 response:(id)a4
{
  uint64_t v7;
  id v8;
  char v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v7 = *MEMORY[0x1E0CB9B30];
  v8 = a4;
  v9 = objc_msgSend(v28, "isEqualToString:", v7);
  v10 = (_QWORD *)MEMORY[0x1E0CB9A00];
  v11 = (_QWORD *)MEMORY[0x1E0CB9B28];
  if ((v9 & 1) == 0
    && (objc_msgSend(v28, "isEqualToString:", *MEMORY[0x1E0CB9B28]) & 1) == 0
    && (objc_msgSend(v28, "isEqualToString:", *v10) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicValueDisplayMetadata.m"), 1277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[serviceType isEqualToString:HMServiceTypeWindowCovering] || [serviceType isEqualToString:HMServiceTypeWindow] || [serviceType isEqualToString:HMServiceTypeDoor]"));

  }
  objc_msgSend(v8, "responseForCharacteristicType:", *MEMORY[0x1E0CB8878]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueWithExpectedClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "responseForCharacteristicType:", *MEMORY[0x1E0CB8AF0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueWithExpectedClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "responseForCharacteristicType:", *MEMORY[0x1E0CB8980]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "valueWithExpectedClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v18 = v15 == 0;
  else
    v18 = 1;
  if (!v18)
  {
    if (objc_msgSend(v13, "integerValue") < 1)
      v19 = 1;
    else
      v19 = 2;
    -[HFCharacteristicValueDisplayMetadata setPrimaryState:](self, "setPrimaryState:", v19);
    v20 = objc_msgSend(v28, "isEqualToString:", v7) ^ 1;
    if ((objc_msgSend(v17, "BOOLValue") & 1) != 0
      || (v21 = objc_msgSend(v15, "integerValue"), v21 == objc_msgSend(v13, "integerValue")))
    {
      if (-[HFCharacteristicValueDisplayMetadata primaryState](self, "primaryState") != 2)
        v20 = -1;
    }
    else
    {
      if (objc_msgSend(v15, "integerValue") < 1)
        v22 = 1;
      else
        v22 = 2;
      -[HFCharacteristicValueDisplayMetadata setTransitioningPrimaryState:](self, "setTransitioningPrimaryState:", v22);
    }
    -[HFCharacteristicValueDisplayMetadata setPriority:](self, "setPriority:", v20);
  }
  if (objc_msgSend(v17, "BOOLValue"))
  {
    -[HFCharacteristicValueDisplayMetadata setPrimaryState:](self, "setPrimaryState:", 2);
    v23 = -[HFCharacteristicValueDisplayMetadata priority](self, "priority");
    if (v23 <= 1)
      v24 = 1;
    else
      v24 = v23;
    -[HFCharacteristicValueDisplayMetadata setPriority:](self, "setPriority:", v24);
  }
  if ((objc_msgSend(v28, "isEqualToString:", *v10) & 1) != 0)
  {
    v25 = CFSTR("HFStatusSortKeyDoor");
LABEL_33:
    _HFLocalizedStringWithDefaultValue(v25, v25, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueDisplayMetadata setSortKey:](self, "setSortKey:", v26);

    goto LABEL_34;
  }
  if ((objc_msgSend(v28, "isEqualToString:", *v11) & 1) != 0)
  {
    v25 = CFSTR("HFStatusSortKeyWindow");
    goto LABEL_33;
  }
  if (objc_msgSend(v28, "isEqualToString:", v7))
  {
    v25 = CFSTR("HFStatusSortKeyBlinds");
    goto LABEL_33;
  }
LABEL_34:

}

- (void)parseProgammableSwitchOfType:(id)a3 response:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB9AC8]) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB9AD0]) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicValueDisplayMetadata.m"), 1318, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[serviceType isEqualToString:HMServiceTypeStatefulProgrammableSwitch] || [serviceType isEqualToString:HMServiceTypeStatelessProgrammableSwitch]"));

  }
  -[HFCharacteristicValueDisplayMetadata setPrimaryState:](self, "setPrimaryState:", 1);
  -[HFCharacteristicValueDisplayMetadata setPriority:](self, "setPriority:", -1);

}

- (void)setTransitioningPrimaryState:(int64_t)a3
{
  self->_transitioningPrimaryState = a3;
}

- (void)setSplitAccountFuture:(id)a3
{
  objc_storeStrong((id *)&self->_splitAccountFuture, a3);
}

@end
