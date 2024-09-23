@implementation BMDiscoverabilityUsage

- (BMDiscoverabilityUsage)initWithContentIdentifier:(id)a3 bundleID:(id)a4 contentType:(int)a5 context:(id)a6 eligibleContext:(id)a7 ineligibleReason:(int)a8 osBuild:(id)a9 state:(int)a10 analyticsEvent:(id)a11
{
  id v16;
  id v17;
  id v18;
  BMDiscoverabilityUsage *v19;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v16 = a3;
  v25 = a4;
  v24 = a6;
  v23 = a7;
  v17 = a9;
  v18 = a11;
  v26.receiver = self;
  v26.super_class = (Class)BMDiscoverabilityUsage;
  v19 = -[BMEventBase init](&v26, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v19->_contentIdentifier, a3);
    objc_storeStrong((id *)&v19->_bundleID, a4);
    v19->_contentType = a5;
    objc_storeStrong((id *)&v19->_context, a6);
    objc_storeStrong((id *)&v19->_eligibleContext, a7);
    v19->_ineligibleReason = a8;
    objc_storeStrong((id *)&v19->_osBuild, a9);
    v19->_state = a10;
    objc_storeStrong((id *)&v19->_analyticsEvent, a11);
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
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMDiscoverabilityUsage contentIdentifier](self, "contentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDiscoverabilityUsage bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMDiscoverabilityUsageContentTypeAsString(-[BMDiscoverabilityUsage contentType](self, "contentType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDiscoverabilityUsage context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDiscoverabilityUsage eligibleContext](self, "eligibleContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BMDiscoverabilityUsageIneligibleReasonAsString(-[BMDiscoverabilityUsage ineligibleReason](self, "ineligibleReason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDiscoverabilityUsage osBuild](self, "osBuild");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BMDiscoverabilityUsageStateAsString(-[BMDiscoverabilityUsage state](self, "state"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDiscoverabilityUsage analyticsEvent](self, "analyticsEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMDiscoverabilityUsage with contentIdentifier: %@, bundleID: %@, contentType: %@, context: %@, eligibleContext: %@, ineligibleReason: %@, osBuild: %@, state: %@, analyticsEvent: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDiscoverabilityUsage *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  void *v37;
  uint64_t v38;
  BMDiscoverabilityUsage *v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMDiscoverabilityUsage;
  v5 = -[BMEventBase init](&v41, sel_init);
  if (!v5)
    goto LABEL_72;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v8])
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v6;
        v14 = *(_QWORD *)&v4[v13];
        if (v14 == -1 || v14 >= *(_QWORD *)&v4[*v7])
          break;
        v15 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v16 = v11++ >= 9;
        if (v16)
        {
          v12 = 0;
          v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v17 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v17 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 32;
          goto LABEL_49;
        case 2u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
          goto LABEL_49;
        case 3u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          while (2)
          {
            v24 = *v6;
            v25 = *(_QWORD *)&v4[v24];
            if (v25 == -1 || v25 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v25);
              *(_QWORD *)&v4[v24] = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                v16 = v22++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_53:
          if (v23 >= 5)
            LODWORD(v23) = 0;
          v38 = 20;
          goto LABEL_68;
        case 4u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 48;
          goto LABEL_49;
        case 5u:
          PBReaderReadData();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 56;
          goto LABEL_49;
        case 6u:
          v27 = 0;
          v28 = 0;
          v23 = 0;
          while (2)
          {
            v29 = *v6;
            v30 = *(_QWORD *)&v4[v29];
            if (v30 == -1 || v30 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v30);
              *(_QWORD *)&v4[v29] = v30 + 1;
              v23 |= (unint64_t)(v31 & 0x7F) << v27;
              if (v31 < 0)
              {
                v27 += 7;
                v16 = v28++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_59:
          if (v23 >= 0x19)
            LODWORD(v23) = 0;
          v38 = 24;
          goto LABEL_68;
        case 7u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 64;
          goto LABEL_49;
        case 8u:
          v32 = 0;
          v33 = 0;
          v23 = 0;
          break;
        case 9u:
          PBReaderReadData();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 72;
LABEL_49:
          v37 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_71;
          continue;
      }
      while (1)
      {
        v34 = *v6;
        v35 = *(_QWORD *)&v4[v34];
        if (v35 == -1 || v35 >= *(_QWORD *)&v4[*v7])
          break;
        v36 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v35);
        *(_QWORD *)&v4[v34] = v35 + 1;
        v23 |= (unint64_t)(v36 & 0x7F) << v32;
        if ((v36 & 0x80) == 0)
          goto LABEL_63;
        v32 += 7;
        v16 = v33++ >= 9;
        if (v16)
        {
          LODWORD(v23) = 0;
          goto LABEL_65;
        }
      }
      v4[*v8] = 1;
LABEL_63:
      if (v4[*v8])
        LODWORD(v23) = 0;
LABEL_65:
      if (v23 >= 0xA)
        LODWORD(v23) = 0;
      v38 = 28;
LABEL_68:
      *(_DWORD *)((char *)&v5->super.super.isa + v38) = v23;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_71:
    v39 = 0;
  else
LABEL_72:
    v39 = v5;

  return v39;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_contentIdentifier)
    PBDataWriterWriteStringField();
  if (self->_bundleID)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_context)
    PBDataWriterWriteStringField();
  if (self->_eligibleContext)
    PBDataWriterWriteDataField();
  PBDataWriterWriteUint32Field();
  if (self->_osBuild)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_analyticsEvent)
    PBDataWriterWriteDataField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMDiscoverabilityUsage writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDiscoverabilityUsage)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id *v26;
  void *v27;
  void *v28;
  id v29;
  BMDiscoverabilityUsage *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  BMDiscoverabilityUsage *v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  id v51;
  void *v52;
  id v53;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id *v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  _QWORD v102[3];

  v102[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contentIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          goto LABEL_72;
        }
        v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v21 = v9;
        v22 = *MEMORY[0x1E0D025B8];
        v99 = *MEMORY[0x1E0CB2D50];
        v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
        v100 = v84;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v22;
        v9 = v21;
        v83 = (void *)v23;
        v25 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v24, 2);
        v15 = 0;
        v26 = a4;
        a4 = 0;
        *v26 = v25;
        goto LABEL_71;
      }
      v81 = v9;
    }
    else
    {
      v81 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contentType"));
    v10 = objc_claimAutoreleasedReturnValue();
    v83 = (void *)v10;
    if (v10 && (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v11;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v77)
          {
            v84 = 0;
            a4 = 0;
            v15 = v81;
            goto LABEL_71;
          }
          v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v71 = v9;
          v56 = *MEMORY[0x1E0D025B8];
          v97 = *MEMORY[0x1E0CB2D50];
          v31 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("contentType"));
          v98 = v31;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
          v57 = objc_claimAutoreleasedReturnValue();
          v58 = v55;
          v27 = (void *)v57;
          v59 = v56;
          v9 = v71;
          v84 = 0;
          a4 = 0;
          *v77 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v59, 2, v57);
          goto LABEL_82;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDiscoverabilityUsageContentTypeFromString(v11));
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v84 = v12;
    }
    else
    {
      v84 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("context"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v7;
    if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v28 = v6;
      v29 = v8;
      v30 = self;
      v31 = 0;
LABEL_26:
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("eligibleContext"));
      v32 = objc_claimAutoreleasedReturnValue();
      v72 = v27;
      v73 = (void *)v32;
      v79 = v31;
      if (v32 && (v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          a4 = v77;
          if (!v77)
          {
            v82 = 0;
            v15 = v81;
            v38 = v73;
            self = v30;
            v8 = v29;
            v6 = v28;
            v7 = v76;
            goto LABEL_69;
          }
          v40 = v9;
          v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v42 = *MEMORY[0x1E0D025B8];
          v93 = *MEMORY[0x1E0CB2D50];
          v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("eligibleContext"));
          v94 = v78;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v41;
          v9 = v40;
          v31 = v79;
          v82 = 0;
          a4 = 0;
          *v77 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v42, 2, v34);
          v15 = v81;
          self = v30;
          v8 = v29;
          v6 = v28;
          v7 = v76;
          goto LABEL_68;
        }
        v82 = v33;
      }
      else
      {
        v82 = 0;
      }
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("ineligibleReason"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      self = v30;
      v75 = v29;
      v70 = v9;
      if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v35 = v34;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v77)
            {
              v78 = 0;
              a4 = 0;
              v15 = v81;
              v6 = v28;
              v8 = v75;
              v7 = v76;
              goto LABEL_68;
            }
            v62 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v63 = *MEMORY[0x1E0D025B8];
            v91 = *MEMORY[0x1E0CB2D50];
            v74 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("ineligibleReason"));
            v92 = v74;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = 0;
            a4 = 0;
            *v77 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v63, 2, v44);
            v9 = v70;
            v15 = v81;
            v6 = v28;
            v7 = v76;
