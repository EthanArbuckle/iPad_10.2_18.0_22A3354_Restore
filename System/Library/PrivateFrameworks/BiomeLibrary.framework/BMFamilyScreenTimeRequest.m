@implementation BMFamilyScreenTimeRequest

- (BMFamilyScreenTimeRequest)initWithRequestID:(id)a3 eventTime:(id)a4 requesterDSID:(id)a5 responderDSID:(id)a6 requestKind:(int)a7 status:(int)a8 approvalTime:(int)a9 websitePath:(id)a10 bundleID:(id)a11 isActionUserDevice:(id)a12
{
  id v17;
  id v18;
  id v19;
  BMFamilyScreenTimeRequest *v20;
  double v21;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v28 = a3;
  v17 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a10;
  v18 = a11;
  v19 = a12;
  v29.receiver = self;
  v29.super_class = (Class)BMFamilyScreenTimeRequest;
  v20 = -[BMEventBase init](&v29, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v20->_requestID, a3);
    if (v17)
    {
      v20->_hasRaw_eventTime = 1;
      objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v20->_hasRaw_eventTime = 0;
      v21 = -1.0;
    }
    v20->_raw_eventTime = v21;
    objc_storeStrong((id *)&v20->_requesterDSID, a5);
    objc_storeStrong((id *)&v20->_responderDSID, a6);
    v20->_requestKind = a7;
    v20->_status = a8;
    v20->_approvalTime = a9;
    objc_storeStrong((id *)&v20->_websitePath, a10);
    objc_storeStrong((id *)&v20->_bundleID, a11);
    if (v19)
    {
      v20->_hasIsActionUserDevice = 1;
      v20->_isActionUserDevice = objc_msgSend(v19, "BOOLValue");
    }
    else
    {
      v20->_hasIsActionUserDevice = 0;
      v20->_isActionUserDevice = 0;
    }
  }

  return v20;
}

