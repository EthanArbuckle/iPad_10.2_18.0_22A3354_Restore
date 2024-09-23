@implementation BMProactiveHarvestingReminders

- (BMProactiveHarvestingReminders)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 title:(id)a6 notes:(id)a7 isAllDay:(id)a8 completionDateTimestamp:(id)a9 dueDateTimestamp:(id)a10 priority:(id)a11 contentProtection:(id)a12 personaId:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  BMProactiveHarvestingReminders *v24;
  double v25;
  double v26;
  double v27;
  int v28;
  id v31;
  id v32;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v38 = a3;
  v31 = a4;
  v37 = a4;
  v18 = a5;
  v36 = a6;
  v32 = a7;
  v35 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v34 = a13;
  v39.receiver = self;
  v39.super_class = (Class)BMProactiveHarvestingReminders;
  v24 = -[BMEventBase init](&v39, sel_init);
  if (v24)
  {
    v24->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v24->_uniqueID, a3);
    objc_storeStrong((id *)&v24->_domainID, v31);
    if (v18)
    {
      v24->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v18, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v24->_hasRaw_absoluteTimestamp = 0;
      v25 = -1.0;
    }
    v24->_raw_absoluteTimestamp = v25;
    objc_storeStrong((id *)&v24->_title, a6);
    objc_storeStrong((id *)&v24->_notes, v32);
    if (v19)
    {
      v24->_hasIsAllDay = 1;
      v24->_isAllDay = objc_msgSend(v19, "BOOLValue");
    }
    else
    {
      v24->_hasIsAllDay = 0;
      v24->_isAllDay = 0;
    }
    if (v20)
    {
      v24->_hasRaw_completionDateTimestamp = 1;
      objc_msgSend(v20, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v24->_hasRaw_completionDateTimestamp = 0;
      v26 = -1.0;
    }
    v24->_raw_completionDateTimestamp = v26;
    if (v21)
    {
      v24->_hasRaw_dueDateTimestamp = 1;
      objc_msgSend(v21, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v24->_hasRaw_dueDateTimestamp = 0;
      v27 = -1.0;
    }
    v24->_raw_dueDateTimestamp = v27;
    if (v22)
    {
      v24->_hasPriority = 1;
      v28 = objc_msgSend(v22, "intValue");
    }
    else
    {
      v24->_hasPriority = 0;
      v28 = -1;
    }
    v24->_priority = v28;
    objc_storeStrong((id *)&v24->_contentProtection, a12);
    objc_storeStrong((id *)&v24->_personaId, a13);
  }

  return v24;
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
  void *v12;
  id v14;
  id v15;
  void *v16;

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMProactiveHarvestingReminders uniqueID](self, "uniqueID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingReminders domainID](self, "domainID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingReminders absoluteTimestamp](self, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingReminders title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingReminders notes](self, "notes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingReminders isAllDay](self, "isAllDay"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingReminders completionDateTimestamp](self, "completionDateTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingReminders dueDateTimestamp](self, "dueDateTimestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMProactiveHarvestingReminders priority](self, "priority"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingReminders contentProtection](self, "contentProtection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingReminders personaId](self, "personaId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "initWithFormat:", CFSTR("BMProactiveHarvestingReminders with uniqueID: %@, domainID: %@, absoluteTimestamp: %@, title: %@, notes: %@, isAllDay: %@, completionDateTimestamp: %@, dueDateTimestamp: %@, priority: %@, contentProtection: %@, personaId: %@"), v16, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return (NSString *)v15;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMProactiveHarvestingReminders *v5;
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
  objc_class *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  void *v43;
  uint64_t v44;
  BMProactiveHarvestingReminders *v45;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BMProactiveHarvestingReminders;
  v5 = -[BMEventBase init](&v47, sel_init);
  if (!v5)
    goto LABEL_70;
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
          v21 = 80;
          goto LABEL_51;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 88;
          goto LABEL_51;
        case 3u:
          v5->_hasRaw_absoluteTimestamp = 1;
          v22 = *v6;
          v23 = *(_QWORD *)&v4[v22];
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v24 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v23);
            *(_QWORD *)&v4[v22] = v23 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v24 = 0;
          }
          v44 = 24;
          goto LABEL_66;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 96;
          goto LABEL_51;
        case 5u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 104;
          goto LABEL_51;
        case 6u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v5->_hasIsAllDay = 1;
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
                  v27 = 0;
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v27 = 0;
LABEL_55:
          v5->_isAllDay = v27 != 0;
          continue;
        case 7u:
          v5->_hasRaw_completionDateTimestamp = 1;
          v32 = *v6;
          v33 = *(_QWORD *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v24 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v33);
            *(_QWORD *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v24 = 0;
          }
          v44 = 40;
          goto LABEL_66;
        case 8u:
          v5->_hasRaw_dueDateTimestamp = 1;
          v34 = *v6;
          v35 = *(_QWORD *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v24 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v35);
            *(_QWORD *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v24 = 0;
          }
          v44 = 56;
