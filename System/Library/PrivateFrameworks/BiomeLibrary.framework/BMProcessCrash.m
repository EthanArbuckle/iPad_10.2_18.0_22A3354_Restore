@implementation BMProcessCrash

- (BMProcessCrash)initWithIncidentID:(id)a3 processName:(id)a4 bundleID:(id)a5 appVersion:(id)a6 bundleVersion:(id)a7 exception:(id)a8 terminationReason:(id)a9 responsibleApp:(id)a10
{
  return -[BMProcessCrash initWithIncidentID:processName:bundleID:appVersion:bundleVersion:exception:terminationReason:responsibleApp:coalitionName:isFirstParty:isBeta:](self, "initWithIncidentID:processName:bundleID:appVersion:bundleVersion:exception:terminationReason:responsibleApp:coalitionName:isFirstParty:isBeta:", a3, a4, a5, a6, a7, a8, a9, a10, 0, 0, 0);
}

- (BMProcessCrash)initWithIncidentID:(id)a3 processName:(id)a4 bundleID:(id)a5 appVersion:(id)a6 bundleVersion:(id)a7 exception:(id)a8 terminationReason:(id)a9 responsibleApp:(id)a10 coalitionName:(id)a11
{
  return -[BMProcessCrash initWithIncidentID:processName:bundleID:appVersion:bundleVersion:exception:terminationReason:responsibleApp:coalitionName:isFirstParty:isBeta:](self, "initWithIncidentID:processName:bundleID:appVersion:bundleVersion:exception:terminationReason:responsibleApp:coalitionName:isFirstParty:isBeta:", a3, a4, a5, a6, a7, a8, a9, a10, 0, 0, 0);
}

