@implementation MCAirPlayPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.airplay");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)localizedSingularForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("AIRPLAY_SINGULAR"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("AIRPLAY_"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCAirPlayPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCAirPlayPayload *v10;
  void *v11;
  id v12;
  os_log_t *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  MCAirPlayDestination *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  const __CFString *v30;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  int v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  const __CFString *v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  MCAirPlayDestination *v44;
  uint64_t v45;
  const __CFString *v46;
  unint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  MCAirPlayDestination *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  os_log_t *v63;
  void *v64;
  unint64_t v65;
  MCAirPlayDestination *v66;
  void *v67;
  void *v68;
  os_log_t v69;
  NSObject *v70;
  void *v71;
  MCAirPlayPayload *v72;
  id v73;
  id v74;
  os_log_t *v75;
  void *v76;
  void *v77;
  os_log_t v78;
  NSObject *v79;
  void *v80;
  id *v82;
  id *v83;
  id v84;
  id v85;
  id v86;
  MCAirPlayPayload *v87;
  MCAirPlayPayload *v88;
  MCAirPlayPayload *v89;
  id v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  id v113;
  id v114;
  objc_super v115;
  uint8_t buf[4];
  void *v117;
  __int16 v118;
  id v119;
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v115.receiver = self;
  v115.super_class = (Class)MCAirPlayPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v115, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_89;
  v114 = 0;
  +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("AllowList"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v114);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v114;
  v13 = (os_log_t *)&_MCLogObjects;
  if (v12)
  {
    v14 = v12;
    goto LABEL_80;
  }
  if (!v11)
  {
    v113 = 0;
    +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("Whitelist"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v113);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v113;
    if (v14)
    {
LABEL_80:
      v94 = v14;
      -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v14);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v67;
      if (a5)
        *a5 = objc_retainAutorelease(v67);
      v69 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
      {
        v70 = v69;
        v71 = (void *)objc_opt_class();
        v72 = v10;
        v73 = v9;
        v74 = v71;
        objc_msgSend(v68, "MCVerboseDescription");
        v75 = v13;
        v76 = v11;
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v117 = v71;
        v118 = 2114;
        v119 = v77;
        _os_log_impl(&dword_19ECC4000, v70, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

        v11 = v76;
        v13 = v75;

        v9 = v73;
        v10 = v72;

      }
      v10 = 0;
      goto LABEL_85;
    }
  }
  v91 = v11;
  if (!objc_msgSend(v9, "isStub"))
  {
    objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isSupervised");

    if (!v35)
      goto LABEL_39;
    v83 = a5;
    v85 = v9;
    v88 = v10;
    v90 = v8;
    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v36 = v91;
    v93 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v100, v121, 16);
    if (!v93)
      goto LABEL_38;
    v37 = *(_QWORD *)v101;
    v38 = 0x1E0C99000uLL;
    v39 = CFSTR("DeviceID");
    while (1)
    {
      for (i = 0; i != v93; ++i)
      {
        if (*(_QWORD *)v101 != v37)
          objc_enumerationMutation(v36);
        v41 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("Whitelist"));
          v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_71:
          v9 = v85;
          v10 = v88;
          v13 = (os_log_t *)&_MCLogObjects;
          goto LABEL_76;
        }
        objc_msgSend(v41, "objectForKey:", v39);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKey:", CFSTR("DeviceName"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || !v42
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("DeviceID"));
          v14 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_71;
        }
        if (objc_msgSend(v43, "length"))
        {
          v44 = objc_alloc_init(MCAirPlayDestination);
        }
        else
        {
          if (!objc_msgSend(v42, "length"))
            goto LABEL_36;
          v44 = objc_alloc_init(MCAirPlayDestination);
          objc_msgSend(v42, "uppercaseString");
          v45 = v37;
          v46 = v39;
          v47 = v38;
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[MCAirPlayDestination setDeviceID:](v44, "setDeviceID:", v48);

          v38 = v47;
          v39 = v46;
          v37 = v45;
        }
        objc_msgSend(v33, "addObject:", v44);

