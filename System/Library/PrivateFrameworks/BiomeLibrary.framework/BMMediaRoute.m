@implementation BMMediaRoute

- (BMMediaRoute)initWithRouteType:(int)a3 groupLeaderOutputDeviceID:(id)a4 isRemoteControl:(id)a5 outputDevices:(id)a6
{
  id v11;
  id v12;
  id v13;
  BMMediaRoute *v14;
  objc_super v16;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BMMediaRoute;
  v14 = -[BMEventBase init](&v16, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v14->_routeType = a3;
    objc_storeStrong((id *)&v14->_groupLeaderOutputDeviceID, a4);
    if (v12)
    {
      v14->_hasIsRemoteControl = 1;
      v14->_isRemoteControl = objc_msgSend(v12, "BOOLValue");
    }
    else
    {
      v14->_hasIsRemoteControl = 0;
      v14->_isRemoteControl = 0;
    }
    objc_storeStrong((id *)&v14->_outputDevices, a6);
  }

  return v14;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMMediaRouteRouteTypeAsString(-[BMMediaRoute routeType](self, "routeType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaRoute groupLeaderOutputDeviceID](self, "groupLeaderOutputDeviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMediaRoute isRemoteControl](self, "isRemoteControl"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaRoute outputDevices](self, "outputDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMediaRoute with routeType: %@, groupLeaderOutputDeviceID: %@, isRemoteControl: %@, outputDevices: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMediaRoute *v5;
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
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  NSString *groupLeaderOutputDeviceID;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  id v34;
  void *v35;
  uint64_t v36;
  NSArray *outputDevices;
  int v38;
  BMMediaRoute *v39;
  objc_super v41;
  uint64_t v42;
  uint64_t v43;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMMediaRoute;
  v5 = -[BMEventBase init](&v41, sel_init);
  if (!v5)
    goto LABEL_53;
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
          v20 = 0;
          v21 = 0;
          v22 = 0;
          while (1)
          {
            v23 = *v7;
            v24 = *(_QWORD *)&v4[v23];
            if (v24 == -1 || v24 >= *(_QWORD *)&v4[*v8])
              break;
            v25 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v24);
            *(_QWORD *)&v4[v23] = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if ((v25 & 0x80) == 0)
              goto LABEL_41;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_43;
            }
          }
          v4[*v9] = 1;
LABEL_41:
          if (v4[*v9])
            LODWORD(v22) = 0;
LABEL_43:
          if (v22 >= 3)
            LODWORD(v22) = 0;
          v5->_routeType = v22;
          continue;
        case 2u:
          PBReaderReadString();
          v26 = objc_claimAutoreleasedReturnValue();
          groupLeaderOutputDeviceID = v5->_groupLeaderOutputDeviceID;
          v5->_groupLeaderOutputDeviceID = (NSString *)v26;

          continue;
        case 3u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          v5->_hasIsRemoteControl = 1;
          break;
        case 4u:
          v42 = 0;
          v43 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_55;
          v34 = -[BMMediaRouteOutputDevice initByReadFrom:]([BMMediaRouteOutputDevice alloc], "initByReadFrom:", v4);
          if (!v34)
            goto LABEL_55;
          v35 = v34;
          objc_msgSend(v6, "addObject:", v34);
          PBReaderRecallMark();

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_55:

          goto LABEL_52;
      }
      while (1)
      {
        v31 = *v7;
        v32 = *(_QWORD *)&v4[v31];
        if (v32 == -1 || v32 >= *(_QWORD *)&v4[*v8])
          break;
        v33 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v32);
        *(_QWORD *)&v4[v31] = v32 + 1;
        v30 |= (unint64_t)(v33 & 0x7F) << v28;
        if ((v33 & 0x80) == 0)
          goto LABEL_47;
        v28 += 7;
        v17 = v29++ >= 9;
        if (v17)
        {
          v30 = 0;
          goto LABEL_49;
        }
      }
      v4[*v9] = 1;
LABEL_47:
      if (v4[*v9])
        v30 = 0;
LABEL_49:
      v5->_isRemoteControl = v30 != 0;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v36 = objc_msgSend(v6, "copy");
  outputDevices = v5->_outputDevices;
  v5->_outputDevices = (NSArray *)v36;

  v38 = v4[*v9];
  if (v38)
LABEL_52:
    v39 = 0;
  else