LABEL_67:

            v8 = v75;
LABEL_68:

            v27 = v72;
            v38 = v73;
            goto LABEL_69;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDiscoverabilityUsageIneligibleReasonFromString(v34));
          v35 = (id)objc_claimAutoreleasedReturnValue();
        }
        v78 = v35;
      }
      else
      {
        v78 = 0;
      }
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("osBuild"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        v6 = v28;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v7 = v76;
          if (!v77)
          {
            v74 = 0;
            a4 = 0;
            v15 = v81;
            goto LABEL_67;
          }
          v46 = v30;
          v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v50 = *MEMORY[0x1E0D025B8];
          v89 = *MEMORY[0x1E0CB2D50];
          v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("osBuild"));
          v90 = v47;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v50, 2, v45);
          v74 = 0;
          a4 = 0;
          *v77 = v51;
          goto LABEL_93;
        }
        v74 = v44;
      }
      else
      {
        v74 = 0;
        v6 = v28;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("state"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v45 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v46 = self;
        v47 = 0;
        goto LABEL_61;
      }
      v46 = self;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = v45;
LABEL_60:
        v47 = v48;
LABEL_61:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("analyticsEvent"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (v52 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v15 = v81;
            a4 = v77;
            if (v77)
            {
              v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v68 = *MEMORY[0x1E0D025B8];
              v85 = *MEMORY[0x1E0CB2D50];
              v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("analyticsEvent"));
              v86 = v60;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              *v77 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v68, 2, v61);

              v53 = 0;
              a4 = 0;
            }
            else
            {
              v53 = 0;
            }
            goto LABEL_65;
          }
          v53 = v52;
        }
        else
        {
          v53 = 0;
        }
        objc_msgSend(v84, "intValue");
        objc_msgSend(v78, "intValue");
        LODWORD(v67) = objc_msgSend(v47, "intValue");
        v15 = v81;
        a4 = -[BMDiscoverabilityUsage initWithContentIdentifier:bundleID:contentType:context:eligibleContext:ineligibleReason:osBuild:state:analyticsEvent:](v46, "initWithContentIdentifier:bundleID:contentType:context:eligibleContext:ineligibleReason:osBuild:state:analyticsEvent:", v75, v74, v67, v53);
        v46 = (BMDiscoverabilityUsage *)a4;