LABEL_66:
          *(Class *)((char *)&v5->super.super.isa + v44) = v24;
          continue;
        case 9u:
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v5->_hasPriority = 1;
          break;
        case 0xAu:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 112;
          goto LABEL_51;
        case 0xBu:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 120;
LABEL_51:
          v43 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_69;
          continue;
      }
      while (1)
      {
        v39 = *v6;
        v40 = *(_QWORD *)&v4[v39];
        v41 = v40 + 1;
        if (v40 == -1 || v41 > *(_QWORD *)&v4[*v7])
          break;
        v42 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v40);
        *(_QWORD *)&v4[v39] = v41;
        v38 |= (unint64_t)(v42 & 0x7F) << v36;
        if ((v42 & 0x80) == 0)
          goto LABEL_57;
        v36 += 7;
        v17 = v37++ >= 9;
        if (v17)
        {
          LODWORD(v38) = 0;
          goto LABEL_59;
        }
      }
      v4[*v8] = 1;
LABEL_57:
      if (v4[*v8])
        LODWORD(v38) = 0;
LABEL_59:
      v5->_priority = -(v38 & 1) ^ ((int)v38 >> 1);
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_69:
    v45 = 0;
  else
LABEL_70:
    v45 = v5;

  return v45;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uniqueID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_domainID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_notes)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasIsAllDay)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasRaw_completionDateTimestamp)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasRaw_dueDateTimestamp)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasPriority)
  {
    PBDataWriterWriteSint32Field();
    v4 = v5;
  }
  if (self->_contentProtection)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_personaId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMProactiveHarvestingReminders writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMProactiveHarvestingReminders)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id *v12;
  id v13;
  id v14;
  double v15;
  double v16;
  id v17;
  id *v18;
  id v19;
  uint64_t v20;
  void *v21;
  BMProactiveHarvestingReminders *v22;
  void *v23;
  id v24;
  id *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  objc_class *v37;
  id v38;
  id v39;
  double v40;
  double v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id *v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  void *v57;
  uint64_t v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  void *v65;
  objc_class *v66;
  void *v67;
  id v68;
  id v69;
  double v70;
  double v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  BMProactiveHarvestingReminders *v77;
  id v78;
  void *v79;
  id v80;
  id v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id *v91;
  id v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  id v97;
  id v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  id *v113;
  id *v114;
  void *v115;
  void *v116;
  id v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  id v126;
  id v127;
  id v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  id v133;
  uint64_t v134;
  id v135;
  uint64_t v136;
  id v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  id v143;
  uint64_t v144;
  id v145;
  uint64_t v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  _QWORD v151[3];

  v151[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("domainID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v127 = 0;
LABEL_7:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = (objc_class *)MEMORY[0x1E0C99D68];
          v12 = a4;
          v13 = v9;
          v14 = [v11 alloc];
          objc_msgSend(v13, "doubleValue");
          v16 = v15;

          a4 = v12;
          v17 = (id)objc_msgSend(v14, "initWithTimeIntervalSinceReferenceDate:", v16);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v31 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
            objc_msgSend(v31, "dateFromString:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_23;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v10 = 0;
              v22 = 0;
              v21 = v127;
              goto LABEL_88;
            }
            v89 = v6;
            v90 = v7;
            v91 = a4;
            v92 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v93 = v9;
            v94 = *MEMORY[0x1E0D025B8];
            v146 = *MEMORY[0x1E0CB2D50];
            v126 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
            v147 = v126;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = v94;
            v9 = v93;
            v22 = 0;
            *v91 = (id)objc_msgSend(v92, "initWithDomain:code:userInfo:", v95, 2, v32);
            v7 = v90;
            v6 = v89;
            v10 = 0;
            v21 = v127;
            goto LABEL_87;
          }
          v17 = v9;
        }
        v10 = v17;
      }
      else
      {
        v10 = 0;
      }
