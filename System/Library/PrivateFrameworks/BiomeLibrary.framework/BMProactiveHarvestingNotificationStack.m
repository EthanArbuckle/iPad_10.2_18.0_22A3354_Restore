@implementation BMProactiveHarvestingNotificationStack

- (BMProactiveHarvestingNotificationStack)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 notificationIDs:(id)a5 appBundleID:(id)a6 threadID:(id)a7 stackState:(id)a8 sectionID:(id)a9 contentProtection:(id)a10 personaId:(id)a11
{
  id v18;
  id v19;
  id v20;
  BMProactiveHarvestingNotificationStack *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a3;
  v18 = a4;
  v30 = a5;
  v29 = a6;
  v28 = a7;
  v19 = a8;
  v20 = a9;
  v27 = a10;
  v26 = a11;
  v32.receiver = self;
  v32.super_class = (Class)BMProactiveHarvestingNotificationStack;
  v21 = -[BMEventBase init](&v32, sel_init);
  if (v21)
  {
    v21->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v21->_uniqueID, a3);
    if (v18)
    {
      v21->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v18, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v21->_hasRaw_absoluteTimestamp = 0;
      v22 = -1.0;
    }
    v21->_raw_absoluteTimestamp = v22;
    objc_storeStrong((id *)&v21->_notificationIDs, a5);
    objc_storeStrong((id *)&v21->_appBundleID, a6);
    objc_storeStrong((id *)&v21->_threadID, a7);
    if (v19)
    {
      v21->_hasStackState = 1;
      v23 = objc_msgSend(v19, "longLongValue");
    }
    else
    {
      v21->_hasStackState = 0;
      v23 = -1;
    }
    v21->_stackState = v23;
    if (v20)
    {
      v21->_hasSectionID = 1;
      v24 = objc_msgSend(v20, "longLongValue");
    }
    else
    {
      v21->_hasSectionID = 0;
      v24 = -1;
    }
    v21->_sectionID = v24;
    objc_storeStrong((id *)&v21->_contentProtection, a10);
    objc_storeStrong((id *)&v21->_personaId, a11);
  }

  return v21;
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
  -[BMProactiveHarvestingNotificationStack uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotificationStack absoluteTimestamp](self, "absoluteTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotificationStack notificationIDs](self, "notificationIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotificationStack appBundleID](self, "appBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotificationStack threadID](self, "threadID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMProactiveHarvestingNotificationStack stackState](self, "stackState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMProactiveHarvestingNotificationStack sectionID](self, "sectionID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotificationStack contentProtection](self, "contentProtection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotificationStack personaId](self, "personaId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMProactiveHarvestingNotificationStack with uniqueID: %@, absoluteTimestamp: %@, notificationIDs: %@, appBundleID: %@, threadID: %@, stackState: %@, sectionID: %@, contentProtection: %@, personaId: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMProactiveHarvestingNotificationStack *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  int v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  double v25;
  uint64_t v26;
  void *v27;
  char v28;
  unsigned int v29;
  objc_class *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  NSArray *notificationIDs;
  int v45;
  BMProactiveHarvestingNotificationStack *v46;
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)BMProactiveHarvestingNotificationStack;
  v5 = -[BMEventBase init](&v48, sel_init);
  if (!v5)
    goto LABEL_61;
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
        v16 = v15 + 1;
        if (v15 == -1 || v16 > *(_QWORD *)&v4[*v8])
          break;
        v17 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0)
          goto LABEL_13;
        v11 += 7;
        v18 = v12++ >= 9;
        if (v18)
        {
          v13 = 0;
          v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v19 = v4[*v9];
      if (v4[*v9])
        v13 = 0;
LABEL_15:
      if (v19 || (v13 & 7) == 4)
        break;
      switch((v13 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 40;
          goto LABEL_46;
        case 2u:
          v5->_hasRaw_absoluteTimestamp = 1;
          v23 = *v7;
          v24 = *(_QWORD *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v25 = *(double *)(*(_QWORD *)&v4[*v10] + v24);
            *(_QWORD *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v25 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v25;
          continue;
        case 3u:
          PBReaderReadString();
          v26 = objc_claimAutoreleasedReturnValue();
          if (!v26)
            goto LABEL_63;
          v27 = (void *)v26;
          objc_msgSend(v6, "addObject:", v26);

          continue;
        case 4u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 56;
          goto LABEL_46;
        case 5u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 64;
          goto LABEL_46;
        case 6u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          v5->_hasStackState = 1;
          while (2)
          {
            v31 = *v7;
            v32 = *(_QWORD *)&v4[v31];
            v33 = v32 + 1;
            if (v32 == -1 || v33 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v32);
              *(_QWORD *)&v4[v31] = v33;
              v30 = (objc_class *)(((unint64_t)(v34 & 0x7F) << v28) | (unint64_t)v30);
              if (v34 < 0)
              {
                v28 += 7;
                v18 = v29++ >= 9;
                if (v18)
                {
                  v30 = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v30 = 0;
LABEL_50:
          v42 = 72;
          goto LABEL_55;
        case 7u:
          v35 = 0;
          v36 = 0;
          v30 = 0;
          v5->_hasSectionID = 1;
          break;
        case 8u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 88;
          goto LABEL_46;
        case 9u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 96;
LABEL_46:
          v41 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_63:

          goto LABEL_60;
      }
      while (1)
      {
        v37 = *v7;
        v38 = *(_QWORD *)&v4[v37];
        v39 = v38 + 1;
        if (v38 == -1 || v39 > *(_QWORD *)&v4[*v8])
          break;
        v40 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v38);
        *(_QWORD *)&v4[v37] = v39;
        v30 = (objc_class *)(((unint64_t)(v40 & 0x7F) << v35) | (unint64_t)v30);
        if ((v40 & 0x80) == 0)
          goto LABEL_52;
        v35 += 7;
        v18 = v36++ >= 9;
        if (v18)
        {
          v30 = 0;
          goto LABEL_54;
        }
      }
      v4[*v9] = 1;
LABEL_52:
      if (v4[*v9])
        v30 = 0;
LABEL_54:
      v42 = 80;
LABEL_55:
      *(Class *)((char *)&v5->super.super.isa + v42) = v30;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v43 = objc_msgSend(v6, "copy");
  notificationIDs = v5->_notificationIDs;
  v5->_notificationIDs = (NSArray *)v43;

  v45 = v4[*v9];
  if (v45)
LABEL_60:
    v46 = 0;
  else
LABEL_61:
    v46 = v5;

  return v46;
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
  if (self->_uniqueID)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_notificationIDs;
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

  if (self->_appBundleID)
    PBDataWriterWriteStringField();
  if (self->_threadID)
    PBDataWriterWriteStringField();
  if (self->_hasStackState)
    PBDataWriterWriteInt64Field();
  if (self->_hasSectionID)
    PBDataWriterWriteInt64Field();
  if (self->_contentProtection)
    PBDataWriterWriteStringField();
  if (self->_personaId)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMProactiveHarvestingNotificationStack writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMProactiveHarvestingNotificationStack)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  BMProactiveHarvestingNotificationStack *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  BMProactiveHarvestingNotificationStack *v23;
  id v24;
  id v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BMProactiveHarvestingNotificationStack *v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  id v58;
  id v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  uint64_t v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  id v79;
  void *v80;
  void *v81;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  id v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  _BYTE v127[128];
  uint64_t v128;
  void *v129;
  uint64_t v130;
  id v131;
  uint64_t v132;
  _QWORD v133[3];

  v133[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v16 = *MEMORY[0x1E0D025B8];
        v132 = *MEMORY[0x1E0CB2D50];
        v17 = v5;
        v18 = self;
        v19 = objc_alloc(MEMORY[0x1E0CB3940]);
        v83 = objc_opt_class();
        v20 = v19;
        self = v18;
        v5 = v17;
        v8 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v83, CFSTR("uniqueID"));
        v133[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v133, &v132, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v7);
        v22 = 0;
        v23 = 0;
        *a4 = v21;
        goto LABEL_100;
      }
      v22 = 0;
      v23 = 0;
      goto LABEL_101;
    }
    v105 = v6;
  }
  else
  {
    v105 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v7;
  v104 = v6;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (objc_class *)MEMORY[0x1E0C99D68];
      v10 = v7;
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
        v24 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        objc_msgSend(v24, "dateFromString:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v67 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v68 = *MEMORY[0x1E0D025B8];
          v130 = *MEMORY[0x1E0CB2D50];
          v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
          v131 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v68, 2, v28);
          v8 = 0;
          v23 = 0;
          *a4 = v69;
          v22 = v105;
          goto LABEL_98;
        }
        v8 = 0;
        v23 = 0;
        v22 = v105;
        goto LABEL_100;
      }
      v14 = v7;
    }
    v8 = v14;
  }
  else
  {
    v8 = 0;
  }