- (BMProcessCrash)initWithIncidentID:(id)a3 processName:(id)a4 bundleID:(id)a5 appVersion:(id)a6 bundleVersion:(id)a7 exception:(id)a8 terminationReason:(id)a9 responsibleApp:(id)a10 coalitionName:(id)a11 isFirstParty:(id)a12 isBeta:(id)a13
{
  id v18;
  id v19;
  BMProcessCrash *v20;
  id v23;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v33 = a3;
  v23 = a4;
  v32 = a4;
  v31 = a5;
  v30 = a6;
  v29 = a7;
  v28 = a8;
  v27 = a9;
  v26 = a10;
  v25 = a11;
  v18 = a12;
  v19 = a13;
  v34.receiver = self;
  v34.super_class = (Class)BMProcessCrash;
  v20 = -[BMEventBase init](&v34, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v20->_incidentID, a3);
    objc_storeStrong((id *)&v20->_processName, v23);
    objc_storeStrong((id *)&v20->_bundleID, a5);
    objc_storeStrong((id *)&v20->_appVersion, a6);
    objc_storeStrong((id *)&v20->_bundleVersion, a7);
    objc_storeStrong((id *)&v20->_exception, a8);
    objc_storeStrong((id *)&v20->_terminationReason, a9);
    objc_storeStrong((id *)&v20->_responsibleApp, a10);
    objc_storeStrong((id *)&v20->_coalitionName, a11);
    if (v18)
    {
      v20->_hasIsFirstParty = 1;
      v20->_isFirstParty = objc_msgSend(v18, "BOOLValue");
    }
    else
    {
      v20->_hasIsFirstParty = 0;
      v20->_isFirstParty = 0;
    }
    if (v19)
    {
      v20->_hasIsBeta = 1;
      v20->_isBeta = objc_msgSend(v19, "BOOLValue");
    }
    else
    {
      v20->_hasIsBeta = 0;
      v20->_isBeta = 0;
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
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMProcessCrash incidentID](self, "incidentID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProcessCrash processName](self, "processName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProcessCrash bundleID](self, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProcessCrash appVersion](self, "appVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProcessCrash bundleVersion](self, "bundleVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProcessCrash exception](self, "exception");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProcessCrash terminationReason](self, "terminationReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProcessCrash responsibleApp](self, "responsibleApp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProcessCrash coalitionName](self, "coalitionName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProcessCrash isFirstParty](self, "isFirstParty"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProcessCrash isBeta](self, "isBeta"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("BMProcessCrash with incidentID: %@, processName: %@, bundleID: %@, appVersion: %@, bundleVersion: %@, exception: %@, terminationReason: %@, responsibleApp: %@, coalitionName: %@, isFirstParty: %@, isBeta: %@"), v14, v12, v3, v4, v5, v13, v6, v7, v8, v9, v10);

  return (NSString *)v16;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMProcessCrash *v5;
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
  objc_class *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  BOOL v37;
  uint64_t v38;
  BMProcessCrash *v39;
  objc_super v41;
  uint64_t v42;
  uint64_t v43;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMProcessCrash;
  v5 = -[BMEventBase init](&v41, sel_init);
  if (!v5)
    goto LABEL_63;
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
          v20 = 24;
          goto LABEL_36;
        case 2u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 32;
          goto LABEL_36;
        case 3u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
          goto LABEL_36;
        case 4u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 48;
          goto LABEL_36;
        case 5u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 56;
          goto LABEL_36;
        case 6u:
          v42 = 0;
          v43 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_62;
          v21 = -[BMProcessCrashException initByReadFrom:]([BMProcessCrashException alloc], "initByReadFrom:", v4);
          if (!v21)
            goto LABEL_62;
          v22 = 64;
          goto LABEL_33;
        case 7u:
          v42 = 0;
          v43 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_62;
          v21 = -[BMProcessCrashTerminationReason initByReadFrom:]([BMProcessCrashTerminationReason alloc], "initByReadFrom:", v4);
          if (!v21)
            goto LABEL_62;
          v22 = 72;
LABEL_33:
          v23 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = v21;

          PBReaderRecallMark();
          continue;
        case 8u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 80;
          goto LABEL_36;
        case 9u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 88;
LABEL_36:
          v24 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 0xAu:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v5->_hasIsFirstParty = 1;
          while (2)
          {
            v28 = *v6;
            v29 = *(_QWORD *)&v4[v28];
            if (v29 == -1 || v29 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v29);
              *(_QWORD *)&v4[v28] = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                v16 = v26++ >= 9;
                if (v16)
                {
                  v27 = 0;
                  goto LABEL_54;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v27 = 0;
LABEL_54:
          v37 = v27 != 0;
          v38 = 16;
          goto LABEL_59;
        case 0xBu:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v5->_hasIsBeta = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_62;
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
        v33 |= (unint64_t)(v36 & 0x7F) << v31;
        if ((v36 & 0x80) == 0)
          goto LABEL_56;
        v31 += 7;
        v16 = v32++ >= 9;
        if (v16)
        {
          v33 = 0;
          goto LABEL_58;
        }
      }
      v4[*v8] = 1;
LABEL_56:
      if (v4[*v8])
        v33 = 0;
LABEL_58:
      v37 = v33 != 0;
      v38 = 18;
LABEL_59:
      *((_BYTE *)&v5->super.super.isa + v38) = v37;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_62:
    v39 = 0;
  else
LABEL_63:
    v39 = v5;

  return v39;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_incidentID)
    PBDataWriterWriteStringField();
  if (self->_processName)
    PBDataWriterWriteStringField();
  if (self->_bundleID)
    PBDataWriterWriteStringField();
  if (self->_appVersion)
    PBDataWriterWriteStringField();
  if (self->_bundleVersion)
    PBDataWriterWriteStringField();
  if (self->_exception)
  {
    PBDataWriterPlaceMark();
    -[BMProcessCrashException writeTo:](self->_exception, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_terminationReason)
  {
    PBDataWriterPlaceMark();
    -[BMProcessCrashTerminationReason writeTo:](self->_terminationReason, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_responsibleApp)
    PBDataWriterWriteStringField();
  if (self->_coalitionName)
    PBDataWriterWriteStringField();
  if (self->_hasIsFirstParty)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsBeta)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMProcessCrash writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMProcessCrash)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id *v32;
  uint64_t v33;
  id v34;
  id *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  id *v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  id *v65;
  uint64_t v66;
  id v67;
  id *v68;
  id v69;
  void *v70;
  id *v71;
  id v72;
  uint64_t v73;
  id v75;
  id v76;
  id v77;
  id v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  uint64_t v88;
  id v89;
  id v90;
  uint64_t v91;
  id *v92;
  id *v93;
  id *v94;
  void *v95;
  id v96;
  uint64_t v97;
  id v98;
  void *v99;
  BMProcessCrashTerminationReason *v100;
  uint64_t v101;
  BMProcessCrashException *v102;
  id v103;
  id v104;
  void *v105;
  id v106;
  id v107;
  id v108;
  BMProcessCrash *v109;
  id v110;
  id v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  id v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  id v119;
  uint64_t v120;
  BMProcessCrashTerminationReason *v121;
  uint64_t v122;
  BMProcessCrashException *v123;
  uint64_t v124;
  id v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  _QWORD v133[3];

  v133[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("incidentID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("processName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v27 = 0;
          goto LABEL_90;
        }
        v39 = v8;
        v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v93 = a4;
        v41 = *MEMORY[0x1E0D025B8];
        v130 = *MEMORY[0x1E0CB2D50];
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("processName"));
        v131 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v40;
        v8 = v39;
        v43 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v41, 2, v10);
        a4 = 0;
        v27 = 0;
        *v93 = v43;
        goto LABEL_89;
      }
      v108 = v9;
    }
    else
    {
      v108 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v28 = 0;
          v27 = v108;
          goto LABEL_89;
        }
        v44 = v8;
        v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v46 = a4;
        v47 = *MEMORY[0x1E0D025B8];
        v128 = *MEMORY[0x1E0CB2D50];
        v48 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
        v129 = v48;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1);
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = v45;
        v8 = v44;
        v51 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v47, 2, v49);
        a4 = 0;
        v28 = 0;
        *v46 = v51;
        v11 = (void *)v49;
        v52 = (void *)v48;
        v27 = v108;
