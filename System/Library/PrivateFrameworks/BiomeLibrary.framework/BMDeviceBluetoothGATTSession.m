@implementation BMDeviceBluetoothGATTSession

- (BMDeviceBluetoothGATTSession)initWithBundleID:(id)a3 serviceUUID:(id)a4 sessionType:(id)a5 sessionState:(int)a6 supportsBackgrounding:(id)a7 supportsStateRestoration:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  BMDeviceBluetoothGATTSession *v19;
  id v21;
  objc_super v22;

  v21 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BMDeviceBluetoothGATTSession;
  v19 = -[BMEventBase init](&v22, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v19->_bundleID, a3);
    objc_storeStrong((id *)&v19->_serviceUUID, a4);
    objc_storeStrong((id *)&v19->_sessionType, a5);
    v19->_sessionState = a6;
    if (v17)
    {
      v19->_hasSupportsBackgrounding = 1;
      v19->_supportsBackgrounding = objc_msgSend(v17, "BOOLValue");
    }
    else
    {
      v19->_hasSupportsBackgrounding = 0;
      v19->_supportsBackgrounding = 0;
    }
    if (v18)
    {
      v19->_hasSupportsStateRestoration = 1;
      v19->_supportsStateRestoration = objc_msgSend(v18, "BOOLValue");
    }
    else
    {
      v19->_hasSupportsStateRestoration = 0;
      v19->_supportsStateRestoration = 0;
    }
  }

  return v19;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMDeviceBluetoothGATTSession bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceBluetoothGATTSession serviceUUID](self, "serviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceBluetoothGATTSession sessionType](self, "sessionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMDeviceBluetoothGATTSessionStateAsString(-[BMDeviceBluetoothGATTSession sessionState](self, "sessionState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceBluetoothGATTSession supportsBackgrounding](self, "supportsBackgrounding"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceBluetoothGATTSession supportsStateRestoration](self, "supportsStateRestoration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMDeviceBluetoothGATTSession with bundleID: %@, serviceUUID: %@, sessionType: %@, sessionState: %@, supportsBackgrounding: %@, supportsStateRestoration: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDeviceBluetoothGATTSession *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  void *v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  NSArray *serviceUUID;
  int v47;
  BMDeviceBluetoothGATTSession *v48;
  objc_super v50;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)BMDeviceBluetoothGATTSession;
  v5 = -[BMEventBase init](&v50, sel_init);
  if (!v5)
    goto LABEL_66;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = *v7;
        v15 = *(_QWORD *)&v4[v14];
        if (v15 == -1 || v15 >= *(_QWORD *)&v4[*v8])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v15 + 1;
        v13 |= (unint64_t)(v16 & 0x7F) << v11;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v11 += 7;
        v17 = v12++ >= 9;
        if (v17)
        {
          v13 = 0;
          v18 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v18 = v4[*v9];
      if (v4[*v9])
        v13 = 0;
LABEL_15:
      if (v18 || (v13 & 7) == 4)
        break;
      switch((v13 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 32;
          goto LABEL_22;
        case 2u:
          PBReaderReadString();
          v35 = objc_claimAutoreleasedReturnValue();
          if (!v35)
            goto LABEL_68;
          v36 = (void *)v35;
          objc_msgSend(v6, "addObject:", v35);

          continue;
        case 3u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
LABEL_22:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 4u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          while (2)
          {
            v26 = *v7;
            v27 = *(_QWORD *)&v4[v26];
            if (v27 == -1 || v27 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v27);
              *(_QWORD *)&v4[v26] = v27 + 1;
              v25 |= (unint64_t)(v28 & 0x7F) << v23;
              if (v28 < 0)
              {
                v23 += 7;
                v17 = v24++ >= 9;
                if (v17)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_51;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v25) = 0;
LABEL_51:
          if (v25 >= 6)
            LODWORD(v25) = 0;
          v5->_sessionState = v25;
          continue;
        case 5u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          v5->_hasSupportsBackgrounding = 1;
          while (2)
          {
            v32 = *v7;
            v33 = *(_QWORD *)&v4[v32];
            if (v33 == -1 || v33 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v33);
              *(_QWORD *)&v4[v32] = v33 + 1;
              v31 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                v17 = v30++ >= 9;
                if (v17)
                {
                  v31 = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v31 = 0;
LABEL_57:
          v43 = v31 != 0;
          v44 = 16;
          goto LABEL_62;
        case 6u:
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v5->_hasSupportsStateRestoration = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_68:

          goto LABEL_65;
      }
      while (1)
      {
        v40 = *v7;
        v41 = *(_QWORD *)&v4[v40];
        if (v41 == -1 || v41 >= *(_QWORD *)&v4[*v8])
          break;
        v42 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v41);
        *(_QWORD *)&v4[v40] = v41 + 1;
        v39 |= (unint64_t)(v42 & 0x7F) << v37;
        if ((v42 & 0x80) == 0)
          goto LABEL_59;
        v37 += 7;
        v17 = v38++ >= 9;
        if (v17)
        {
          v39 = 0;
          goto LABEL_61;
        }
      }
      v4[*v9] = 1;
LABEL_59:
      if (v4[*v9])
        v39 = 0;
LABEL_61:
      v43 = v39 != 0;
      v44 = 18;
LABEL_62:
      *((_BYTE *)&v5->super.super.isa + v44) = v43;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v45 = objc_msgSend(v6, "copy");
  serviceUUID = v5->_serviceUUID;
  v5->_serviceUUID = (NSArray *)v45;

  v47 = v4[*v9];
  if (v47)
LABEL_65:
    v48 = 0;
  else
LABEL_66:
    v48 = v5;

  return v48;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_bundleID)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_serviceUUID;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_sessionType)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_hasSupportsBackgrounding)
    PBDataWriterWriteBOOLField();
  if (self->_hasSupportsStateRestoration)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMDeviceBluetoothGATTSession writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDeviceBluetoothGATTSession)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  BMDeviceBluetoothGATTSession *v29;
  id v30;
  uint64_t v31;
  id *v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  BMDeviceBluetoothGATTSession *v61;
  id *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  _BYTE v79[128];
  uint64_t v80;
  void *v81;
  uint64_t v82;
  _QWORD v83[3];

  v83[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = a4;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = *MEMORY[0x1E0D025B8];
        v82 = *MEMORY[0x1E0CB2D50];
        v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
        v83[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, &v82, 1);
        v32 = a4;
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 0;
        v29 = 0;
        *v32 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2, v12);
        goto LABEL_60;
      }
      v8 = 0;
      v29 = 0;
      goto LABEL_62;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serviceUUID"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  v60 = v7;
  if (v11)
  {
    v61 = self;

    v9 = 0;
  }
  else
  {
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v62)
        {
          v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v34 = *MEMORY[0x1E0D025B8];
          v80 = *MEMORY[0x1E0CB2D50];
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("serviceUUID"));
          v81 = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
          v21 = (id)objc_claimAutoreleasedReturnValue();
          v29 = 0;
          *v62 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, 2, v21);
          goto LABEL_59;
        }
        v29 = 0;
        goto LABEL_61;
      }
    }
    v61 = self;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v9 = v9;
  v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
  if (!v13)
    goto LABEL_18;
  v14 = v13;
  v15 = *(_QWORD *)v64;
  while (2)
  {
    v16 = v6;
    v17 = v8;
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v64 != v15)
        objc_enumerationMutation(v9);
      v19 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v62)
        {
          v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v24 = *MEMORY[0x1E0D025B8];
          v77 = *MEMORY[0x1E0CB2D50];
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("serviceUUID"));
          v78 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v23;
          v26 = v24;