LABEL_53:
    v39 = v5;

  return v39;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_groupLeaderOutputDeviceID)
    PBDataWriterWriteStringField();
  if (self->_hasIsRemoteControl)
    PBDataWriterWriteBOOLField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_outputDevices;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMediaRoute writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMediaRoute)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  BMMediaRouteOutputDevice *v24;
  BMMediaRouteOutputDevice *v25;
  id v26;
  BMMediaRoute *v27;
  id v28;
  uint64_t v29;
  id *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  id *v35;
  id v36;
  uint64_t v37;
  id v38;
  id *v39;
  id v40;
  uint64_t v41;
  void *v42;
  id *v43;
  uint64_t *v44;
  void *v45;
  void *v46;
  id v48;
  id v49;
  id *v50;
  uint64_t v51;
  void *v52;
  id v53;
  id *v54;
  uint64_t v55;
  BMMediaRoute *v56;
  id v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id *v61;
  id *v62;
  id v63;
  id v64;
  BMMediaRoute *v65;
  id *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  id v78;
  _BYTE v79[128];
  uint64_t v80;
  void *v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  id *v85;
  uint64_t v86;
  _QWORD v87[3];

  v87[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("routeType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("groupLeaderOutputDeviceID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v11 = 0;
          v27 = 0;
          goto LABEL_52;
        }
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v62 = a4;
        v29 = *MEMORY[0x1E0D025B8];
        v84 = *MEMORY[0x1E0CB2D50];
        v30 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("groupLeaderOutputDeviceID"));
        v85 = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v28;
        v13 = (void *)v31;
        v33 = v29;
        a4 = v30;
        v27 = 0;
        v11 = 0;
        *v62 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 2, v31);
        goto LABEL_51;
      }
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isRemoteControl"));
    v12 = objc_claimAutoreleasedReturnValue();
    v68 = v10;
    v69 = v7;
    v67 = (void *)v12;
    if (v12 && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v34 = v11;
          v35 = a4;
          v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v37 = *MEMORY[0x1E0D025B8];
          v82 = *MEMORY[0x1E0CB2D50];
          v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isRemoteControl"));
          v83 = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2, v17);
          v27 = 0;
          a4 = 0;
          *v35 = v38;
          v11 = v34;
          goto LABEL_49;
        }
        v27 = 0;
LABEL_51:

        goto LABEL_52;
      }
      v66 = v13;
    }
    else
    {
      v66 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("outputDevices"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (v16)
    {
      v64 = v11;
      v65 = self;
      v61 = a4;
      v63 = v6;

      v14 = 0;
LABEL_20:
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v14 = v14;
      v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
      if (!v18)
        goto LABEL_30;
      v19 = v18;
      v20 = *(_QWORD *)v72;
      v60 = v8;
LABEL_22:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v72 != v20)
          objc_enumerationMutation(v14);
        v22 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v21);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v39 = v61;
          v6 = v63;
          v8 = v60;
          a4 = v66;
          if (!v61)
            goto LABEL_48;
          v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v41 = *MEMORY[0x1E0D025B8];
          v75 = *MEMORY[0x1E0CB2D50];
          v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("outputDevices"));
          v76 = v23;
          v42 = (void *)MEMORY[0x1E0C99D80];
          v43 = &v76;
          v44 = &v75;
          goto LABEL_43;
        }
        v23 = v22;
        v24 = [BMMediaRouteOutputDevice alloc];
        v70 = 0;
        v25 = -[BMMediaRouteOutputDevice initWithJSONDictionary:error:](v24, "initWithJSONDictionary:error:", v23, &v70);
        v26 = v70;
        if (v26)
        {
          v45 = v26;
          if (v61)
            *v61 = objc_retainAutorelease(v26);

          v6 = v63;
          v8 = v60;
          a4 = v66;
LABEL_47:

LABEL_48:
          v27 = 0;
          v11 = v64;
          self = v65;
          goto LABEL_49;
        }
        objc_msgSend(v17, "addObject:", v25);

        if (v19 == ++v21)
        {
          v19 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
          v8 = v60;
          if (v19)
            goto LABEL_22;
LABEL_30:

          v11 = v64;
          a4 = v66;
          self = -[BMMediaRoute initWithRouteType:groupLeaderOutputDeviceID:isRemoteControl:outputDevices:](v65, "initWithRouteType:groupLeaderOutputDeviceID:isRemoteControl:outputDevices:", objc_msgSend(v8, "intValue"), v64, v66, v17);
          v27 = self;
          v6 = v63;
LABEL_49:

          goto LABEL_50;
        }
      }
      v39 = v61;
      v6 = v63;
      v8 = v60;
      a4 = v66;
      if (!v61)
        goto LABEL_48;
      v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v41 = *MEMORY[0x1E0D025B8];
      v77 = *MEMORY[0x1E0CB2D50];
      v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("outputDevices"));
      v78 = v23;
      v42 = (void *)MEMORY[0x1E0C99D80];
      v43 = &v78;
      v44 = &v77;
