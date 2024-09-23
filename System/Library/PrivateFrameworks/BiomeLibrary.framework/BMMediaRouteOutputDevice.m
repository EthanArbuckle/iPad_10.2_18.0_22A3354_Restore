@implementation BMMediaRouteOutputDevice

- (BMMediaRouteOutputDevice)initWithOutputDeviceID:(id)a3 type:(int)a4 subType:(int)a5 clusterType:(int)a6 flattenedClusterLeafMembers:(id)a7
{
  id v13;
  id v14;
  BMMediaRouteOutputDevice *v15;
  objc_super v17;

  v13 = a3;
  v14 = a7;
  v17.receiver = self;
  v17.super_class = (Class)BMMediaRouteOutputDevice;
  v15 = -[BMEventBase init](&v17, sel_init);
  if (v15)
  {
    v15->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v15->_outputDeviceID, a3);
    v15->_type = a4;
    v15->_subType = a5;
    v15->_clusterType = a6;
    objc_storeStrong((id *)&v15->_flattenedClusterLeafMembers, a7);
  }

  return v15;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMMediaRouteOutputDevice outputDeviceID](self, "outputDeviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMMediaRouteOutputDeviceTypeAsString(-[BMMediaRouteOutputDevice type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMMediaRouteOutputDeviceSubTypeAsString(-[BMMediaRouteOutputDevice subType](self, "subType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMMediaRouteOutputDeviceClusterTypeAsString(-[BMMediaRouteOutputDevice clusterType](self, "clusterType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaRouteOutputDevice flattenedClusterLeafMembers](self, "flattenedClusterLeafMembers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMediaRouteOutputDevice with outputDeviceID: %@, type: %@, subType: %@, clusterType: %@, flattenedClusterLeafMembers: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMediaRouteOutputDevice *v5;
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
  NSString *outputDeviceID;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  NSArray *flattenedClusterLeafMembers;
  int v43;
  BMMediaRouteOutputDevice *v44;
  objc_super v46;
  uint64_t v47;
  uint64_t v48;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)BMMediaRouteOutputDevice;
  v5 = -[BMEventBase init](&v46, sel_init);
  if (!v5)
    goto LABEL_69;
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
          outputDeviceID = v5->_outputDeviceID;
          v5->_outputDeviceID = (NSString *)v20;

          continue;
        case 2u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          while (2)
          {
            v25 = *v7;
            v26 = *(_QWORD *)&v4[v25];
            if (v26 == -1 || v26 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v27 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v26);
              *(_QWORD *)&v4[v25] = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                v17 = v23++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v24) = 0;
LABEL_50:
          if (v24 >= 6)
            LODWORD(v24) = 0;
          v40 = 20;
          goto LABEL_65;
        case 3u:
          v28 = 0;
          v29 = 0;
          v24 = 0;
          while (2)
          {
            v30 = *v7;
            v31 = *(_QWORD *)&v4[v30];
            if (v31 == -1 || v31 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v31);
              *(_QWORD *)&v4[v30] = v31 + 1;
              v24 |= (unint64_t)(v32 & 0x7F) << v28;
              if (v32 < 0)
              {
                v28 += 7;
                v17 = v29++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v24) = 0;
LABEL_56:
          if (v24 >= 0x16)
            LODWORD(v24) = 0;
          v40 = 24;
          goto LABEL_65;
        case 4u:
          v33 = 0;
          v34 = 0;
          v24 = 0;
          break;
        case 5u:
          v47 = 0;
          v48 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_71;
          v38 = -[BMMediaRouteOutputDeviceClusterMember initByReadFrom:]([BMMediaRouteOutputDeviceClusterMember alloc], "initByReadFrom:", v4);
          if (!v38)
            goto LABEL_71;
          v39 = v38;
          objc_msgSend(v6, "addObject:", v38);
          PBReaderRecallMark();

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_71:

          goto LABEL_68;
      }
      while (1)
      {
        v35 = *v7;
        v36 = *(_QWORD *)&v4[v35];
        if (v36 == -1 || v36 >= *(_QWORD *)&v4[*v8])
          break;
        v37 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v36);
        *(_QWORD *)&v4[v35] = v36 + 1;
        v24 |= (unint64_t)(v37 & 0x7F) << v33;
        if ((v37 & 0x80) == 0)
          goto LABEL_60;
        v33 += 7;
        v17 = v34++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_62;
        }
      }
      v4[*v9] = 1;