- (NSString)description
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
  void *v13;
  id v14;
  id v15;

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMFamilyScreenTimeRequest requestID](self, "requestID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFamilyScreenTimeRequest eventTime](self, "eventTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFamilyScreenTimeRequest requesterDSID](self, "requesterDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFamilyScreenTimeRequest responderDSID](self, "responderDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMFamilyScreenTimeRequestKindAsString(-[BMFamilyScreenTimeRequest requestKind](self, "requestKind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMFamilyScreenTimeRequestStatusAsString(-[BMFamilyScreenTimeRequest status](self, "status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMFamilyScreenTimeRequestApprovedTimeAsString(-[BMFamilyScreenTimeRequest approvalTime](self, "approvalTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFamilyScreenTimeRequest websitePath](self, "websitePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFamilyScreenTimeRequest bundleID](self, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMFamilyScreenTimeRequest isActionUserDevice](self, "isActionUserDevice"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "initWithFormat:", CFSTR("BMFamilyScreenTimeRequest with requestID: %@, eventTime: %@, requesterDSID: %@, responderDSID: %@, requestKind: %@, status: %@, approvalTime: %@, websitePath: %@, bundleID: %@, isActionUserDevice: %@"), v13, v3, v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v15;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMFamilyScreenTimeRequest *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  double v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  void *v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  uint64_t v52;
  BMFamilyScreenTimeRequest *v53;
  objc_super v55;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)BMFamilyScreenTimeRequest;
  v5 = -[BMEventBase init](&v55, sel_init);
  if (!v5)
    goto LABEL_87;
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
        v15 = v14 + 1;
        if (v14 == -1 || v15 > *(_QWORD *)&v4[*v7])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v17 = v11++ >= 9;
        if (v17)
        {
          v12 = 0;
          v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v18 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v18 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 56;
          goto LABEL_51;
        case 2u:
          v5->_hasRaw_eventTime = 1;
          v22 = *v6;
          v23 = *(_QWORD *)&v4[v22];
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v24 = *(double *)(*(_QWORD *)&v4[*v9] + v23);
            *(_QWORD *)&v4[v22] = v23 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v24 = 0.0;
          }
          v5->_raw_eventTime = v24;
          continue;
        case 3u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 64;
          goto LABEL_51;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 72;
          goto LABEL_51;
        case 5u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          while (2)
          {
            v28 = *v6;
            v29 = *(_QWORD *)&v4[v28];
            v30 = v29 + 1;
            if (v29 == -1 || v30 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v29);
              *(_QWORD *)&v4[v28] = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                v17 = v26++ >= 9;
                if (v17)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_62;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_62:
          if (v27 >= 3)
            LODWORD(v27) = 0;
          v52 = 40;
          goto LABEL_77;
        case 6u:
          v32 = 0;
          v33 = 0;
          v27 = 0;
          while (2)
          {
            v34 = *v6;
            v35 = *(_QWORD *)&v4[v34];
            v36 = v35 + 1;
            if (v35 == -1 || v36 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v35);
              *(_QWORD *)&v4[v34] = v36;
              v27 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v17 = v33++ >= 9;
                if (v17)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_68:
          if (v27 >= 4)
            LODWORD(v27) = 0;
          v52 = 44;
          goto LABEL_77;
        case 7u:
          v38 = 0;
          v39 = 0;
          v27 = 0;
          while (2)
          {
            v40 = *v6;
            v41 = *(_QWORD *)&v4[v40];
            v42 = v41 + 1;
            if (v41 == -1 || v42 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v41);
              *(_QWORD *)&v4[v40] = v42;
              v27 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v17 = v39++ >= 9;
                if (v17)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_74:
          if (v27 >= 4)
            LODWORD(v27) = 0;
          v52 = 48;
LABEL_77:
          *(_DWORD *)((char *)&v5->super.super.isa + v52) = v27;
          continue;
        case 8u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 80;
          goto LABEL_51;
        case 9u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 88;
LABEL_51:
          v44 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 0xAu:
          v45 = 0;
          v46 = 0;
          v47 = 0;
          v5->_hasIsActionUserDevice = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_86;
          continue;
      }
      while (1)
      {
        v48 = *v6;
        v49 = *(_QWORD *)&v4[v48];
        v50 = v49 + 1;
        if (v49 == -1 || v50 > *(_QWORD *)&v4[*v7])
          break;
        v51 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v49);
        *(_QWORD *)&v4[v48] = v50;
        v47 |= (unint64_t)(v51 & 0x7F) << v45;
        if ((v51 & 0x80) == 0)
          goto LABEL_79;
        v45 += 7;
        v17 = v46++ >= 9;
        if (v17)
        {
          v47 = 0;
          goto LABEL_81;
        }
      }
      v4[*v8] = 1;
LABEL_79:
      if (v4[*v8])
        v47 = 0;
LABEL_81:
      v5->_isActionUserDevice = v47 != 0;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_86:
    v53 = 0;
  else
LABEL_87:
    v53 = v5;

  return v53;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_requestID)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_eventTime)
    PBDataWriterWriteDoubleField();
  if (self->_requesterDSID)
    PBDataWriterWriteStringField();
  if (self->_responderDSID)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_websitePath)
    PBDataWriterWriteStringField();
  if (self->_bundleID)
    PBDataWriterWriteStringField();
  v4 = v5;
  if (self->_hasIsActionUserDevice)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMFamilyScreenTimeRequest writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMFamilyScreenTimeRequest)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BMFamilyScreenTimeRequest *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  BMFamilyScreenTimeRequest *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  BMFamilyScreenTimeRequest *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  void *v58;
  id v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  id v69;
  uint64_t v70;
  id v71;
  id v72;
  uint64_t v73;
  id v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  void *v96;
  id v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  id v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  id v113;
  uint64_t v114;
  id v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  _QWORD v119[3];

  v119[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("requestID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eventTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (objc_class *)MEMORY[0x1E0C99D68];
        v10 = v8;
        v11 = [v9 alloc];
        objc_msgSend(v10, "doubleValue");
        v13 = v12;

        v14 = (id)objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:", v13);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v20, "dateFromString:", v8);
          v99 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v99 = 0;
            v19 = 0;
            goto LABEL_51;
          }
          v75 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v76 = v8;
          v77 = *MEMORY[0x1E0D025B8];
          v116 = *MEMORY[0x1E0CB2D50];
          v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("eventTime"));
          v117 = v41;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
          v78 = objc_claimAutoreleasedReturnValue();
          v79 = v77;
          v8 = v76;
          v96 = (void *)v78;
          v99 = 0;
          v19 = 0;
          *a4 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v79, 2);
          goto LABEL_50;
        }
        v14 = v8;
      }
      v99 = v14;
    }
    else
    {
      v99 = 0;
    }