LABEL_30:
          v8 = v17;
          v29 = 0;
          *v62 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v22);
          v21 = v9;
          v6 = v16;
          goto LABEL_57;
        }
LABEL_31:
        v29 = 0;
        v21 = v9;
        self = v61;
        v8 = v17;
        v6 = v16;
        goto LABEL_59;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v62)
        {
          v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v28 = *MEMORY[0x1E0D025B8];
          v75 = *MEMORY[0x1E0CB2D50];
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("serviceUUID"));
          v76 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v27;
          v26 = v28;
          goto LABEL_30;
        }
        goto LABEL_31;
      }
      objc_msgSend(v12, "addObject:", v19);
    }
    v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
    v8 = v17;
    v6 = v16;
    if (v14)
      continue;
    break;
  }
LABEL_18:

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sessionType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v21 = 0;
    goto LABEL_21;
  }
  v35 = v6;
  v36 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v62)
    {
      v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v39 = *MEMORY[0x1E0D025B8];
      v73 = *MEMORY[0x1E0CB2D50];
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sessionType"));
      v74 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 2);
      v21 = 0;
      v29 = 0;
      *v62 = v40;
      goto LABEL_77;
    }
    v21 = 0;
    v29 = 0;
    v6 = v35;
    goto LABEL_58;
  }
  v21 = v20;
  v6 = v35;