LABEL_60:
      if (v4[*v9])
        LODWORD(v24) = 0;
LABEL_62:
      if (v24 >= 4)
        LODWORD(v24) = 0;
      v40 = 28;
LABEL_65:
      *(_DWORD *)((char *)&v5->super.super.isa + v40) = v24;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v41 = objc_msgSend(v6, "copy");
  flattenedClusterLeafMembers = v5->_flattenedClusterLeafMembers;
  v5->_flattenedClusterLeafMembers = (NSArray *)v41;

  v43 = v4[*v9];
  if (v43)
LABEL_68:
    v44 = 0;
  else
LABEL_69:
    v44 = v5;

  return v44;
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
  if (self->_outputDeviceID)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_flattenedClusterLeafMembers;
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
  -[BMMediaRouteOutputDevice writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMediaRouteOutputDevice)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
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
  BMMediaRouteOutputDeviceClusterMember *v24;
  BMMediaRouteOutputDeviceClusterMember *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id *v34;
  id v35;
  id *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id *v40;
  uint64_t *v41;
  void *v42;
  void *v43;
  id v45;
  uint64_t v46;
  id *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  id *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  id *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  id *v63;
  id *v64;
  id v65;
  BMMediaRouteOutputDevice *v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  id v84;
  _BYTE v85[128];
  uint64_t v86;
  void *v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  _QWORD v95[3];

  v95[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("outputDeviceID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v74 = v9;
      }
      else
      {
        v35 = v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!p_isa)
          {
            v30 = 0;
            goto LABEL_62;
          }
          v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v50 = v9;
          v51 = *MEMORY[0x1E0D025B8];
          v92 = *MEMORY[0x1E0CB2D50];
          v52 = p_isa;
          v75 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("type"));
          v93 = v75;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = v51;
          v9 = v50;
          v73 = (void *)v53;
          v30 = 0;
          p_isa = 0;
          *v52 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v54, 2);
          v8 = v35;
          goto LABEL_61;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMediaRouteOutputDeviceTypeFromString(v9));
        v74 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v74 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subType"));
    v10 = objc_claimAutoreleasedReturnValue();
    v73 = (void *)v10;
    if (v10 && (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v75 = v11;
      }
      else
      {
        v68 = v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!p_isa)
          {
            v75 = 0;
            goto LABEL_60;
          }
          v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v56 = v9;
          v57 = *MEMORY[0x1E0D025B8];
          v90 = *MEMORY[0x1E0CB2D50];
          v58 = p_isa;
          v59 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("subType"));
          v91 = v59;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v57;
          v9 = v56;
          v27 = (void *)v59;
          v75 = 0;
          p_isa = 0;
          *v58 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v60, 2, v43);
          v8 = v68;
LABEL_59:

LABEL_60:
          v30 = v74;
LABEL_61:

          goto LABEL_62;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMediaRouteOutputDeviceSubTypeFromString(v11));
        v75 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v75 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clusterType"));
    v12 = objc_claimAutoreleasedReturnValue();
    v70 = v7;
    v71 = v9;
    v72 = (void *)v12;
    if (v12 && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v69 = v13;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (p_isa)
          {
            v61 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v62 = *MEMORY[0x1E0D025B8];
            v88 = *MEMORY[0x1E0CB2D50];
            v63 = p_isa;
            v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("clusterType"));
            v89 = v14;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            p_isa = 0;
            *v63 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v62, 2, v17);
            v27 = 0;
            goto LABEL_56;
          }
          v27 = 0;