LABEL_36:
      }
      v13 = (os_log_t *)&_MCLogObjects;
      v93 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v100, v121, 16);
      if (!v93)
      {
LABEL_38:

        v10 = v88;
        -[MCAirPlayPayload setAllowListDestinations:](v88, "setAllowListDestinations:", v33);

        v8 = v90;
        a5 = v83;
        v9 = v85;
LABEL_39:
        v99 = 0;
        +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("Passwords"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v99);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        v49 = v99;
        if (v49)
        {
          v14 = v49;
          goto LABEL_78;
        }
        v83 = a5;
        v86 = v9;
        v89 = v10;
        v90 = v8;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v36 = (id)objc_claimAutoreleasedReturnValue();
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v98 = 0u;
        v33 = v33;
        v56 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v95, v120, 16);
        if (!v56)
        {
LABEL_68:

          v10 = v89;
          -[MCAirPlayPayload setDestinationsWithPasswords:](v89, "setDestinationsWithPasswords:", v36);
          v14 = 0;
          a5 = v83;
          v9 = v86;
          goto LABEL_77;
        }
        v57 = v56;
        v58 = *(_QWORD *)v96;
        v59 = 0x1E0C99000uLL;
LABEL_55:
        v60 = 0;
        while (1)
        {
          if (*(_QWORD *)v96 != v58)
            objc_enumerationMutation(v33);
          v61 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v60);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          objc_msgSend(v61, "objectForKey:", CFSTR("DeviceName"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v62 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("DeviceName"));
            v14 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_75;
          }
          v63 = v13;
          objc_msgSend(v61, "objectForKey:", CFSTR("Password"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v64 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("Password"));
            v14 = (id)objc_claimAutoreleasedReturnValue();

            v13 = v63;
            goto LABEL_75;
          }
          if (objc_msgSend(v62, "length") && objc_msgSend(v64, "length"))
          {
            v65 = v59;
            v66 = objc_alloc_init(MCAirPlayDestination);
            -[MCAirPlayDestination setDeviceName:](v66, "setDeviceName:", v62);
            -[MCAirPlayDestination setPassword:](v66, "setPassword:", v64);
            objc_msgSend(v36, "addObject:", v66);

            v59 = v65;
          }

          ++v60;
          v13 = v63;
          if (v57 == v60)
          {
            v57 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v95, v120, 16);
            if (!v57)
              goto LABEL_68;
            goto LABEL_55;
          }
        }
        +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("Passwords"));
        v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_75:

        v9 = v86;
        v10 = v89;
LABEL_76:
        a5 = v83;
        goto LABEL_77;
      }
    }
  }
  v82 = a5;
  v84 = v9;
  v87 = v10;
  v90 = v8;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v16 = v91;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v109, v123, 16);
  if (!v17)
    goto LABEL_18;
  v18 = v17;
  v19 = *(_QWORD *)v110;
  v20 = CFSTR("DeviceID");
  v21 = CFSTR("DeviceName");
  do
  {
    v22 = 0;
    v92 = v18;
    do
    {
      if (*(_QWORD *)v110 != v19)
        objc_enumerationMutation(v16);
      v23 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v22);
      objc_msgSend(v23, "objectForKey:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = objc_alloc_init(MCAirPlayDestination);
        -[MCAirPlayDestination setDeviceName:](v26, "setDeviceName:", v25);
      }
      else
      {
        if (!v24)
          goto LABEL_16;
        objc_msgSend(v24, "uppercaseString");
        v27 = v19;
        v28 = v15;
        v29 = v21;
        v30 = v20;
        v31 = v16;
        v32 = objc_claimAutoreleasedReturnValue();

        v26 = objc_alloc_init(MCAirPlayDestination);
        -[MCAirPlayDestination setDeviceID:](v26, "setDeviceID:", v32);
        v24 = (void *)v32;
        v16 = v31;
        v20 = v30;
        v21 = v29;
        v15 = v28;
        v19 = v27;
        v18 = v92;
      }
      objc_msgSend(v15, "addObject:", v26);

LABEL_16:
      ++v22;
    }
    while (v18 != v22);
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v109, v123, 16);
  }
  while (v18);