LABEL_16:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("requesterDSID"));
    v21 = objc_claimAutoreleasedReturnValue();
    v96 = (void *)v21;
    if (v21 && (v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v41 = 0;
          v19 = 0;
          goto LABEL_50;
        }
        v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v44 = v8;
        v45 = *MEMORY[0x1E0D025B8];
        v114 = *MEMORY[0x1E0CB2D50];
        v98 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("requesterDSID"));
        v115 = v98;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = v43;
        v24 = (void *)v46;
        v48 = v45;
        v8 = v44;
        v41 = 0;
        v19 = 0;
        *a4 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v48, 2, v46);
LABEL_49:

LABEL_50:
        goto LABEL_51;
      }
      v95 = v22;
    }
    else
    {
      v95 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("responderDSID"));
    v23 = objc_claimAutoreleasedReturnValue();
    v91 = (void *)v23;
    if (v23 && (v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v98 = 0;
          v19 = 0;
          v41 = v95;
          goto LABEL_49;
        }
        v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v50 = v8;
        v51 = *MEMORY[0x1E0D025B8];
        v112 = *MEMORY[0x1E0CB2D50];
        v93 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("responderDSID"));
        v113 = v93;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v49;
        v24 = v91;
        v53 = v51;
        v8 = v50;
        v98 = 0;
        v19 = 0;
        *a4 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v53, 2, v25);
        v41 = v95;
        goto LABEL_48;
      }
      v98 = v24;
    }
    else
    {
      v98 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("requestKind"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v6;
    if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = v7;
        v27 = self;
        v93 = v25;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v93 = 0;
            v19 = 0;
            v41 = v95;
            v24 = v91;
            goto LABEL_48;
          }
          v94 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v64 = v8;
          v65 = *MEMORY[0x1E0D025B8];
          v110 = *MEMORY[0x1E0CB2D50];
          v90 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("requestKind"));
          v111 = v90;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
          v66 = objc_claimAutoreleasedReturnValue();
          v67 = v65;
          v8 = v64;
          v87 = (void *)v66;
          v68 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v67, 2);
          v93 = 0;
          v19 = 0;
          *a4 = v68;
          v41 = v95;
          v24 = v91;
LABEL_47:

LABEL_48:
          goto LABEL_49;
        }
        v26 = v7;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMFamilyScreenTimeRequestKindFromString(v25));
        v93 = (id)objc_claimAutoreleasedReturnValue();
        v27 = self;
      }
    }
    else
    {
      v26 = v7;
      v27 = self;
      v93 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
    v28 = objc_claimAutoreleasedReturnValue();
    v86 = v25;
    v87 = (void *)v28;
    if (v28 && (v29 = (void *)v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v90 = v29;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v90 = 0;
            v19 = 0;
            v41 = v95;
            self = v27;
            v7 = v26;
            v24 = v91;
            v6 = v92;
            goto LABEL_47;
          }
          v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v70 = *MEMORY[0x1E0D025B8];
          v108 = *MEMORY[0x1E0CB2D50];
          v89 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("status"));
          v109 = v89;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v70, 2);
          v90 = 0;
          v19 = 0;
          *a4 = v71;
          self = v27;
          v7 = v26;
          v24 = v91;
          v6 = v92;
          goto LABEL_46;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMFamilyScreenTimeRequestStatusFromString(v29));
        v90 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v90 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("approvalTime"));
    v30 = objc_claimAutoreleasedReturnValue();
    v85 = (void *)v30;
    if (v30 && (v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      self = v27;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v89 = 0;
            v19 = 0;
            v7 = v26;
            v24 = v91;
            v6 = v92;
            goto LABEL_45;
          }
          v72 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v73 = *MEMORY[0x1E0D025B8];
          v106 = *MEMORY[0x1E0CB2D50];
          v88 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("approvalTime"));
          v107 = v88;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v73, 2, v32);
          v89 = 0;
          v19 = 0;
          *a4 = v74;
          v7 = v26;
          v6 = v92;