LABEL_58:
          v43 = v72;
          goto LABEL_59;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMediaRouteOutputDeviceClusterTypeFromString(v13));
        v69 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v69 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flattenedClusterLeafMembers"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (v16)
    {
      v64 = p_isa;
      v65 = v6;
      v66 = self;

      v14 = 0;
LABEL_18:
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v14 = v14;
      v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
      if (!v18)
        goto LABEL_28;
      v19 = v18;
      v20 = *(_QWORD *)v78;
      v67 = v8;
LABEL_20:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v78 != v20)
          objc_enumerationMutation(v14);
        v22 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v21);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v36 = v64;
          v6 = v65;
          v8 = v67;
          if (!v64)
            goto LABEL_54;
          v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v38 = *MEMORY[0x1E0D025B8];
          v81 = *MEMORY[0x1E0CB2D50];
          v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("flattenedClusterLeafMembers"));
          v82 = v23;
          v39 = (void *)MEMORY[0x1E0C99D80];
          v40 = &v82;
          v41 = &v81;
          goto LABEL_47;
        }
        v23 = v22;
        v24 = [BMMediaRouteOutputDeviceClusterMember alloc];
        v76 = 0;
        v25 = -[BMMediaRouteOutputDeviceClusterMember initWithJSONDictionary:error:](v24, "initWithJSONDictionary:error:", v23, &v76);
        v26 = v76;
        if (v26)
        {
          v42 = v26;
          if (v64)
            *v64 = objc_retainAutorelease(v26);

          v6 = v65;
          v8 = v67;
LABEL_53:

LABEL_54:
          p_isa = 0;
          self = v66;
          goto LABEL_55;
        }
        objc_msgSend(v17, "addObject:", v25);

        if (v19 == ++v21)
        {
          v19 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
          v8 = v67;
          if (v19)
            goto LABEL_20;
LABEL_28:

          v27 = v69;
          self = -[BMMediaRouteOutputDevice initWithOutputDeviceID:type:subType:clusterType:flattenedClusterLeafMembers:](v66, "initWithOutputDeviceID:type:subType:clusterType:flattenedClusterLeafMembers:", v8, objc_msgSend(v74, "intValue"), objc_msgSend(v75, "intValue"), objc_msgSend(v69, "intValue"), v17);
          p_isa = (id *)&self->super.super.isa;
          v6 = v65;
LABEL_56:

          v7 = v70;
          v9 = v71;
          goto LABEL_57;
        }
      }
      v36 = v64;
      v6 = v65;
      v8 = v67;
      if (!v64)
        goto LABEL_54;
      v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v38 = *MEMORY[0x1E0D025B8];
      v83 = *MEMORY[0x1E0CB2D50];
      v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("flattenedClusterLeafMembers"));
      v84 = v23;
      v39 = (void *)MEMORY[0x1E0C99D80];
      v40 = &v84;
      v41 = &v83;
LABEL_47:
      objc_msgSend(v39, "dictionaryWithObjects:forKeys:count:", v40, v41, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *v36 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 2, v42);
      goto LABEL_53;
    }
    if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v64 = p_isa;
      v65 = v6;
      v66 = self;
      goto LABEL_18;
    }
    if (p_isa)
    {
      v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v46 = *MEMORY[0x1E0D025B8];
      v86 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("flattenedClusterLeafMembers"));
      v87 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
      v47 = p_isa;
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *v47 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v46, 2, v48);

      p_isa = 0;
LABEL_55:
      v27 = v69;
      goto LABEL_56;
    }
    v9 = v71;
    v27 = v69;
LABEL_57:

    goto LABEL_58;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!p_isa)
  {
    v8 = 0;
    goto LABEL_63;
  }
  v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v29 = *MEMORY[0x1E0D025B8];
  v94 = *MEMORY[0x1E0CB2D50];
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("outputDeviceID"));
  v95[0] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, &v94, 1);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v29;
  v9 = (void *)v31;
  v33 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v32, 2, v31);
  v8 = 0;
  v34 = p_isa;
  p_isa = 0;
  *v34 = v33;