LABEL_21:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sessionState"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v22;
  if (!v22)
  {
LABEL_47:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("supportsBackgrounding"));
    v41 = objc_claimAutoreleasedReturnValue();
    v55 = (void *)v41;
    if (v41 && (v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v62)
        {
          v58 = 0;
          v29 = 0;
LABEL_55:

          goto LABEL_56;
        }
        v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v46 = *MEMORY[0x1E0D025B8];
        v69 = *MEMORY[0x1E0CB2D50];
        v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("supportsBackgrounding"));
        v70 = v44;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v46, 2, v43);
        v29 = 0;
        v58 = 0;
        *v62 = v47;
        goto LABEL_54;
      }
      v58 = v42;
    }
    else
    {
      v58 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("supportsStateRestoration"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v62)
        {
          v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v53 = *MEMORY[0x1E0D025B8];
          v67 = *MEMORY[0x1E0CB2D50];
          v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("supportsStateRestoration"));
          v68 = v48;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *v62 = (id)objc_msgSend(v54, "initWithDomain:code:userInfo:", v53, 2, v49);

        }
        v44 = 0;
        v29 = 0;
        goto LABEL_54;
      }
      v44 = v43;
    }
    else
    {
      v44 = 0;
    }
    v29 = -[BMDeviceBluetoothGATTSession initWithBundleID:serviceUUID:sessionType:sessionState:supportsBackgrounding:supportsStateRestoration:](v61, "initWithBundleID:serviceUUID:sessionType:sessionState:supportsBackgrounding:supportsStateRestoration:", v8, v12, v21, objc_msgSend(v22, "intValue"), v58, v44);
    v61 = v29;
LABEL_54:

    v42 = v55;
    goto LABEL_55;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = 0;
    goto LABEL_47;
  }
  v35 = v6;
  v36 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = v22;
LABEL_46:
    v22 = v37;
    v6 = v35;
    goto LABEL_47;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDeviceBluetoothGATTSessionStateFromString(v22));
    v37 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_46;
  }
  if (v62)
  {
    v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v56 = *MEMORY[0x1E0D025B8];
    v71 = *MEMORY[0x1E0CB2D50];
    v58 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("sessionState"));
    v72 = v58;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v56, 2, v51);
    v22 = 0;
    v29 = 0;
    *v62 = v52;
    v6 = v35;
    v42 = (void *)v51;
    goto LABEL_55;
  }
  v22 = 0;
  v29 = 0;
LABEL_77:
  v8 = v36;
  v6 = v35;
LABEL_56:

LABEL_57:
LABEL_58:

  self = v61;
LABEL_59:

  v7 = v60;
LABEL_60:

LABEL_61:
LABEL_62:

  return v29;
}