LABEL_44:

          v24 = v91;
LABEL_45:
          v25 = v86;
LABEL_46:

          v41 = v95;
          goto LABEL_47;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMFamilyScreenTimeRequestApprovedTimeFromString(v31));
        v89 = (id)objc_claimAutoreleasedReturnValue();
        v7 = v26;
LABEL_32:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("websitePath"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v92;
        if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v19 = (BMFamilyScreenTimeRequest *)a4;
            if (!a4)
            {
              v88 = 0;
              goto LABEL_44;
            }
            v54 = v8;
            v55 = v7;
            v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v57 = *MEMORY[0x1E0D025B8];
            v104 = *MEMORY[0x1E0CB2D50];
            v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("websitePath"));
            v105 = v36;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = v56;
            v7 = v55;
            v8 = v54;
            v59 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v57, 2, v33);
            v19 = 0;
            v88 = 0;
            *a4 = v59;
            goto LABEL_43;
          }
          v88 = v32;
        }
        else
        {
          v88 = 0;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleID"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v8;
        if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v36 = 0;
              v19 = 0;
              v6 = v92;
              goto LABEL_43;
            }
            v34 = v7;
            v35 = self;
            v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v60 = *MEMORY[0x1E0D025B8];
            v102 = *MEMORY[0x1E0CB2D50];
            v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
            v103 = v38;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v60, 2, v37);
            v19 = 0;
            v36 = 0;
            *a4 = v61;
            goto LABEL_42;
          }
          v34 = v7;
          v35 = self;
          v36 = v33;
        }
        else
        {
          v34 = v7;
          v35 = self;
          v36 = 0;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isActionUserDevice"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
              v83 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v81 = *MEMORY[0x1E0D025B8];
              v100 = *MEMORY[0x1E0CB2D50];
              v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isActionUserDevice"));
              v101 = v62;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              *a4 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v81, 2, v63);

            }
            v38 = 0;
            v19 = 0;
            goto LABEL_42;
          }
          v38 = v37;
        }
        else
        {
          v38 = 0;
        }
        v39 = objc_msgSend(v93, "intValue");
        v40 = objc_msgSend(v90, "intValue");
        LODWORD(v80) = objc_msgSend(v89, "intValue");
        v19 = -[BMFamilyScreenTimeRequest initWithRequestID:eventTime:requesterDSID:responderDSID:requestKind:status:approvalTime:websitePath:bundleID:isActionUserDevice:](v35, "initWithRequestID:eventTime:requesterDSID:responderDSID:requestKind:status:approvalTime:websitePath:bundleID:isActionUserDevice:", v34, v99, v95, v98, v39, v40, v80, v88, v36, v38);
        v35 = v19;
LABEL_42:

        self = v35;
        v6 = v92;
        v7 = v34;
        v8 = v84;
LABEL_43:

        goto LABEL_44;
      }
      v89 = v31;
    }
    else
    {
      v89 = 0;
      self = v27;
    }
    v7 = v26;
    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    goto LABEL_4;
  }
  if (!a4)
  {
    v7 = 0;
    v19 = 0;
    goto LABEL_52;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v16 = *MEMORY[0x1E0D025B8];
  v118 = *MEMORY[0x1E0CB2D50];
  v99 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("requestID"));
  v119[0] = v99;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, &v118, 1);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v16;
  v8 = (void *)v17;
  v7 = 0;
  v19 = 0;
  *a4 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v18, 2, v17);
LABEL_51:

