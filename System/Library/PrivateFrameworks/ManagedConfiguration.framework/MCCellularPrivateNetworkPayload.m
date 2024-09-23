@implementation MCCellularPrivateNetworkPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.cellularprivatenetwork.managed"));
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

  return MCLocalizedFormat(CFSTR("CELLULAR_PRIVATE_NETWORK_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("CELLULAR_PRIVATE_NETWORK_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)_validationErrorType:(int64_t)a3 forInvalidKey:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;

  v9 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArray(CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), (uint64_t)a2, a3, (uint64_t)a4, v4, v5, v6, v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPayloadErrorDomain"), a3, v10, CFSTR("MCFatalError"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)_checkForValidContents:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MCCellularPrivateNetworkPayload *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  MCCellularPrivateNetworkPayload *v34;
  uint64_t v35;
  MCCellularPrivateNetworkPayload *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  id obj;
  uint64_t v50;
  uint64_t v51;
  id v52;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MCCellularPrivateNetworkPayload.m"), 53, CFSTR("Invalid argument"));

  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v6;
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  v7 = 0;
  if (v47)
  {
    v48 = *(_QWORD *)v59;
    v45 = a4;
    do
    {
      v8 = 0;
      v9 = v7;
      do
      {
        if (*(_QWORD *)v59 != v48)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v8);
        objc_msgSend(v10, "objectForKey:", CFSTR("DataSetName"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          -[MCCellularPrivateNetworkPayload _validationErrorType:forInvalidKey:](self, "_validationErrorType:forInvalidKey:", 2002, CFSTR("DataSetName"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_77:

LABEL_78:
          a4 = v45;
          goto LABEL_79;
        }
        objc_msgSend(v10, "objectForKey:", CFSTR("VersionNumber"));
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          -[MCCellularPrivateNetworkPayload _validationErrorType:forInvalidKey:](self, "_validationErrorType:forInvalidKey:", 2002, CFSTR("VersionNumber"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = (void *)v12;
          goto LABEL_77;
        }
        objc_msgSend(v10, "objectForKey:", CFSTR("Geofences"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
          goto LABEL_47;
        v52 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (unint64_t)objc_msgSend(v13, "count") > 0x3E8)
        {
          v14 = v13;
          v15 = (void *)v12;
          -[MCCellularPrivateNetworkPayload _validationErrorType:forInvalidKey:](self, "_validationErrorType:forInvalidKey:", 2003, CFSTR("Geofences"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 4;
          goto LABEL_68;
        }
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v46 = v13;
        v51 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        if (!v51)
          goto LABEL_46;
        v50 = *(_QWORD *)v55;
        v43 = v12;
        v44 = v11;
        v42 = v13;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v55 != v50)
              objc_enumerationMutation(v46);
            v18 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v17);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              -[MCCellularPrivateNetworkPayload _validationErrorType:forInvalidKey:](self, "_validationErrorType:forInvalidKey:", 2003, CFSTR("Geofences"));
              v29 = objc_claimAutoreleasedReturnValue();

              v9 = (void *)v29;
LABEL_45:
              v12 = v43;
              v11 = v44;
              v13 = v42;
              goto LABEL_46;
            }
            objc_msgSend(v18, "objectForKey:", CFSTR("Longitude"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKey:", CFSTR("Latitude"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKey:", CFSTR("Radius"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKey:", CFSTR("GeofenceId"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              v23 = self;
              v24 = 2002;
              v25 = CFSTR("Longitude");
LABEL_37:
              -[MCCellularPrivateNetworkPayload _validationErrorType:forInvalidKey:](v23, "_validationErrorType:forInvalidKey:", v24, v25, v42, v43, v44);
              v26 = objc_claimAutoreleasedReturnValue();

              v27 = 0;
              v9 = (void *)v26;
              goto LABEL_38;
            }
            if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              v23 = self;
              v24 = 2002;
              v25 = CFSTR("Latitude");
              goto LABEL_37;
            }
            if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              v23 = self;
              v24 = 2002;
              v25 = CFSTR("Radius");
              goto LABEL_37;
            }
            if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              v23 = self;
              v24 = 2002;
              goto LABEL_36;
            }
            if (objc_msgSend(v52, "containsObject:", v22))
            {
              v23 = self;
              v24 = 2000;
LABEL_36:
              v25 = CFSTR("GeofenceId");
              goto LABEL_37;
            }
            objc_msgSend(v52, "addObject:", v22);
            v27 = 1;
LABEL_38:

            if (!v27)
              goto LABEL_45;
            ++v17;
          }
          while (v51 != v17);
          v28 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          v12 = v43;
          v11 = v44;
          v13 = v42;
          v51 = v28;
        }
        while (v28);
LABEL_46:

LABEL_47:
        v7 = v9;
        objc_msgSend(v10, "objectForKey:", CFSTR("CellularDataPreferred"), v42, v43, v44);
        v30 = objc_claimAutoreleasedReturnValue();
        v52 = (id)v30;
        if (!v30)
        {
LABEL_51:
          objc_msgSend(v10, "objectForKey:", CFSTR("EnableNRStandalone"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v9)
            goto LABEL_55;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if ((objc_msgSend(v9, "isEqual:", &unk_1E42127A8) & 1) != 0
              || (objc_msgSend(v9, "isEqual:", &unk_1E42127C0) & 1) != 0)
            {
LABEL_55:
              objc_msgSend(v10, "objectForKey:", CFSTR("CsgNetworkIdentifier"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                v14 = v13;
                v15 = (void *)v12;
                -[MCCellularPrivateNetworkPayload _validationErrorType:forInvalidKey:](self, "_validationErrorType:forInvalidKey:", 2003, CFSTR("CsgNetworkIdentifier"));
                v33 = v7;
                v16 = 4;
                v7 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v14 = v13;
                v15 = (void *)v12;
                objc_msgSend(v10, "objectForKey:", CFSTR("NetworkIdentifier"));
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  -[MCCellularPrivateNetworkPayload _validationErrorType:forInvalidKey:](self, "_validationErrorType:forInvalidKey:", 2003, CFSTR("NetworkIdentifier"));
                  v38 = objc_claimAutoreleasedReturnValue();

                  v16 = 4;
                  v7 = (void *)v38;
                }
                else
                {
                  v16 = 4 * (v7 != 0);
                }
              }

              goto LABEL_67;
            }
            v14 = v13;
            v15 = (void *)v12;
            v36 = self;
            v37 = 2004;
          }
          else
          {
            v14 = v13;
            v15 = (void *)v12;
            v36 = self;
            v37 = 2003;
          }
          -[MCCellularPrivateNetworkPayload _validationErrorType:forInvalidKey:](v36, "_validationErrorType:forInvalidKey:", v37, CFSTR("EnableNRStandalone"));
          v32 = v7;
          v16 = 4;
          v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_67:

          goto LABEL_68;
        }
        v31 = (void *)v30;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((objc_msgSend(v31, "isEqual:", &unk_1E42127A8) & 1) != 0
            || (objc_msgSend(v31, "isEqual:", &unk_1E42127C0) & 1) != 0)
          {
            goto LABEL_51;
          }
          v14 = v13;
          v15 = (void *)v12;
          v34 = self;
          v35 = 2004;
        }
        else
        {
          v14 = v13;
          v15 = (void *)v12;
          v34 = self;
          v35 = 2003;
        }
        -[MCCellularPrivateNetworkPayload _validationErrorType:forInvalidKey:](v34, "_validationErrorType:forInvalidKey:", v35, CFSTR("CellularDataPreferred"));
        v16 = 4;
        v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_68:

        if (v16)
          goto LABEL_78;
        ++v8;
        v9 = v7;
      }
      while (v8 != v47);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      a4 = v45;
      v47 = v39;
    }
    while (v39);
  }