LABEL_62:

LABEL_63:
  return (BMMediaRouteOutputDevice *)p_isa;
}

- (id)_flattenedClusterLeafMembersJSONArray
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
  -[BMMediaRouteOutputDevice flattenedClusterLeafMembers](self, "flattenedClusterLeafMembers", 0);
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
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  -[BMMediaRouteOutputDevice outputDeviceID](self, "outputDeviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMediaRouteOutputDevice type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMediaRouteOutputDevice subType](self, "subType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMediaRouteOutputDevice clusterType](self, "clusterType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaRouteOutputDevice _flattenedClusterLeafMembersJSONArray](self, "_flattenedClusterLeafMembersJSONArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("outputDeviceID");
  v8 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v15 = v8;
  v22[0] = v8;
  v18 = CFSTR("type");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v8, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v9;
  v19 = CFSTR("subType");
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v10;
  v20 = CFSTR("clusterType");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v11;
  v21 = CFSTR("flattenedClusterLeafMembers");
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
      goto LABEL_13;
  }
  else
  {

    if (v6)
    {
LABEL_13:
      if (v5)
        goto LABEL_14;
      goto LABEL_19;
    }
  }

  if (v5)
  {
LABEL_14:
    if (v4)
      goto LABEL_15;
LABEL_20:

    if (v3)
      goto LABEL_16;
LABEL_21:

    goto LABEL_16;
  }
LABEL_19:

  if (!v4)
    goto LABEL_20;
LABEL_15:
  if (!v3)
    goto LABEL_21;
LABEL_16:

  return v13;
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
  char v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMediaRouteOutputDevice outputDeviceID](self, "outputDeviceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "outputDeviceID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMediaRouteOutputDevice outputDeviceID](self, "outputDeviceID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "outputDeviceID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_12;
    }
    v13 = -[BMMediaRouteOutputDevice type](self, "type");
    if (v13 == objc_msgSend(v5, "type"))
    {
      v14 = -[BMMediaRouteOutputDevice subType](self, "subType");
      if (v14 == objc_msgSend(v5, "subType"))
      {
        v15 = -[BMMediaRouteOutputDevice clusterType](self, "clusterType");
        if (v15 == objc_msgSend(v5, "clusterType"))
        {
          -[BMMediaRouteOutputDevice flattenedClusterLeafMembers](self, "flattenedClusterLeafMembers");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "flattenedClusterLeafMembers");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16 == v17)
          {
            v12 = 1;
          }
          else
          {
            -[BMMediaRouteOutputDevice flattenedClusterLeafMembers](self, "flattenedClusterLeafMembers");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "flattenedClusterLeafMembers");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v18, "isEqual:", v19);

          }
          goto LABEL_13;
        }
      }
    }
LABEL_12:
    v12 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)outputDeviceID
{
  return self->_outputDeviceID;
}

- (int)type
{
  return self->_type;
}

- (int)subType
{
  return self->_subType;
}

- (int)clusterType
{
  return self->_clusterType;
}

- (NSArray)flattenedClusterLeafMembers
{
  return self->_flattenedClusterLeafMembers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flattenedClusterLeafMembers, 0);
  objc_storeStrong((id *)&self->_outputDeviceID, 0);
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

    v4 = -[BMMediaRouteOutputDevice initByReadFrom:]([BMMediaRouteOutputDevice alloc], "initByReadFrom:", v7);
    v4[4] = 0;

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
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("outputDeviceID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("type"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("subType"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clusterType"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("flattenedClusterLeafMembers_json"), 5, 1, &__block_literal_global_200_30929);
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C3C0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("outputDeviceID"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("type"), 2, 4, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subType"), 3, 4, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clusterType"), 4, 4, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("flattenedClusterLeafMembers"), 5, 14, objc_opt_class());
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __35__BMMediaRouteOutputDevice_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_flattenedClusterLeafMembersJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