LABEL_88:

        self = v109;
LABEL_89:

        goto LABEL_90;
      }
      v107 = v10;
    }
    else
    {
      v107 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v52 = 0;
          v28 = v107;
          v27 = v108;
          goto LABEL_88;
        }
        v57 = v8;
        v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v94 = a4;
        v59 = *MEMORY[0x1E0D025B8];
        v126 = *MEMORY[0x1E0CB2D50];
        v106 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("appVersion"));
        v127 = v106;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1);
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = v58;
        v8 = v57;
        v105 = (void *)v60;
        v62 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v59, 2);
        a4 = 0;
        v52 = 0;
        *v94 = v62;
        v28 = v107;
        v27 = v108;
        goto LABEL_87;
      }
      v104 = v11;
    }
    else
    {
      v104 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    v103 = v8;
    v105 = (void *)v12;
    if (v12 && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v106 = 0;
          v28 = v107;
          v27 = v108;
          v52 = v104;
          goto LABEL_87;
        }
        v63 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v64 = v11;
        v65 = a4;
        v66 = *MEMORY[0x1E0D025B8];
        v124 = *MEMORY[0x1E0CB2D50];
        v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleVersion"));
        v125 = v36;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1);
        v102 = (BMProcessCrashException *)objc_claimAutoreleasedReturnValue();
        v67 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v66, 2);
        a4 = 0;
        v106 = 0;
        *v65 = v67;
        v11 = v64;
        v28 = v107;
        v27 = v108;
        goto LABEL_85;
      }
      v106 = v13;
    }
    else
    {
      v106 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exception"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v95 = v9;
      v15 = v14;
      v16 = v10;
      v102 = 0;
LABEL_19:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("terminationReason"));
      v17 = objc_claimAutoreleasedReturnValue();
      v99 = (void *)v17;
      if (!v17 || (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v100 = 0;
LABEL_22:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("responsibleApp"));
        v19 = objc_claimAutoreleasedReturnValue();
        v10 = v16;
        v83 = v15;
        v84 = (void *)v19;
        if (v19 && (v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v68 = a4;
          objc_opt_class();
          v9 = v95;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              a4 = 0;
              v29 = 0;
              v28 = v107;
              v27 = v108;
              v30 = v83;
              goto LABEL_39;
            }
            v75 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v91 = *MEMORY[0x1E0D025B8];
            v118 = *MEMORY[0x1E0CB2D50];
            v85 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("responsibleApp"));
            v119 = v85;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            a4 = 0;
            v29 = 0;
            *v68 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v91, 2);
            v28 = v107;
            v27 = v108;