LABEL_23:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = v32;
      v125 = v10;
      if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v126 = 0;
            v22 = 0;
            v21 = v127;
LABEL_87:

            goto LABEL_88;
          }
          v114 = a4;
          v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v44 = v9;
          v45 = *MEMORY[0x1E0D025B8];
          v144 = *MEMORY[0x1E0CB2D50];
          v124 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("title"));
          v145 = v124;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1);
          v46 = objc_claimAutoreleasedReturnValue();
          v47 = v43;
          v48 = (void *)v46;
          v49 = v45;
          v9 = v44;
          v126 = 0;
          v22 = 0;
          *v114 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v49, 2, v46);
          v21 = v127;
LABEL_86:

          goto LABEL_87;
        }
        v126 = v32;
      }
      else
      {
        v126 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("notes"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v124 = 0;
            v22 = 0;
            v21 = v127;
            v48 = v33;
LABEL_85:
            v10 = v125;
            goto LABEL_86;
          }
          v121 = v6;
          v117 = v7;
          v50 = a4;
          v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v52 = v9;
          v53 = *MEMORY[0x1E0D025B8];
          v142 = *MEMORY[0x1E0CB2D50];
          v48 = v33;
          v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("notes"));
          v143 = v34;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1);
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = v53;
          v9 = v52;
          v119 = (void *)v54;
          v124 = 0;
          v22 = 0;
          *v50 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v55, 2);
          v7 = v117;
          v6 = v121;
          goto LABEL_83;
        }
        v115 = v33;
        v124 = v33;
      }
      else
      {
        v115 = v33;
        v124 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isAllDay"));
      v34 = (id)objc_claimAutoreleasedReturnValue();
      v119 = v34;
      v113 = a4;
      if (v34)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v34 = 0;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v34 = 0;
              v22 = 0;
              v21 = v127;
              v48 = v115;
              goto LABEL_84;
            }
            v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v57 = v9;
            v58 = *MEMORY[0x1E0D025B8];
            v140 = *MEMORY[0x1E0CB2D50];
            v59 = objc_alloc(MEMORY[0x1E0CB3940]);
            v106 = objc_opt_class();
            v60 = v59;
            v32 = v123;
            v120 = (void *)objc_msgSend(v60, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v106, CFSTR("isAllDay"));
            v141 = v120;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1);
            v61 = objc_claimAutoreleasedReturnValue();
            v62 = v58;
            v9 = v57;
            v111 = (void *)v61;
            v63 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v62, 2);
            v34 = 0;
            v22 = 0;
            v48 = v115;
            *v113 = v63;
            goto LABEL_82;
          }
          v34 = v34;
        }
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("completionDateTimestamp"));
      v35 = objc_claimAutoreleasedReturnValue();
      v111 = (void *)v35;
      if (!v35 || (v36 = (void *)v35, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v120 = 0;
LABEL_60:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dueDateTimestamp"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = v7;
        v109 = v9;
        v110 = v8;
        if (v65 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v66 = (objc_class *)MEMORY[0x1E0C99D68];
            v67 = v9;
            v68 = v65;
            v69 = [v66 alloc];
            objc_msgSend(v68, "doubleValue");
            v71 = v70;

            v9 = v67;
            v72 = (id)objc_msgSend(v69, "initWithTimeIntervalSinceReferenceDate:", v71);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v73 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
              objc_msgSend(v73, "dateFromString:", v65);
              v116 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_68;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v113)
              {
                v116 = 0;
                v22 = 0;
                goto LABEL_81;
              }
              v102 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v103 = *MEMORY[0x1E0D025B8];
              v136 = *MEMORY[0x1E0CB2D50];
              v75 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("dueDateTimestamp"));
              v137 = v75;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v104 = v102;
              v9 = v109;
              v105 = v103;
              v7 = v118;
              v116 = 0;
              v22 = 0;
              *v113 = (id)objc_msgSend(v104, "initWithDomain:code:userInfo:", v105, 2, v74);
              goto LABEL_80;
            }
            v72 = v65;
          }
          v116 = v72;
        }
        else
        {
          v116 = 0;
        }