LABEL_16:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("notificationIDs"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "isEqual:", v26);

  v102 = v8;
  if (v27)
  {

    v25 = 0;
  }
  else if (v25)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v23 = 0;
        v22 = v105;
        goto LABEL_99;
      }
      v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v57 = *MEMORY[0x1E0D025B8];
      v128 = *MEMORY[0x1E0CB2D50];
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("notificationIDs"));
      v129 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      v58 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v57, 2, v36);
      v23 = 0;
      *a4 = v58;
LABEL_56:
      v22 = v105;
      goto LABEL_97;
    }
  }
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v25, "count"));
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v25 = v25;
  v29 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v107, v127, 16);
  if (!v29)
    goto LABEL_29;
  v30 = v29;
  v31 = *(_QWORD *)v108;
  v101 = v5;
  while (2)
  {
    v32 = self;
    for (i = 0; i != v30; ++i)
    {
      if (*(_QWORD *)v108 != v31)
        objc_enumerationMutation(v25);
      v34 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (a4)
        {
          v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v48 = *MEMORY[0x1E0D025B8];
          v125 = *MEMORY[0x1E0CB2D50];
          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("notificationIDs"));
          v126 = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
          v49 = objc_claimAutoreleasedReturnValue();
          v50 = v47;
          v51 = v48;
LABEL_52:
          v55 = (void *)v49;
          self = v32;
          v22 = v105;
          v23 = 0;
          *a4 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 2);
          v36 = v25;
          v5 = v101;
          v8 = v102;
          goto LABEL_95;
        }
        goto LABEL_53;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v53 = *MEMORY[0x1E0D025B8];
          v123 = *MEMORY[0x1E0CB2D50];
          v54 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("notificationIDs"));
          v124 = v54;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
          v49 = objc_claimAutoreleasedReturnValue();
          v50 = v52;
          v51 = v53;
          v35 = (void *)v54;
          goto LABEL_52;
        }