LABEL_38:
            v30 = v83;

LABEL_39:
LABEL_83:

LABEL_84:
            v36 = v30;
            goto LABEL_85;
          }
          v89 = v20;
        }
        else
        {
          v89 = 0;
          v9 = v95;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("coalitionName"));
        v21 = objc_claimAutoreleasedReturnValue();
        v92 = a4;
        v82 = (void *)v21;
        if (v21 && (v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v85 = 0;
              a4 = 0;
              goto LABEL_37;
            }
            v96 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v88 = *MEMORY[0x1E0D025B8];
            v116 = *MEMORY[0x1E0CB2D50];
            v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("coalitionName"));
            v117 = v24;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = (id)objc_msgSend(v96, "initWithDomain:code:userInfo:", v88, 2, v23);
            a4 = 0;
            v85 = 0;
            *v92 = v76;
LABEL_36:

LABEL_37:
            v28 = v107;
            v27 = v108;
            v29 = v89;
            goto LABEL_38;
          }
          v85 = v22;
        }
        else
        {
          v85 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isFirstParty"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v24 = 0;
              a4 = 0;
              goto LABEL_36;
            }
            v77 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v97 = *MEMORY[0x1E0D025B8];
            v114 = *MEMORY[0x1E0CB2D50];
            v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isFirstParty"));
            v115 = v26;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v97, 2, v25);
            a4 = 0;
            v24 = 0;
            *v92 = v78;
            goto LABEL_35;
          }
          v24 = v23;
        }
        else
        {
          v24 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isBeta"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
              v98 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v81 = *MEMORY[0x1E0D025B8];
              v112 = *MEMORY[0x1E0CB2D50];
              v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isBeta"));
              v113 = v79;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              *v92 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v81, 2, v80);

            }
            v26 = 0;
            a4 = 0;
            goto LABEL_35;
          }
          v26 = v25;
        }
        else
        {
          v26 = 0;
        }
        a4 = -[BMProcessCrash initWithIncidentID:processName:bundleID:appVersion:bundleVersion:exception:terminationReason:responsibleApp:coalitionName:isFirstParty:isBeta:](v109, "initWithIncidentID:processName:bundleID:appVersion:bundleVersion:exception:terminationReason:responsibleApp:coalitionName:isFirstParty:isBeta:", v103, v108, v107, v104, v106, v102, v100, v89, v85, v24, v26);
        v109 = (BMProcessCrash *)a4;