LABEL_68:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("priority"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = v34;
        if (v74 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v113)
            {
              v75 = 0;
              v22 = 0;
              goto LABEL_80;
            }
            v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v83 = *MEMORY[0x1E0D025B8];
            v134 = *MEMORY[0x1E0CB2D50];
            v78 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("priority"));
            v135 = v78;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v83, 2, v76);
            v22 = 0;
            v75 = 0;
            *v113 = v84;
LABEL_79:

            v7 = v118;
            v9 = v109;
            v34 = v112;
LABEL_80:

            v8 = v110;
            goto LABEL_81;
          }
          v75 = v74;
        }
        else
        {
          v75 = 0;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contentProtection"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = v6;
        if (v76 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v113)
            {
              v78 = 0;
              v22 = 0;
              goto LABEL_79;
            }
            v77 = self;
            v107 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v85 = *MEMORY[0x1E0D025B8];
            v132 = *MEMORY[0x1E0CB2D50];
            v80 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contentProtection"));
            v133 = v80;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = (id)objc_msgSend(v107, "initWithDomain:code:userInfo:", v85, 2, v79);
            v22 = 0;
            v78 = 0;
            *v113 = v86;
            goto LABEL_78;
          }
          v77 = self;
          v78 = v76;
        }
        else
        {
          v77 = self;
          v78 = 0;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("personaId"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        if (v79 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v113)
            {
              v129 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v108 = *MEMORY[0x1E0D025B8];
              v130 = *MEMORY[0x1E0CB2D50];
              v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("personaId"));
              v131 = v87;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              *v113 = (id)objc_msgSend(v129, "initWithDomain:code:userInfo:", v108, 2, v88);

            }
            v80 = 0;
            v22 = 0;
            goto LABEL_78;
          }
          v80 = v79;
        }
        else
        {
          v80 = 0;
        }
        v22 = -[BMProactiveHarvestingReminders initWithUniqueID:domainID:absoluteTimestamp:title:notes:isAllDay:completionDateTimestamp:dueDateTimestamp:priority:contentProtection:personaId:](v77, "initWithUniqueID:domainID:absoluteTimestamp:title:notes:isAllDay:completionDateTimestamp:dueDateTimestamp:priority:contentProtection:personaId:", v118, v127, v125, v126, v124, v112, v120, v116, v75, v78, v80);
        v77 = v22;