LABEL_53:
        v23 = 0;
        v36 = v25;
        self = v32;
        v5 = v101;
        goto LABEL_56;
      }
      objc_msgSend(v28, "addObject:", v34);
    }
    v30 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v107, v127, 16);
    self = v32;
    v5 = v101;
    if (v30)
      continue;
    break;
  }
LABEL_29:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("appBundleID"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = v35;
      goto LABEL_32;
    }
    if (a4)
    {
      v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v60 = *MEMORY[0x1E0D025B8];
      v121 = *MEMORY[0x1E0CB2D50];
      v61 = v35;
      v62 = objc_alloc(MEMORY[0x1E0CB3940]);
      v84 = objc_opt_class();
      v63 = v62;
      v35 = v61;
      v55 = (void *)objc_msgSend(v63, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v84, CFSTR("appBundleID"));
      v122 = v55;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v60, 2);
      v23 = 0;
      v36 = 0;
      *a4 = v64;
      v22 = v105;
      v8 = v102;

      goto LABEL_95;
    }
    v36 = 0;
    v23 = 0;
    v22 = v105;
  }
  else
  {
    v36 = 0;
LABEL_32:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("threadID"));
    v37 = objc_claimAutoreleasedReturnValue();
    v95 = v35;
    v99 = (void *)v37;
    if (v37 && (v38 = (void *)v37, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v89 = v36;
        v96 = v38;
        goto LABEL_35;
      }
      v23 = (BMProactiveHarvestingNotificationStack *)a4;
      if (a4)
      {
        v97 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v65 = *MEMORY[0x1E0D025B8];
        v119 = *MEMORY[0x1E0CB2D50];
        v98 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("threadID"));
        v120 = v98;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v65, 2);
        v23 = 0;
        v55 = 0;
        v22 = v105;
        *a4 = v66;
        goto LABEL_93;
      }
      v55 = 0;
      v22 = v105;
    }
    else
    {
      v89 = v36;
      v96 = 0;
LABEL_35:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stackState"));
      v39 = objc_claimAutoreleasedReturnValue();
      v92 = (void *)v39;
      if (v39 && (v40 = (void *)v39, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v98 = v40;
          goto LABEL_38;
        }
        if (a4)
        {
          v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v71 = *MEMORY[0x1E0D025B8];
          v117 = *MEMORY[0x1E0CB2D50];
          v93 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("stackState"));
          v118 = v93;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
          v72 = objc_claimAutoreleasedReturnValue();
          v73 = v71;
          v35 = v95;
          v88 = (void *)v72;
          v23 = 0;
          v98 = 0;
          *a4 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v73, 2);
          v22 = v105;
          v55 = v96;
          v36 = v89;
          goto LABEL_92;
        }
        v98 = 0;
        v23 = 0;
        v22 = v105;
        v55 = v96;
        v36 = v89;
      }
      else
      {
        v98 = 0;
LABEL_38:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sectionID"));
        v41 = objc_claimAutoreleasedReturnValue();
        v36 = v89;
        v88 = (void *)v41;
        if (v41 && (v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v93 = v42;
            goto LABEL_41;
          }
          if (a4)
          {
            v94 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v74 = *MEMORY[0x1E0D025B8];
            v115 = *MEMORY[0x1E0CB2D50];
            v90 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("sectionID"));
            v116 = v90;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = v74;
            v35 = v95;
            v77 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v76, 2, v75);
            v23 = 0;
            v93 = 0;
            *a4 = v77;
            v22 = v105;
            goto LABEL_90;
          }
          v93 = 0;
          v23 = 0;
          v22 = v105;
        }
        else
        {
          v93 = 0;
LABEL_41:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contentProtection"));
          v43 = objc_claimAutoreleasedReturnValue();
          v87 = (void *)v43;
          if (v43 && (v44 = (void *)v43, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v90 = v44;
              goto LABEL_44;
            }
            if (a4)
            {
              v91 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v78 = *MEMORY[0x1E0D025B8];
              v113 = *MEMORY[0x1E0CB2D50];
              v46 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contentProtection"));
              v114 = v46;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v79 = (id)objc_msgSend(v91, "initWithDomain:code:userInfo:", v78, 2, v45);
              v23 = 0;
              v90 = 0;
              *a4 = v79;
              v22 = v105;
              goto LABEL_88;
            }
            v90 = 0;
            v23 = 0;
            v22 = v105;
          }
          else
          {
            v90 = 0;
LABEL_44:
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("personaId"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v45 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v46 = 0;
              v22 = v105;
              goto LABEL_47;
            }
            objc_opt_class();
            v22 = v105;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v46 = v45;
LABEL_47:
              self = -[BMProactiveHarvestingNotificationStack initWithUniqueID:absoluteTimestamp:notificationIDs:appBundleID:threadID:stackState:sectionID:contentProtection:personaId:](self, "initWithUniqueID:absoluteTimestamp:notificationIDs:appBundleID:threadID:stackState:sectionID:contentProtection:personaId:", v22, v8, v28, v89, v96, v98, v93, v90, v46);
              v23 = self;
            }
            else
            {
              if (a4)
              {
                v86 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v85 = *MEMORY[0x1E0D025B8];
                v111 = *MEMORY[0x1E0CB2D50];
                v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("personaId"));
                v112 = v80;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                *a4 = (id)objc_msgSend(v86, "initWithDomain:code:userInfo:", v85, 2, v81);

              }
              v46 = 0;
              v23 = 0;
            }