LABEL_35:

        goto LABEL_36;
      }
      v87 = v11;
      v53 = a4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v54 = v18;
        v110 = 0;
        v100 = -[BMProcessCrashTerminationReason initWithJSONDictionary:error:]([BMProcessCrashTerminationReason alloc], "initWithJSONDictionary:error:", v54, &v110);
        v55 = v110;
        if (!v55)
        {

          a4 = v53;
          v11 = v87;
          goto LABEL_22;
        }
        v56 = v55;
        v90 = v54;
        v28 = v107;
        v27 = v108;
        if (v53)
          *v53 = objc_retainAutorelease(v55);

        a4 = 0;
        v11 = v87;
        v29 = v90;
      }
      else
      {
        if (!a4)
        {
          a4 = 0;
          v28 = v107;
          v27 = v108;
          v11 = v87;
          v10 = v16;
          v30 = v15;
          v9 = v95;
          goto LABEL_84;
        }
        v71 = a4;
        v72 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v73 = *MEMORY[0x1E0D025B8];
        v120 = *MEMORY[0x1E0CB2D50];
        v100 = (BMProcessCrashTerminationReason *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("terminationReason"));
        v121 = v100;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        a4 = 0;
        *v71 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v73, 2, v29);
        v28 = v107;
        v27 = v108;
        v11 = v87;
      }
      v10 = v16;
      v30 = v15;
      v9 = v95;
      goto LABEL_83;
    }
    v86 = v11;
    v35 = a4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = v14;
      v111 = 0;
      v102 = -[BMProcessCrashException initWithJSONDictionary:error:]([BMProcessCrashException alloc], "initWithJSONDictionary:error:", v36, &v111);
      v37 = v111;
      if (!v37)
      {
        v95 = v9;
        v15 = v14;
        v16 = v10;

        v11 = v86;
        goto LABEL_19;
      }
      v38 = v37;
      v28 = v107;
      v27 = v108;
      if (v35)
        *v35 = objc_retainAutorelease(v37);

      a4 = 0;
    }
    else
    {
      if (!a4)
      {
        a4 = 0;
        v28 = v107;
        v27 = v108;
        v11 = v86;
        goto LABEL_86;
      }
      v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v101 = *MEMORY[0x1E0D025B8];
      v122 = *MEMORY[0x1E0CB2D50];
      v102 = (BMProcessCrashException *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("exception"));
      v123 = v102;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v123, &v122, 1);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v101, 2, v70);

      a4 = 0;
      v36 = v14;
      v28 = v107;
      v27 = v108;
    }
    v11 = v86;
LABEL_85:

    v14 = v36;
LABEL_86:

    v8 = v103;
    v52 = v104;
LABEL_87:

    goto LABEL_88;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (a4)
  {
    v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v32 = a4;
    v33 = *MEMORY[0x1E0D025B8];
    v132 = *MEMORY[0x1E0CB2D50];
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("incidentID"));
    v133[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v133, &v132, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v33, 2, v9);
    a4 = 0;
    v8 = 0;
    *v32 = v34;
LABEL_90:

    goto LABEL_91;
  }
  v8 = 0;