LABEL_78:
        self = v77;

        v6 = v122;
        goto LABEL_79;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = (objc_class *)MEMORY[0x1E0C99D68];
        v38 = v36;
        v39 = [v37 alloc];
        objc_msgSend(v38, "doubleValue");
        v41 = v40;

        v42 = (id)objc_msgSend(v39, "initWithTimeIntervalSinceReferenceDate:", v41);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v64 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v64, "dateFromString:", v36);
          v120 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_60;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v96 = v6;
          v97 = v7;
          if (!v113)
          {
            v120 = 0;
            v22 = 0;
            v32 = v123;
            v6 = v96;
            v48 = v115;
            goto LABEL_82;
          }
          v98 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v99 = v9;
          v100 = *MEMORY[0x1E0D025B8];
          v138 = *MEMORY[0x1E0CB2D50];
          v116 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("completionDateTimestamp"));
          v139 = v116;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = v100;
          v9 = v99;
          v120 = 0;
          v22 = 0;
          *v113 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v101, 2, v65);
          v7 = v97;
          v6 = v96;
LABEL_81:
          v48 = v115;

          v32 = v123;
LABEL_82:

LABEL_83:
          v21 = v127;
LABEL_84:

          goto LABEL_85;
        }
        v42 = v36;
      }
      v120 = v42;
      goto LABEL_60;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v127 = v8;
      goto LABEL_7;
    }
    if (a4)
    {
      v23 = v6;
      v24 = v7;
      v25 = a4;
      v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v27 = *MEMORY[0x1E0D025B8];
      v148 = *MEMORY[0x1E0CB2D50];
      v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("domainID"));
      v149 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v149, &v148, 1);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v27;
      v9 = (void *)v29;
      v21 = 0;
      v22 = 0;
      *v25 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v30, 2, v29);
      v7 = v24;
      v6 = v23;
      v10 = (void *)v28;
LABEL_88:

      goto LABEL_89;
    }
    v21 = 0;
    v22 = 0;
LABEL_89:

    goto LABEL_90;
  }
  if (a4)
  {
    v18 = a4;
    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = *MEMORY[0x1E0D025B8];
    v150 = *MEMORY[0x1E0CB2D50];
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("uniqueID"));
    v151[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v151, &v150, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    *v18 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v8);
    v7 = 0;
    goto LABEL_89;
  }
  v7 = 0;
  v22 = 0;