LABEL_65:

LABEL_66:
        self = v46;
        v7 = v76;
        v9 = v70;
        v31 = v79;
        goto LABEL_67;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDiscoverabilityUsageStateFromString(v45));
        v48 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_60;
      }
      if (v77)
      {
        v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v65 = *MEMORY[0x1E0D025B8];
        v87 = *MEMORY[0x1E0CB2D50];
        v53 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("state"));
        v88 = v53;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v65, 2, v52);
        v47 = 0;
        a4 = 0;
        *v77 = v66;
        v15 = v81;
        goto LABEL_65;
      }
      v47 = 0;
      a4 = 0;
LABEL_93:
      v15 = v81;
      goto LABEL_66;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = v6;
      v29 = v8;
      v30 = self;
      v31 = v27;
      goto LABEL_26;
    }
    a4 = v77;
    if (v77)
    {
      v80 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v36 = v9;
      v37 = *MEMORY[0x1E0D025B8];
      v95 = *MEMORY[0x1E0CB2D50];
      v82 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("context"));
      v96 = v82;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v37;
      v9 = v36;
      v31 = 0;
      a4 = 0;
      *v77 = (id)objc_msgSend(v80, "initWithDomain:code:userInfo:", v39, 2, v38);
      v15 = v81;
LABEL_69:

LABEL_70:
LABEL_71:

      goto LABEL_72;
    }
    v31 = 0;
LABEL_82:
    v15 = v81;
    goto LABEL_70;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (a4)
  {
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v14 = *MEMORY[0x1E0D025B8];
    v101 = *MEMORY[0x1E0CB2D50];
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contentIdentifier"));
    v102[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, &v101, 1);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v14;
    v9 = (void *)v16;
    v18 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v17, 2, v16);
    v8 = 0;
    v19 = a4;
    a4 = 0;
    *v19 = v18;
LABEL_72:

    goto LABEL_73;
  }
  v8 = 0;
LABEL_73:

  return (BMDiscoverabilityUsage *)a4;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[9];
  _QWORD v34[11];

  v34[9] = *MEMORY[0x1E0C80C00];
  -[BMDiscoverabilityUsage contentIdentifier](self, "contentIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMDiscoverabilityUsage bundleID](self, "bundleID");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDiscoverabilityUsage contentType](self, "contentType"));
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMDiscoverabilityUsage context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDiscoverabilityUsage eligibleContext](self, "eligibleContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDiscoverabilityUsage ineligibleReason](self, "ineligibleReason"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDiscoverabilityUsage osBuild](self, "osBuild");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDiscoverabilityUsage state](self, "state"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDiscoverabilityUsage analyticsEvent](self, "analyticsEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = CFSTR("contentIdentifier");
  v13 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v13;
  v34[0] = v13;
  v33[1] = CFSTR("bundleID");
  v14 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v14;
  v34[1] = v14;
  v33[2] = CFSTR("contentType");
  v15 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v3;
  v25 = (void *)v15;
  v34[2] = v15;
  v33[3] = CFSTR("context");
  v16 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v4;
  v24 = (void *)v16;
  v34[3] = v16;
  v33[4] = CFSTR("eligibleContext");
  v17 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v5;
  v34[4] = v17;
  v33[5] = CFSTR("ineligibleReason");
  v18 = v32;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[5] = v18;
  v33[6] = CFSTR("osBuild");
  v19 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v8;
  v34[6] = v19;
  v33[7] = CFSTR("state");
  v21 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[7] = v21;
  v33[8] = CFSTR("analyticsEvent");
  v22 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[8] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 9);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v10)
      goto LABEL_21;