LABEL_52:
  return v19;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[10];
  _QWORD v38[12];

  v38[10] = *MEMORY[0x1E0C80C00];
  -[BMFamilyScreenTimeRequest requestID](self, "requestID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMFamilyScreenTimeRequest eventTime](self, "eventTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMFamilyScreenTimeRequest eventTime](self, "eventTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  -[BMFamilyScreenTimeRequest requesterDSID](self, "requesterDSID");
  v8 = objc_claimAutoreleasedReturnValue();
  -[BMFamilyScreenTimeRequest responderDSID](self, "responderDSID");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMFamilyScreenTimeRequest requestKind](self, "requestKind"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMFamilyScreenTimeRequest status](self, "status"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMFamilyScreenTimeRequest approvalTime](self, "approvalTime"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFamilyScreenTimeRequest websitePath](self, "websitePath");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFamilyScreenTimeRequest bundleID](self, "bundleID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMFamilyScreenTimeRequest hasIsActionUserDevice](self, "hasIsActionUserDevice"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMFamilyScreenTimeRequest isActionUserDevice](self, "isActionUserDevice"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v37[0] = CFSTR("requestID");
  v13 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v13;
  v38[0] = v13;
  v37[1] = CFSTR("eventTime");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v14;
  v38[1] = v14;
  v37[2] = CFSTR("requesterDSID");
  v15 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v15;
  v38[2] = v15;
  v37[3] = CFSTR("responderDSID");
  v16 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v3;
  v26 = (void *)v16;
  v38[3] = v16;
  v37[4] = CFSTR("requestKind");
  v17 = (void *)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v7;
  v38[4] = v17;
  v37[5] = CFSTR("status");
  v18 = v36;
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v8;
  v38[5] = v18;
  v37[6] = CFSTR("approvalTime");
  v19 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v9;
  v38[6] = v19;
  v37[7] = CFSTR("websitePath");
  v21 = v35;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v10;
  v38[7] = v21;
  v37[8] = CFSTR("bundleID");
  v23 = v34;
  if (!v34)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[8] = v23;
  v37[9] = CFSTR("isActionUserDevice");
  v24 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[9] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 10);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)

  if (!v34)
  if (v35)
  {
    if (v11)
      goto LABEL_33;
  }
  else
  {

    if (v11)
      goto LABEL_33;
  }

LABEL_33:
  if (!v36)

  if (!v22)
  if (v20)
  {
    if (v31)
      goto LABEL_39;
  }
  else
  {

    if (v31)
    {
LABEL_39:
      if (v32)
        goto LABEL_40;
LABEL_46:

      if (v33)
        goto LABEL_41;
LABEL_47:

      goto LABEL_41;
    }
  }

  if (!v32)
    goto LABEL_46;
LABEL_40:
  if (!v33)
    goto LABEL_47;
LABEL_41:

  return v30;
}