LABEL_90:

  return v22;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[11];
  _QWORD v47[13];

  v47[11] = *MEMORY[0x1E0C80C00];
  -[BMProactiveHarvestingReminders uniqueID](self, "uniqueID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingReminders domainID](self, "domainID");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingReminders absoluteTimestamp](self, "absoluteTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMProactiveHarvestingReminders absoluteTimestamp](self, "absoluteTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  -[BMProactiveHarvestingReminders title](self, "title");
  v9 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingReminders notes](self, "notes");
  v10 = objc_claimAutoreleasedReturnValue();
  if (-[BMProactiveHarvestingReminders hasIsAllDay](self, "hasIsAllDay"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingReminders isAllDay](self, "isAllDay"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = 0;
  }
  -[BMProactiveHarvestingReminders completionDateTimestamp](self, "completionDateTimestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[BMProactiveHarvestingReminders completionDateTimestamp](self, "completionDateTimestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    objc_msgSend(v12, "numberWithDouble:");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v44 = 0;
  }

  -[BMProactiveHarvestingReminders dueDateTimestamp](self, "dueDateTimestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[BMProactiveHarvestingReminders dueDateTimestamp](self, "dueDateTimestamp");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    objc_msgSend(v15, "numberWithDouble:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v43 = 0;
  }

  if (-[BMProactiveHarvestingReminders hasPriority](self, "hasPriority"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMProactiveHarvestingReminders priority](self, "priority"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  -[BMProactiveHarvestingReminders contentProtection](self, "contentProtection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingReminders personaId](self, "personaId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = CFSTR("uniqueID");
  v20 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v20;
  v47[0] = v20;
  v46[1] = CFSTR("domainID");
  v21 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v21;
  v47[1] = v21;
  v46[2] = CFSTR("absoluteTimestamp");
  v22 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v22;
  v47[2] = v22;
  v46[3] = CFSTR("title");
  v23 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v3;
  v34 = (void *)v23;
  v47[3] = v23;
  v46[4] = CFSTR("notes");
  v24 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v4;
  v33 = (void *)v24;
  v47[4] = v24;
  v46[5] = CFSTR("isAllDay");
  v25 = v45;
  if (!v45)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v8;
  v47[5] = v25;
  v46[6] = CFSTR("completionDateTimestamp");
  v26 = v44;
  if (!v44)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v9;
  v47[6] = v26;
  v46[7] = CFSTR("dueDateTimestamp");
  v27 = v43;
  if (!v43)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v10;
  v47[7] = v27;
  v46[8] = CFSTR("priority");
  v29 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v47[8] = v29;
  v46[9] = CFSTR("contentProtection");
  v30 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v47[9] = v30;
  v46[10] = CFSTR("personaId");
  v31 = v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v47[10] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 11);
  v38 = (id)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (v18)
      goto LABEL_40;
LABEL_55:

    if (v17)
      goto LABEL_41;
    goto LABEL_56;
  }

  if (!v18)
    goto LABEL_55;
LABEL_40:
  if (v17)
    goto LABEL_41;
LABEL_56:

LABEL_41:
  if (!v43)

  if (!v44)
  if (!v45)

  if (!v28)
  if (v39)
  {
    if (v40)
      goto LABEL_51;
  }
  else
  {

    if (v40)
    {
LABEL_51:
      if (v41)
        goto LABEL_52;
LABEL_59:

      if (v42)
        goto LABEL_53;
LABEL_60:

      goto LABEL_53;
    }
  }

  if (!v41)
    goto LABEL_59;
LABEL_52:
  if (!v42)
    goto LABEL_60;
LABEL_53:

  return v38;
}

- (NSDate)absoluteTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_absoluteTimestamp);
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

- (NSDate)completionDateTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_completionDateTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_completionDateTimestamp);
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