LABEL_18:

  v10 = v87;
  -[MCAirPlayPayload setAllowListDestinations:](v87, "setAllowListDestinations:", v15);

  v108 = 0;
  v8 = v90;
  +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v90, CFSTR("Passwords"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v108);
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v108;
  if (v14)
  {
    a5 = v82;
    v9 = v84;
    v13 = (os_log_t *)&_MCLogObjects;
    goto LABEL_78;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v33 = v33;
  v50 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v105;
    do
    {
      for (j = 0; j != v51; ++j)
      {
        if (*(_QWORD *)v105 != v52)
          objc_enumerationMutation(v33);
        objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * j), "objectForKey:", CFSTR("DeviceName"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54)
        {
          v55 = objc_alloc_init(MCAirPlayDestination);
          -[MCAirPlayDestination setDeviceName:](v55, "setDeviceName:", v54);
          objc_msgSend(v36, "addObject:", v55);

        }
      }
      v51 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
    }
    while (v51);
  }

  v10 = v87;
  -[MCAirPlayPayload setDestinationsWithPasswords:](v87, "setDestinationsWithPasswords:", v36);
  a5 = v82;
  v9 = v84;
  v13 = (os_log_t *)&_MCLogObjects;
  v14 = 0;
LABEL_77:

  v8 = v90;
LABEL_78:

  if (v14)
  {
    v11 = v91;
    goto LABEL_80;
  }
  v94 = 0;
  v11 = v91;
LABEL_85:
  if (objc_msgSend(v8, "count"))
  {
    v78 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
    {
      v79 = v78;
      -[MCPayload friendlyName](v10, "friendlyName");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v117 = v80;
      v118 = 2114;
      v119 = v8;
      _os_log_impl(&dword_19ECC4000, v79, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_89:
  return v10;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)MCAirPlayPayload;
  -[MCPayload stubDictionary](&v44, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCAirPlayPayload allowListDestinations](self, "allowListDestinations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v35 = v3;
    v5 = (void *)MEMORY[0x1E0C99DE8];
    -[MCAirPlayPayload allowListDestinations](self, "allowListDestinations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[MCAirPlayPayload allowListDestinations](self, "allowListDestinations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (!v9)
      goto LABEL_14;
    v10 = v9;
    v11 = *(_QWORD *)v41;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v13, "deviceName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "deviceName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v15;
          v18 = v16;
          v19 = CFSTR("DeviceName");
        }
        else
        {
          objc_msgSend(v13, "deviceID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
            continue;
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "deviceID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v15;
          v18 = v16;
          v19 = CFSTR("DeviceID");
        }
        objc_msgSend(v17, "setObject:forKey:", v18, v19);

        objc_msgSend(v7, "addObject:", v15);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (!v10)
      {
LABEL_14:

        v3 = v35;
        objc_msgSend(v35, "setObject:forKey:", v7, CFSTR("Whitelist"));

        break;
      }
    }
  }
  -[MCAirPlayPayload destinationsWithPasswords](self, "destinationsWithPasswords");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = (void *)MEMORY[0x1E0C99DE8];
    -[MCAirPlayPayload destinationsWithPasswords](self, "destinationsWithPasswords");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "arrayWithCapacity:", objc_msgSend(v23, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[MCAirPlayPayload destinationsWithPasswords](self, "destinationsWithPasswords");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v37 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          objc_msgSend(v30, "deviceName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "deviceName");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setObject:forKey:", v33, CFSTR("DeviceName"));

            objc_msgSend(v24, "addObject:", v32);
          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v27);
    }

    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("Passwords"));
  }
  return v3;
}

- (id)namesOrIdsForAllowedDestinations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("DeviceNames"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("DeviceIDs"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MCAirPlayPayload allowListDestinations](self, "allowListDestinations", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "deviceName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DeviceNames"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "deviceName");
        }
        else
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DeviceIDs"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "deviceID");
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v3;
}