LABEL_88:

            v35 = v95;
          }
          v75 = v87;
LABEL_90:

        }
        v55 = v96;
LABEL_92:

      }
LABEL_93:

    }
LABEL_95:

  }
LABEL_97:

LABEL_98:
  v7 = v103;
  v6 = v104;
LABEL_99:

LABEL_100:
LABEL_101:

  return v23;
}

- (id)_notificationIDsJSONArray
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
  -[BMProactiveHarvestingNotificationStack notificationIDs](self, "notificationIDs", 0);
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
  uint64_t v7;
  void *v8;
  void *v9;
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
  -[BMProactiveHarvestingNotificationStack uniqueID](self, "uniqueID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotificationStack absoluteTimestamp](self, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMProactiveHarvestingNotificationStack absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  -[BMProactiveHarvestingNotificationStack _notificationIDsJSONArray](self, "_notificationIDsJSONArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotificationStack appBundleID](self, "appBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotificationStack threadID](self, "threadID");
  v10 = objc_claimAutoreleasedReturnValue();
  if (-[BMProactiveHarvestingNotificationStack hasStackState](self, "hasStackState"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMProactiveHarvestingNotificationStack stackState](self, "stackState"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }
  if (-[BMProactiveHarvestingNotificationStack hasSectionID](self, "hasSectionID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMProactiveHarvestingNotificationStack sectionID](self, "sectionID"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  -[BMProactiveHarvestingNotificationStack contentProtection](self, "contentProtection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotificationStack personaId](self, "personaId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = CFSTR("uniqueID");
  v13 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v13;
  v34[0] = v13;
  v33[1] = CFSTR("absoluteTimestamp");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v14;
  v34[1] = v14;
  v33[2] = CFSTR("notificationIDs");
  v15 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v15;
  v34[2] = v15;
  v33[3] = CFSTR("appBundleID");
  v16 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v3;
  v24 = (void *)v16;
  v34[3] = v16;
  v33[4] = CFSTR("threadID");
  v17 = (void *)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v7;
  v34[4] = v17;
  v33[5] = CFSTR("stackState");
  v18 = v32;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[5] = v18;
  v33[6] = CFSTR("sectionID");
  v19 = v31;
  if (!v31)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v10;
  v34[6] = v19;
  v33[7] = CFSTR("contentProtection");
  v21 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[7] = v21;
  v33[8] = CFSTR("personaId");
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
    if (v11)
      goto LABEL_30;
  }
  else
  {

    if (v11)
      goto LABEL_30;
  }

LABEL_30:
  if (!v31)

  if (!v32)
  if (!v20)

  if (v9)
  {
    if (v8)
      goto LABEL_38;
  }
  else
  {

    if (v8)
    {
LABEL_38:
      if (v29)
        goto LABEL_39;
LABEL_45:

      if (v30)
        goto LABEL_40;
LABEL_46:

      goto LABEL_40;
    }
  }

  if (!v29)
    goto LABEL_45;
LABEL_39:
  if (!v30)
    goto LABEL_46;
LABEL_40:

  return v28;
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
  int64_t v37;
  int64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMProactiveHarvestingNotificationStack uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMProactiveHarvestingNotificationStack uniqueID](self, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_35;
    }
    -[BMProactiveHarvestingNotificationStack absoluteTimestamp](self, "absoluteTimestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMProactiveHarvestingNotificationStack absoluteTimestamp](self, "absoluteTimestamp");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_35;
    }
    -[BMProactiveHarvestingNotificationStack notificationIDs](self, "notificationIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notificationIDs");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMProactiveHarvestingNotificationStack notificationIDs](self, "notificationIDs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "notificationIDs");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_35;
    }
    -[BMProactiveHarvestingNotificationStack appBundleID](self, "appBundleID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appBundleID");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMProactiveHarvestingNotificationStack appBundleID](self, "appBundleID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appBundleID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_35;
    }
    -[BMProactiveHarvestingNotificationStack threadID](self, "threadID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "threadID");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMProactiveHarvestingNotificationStack threadID](self, "threadID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "threadID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_35;
    }
    if (-[BMProactiveHarvestingNotificationStack hasStackState](self, "hasStackState")
      || objc_msgSend(v5, "hasStackState"))
    {
      if (!-[BMProactiveHarvestingNotificationStack hasStackState](self, "hasStackState"))
        goto LABEL_35;
      if (!objc_msgSend(v5, "hasStackState"))
        goto LABEL_35;
      v37 = -[BMProactiveHarvestingNotificationStack stackState](self, "stackState");
      if (v37 != objc_msgSend(v5, "stackState"))
        goto LABEL_35;
    }
    if (-[BMProactiveHarvestingNotificationStack hasSectionID](self, "hasSectionID")
      || objc_msgSend(v5, "hasSectionID"))
    {
      if (!-[BMProactiveHarvestingNotificationStack hasSectionID](self, "hasSectionID"))
        goto LABEL_35;
      if (!objc_msgSend(v5, "hasSectionID"))
        goto LABEL_35;
      v38 = -[BMProactiveHarvestingNotificationStack sectionID](self, "sectionID");
      if (v38 != objc_msgSend(v5, "sectionID"))
        goto LABEL_35;
    }
    -[BMProactiveHarvestingNotificationStack contentProtection](self, "contentProtection");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentProtection");
    v40 = objc_claimAutoreleasedReturnValue();
    if (v39 == (void *)v40)
    {

    }
    else
    {
      v41 = (void *)v40;
      -[BMProactiveHarvestingNotificationStack contentProtection](self, "contentProtection");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentProtection");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "isEqual:", v43);

      if (!v44)
      {
LABEL_35:
        v12 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    -[BMProactiveHarvestingNotificationStack personaId](self, "personaId");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personaId");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46 == v47)
    {
      v12 = 1;
    }
    else
    {
      -[BMProactiveHarvestingNotificationStack personaId](self, "personaId");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "personaId");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v48, "isEqual:", v49);

    }
    goto LABEL_36;
  }
  v12 = 0;