LABEL_33:

    if (v9)
      goto LABEL_22;
    goto LABEL_34;
  }

  if (!v10)
    goto LABEL_33;
LABEL_21:
  if (v9)
    goto LABEL_22;
LABEL_34:

LABEL_22:
  if (!v32)

  if (!v20)
  if (!v6)

  if (v29)
  {
    if (v30)
      goto LABEL_30;
LABEL_36:

    if (v31)
      goto LABEL_31;
LABEL_37:

    goto LABEL_31;
  }

  if (!v30)
    goto LABEL_36;
LABEL_30:
  if (!v31)
    goto LABEL_37;
LABEL_31:

  return v28;
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
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMDiscoverabilityUsage contentIdentifier](self, "contentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMDiscoverabilityUsage contentIdentifier](self, "contentIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_28;
    }
    -[BMDiscoverabilityUsage bundleID](self, "bundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMDiscoverabilityUsage bundleID](self, "bundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_28;
    }
    v19 = -[BMDiscoverabilityUsage contentType](self, "contentType");
    if (v19 == objc_msgSend(v5, "contentType"))
    {
      -[BMDiscoverabilityUsage context](self, "context");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "context");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMDiscoverabilityUsage context](self, "context");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "context");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_28;
      }
      -[BMDiscoverabilityUsage eligibleContext](self, "eligibleContext");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eligibleContext");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[BMDiscoverabilityUsage eligibleContext](self, "eligibleContext");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "eligibleContext");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_28;
      }
      v32 = -[BMDiscoverabilityUsage ineligibleReason](self, "ineligibleReason");
      if (v32 == objc_msgSend(v5, "ineligibleReason"))
      {
        -[BMDiscoverabilityUsage osBuild](self, "osBuild");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "osBuild");
        v34 = objc_claimAutoreleasedReturnValue();
        if (v33 == (void *)v34)
        {

        }
        else
        {
          v35 = (void *)v34;
          -[BMDiscoverabilityUsage osBuild](self, "osBuild");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "osBuild");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v36, "isEqual:", v37);

          if (!v38)
            goto LABEL_28;
        }
        v39 = -[BMDiscoverabilityUsage state](self, "state");
        if (v39 == objc_msgSend(v5, "state"))
        {
          -[BMDiscoverabilityUsage analyticsEvent](self, "analyticsEvent");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "analyticsEvent");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40 == v41)
          {
            v12 = 1;
          }
          else
          {
            -[BMDiscoverabilityUsage analyticsEvent](self, "analyticsEvent");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "analyticsEvent");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v42, "isEqual:", v43);

          }
          goto LABEL_29;
        }
      }
    }
LABEL_28:
    v12 = 0;
LABEL_29:

    goto LABEL_30;
  }
  v12 = 0;
LABEL_30:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (int)contentType
{
  return self->_contentType;
}

- (NSString)context
{
  return self->_context;
}

- (NSData)eligibleContext
{
  return self->_eligibleContext;
}

- (int)ineligibleReason
{
  return self->_ineligibleReason;
}

- (NSString)osBuild
{
  return self->_osBuild;
}

- (int)state
{
  return self->_state;
}

- (NSData)analyticsEvent
{
  return self->_analyticsEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEvent, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_eligibleContext, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
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

    v4 = -[BMDiscoverabilityUsage initByReadFrom:]([BMDiscoverabilityUsage alloc], "initByReadFrom:", v7);
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
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentIdentifier"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentType"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("context"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eligibleContext"), 4, 0, 5, 14, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("ineligibleReason"), 0, 0, 6, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("osBuild"), 2, 0, 7, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("state"), 0, 0, 8, 4, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("analyticsEvent"), 4, 0, 9, 14, 0);
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1E0D0;
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
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentIdentifier"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 2, 13, 0, v2);
  v13[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentType"), 3, 4, 0);
  v13[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("context"), 4, 13, 0);
  v13[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eligibleContext"), 5, 14, 0);
  v13[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ineligibleReason"), 6, 4, 0);
  v13[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("osBuild"), 7, 13, 0);
  v13[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("state"), 8, 4, 0);
  v13[7] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("analyticsEvent"), 9, 14, 0);
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