LABEL_91:

  return (BMProcessCrash *)a4;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[11];
  _QWORD v42[13];

  v42[11] = *MEMORY[0x1E0C80C00];
  -[BMProcessCrash incidentID](self, "incidentID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMProcessCrash processName](self, "processName");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMProcessCrash bundleID](self, "bundleID");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMProcessCrash appVersion](self, "appVersion");
  v6 = objc_claimAutoreleasedReturnValue();
  -[BMProcessCrash bundleVersion](self, "bundleVersion");
  v7 = objc_claimAutoreleasedReturnValue();
  -[BMProcessCrash exception](self, "exception");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "jsonDictionary");
  v9 = objc_claimAutoreleasedReturnValue();

  -[BMProcessCrash terminationReason](self, "terminationReason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "jsonDictionary");
  v11 = objc_claimAutoreleasedReturnValue();

  -[BMProcessCrash responsibleApp](self, "responsibleApp");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProcessCrash coalitionName](self, "coalitionName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMProcessCrash hasIsFirstParty](self, "hasIsFirstParty"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProcessCrash isFirstParty](self, "isFirstParty"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  if (-[BMProcessCrash hasIsBeta](self, "hasIsBeta"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProcessCrash isBeta](self, "isBeta"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v41[0] = CFSTR("incidentID");
  v14 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v14;
  v42[0] = v14;
  v41[1] = CFSTR("processName");
  v15 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v15;
  v42[1] = v15;
  v41[2] = CFSTR("bundleID");
  v16 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v4;
  v38 = (void *)v3;
  v30 = (void *)v16;
  v42[2] = v16;
  v41[3] = CFSTR("appVersion");
  v17 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v5;
  v29 = (void *)v17;
  v42[3] = v17;
  v41[4] = CFSTR("bundleVersion");
  v18 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v6;
  v28 = (void *)v18;
  v42[4] = v18;
  v41[5] = CFSTR("exception");
  v19 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v7;
  v42[5] = v19;
  v41[6] = CFSTR("terminationReason");
  v20 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v9;
  v42[6] = v20;
  v41[7] = CFSTR("responsibleApp");
  v22 = v40;
  if (!v40)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v11;
  v42[7] = v22;
  v41[8] = CFSTR("coalitionName");
  v24 = v39;
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42[8] = v24;
  v41[9] = CFSTR("isFirstParty");
  v25 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42[9] = v25;
  v41[10] = CFSTR("isBeta");
  v26 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42[10] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 11);
  v33 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (v12)
      goto LABEL_31;
  }
  else
  {

    if (v12)
      goto LABEL_31;
  }

LABEL_31:
  if (!v39)

  if (!v40)
  if (!v23)

  if (!v21)
  if (!v34)

  if (!v35)
  if (v36)
  {
    if (v37)
      goto LABEL_45;
LABEL_50:

    if (v38)
      goto LABEL_46;
LABEL_51:

    goto LABEL_46;
  }

  if (!v37)
    goto LABEL_50;
LABEL_45:
  if (!v38)
    goto LABEL_51;
LABEL_46:

  return v33;
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
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  int v61;
  _BOOL4 v62;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMProcessCrash incidentID](self, "incidentID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "incidentID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMProcessCrash incidentID](self, "incidentID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "incidentID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_49;
    }
    -[BMProcessCrash processName](self, "processName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processName");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMProcessCrash processName](self, "processName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "processName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_49;
    }
    -[BMProcessCrash bundleID](self, "bundleID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMProcessCrash bundleID](self, "bundleID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_49;
    }
    -[BMProcessCrash appVersion](self, "appVersion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appVersion");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMProcessCrash appVersion](self, "appVersion");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appVersion");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_49;
    }
    -[BMProcessCrash bundleVersion](self, "bundleVersion");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleVersion");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMProcessCrash bundleVersion](self, "bundleVersion");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleVersion");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_49;
    }
    -[BMProcessCrash exception](self, "exception");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exception");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMProcessCrash exception](self, "exception");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exception");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_49;
    }
    -[BMProcessCrash terminationReason](self, "terminationReason");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "terminationReason");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMProcessCrash terminationReason](self, "terminationReason");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "terminationReason");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_49;
    }
    -[BMProcessCrash responsibleApp](self, "responsibleApp");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "responsibleApp");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v49 == (void *)v50)
    {

    }
    else
    {
      v51 = (void *)v50;
      -[BMProcessCrash responsibleApp](self, "responsibleApp");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "responsibleApp");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "isEqual:", v53);

      if (!v54)
        goto LABEL_49;
    }
    -[BMProcessCrash coalitionName](self, "coalitionName");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coalitionName");
    v56 = objc_claimAutoreleasedReturnValue();
    if (v55 == (void *)v56)
    {

    }
    else
    {
      v57 = (void *)v56;
      -[BMProcessCrash coalitionName](self, "coalitionName");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "coalitionName");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "isEqual:", v59);

      if (!v60)
        goto LABEL_49;
    }
    if (!-[BMProcessCrash hasIsFirstParty](self, "hasIsFirstParty")
      && !objc_msgSend(v5, "hasIsFirstParty")
      || -[BMProcessCrash hasIsFirstParty](self, "hasIsFirstParty")
      && objc_msgSend(v5, "hasIsFirstParty")
      && (v61 = -[BMProcessCrash isFirstParty](self, "isFirstParty"),
          v61 == objc_msgSend(v5, "isFirstParty")))
    {
      if (!-[BMProcessCrash hasIsBeta](self, "hasIsBeta") && !objc_msgSend(v5, "hasIsBeta"))
      {
        LOBYTE(v12) = 1;
        goto LABEL_50;
      }
      if (-[BMProcessCrash hasIsBeta](self, "hasIsBeta") && objc_msgSend(v5, "hasIsBeta"))
      {
        v62 = -[BMProcessCrash isBeta](self, "isBeta");
        v12 = v62 ^ objc_msgSend(v5, "isBeta") ^ 1;
LABEL_50:

        goto LABEL_51;
      }
    }