- (NSDate)dueDateTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_dueDateTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_dueDateTimestamp);
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
  char v12;
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
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  int v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v58;
  void *v59;
  void *v60;
  void *v61;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMProactiveHarvestingReminders uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMProactiveHarvestingReminders uniqueID](self, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_43;
    }
    -[BMProactiveHarvestingReminders domainID](self, "domainID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domainID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMProactiveHarvestingReminders domainID](self, "domainID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domainID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_43;
    }
    -[BMProactiveHarvestingReminders absoluteTimestamp](self, "absoluteTimestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMProactiveHarvestingReminders absoluteTimestamp](self, "absoluteTimestamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_43;
    }
    -[BMProactiveHarvestingReminders title](self, "title");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMProactiveHarvestingReminders title](self, "title");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_43;
    }
    -[BMProactiveHarvestingReminders notes](self, "notes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notes");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMProactiveHarvestingReminders notes](self, "notes");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "notes");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_43;
    }
    if (-[BMProactiveHarvestingReminders hasIsAllDay](self, "hasIsAllDay")
      || objc_msgSend(v5, "hasIsAllDay"))
    {
      if (!-[BMProactiveHarvestingReminders hasIsAllDay](self, "hasIsAllDay"))
        goto LABEL_43;
      if (!objc_msgSend(v5, "hasIsAllDay"))
        goto LABEL_43;
      v37 = -[BMProactiveHarvestingReminders isAllDay](self, "isAllDay");
      if (v37 != objc_msgSend(v5, "isAllDay"))
        goto LABEL_43;
    }
    -[BMProactiveHarvestingReminders completionDateTimestamp](self, "completionDateTimestamp");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "completionDateTimestamp");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v38 == (void *)v39)
    {

    }
    else
    {
      v40 = (void *)v39;
      -[BMProactiveHarvestingReminders completionDateTimestamp](self, "completionDateTimestamp");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "completionDateTimestamp");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v41, "isEqual:", v42);

      if (!v43)
        goto LABEL_43;
    }
    -[BMProactiveHarvestingReminders dueDateTimestamp](self, "dueDateTimestamp");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dueDateTimestamp");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v44 == (void *)v45)
    {

    }
    else
    {
      v46 = (void *)v45;
      -[BMProactiveHarvestingReminders dueDateTimestamp](self, "dueDateTimestamp");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dueDateTimestamp");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v47, "isEqual:", v48);

      if (!v49)
        goto LABEL_43;
    }
    if (-[BMProactiveHarvestingReminders hasPriority](self, "hasPriority")
      || objc_msgSend(v5, "hasPriority"))
    {
      if (!-[BMProactiveHarvestingReminders hasPriority](self, "hasPriority"))
        goto LABEL_43;
      if (!objc_msgSend(v5, "hasPriority"))
        goto LABEL_43;
      v50 = -[BMProactiveHarvestingReminders priority](self, "priority");
      if (v50 != objc_msgSend(v5, "priority"))
        goto LABEL_43;
    }
    -[BMProactiveHarvestingReminders contentProtection](self, "contentProtection");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentProtection");
    v52 = objc_claimAutoreleasedReturnValue();
    if (v51 == (void *)v52)
    {

    }
    else
    {
      v53 = (void *)v52;
      -[BMProactiveHarvestingReminders contentProtection](self, "contentProtection");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentProtection");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v54, "isEqual:", v55);

      if (!v56)
      {
LABEL_43:
        v12 = 0;
LABEL_44:

        goto LABEL_45;
      }
    }
    -[BMProactiveHarvestingReminders personaId](self, "personaId");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personaId");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58 == v59)
    {
      v12 = 1;
    }
    else
    {
      -[BMProactiveHarvestingReminders personaId](self, "personaId");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "personaId");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v60, "isEqual:", v61);

    }
    goto LABEL_44;
  }
  v12 = 0;
LABEL_45:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)domainID
{
  return self->_domainID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)notes
{
  return self->_notes;
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (BOOL)hasIsAllDay
{
  return self->_hasIsAllDay;
}

- (void)setHasIsAllDay:(BOOL)a3
{
  self->_hasIsAllDay = a3;
}

- (int)priority
{
  return self->_priority;
}

- (BOOL)hasPriority
{
  return self->_hasPriority;
}

- (void)setHasPriority:(BOOL)a3
{
  self->_hasPriority = a3;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_domainID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
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

    v7 = -[BMProactiveHarvestingReminders initByReadFrom:]([BMProactiveHarvestingReminders alloc], "initByReadFrom:", v6);
    v7[17] = 1;

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
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[12];

  v15[11] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uniqueID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("domainID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 3, 0, 1);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("title"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("notes"), 2, 0, 5, 13, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isAllDay"), 0, 0, 6, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("completionDateTimestamp"), 3, 0, 7, 0, 1);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("dueDateTimestamp"), 3, 0, 8, 0, 1);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("priority"), 0, 0, 9, 6, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentProtection"), 2, 0, 10, 13, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("personaId"), 2, 0, 11, 13, 0);
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
  return &unk_1E5F1D470;
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
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uniqueID"), 1, 13, 0);
  v15[0] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("domainID"), 2, 13, 0);
  v15[1] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 3, 0, 0);
  v15[2] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("title"), 4, 13, 0);
  v15[3] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("notes"), 5, 13, 0);
  v15[4] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isAllDay"), 6, 12, 0);
  v15[5] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("completionDateTimestamp"), 7, 0, 0);
  v15[6] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dueDateTimestamp"), 8, 0, 0);
  v15[7] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("priority"), 9, 6, 0);
  v15[8] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentProtection"), 10, 13, 0);
  v15[9] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("personaId"), 11, 13, 0);
  v15[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