- (id)_serviceUUIDJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BMDeviceBluetoothGATTSession serviceUUID](self, "serviceUUID", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  -[BMDeviceBluetoothGATTSession bundleID](self, "bundleID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMDeviceBluetoothGATTSession _serviceUUIDJSONArray](self, "_serviceUUIDJSONArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceBluetoothGATTSession sessionType](self, "sessionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBluetoothGATTSession sessionState](self, "sessionState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMDeviceBluetoothGATTSession hasSupportsBackgrounding](self, "hasSupportsBackgrounding"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceBluetoothGATTSession supportsBackgrounding](self, "supportsBackgrounding"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (-[BMDeviceBluetoothGATTSession hasSupportsStateRestoration](self, "hasSupportsStateRestoration"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceBluetoothGATTSession supportsStateRestoration](self, "supportsStateRestoration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v21[0] = CFSTR("bundleID");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v9;
  v20 = (void *)v3;
  v22[0] = v9;
  v21[1] = CFSTR("serviceUUID");
  v10 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v10;
  v22[1] = v10;
  v21[2] = CFSTR("sessionType");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v10, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v11;
  v21[3] = CFSTR("sessionState");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v12;
  v21[4] = CFSTR("supportsBackgrounding");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v13;
  v21[5] = CFSTR("supportsStateRestoration");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_21;
  }
  else
  {

    if (v7)
    {
LABEL_21:
      if (v6)
        goto LABEL_22;
      goto LABEL_29;
    }
  }

  if (v6)
  {
LABEL_22:
    if (v5)
      goto LABEL_23;
LABEL_30:

    if (v4)
      goto LABEL_24;
    goto LABEL_31;
  }
LABEL_29:

  if (!v5)
    goto LABEL_30;
LABEL_23:
  if (v4)
    goto LABEL_24;
LABEL_31:

LABEL_24:
  if (!v20)

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  int v26;
  _BOOL4 v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMDeviceBluetoothGATTSession bundleID](self, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMDeviceBluetoothGATTSession bundleID](self, "bundleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_26;
    }
    -[BMDeviceBluetoothGATTSession serviceUUID](self, "serviceUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceUUID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMDeviceBluetoothGATTSession serviceUUID](self, "serviceUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serviceUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_26;
    }
    -[BMDeviceBluetoothGATTSession sessionType](self, "sessionType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionType");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMDeviceBluetoothGATTSession sessionType](self, "sessionType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sessionType");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_26;
    }
    v25 = -[BMDeviceBluetoothGATTSession sessionState](self, "sessionState");
    if (v25 == objc_msgSend(v5, "sessionState"))
    {
      if (!-[BMDeviceBluetoothGATTSession hasSupportsBackgrounding](self, "hasSupportsBackgrounding")
        && !objc_msgSend(v5, "hasSupportsBackgrounding")
        || -[BMDeviceBluetoothGATTSession hasSupportsBackgrounding](self, "hasSupportsBackgrounding")
        && objc_msgSend(v5, "hasSupportsBackgrounding")
        && (v26 = -[BMDeviceBluetoothGATTSession supportsBackgrounding](self, "supportsBackgrounding"),
            v26 == objc_msgSend(v5, "supportsBackgrounding")))
      {
        if (!-[BMDeviceBluetoothGATTSession hasSupportsStateRestoration](self, "hasSupportsStateRestoration")
          && !objc_msgSend(v5, "hasSupportsStateRestoration"))
        {
          LOBYTE(v12) = 1;
          goto LABEL_27;
        }
        if (-[BMDeviceBluetoothGATTSession hasSupportsStateRestoration](self, "hasSupportsStateRestoration")
          && objc_msgSend(v5, "hasSupportsStateRestoration"))
        {
          v27 = -[BMDeviceBluetoothGATTSession supportsStateRestoration](self, "supportsStateRestoration");
          v12 = v27 ^ objc_msgSend(v5, "supportsStateRestoration") ^ 1;
LABEL_27:

          goto LABEL_28;
        }
      }
    }
LABEL_26:
    LOBYTE(v12) = 0;
    goto LABEL_27;
  }
  LOBYTE(v12) = 0;
LABEL_28:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSArray)serviceUUID
{
  return self->_serviceUUID;
}

- (NSString)sessionType
{
  return self->_sessionType;
}

- (int)sessionState
{
  return self->_sessionState;
}

- (BOOL)supportsBackgrounding
{
  return self->_supportsBackgrounding;
}

- (BOOL)hasSupportsBackgrounding
{
  return self->_hasSupportsBackgrounding;
}

- (void)setHasSupportsBackgrounding:(BOOL)a3
{
  self->_hasSupportsBackgrounding = a3;
}

- (BOOL)supportsStateRestoration
{
  return self->_supportsStateRestoration;
}

- (BOOL)hasSupportsStateRestoration
{
  return self->_hasSupportsStateRestoration;
}

- (void)setHasSupportsStateRestoration:(BOOL)a3
{
  self->_hasSupportsStateRestoration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionType, 0);
  objc_storeStrong((id *)&self->_serviceUUID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

+ (unsigned)latestDataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  _DWORD *v4;
  objc_class *v5;
  id v6;
  void *v7;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v5 = (objc_class *)MEMORY[0x1E0D82B90];
    v6 = a3;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

    v4 = -[BMDeviceBluetoothGATTSession initByReadFrom:]([BMDeviceBluetoothGATTSession alloc], "initByReadFrom:", v7);
    v4[5] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("serviceUUID_json"), 5, 1, &__block_literal_global_52_45982);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sessionType"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sessionState"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("supportsBackgrounding"), 0, 0, 5, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("supportsStateRestoration"), 0, 0, 6, 12, 0);
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D6F8;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 1, 13, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("serviceUUID"), 2, 13, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sessionType"), 3, 13, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sessionState"), 4, 4, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("supportsBackgrounding"), 5, 12, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("supportsStateRestoration"), 6, 12, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __39__BMDeviceBluetoothGATTSession_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_serviceUUIDJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