LABEL_49:
    LOBYTE(v12) = 0;
    goto LABEL_50;
  }
  LOBYTE(v12) = 0;
LABEL_51:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)incidentID
{
  return self->_incidentID;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (BMProcessCrashException)exception
{
  return self->_exception;
}

- (BMProcessCrashTerminationReason)terminationReason
{
  return self->_terminationReason;
}

- (NSString)responsibleApp
{
  return self->_responsibleApp;
}

- (NSString)coalitionName
{
  return self->_coalitionName;
}

- (BOOL)isFirstParty
{
  return self->_isFirstParty;
}

- (BOOL)hasIsFirstParty
{
  return self->_hasIsFirstParty;
}

- (void)setHasIsFirstParty:(BOOL)a3
{
  self->_hasIsFirstParty = a3;
}

- (BOOL)isBeta
{
  return self->_isBeta;
}

- (BOOL)hasIsBeta
{
  return self->_hasIsBeta;
}

- (void)setHasIsBeta:(BOOL)a3
{
  self->_hasIsBeta = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalitionName, 0);
  objc_storeStrong((id *)&self->_responsibleApp, 0);
  objc_storeStrong((id *)&self->_terminationReason, 0);
  objc_storeStrong((id *)&self->_exception, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_incidentID, 0);
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

    v4 = -[BMProcessCrash initByReadFrom:]([BMProcessCrash alloc], "initByReadFrom:", v7);
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
  void *v9;
  void *v10;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[12];

  v15[11] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("incidentID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("processName"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appVersion"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleVersion"), 2, 0, 5, 13, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("exception_json"), 5, 1, &__block_literal_global_39653);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("terminationReason_json"), 5, 1, &__block_literal_global_171_39654);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("responsibleApp"), 2, 0, 8, 13, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("coalitionName"), 2, 0, 9, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isFirstParty"), 0, 0, 10, 12, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isBeta"), 0, 0, 11, 12, 0);
  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v4;
  v15[3] = v5;
  v15[4] = v6;
  v15[5] = v13;
  v15[6] = v7;
  v15[7] = v8;
  v15[8] = v14;
  v15[9] = v9;
  v15[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D020;
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
  void *v14;
  _QWORD v15[12];

  v15[11] = *MEMORY[0x1E0C80C00];
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("incidentID"), 1, 13, 0);
  v15[0] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("processName"), 2, 13, 0);
  v15[1] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 3, 13, 0);
  v15[2] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appVersion"), 4, 13, 0);
  v15[3] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleVersion"), 5, 13, 0);
  v15[4] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("exception"), 6, 14, objc_opt_class());
  v15[5] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("terminationReason"), 7, 14, objc_opt_class());
  v15[6] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("responsibleApp"), 8, 13, 0);
  v15[7] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("coalitionName"), 9, 13, 0);
  v15[8] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isFirstParty"), 10, 12, 0);
  v15[9] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isBeta"), 11, 12, 0);
  v15[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __25__BMProcessCrash_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "terminationReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __25__BMProcessCrash_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exception");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