LABEL_43:
      objc_msgSend(v42, "dictionaryWithObjects:forKeys:count:", v43, v44, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v40;
      a4 = v66;
      *v39 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v41, 2, v45);
      goto LABEL_47;
    }
    if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v64 = v11;
      v65 = self;
      v61 = a4;
      v63 = v6;
      goto LABEL_20;
    }
    if (a4)
    {
      v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v49 = v11;
      v50 = a4;
      v51 = *MEMORY[0x1E0D025B8];
      v80 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("outputDevices"));
      v81 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *v50 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v51, 2, v52);
      v11 = v49;

      v27 = 0;
      a4 = v66;
      goto LABEL_49;
    }
    v27 = 0;
    a4 = v66;
LABEL_50:

    v10 = v68;
    v7 = v69;
    v13 = v67;
    goto LABEL_51;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
LABEL_8:
    v8 = v9;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMediaRouteRouteTypeFromString(v7));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a4)
  {
    v8 = 0;
    v27 = 0;
    goto LABEL_53;
  }
  v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v54 = a4;
  v55 = *MEMORY[0x1E0D025B8];
  v86 = *MEMORY[0x1E0CB2D50];
  v56 = self;
  v57 = objc_alloc(MEMORY[0x1E0CB3940]);
  v59 = objc_opt_class();
  v58 = v57;
  self = v56;
  v11 = (id)objc_msgSend(v58, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), v59, CFSTR("routeType"));
  v87[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, &v86, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v27 = 0;
  *v54 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v55, 2, v10);
LABEL_52:

LABEL_53:
  return v27;
}

- (id)_outputDevicesJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMMediaRoute outputDevices](self, "outputDevices", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMediaRoute routeType](self, "routeType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaRoute groupLeaderOutputDeviceID](self, "groupLeaderOutputDeviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMediaRoute hasIsRemoteControl](self, "hasIsRemoteControl"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMediaRoute isRemoteControl](self, "isRemoteControl"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[BMMediaRoute _outputDevicesJSONArray](self, "_outputDevicesJSONArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("routeType");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v7;
  v13[1] = CFSTR("groupLeaderOutputDeviceID");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v8;
  v13[2] = CFSTR("isRemoteControl");
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v9;
  v13[3] = CFSTR("outputDevices");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v5)
      goto LABEL_14;
  }
  else
  {

    if (v5)
    {
LABEL_14:
      if (v4)
        goto LABEL_15;
LABEL_19:

      if (v3)
        goto LABEL_16;
LABEL_20:

      goto LABEL_16;
    }
  }

  if (!v4)
    goto LABEL_19;
LABEL_15:
  if (!v3)
    goto LABEL_20;
LABEL_16:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  int v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMMediaRoute routeType](self, "routeType");
    if (v6 == objc_msgSend(v5, "routeType"))
    {
      -[BMMediaRoute groupLeaderOutputDeviceID](self, "groupLeaderOutputDeviceID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "groupLeaderOutputDeviceID");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[BMMediaRoute groupLeaderOutputDeviceID](self, "groupLeaderOutputDeviceID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "groupLeaderOutputDeviceID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_13;
      }
      if (!-[BMMediaRoute hasIsRemoteControl](self, "hasIsRemoteControl")
        && !objc_msgSend(v5, "hasIsRemoteControl")
        || -[BMMediaRoute hasIsRemoteControl](self, "hasIsRemoteControl")
        && objc_msgSend(v5, "hasIsRemoteControl")
        && (v14 = -[BMMediaRoute isRemoteControl](self, "isRemoteControl"),
            v14 == objc_msgSend(v5, "isRemoteControl")))
      {
        -[BMMediaRoute outputDevices](self, "outputDevices");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "outputDevices");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16 == v17)
        {
          v13 = 1;
        }
        else
        {
          -[BMMediaRoute outputDevices](self, "outputDevices");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "outputDevices");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v18, "isEqual:", v19);

        }
        goto LABEL_14;
      }
    }
LABEL_13:
    v13 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)routeType
{
  return self->_routeType;
}

- (NSString)groupLeaderOutputDeviceID
{
  return self->_groupLeaderOutputDeviceID;
}

- (BOOL)isRemoteControl
{
  return self->_isRemoteControl;
}

- (BOOL)hasIsRemoteControl
{
  return self->_hasIsRemoteControl;
}

- (void)setHasIsRemoteControl:(BOOL)a3
{
  self->_hasIsRemoteControl = a3;
}

- (NSArray)outputDevices
{
  return self->_outputDevices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_groupLeaderOutputDeviceID, 0);
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

    v4 = -[BMMediaRoute initByReadFrom:]([BMMediaRoute alloc], "initByReadFrom:", v7);
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
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("routeType"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("groupLeaderOutputDeviceID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isRemoteControl"), 0, 0, 3, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("outputDevices_json"), 5, 1, &__block_literal_global_233);
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C3D8;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("routeType"), 1, 4, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("groupLeaderOutputDeviceID"), 2, 13, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isRemoteControl"), 3, 12, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("outputDevices"), 4, 14, objc_opt_class());
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __23__BMMediaRoute_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_outputDevicesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