LABEL_37:

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

- (NSArray)notificationIDs
{
  return self->_notificationIDs;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (NSString)threadID
{
  return self->_threadID;
}

- (int64_t)stackState
{
  return self->_stackState;
}

- (BOOL)hasStackState
{
  return self->_hasStackState;
}

- (void)setHasStackState:(BOOL)a3
{
  self->_hasStackState = a3;
}

- (int64_t)sectionID
{
  return self->_sectionID;
}

- (BOOL)hasSectionID
{
  return self->_hasSectionID;
}

- (void)setHasSectionID:(BOOL)a3
{
  self->_hasSectionID = a3;
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
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_notificationIDs, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
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

    v4 = -[BMProactiveHarvestingNotificationStack initByReadFrom:]([BMProactiveHarvestingNotificationStack alloc], "initByReadFrom:", v7);
    v4[9] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uniqueID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 2, 0, 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("notificationIDs_json"), 5, 1, &__block_literal_global_26973);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appBundleID"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("threadID"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("stackState"), 0, 0, 6, 3, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sectionID"), 0, 0, 7, 3, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentProtection"), 2, 0, 8, 13, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("personaId"), 2, 0, 9, 13, 0);
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
  return &unk_1E5F1C120;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uniqueID"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 2, 0, 0, v2);
  v13[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("notificationIDs"), 3, 13, 0);
  v13[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appBundleID"), 4, 13, 0);
  v13[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("threadID"), 5, 13, 0);
  v13[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stackState"), 6, 3, 0);
  v13[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sectionID"), 7, 3, 0);
  v13[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentProtection"), 8, 13, 0);
  v13[7] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("personaId"), 9, 13, 0);
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __49__BMProactiveHarvestingNotificationStack_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_notificationIDsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