LABEL_79:

  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return v7 == 0;
}

- (void)_finishInitializationWithContents:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSString *v8;
  NSString *dataSetName;
  NSString *v10;
  NSString *versionNumber;
  NSString *v12;
  NSString *csgNetworkIdentifier;
  NSString *v14;
  NSString *networkIdentifier;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  MCGeofenceInfo *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  uint64_t v30;
  MCCellularPrivateNetworkPayload *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
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
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v4;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v32)
  {
    v30 = *(_QWORD *)v40;
    v31 = self;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v40 != v30)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v6);
        objc_msgSend(v7, "objectForKey:", CFSTR("DataSetName"));
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        dataSetName = self->_dataSetName;
        self->_dataSetName = v8;

        objc_msgSend(v7, "objectForKey:", CFSTR("VersionNumber"));
        v10 = (NSString *)objc_claimAutoreleasedReturnValue();
        versionNumber = self->_versionNumber;
        self->_versionNumber = v10;

        self->_enableNRStandalone = (NSNumber *)(id)objc_msgSend(v7, "objectForKey:", CFSTR("EnableNRStandalone"));
        objc_msgSend(v7, "objectForKey:", CFSTR("CsgNetworkIdentifier"));
        v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        csgNetworkIdentifier = self->_csgNetworkIdentifier;
        self->_csgNetworkIdentifier = v12;

        objc_msgSend(v7, "objectForKey:", CFSTR("NetworkIdentifier"));
        v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        networkIdentifier = self->_networkIdentifier;
        self->_networkIdentifier = v14;

        objc_msgSend(v7, "objectForKey:", CFSTR("CellularDataPreferred"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v6;
        if (v33)
        {
          objc_msgSend(v7, "objectForKey:", CFSTR("CellularDataPreferred"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          self->_cellularDataPreferred = objc_msgSend(v16, "BOOLValue");

        }
        else
        {
          self->_cellularDataPreferred = 0;
        }
        objc_msgSend(v7, "objectForKey:", CFSTR("Geofences"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v36;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v36 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
                v24 = objc_alloc_init(MCGeofenceInfo);
                objc_msgSend(v23, "objectForKey:", CFSTR("Longitude"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectForKey:", CFSTR("Latitude"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectForKey:", CFSTR("Radius"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectForKey:", CFSTR("GeofenceId"));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[MCGeofenceInfo setLongitude:](v24, "setLongitude:", v25);
                -[MCGeofenceInfo setLatitude:](v24, "setLatitude:", v26);
                -[MCGeofenceInfo setRadius:](v24, "setRadius:", v27);
                -[MCGeofenceInfo setGeofenceId:](v24, "setGeofenceId:", v28);
                objc_msgSend(v5, "addObject:", v24);

              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            }
            while (v20);
          }
        }

        v6 = v34 + 1;
        self = v31;
      }
      while (v34 + 1 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v32);
  }

  if (objc_msgSend(v5, "count"))
    objc_storeStrong((id *)&self->_geofenceList, v5);

}

- (MCCellularPrivateNetworkPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCCellularPrivateNetworkPayload *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  NSString *v14;
  NSString *v15;
  id v16;
  NSString *v17;
  uint64_t v18;
  NSString *dataSetName;
  NSString *v20;
  NSString *versionNumber;
  NSString *v22;
  NSString *csgNetworkIdentifier;
  NSString *v24;
  NSString *networkIdentifier;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  objc_super v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v45.receiver = self;
  v45.super_class = (Class)MCCellularPrivateNetworkPayload;
  v9 = -[MCPayload initWithDictionary:profile:outError:](&v45, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  if (!v9)
    goto LABEL_25;
  v44 = 0;
  +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("PayloadContent"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v44);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v44;
  if (!v11 && v10)
  {
    v43 = 0;
    -[MCCellularPrivateNetworkPayload _checkForValidContents:outError:](v9, "_checkForValidContents:outError:", v10, &v43);
    v11 = v43;
  }
  -[MCPayload profile](v9, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isStub");

  if (v13)
  {
    if (v11)
    {
      v14 = 0;
      v15 = 0;
    }
    else
    {
      v42 = 0;
      +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("DataSetName"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v42);
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      v16 = v42;
      if (!v16)
      {
        v41 = 0;
        +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("VersionNumber"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v41);
        v17 = (NSString *)objc_claimAutoreleasedReturnValue();
        v37 = v41;
        if (v37)
        {
          v11 = v37;
          v14 = 0;
        }
        else
        {
          v40 = 0;
          +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("CsgNetworkIdentifier"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v40);
          v14 = (NSString *)objc_claimAutoreleasedReturnValue();
          v38 = v40;
          if (!v38)
          {
            v39 = 0;
            +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("NetworkIdentifier"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v39);
            v18 = objc_claimAutoreleasedReturnValue();
            v11 = v39;
            goto LABEL_12;
          }
          v11 = v38;
        }
LABEL_11:
        v18 = 0;
LABEL_12:
        dataSetName = v9->_dataSetName;
        v9->_dataSetName = v15;
        v20 = v15;

        versionNumber = v9->_versionNumber;
        v9->_versionNumber = v17;
        v22 = v17;

        csgNetworkIdentifier = v9->_csgNetworkIdentifier;
        v9->_csgNetworkIdentifier = v14;
        v24 = v14;

        networkIdentifier = v9->_networkIdentifier;
        v9->_networkIdentifier = (NSString *)v18;

        goto LABEL_13;
      }
      v11 = v16;
      v14 = 0;
    }
    v17 = 0;
    goto LABEL_11;
  }
LABEL_13:
  if (v11)
  {
    -[MCPayload malformedPayloadErrorWithError:](v9, "malformedPayloadErrorWithError:", v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (a5)
      *a5 = objc_retainAutorelease(v26);
    v28 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v29 = v28;
      v30 = (void *)objc_opt_class();
      v31 = v30;
      objc_msgSend(v27, "MCVerboseDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v30;
      v48 = 2114;
      v49 = v32;
      _os_log_impl(&dword_19ECC4000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v9 = 0;
  }
  if (objc_msgSend(v8, "count"))
  {
    v33 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v34 = v33;
      -[MCPayload friendlyName](v9, "friendlyName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v35;
      v48 = 2114;
      v49 = v8;
      _os_log_impl(&dword_19ECC4000, v34, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }
  if (!v11)
    -[MCCellularPrivateNetworkPayload _finishInitializationWithContents:](v9, "_finishInitializationWithContents:", v10);

LABEL_25:
  return v9;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCCellularPrivateNetworkPayload;
  -[MCPayload stubDictionary](&v9, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCCellularPrivateNetworkPayload dataSetName](self, "dataSetName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("DataSetName"));

  -[MCCellularPrivateNetworkPayload versionNumber](self, "versionNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("VersionNumber"));

  -[MCCellularPrivateNetworkPayload csgNetworkIdentifier](self, "csgNetworkIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("CsgNetworkIdentifier"));

  -[MCCellularPrivateNetworkPayload networkIdentifier](self, "networkIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("NetworkIdentifier"));

  return v3;
}

- (id)title
{
  NSString *dataSetName;

  dataSetName = self->_dataSetName;
  if (dataSetName)
    return dataSetName;
  MCLocalizedString(CFSTR("NAME_MISSING"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)subtitle1Label
{
  return MCLocalizedString(CFSTR("VERSION_COLON"));
}

- (id)subtitle1Description
{
  NSString *versionNumber;

  versionNumber = self->_versionNumber;
  if (versionNumber)
    return versionNumber;
  MCLocalizedString(CFSTR("VERSION_MISSING"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)dataSetName
{
  return self->_dataSetName;
}

- (void)setDataSetName:(id)a3
{
  objc_storeStrong((id *)&self->_dataSetName, a3);
}

- (NSString)versionNumber
{
  return self->_versionNumber;
}

- (void)setVersionNumber:(id)a3
{
  objc_storeStrong((id *)&self->_versionNumber, a3);
}

- (NSArray)geofenceList
{
  return self->_geofenceList;
}

- (void)setGeofenceList:(id)a3
{
  objc_storeStrong((id *)&self->_geofenceList, a3);
}

- (NSString)csgNetworkIdentifier
{
  return self->_csgNetworkIdentifier;
}

- (void)setCsgNetworkIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_csgNetworkIdentifier, a3);
}

- (NSString)networkIdentifier
{
  return self->_networkIdentifier;
}

- (void)setNetworkIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_networkIdentifier, a3);
}

- (BOOL)cellularDataPreferred
{
  return self->_cellularDataPreferred;
}

- (void)setCellularDataPreferred:(BOOL)a3
{
  self->_cellularDataPreferred = a3;
}

- (NSNumber)enableNRStandalone
{
  return self->_enableNRStandalone;
}

- (void)setEnableNRStandalone:(id)a3
{
  self->_enableNRStandalone = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkIdentifier, 0);
  objc_storeStrong((id *)&self->_csgNetworkIdentifier, 0);
  objc_storeStrong((id *)&self->_geofenceList, 0);
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_dataSetName, 0);
}

@end