- (NSDate)eventTime
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_eventTime)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_eventTime);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
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
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  int v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  _BOOL4 v46;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMFamilyScreenTimeRequest requestID](self, "requestID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMFamilyScreenTimeRequest requestID](self, "requestID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "requestID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_35;
    }
    -[BMFamilyScreenTimeRequest eventTime](self, "eventTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventTime");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMFamilyScreenTimeRequest eventTime](self, "eventTime");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventTime");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_35;
    }
    -[BMFamilyScreenTimeRequest requesterDSID](self, "requesterDSID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requesterDSID");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMFamilyScreenTimeRequest requesterDSID](self, "requesterDSID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "requesterDSID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_35;
    }
    -[BMFamilyScreenTimeRequest responderDSID](self, "responderDSID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "responderDSID");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMFamilyScreenTimeRequest responderDSID](self, "responderDSID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "responderDSID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_35;
    }
    v31 = -[BMFamilyScreenTimeRequest requestKind](self, "requestKind");
    if (v31 != objc_msgSend(v5, "requestKind"))
      goto LABEL_35;
    v32 = -[BMFamilyScreenTimeRequest status](self, "status");
    if (v32 != objc_msgSend(v5, "status"))
      goto LABEL_35;
    v33 = -[BMFamilyScreenTimeRequest approvalTime](self, "approvalTime");
    if (v33 != objc_msgSend(v5, "approvalTime"))
      goto LABEL_35;
    -[BMFamilyScreenTimeRequest websitePath](self, "websitePath");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "websitePath");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v34 == (void *)v35)
    {

    }
    else
    {
      v36 = (void *)v35;
      -[BMFamilyScreenTimeRequest websitePath](self, "websitePath");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "websitePath");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isEqual:", v38);

      if (!v39)
        goto LABEL_35;
    }
    -[BMFamilyScreenTimeRequest bundleID](self, "bundleID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v41 = objc_claimAutoreleasedReturnValue();
    if (v40 == (void *)v41)
    {

    }
    else
    {
      v42 = (void *)v41;
      -[BMFamilyScreenTimeRequest bundleID](self, "bundleID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v43, "isEqual:", v44);

      if (!v45)
        goto LABEL_35;
    }
    if (!-[BMFamilyScreenTimeRequest hasIsActionUserDevice](self, "hasIsActionUserDevice")
      && !objc_msgSend(v5, "hasIsActionUserDevice"))
    {
      LOBYTE(v12) = 1;
      goto LABEL_36;
    }
    if (-[BMFamilyScreenTimeRequest hasIsActionUserDevice](self, "hasIsActionUserDevice")
      && objc_msgSend(v5, "hasIsActionUserDevice"))
    {
      v46 = -[BMFamilyScreenTimeRequest isActionUserDevice](self, "isActionUserDevice");
      v12 = v46 ^ objc_msgSend(v5, "isActionUserDevice") ^ 1;
LABEL_36:

      goto LABEL_37;
    }
LABEL_35:
    LOBYTE(v12) = 0;
    goto LABEL_36;
  }
  LOBYTE(v12) = 0;
LABEL_37:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (NSString)requesterDSID
{
  return self->_requesterDSID;
}

- (NSString)responderDSID
{
  return self->_responderDSID;
}

- (int)requestKind
{
  return self->_requestKind;
}

- (int)status
{
  return self->_status;
}

- (int)approvalTime
{
  return self->_approvalTime;
}

- (NSString)websitePath
{
  return self->_websitePath;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (BOOL)isActionUserDevice
{
  return self->_isActionUserDevice;
}

- (BOOL)hasIsActionUserDevice
{
  return self->_hasIsActionUserDevice;
}

- (void)setHasIsActionUserDevice:(BOOL)a3
{
  self->_hasIsActionUserDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_websitePath, 0);
  objc_storeStrong((id *)&self->_responderDSID, 0);
  objc_storeStrong((id *)&self->_requesterDSID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

+ (unsigned)latestDataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 1)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMFamilyScreenTimeRequest initByReadFrom:]([BMFamilyScreenTimeRequest alloc], "initByReadFrom:", v6);
    v7[9] = 1;

  }
  else
  {
    v7 = 0;
  }
  return v7;
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
  id v13;
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("requestID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventTime"), 3, 0, 2, 0, 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("requesterDSID"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("responderDSID"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("requestKind"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("status"), 0, 0, 6, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("approvalTime"), 0, 0, 7, 4, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("websitePath"), 2, 0, 8, 13, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 9, 13, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isActionUserDevice"), 0, 0, 10, 12, 0);
  v14[0] = v2;
  v14[1] = v3;
  v14[2] = v4;
  v14[3] = v5;
  v14[4] = v6;
  v14[5] = v7;
  v14[6] = v8;
  v14[7] = v9;
  v14[8] = v10;
  v14[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1F570;
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
  void *v13;
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("requestID"), 1, 13, 0);
  v14[0] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventTime"), 2, 0, 0);
  v14[1] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("requesterDSID"), 3, 13, 0);
  v14[2] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("responderDSID"), 4, 13, 0);
  v14[3] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("requestKind"), 5, 4, 0);
  v14[4] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("status"), 6, 4, 0);
  v14[5] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("approvalTime"), 7, 4, 0);
  v14[6] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("websitePath"), 8, 13, 0);
  v14[7] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 9, 13, 0);
  v14[8] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isActionUserDevice"), 10, 12, 0);
  v14[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