- (NSArray)titlesAndDescriptions
{
  NSArray *titlesAndDescriptions;
  NSArray *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSArray *v33;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  titlesAndDescriptions = self->_titlesAndDescriptions;
  if (!titlesAndDescriptions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[MCAirPlayPayload allowListDestinations](self, "allowListDestinations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v37[0] = CFSTR("t");
      MCLocalizedString(CFSTR("AIRPLAY_ALLOW_LIST_TITLE_COLON"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = CFSTR("d");
      v38[0] = v7;
      -[MCAirPlayPayload allowListDestinations](self, "allowListDestinations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");
      MCLocalizedFormat(CFSTR("AIRPLAY_DESTINATION_COUNT"), v10, v11, v12, v13, v14, v15, v16, v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v4, "addObject:", v18);

    }
    -[MCAirPlayPayload destinationsWithPasswords](self, "destinationsWithPasswords");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20)
    {
      v35[0] = CFSTR("t");
      MCLocalizedString(CFSTR("AIRPLAY_PASSWORD_TITLE_COLON"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = CFSTR("d");
      v36[0] = v21;
      -[MCAirPlayPayload destinationsWithPasswords](self, "destinationsWithPasswords");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");
      MCLocalizedFormat(CFSTR("AIRPLAY_DESTINATION_COUNT"), v24, v25, v26, v27, v28, v29, v30, v23);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v4, "addObject:", v32);

    }
    v33 = self->_titlesAndDescriptions;
    self->_titlesAndDescriptions = v4;

    titlesAndDescriptions = self->_titlesAndDescriptions;
  }
  return titlesAndDescriptions;
}

- (id)subtitle1Label
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[MCAirPlayPayload titlesAndDescriptions](self, "titlesAndDescriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[MCAirPlayPayload titlesAndDescriptions](self, "titlesAndDescriptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("t"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)subtitle1Description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[MCAirPlayPayload titlesAndDescriptions](self, "titlesAndDescriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[MCAirPlayPayload titlesAndDescriptions](self, "titlesAndDescriptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("d"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)subtitle2Label
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[MCAirPlayPayload titlesAndDescriptions](self, "titlesAndDescriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 < 2)
  {
    v7 = 0;
  }
  else
  {
    -[MCAirPlayPayload titlesAndDescriptions](self, "titlesAndDescriptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("t"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)subtitle2Description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[MCAirPlayPayload titlesAndDescriptions](self, "titlesAndDescriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 < 2)
  {
    v7 = 0;
  }
  else
  {
    -[MCAirPlayPayload titlesAndDescriptions](self, "titlesAndDescriptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("d"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  uint64_t v5;
  _UNKNOWN **v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
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
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[MCAirPlayPayload allowListDestinations](self, "allowListDestinations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = &off_1E41DE000;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0C99DE8];
    -[MCAirPlayPayload allowListDestinations](self, "allowListDestinations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[MCAirPlayPayload allowListDestinations](self, "allowListDestinations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v40 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v15, "deviceName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            objc_msgSend(v15, "deviceName");
          else
            objc_msgSend(v15, "deviceID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v12);
    }

    v6 = &off_1E41DE000;
    MCLocalizedString(CFSTR("ALLOWED_DEVICES"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v9, v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v19);
  }
  -[MCAirPlayPayload destinationsWithPasswords](self, "destinationsWithPasswords");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    v22 = (void *)MEMORY[0x1E0C99DE8];
    -[MCAirPlayPayload destinationsWithPasswords](self, "destinationsWithPasswords");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "arrayWithCapacity:", objc_msgSend(v23, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[MCAirPlayPayload destinationsWithPasswords](self, "destinationsWithPasswords", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v36 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "deviceName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v30);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v27);
    }

    v31 = v6[133];
    MCLocalizedString(CFSTR("DESTINATIONS_WITH_PASSWORD"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sectionWithLocalizedArray:title:footer:", v24, v32, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v33);
  }
  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }
  return v3;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v31.receiver = self;
  v31.super_class = (Class)MCAirPlayPayload;
  -[MCPayload verboseDescription](&v31, sel_verboseDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCAirPlayPayload allowListDestinations](self, "allowListDestinations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Allow List   : %d entries\n"), objc_msgSend(v6, "count"));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[MCAirPlayPayload allowListDestinations](self, "allowListDestinations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v12, "deviceName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v12, "deviceName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("             %@\n"), v14);
        }
        else
        {
          objc_msgSend(v12, "deviceID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("              %@\n"), v14);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v9);
  }

  -[MCAirPlayPayload destinationsWithPasswords](self, "destinationsWithPasswords");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Passwords   : %d entries\n"), objc_msgSend(v15, "count"));

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[MCAirPlayPayload destinationsWithPasswords](self, "destinationsWithPasswords");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "deviceName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("              %@\n"), v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v18);
  }

  return v5;
}

- (NSArray)allowListDestinations
{
  return self->_allowListDestinations;
}

- (void)setAllowListDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_allowListDestinations, a3);
}

- (NSArray)destinationsWithPasswords
{
  return self->_destinationsWithPasswords;
}

- (void)setDestinationsWithPasswords:(id)a3
{
  objc_storeStrong((id *)&self->_destinationsWithPasswords, a3);
}

- (void)setTitlesAndDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_titlesAndDescriptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titlesAndDescriptions, 0);
  objc_storeStrong((id *)&self->_destinationsWithPasswords, 0);
  objc_storeStrong((id *)&self->_allowListDestinations, 0);
}

@end
