@implementation BMSiriPostSiriEngagementSignal

- (BMSiriPostSiriEngagementSignal)initWithDomain:(id)a3 action:(id)a4 isPostSiriEngagement:(id)a5 pseDelta:(id)a6 pseContents:(id)a7 donatedTimestamp:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  BMSiriPostSiriEngagementSignal *v19;
  double v20;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)BMSiriPostSiriEngagementSignal;
  v19 = -[BMEventBase init](&v24, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v22, v23);
    objc_storeStrong((id *)&v19->_domain, a3);
    objc_storeStrong((id *)&v19->_action, a4);
    if (v15)
    {
      v19->_hasIsPostSiriEngagement = 1;
      v19->_isPostSiriEngagement = objc_msgSend(v15, "BOOLValue");
    }
    else
    {
      v19->_hasIsPostSiriEngagement = 0;
      v19->_isPostSiriEngagement = 0;
    }
    objc_storeStrong((id *)&v19->_pseDelta, a6);
    objc_storeStrong((id *)&v19->_pseContents, a7);
    if (v18)
    {
      v19->_hasDonatedTimestamp = 1;
      objc_msgSend(v18, "doubleValue");
    }
    else
    {
      v19->_hasDonatedTimestamp = 0;
      v20 = -1.0;
    }
    v19->_donatedTimestamp = v20;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriPostSiriEngagementSignal domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagementSignal action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriPostSiriEngagementSignal isPostSiriEngagement](self, "isPostSiriEngagement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagementSignal pseDelta](self, "pseDelta");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagementSignal pseContents](self, "pseContents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriPostSiriEngagementSignal donatedTimestamp](self, "donatedTimestamp");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriPostSiriEngagementSignal with domain: %@, action: %@, isPostSiriEngagement: %@, pseDelta: %@, pseContents: %@, donatedTimestamp: %@"), v4, v5, v6, v7, v8, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriPostSiriEngagementSignal *v5;
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
  void *v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  BMSiriPostSiriEngagementSignalDeltaEvent *v31;
  BMSiriPostSiriEngagementSignalDeltaEvent *pseDelta;
  id v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  double v37;
  uint64_t v38;
  NSArray *pseContents;
  int v40;
  BMSiriPostSiriEngagementSignal *v41;
  objc_super v43;
  uint64_t v44;
  uint64_t v45;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BMSiriPostSiriEngagementSignal;
  v5 = -[BMEventBase init](&v43, sel_init);
  if (!v5)
    goto LABEL_50;
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
          v22 = 24;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 32;
LABEL_24:
          v23 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        case 3u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          v5->_hasIsPostSiriEngagement = 1;
          break;
        case 4u:
          v44 = 0;
          v45 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_52;
          v31 = -[BMSiriPostSiriEngagementSignalDeltaEvent initByReadFrom:]([BMSiriPostSiriEngagementSignalDeltaEvent alloc], "initByReadFrom:", v4);
          if (!v31)
            goto LABEL_52;
          pseDelta = v5->_pseDelta;
          v5->_pseDelta = v31;

          PBReaderRecallMark();
          continue;
        case 5u:
          v44 = 0;
          v45 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_52;
          v33 = -[BMSiriPostSiriEngagementSignalContent initByReadFrom:]([BMSiriPostSiriEngagementSignalContent alloc], "initByReadFrom:", v4);
          if (!v33)
            goto LABEL_52;
          v34 = v33;
          objc_msgSend(v6, "addObject:", v33);
          PBReaderRecallMark();

          continue;
        case 6u:
          v5->_hasDonatedTimestamp = 1;
          v35 = *v7;
          v36 = *(_QWORD *)&v4[v35];
          if (v36 <= 0xFFFFFFFFFFFFFFF7 && v36 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v37 = *(double *)(*(_QWORD *)&v4[*v10] + v36);
            *(_QWORD *)&v4[v35] = v36 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v37 = 0.0;
          }
          v5->_donatedTimestamp = v37;
          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_52:

          goto LABEL_49;
      }
      while (1)
      {
        v27 = *v7;
        v28 = *(_QWORD *)&v4[v27];
        v29 = v28 + 1;
        if (v28 == -1 || v29 > *(_QWORD *)&v4[*v8])
          break;
        v30 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v28);
        *(_QWORD *)&v4[v27] = v29;
        v26 |= (unint64_t)(v30 & 0x7F) << v24;
        if ((v30 & 0x80) == 0)
          goto LABEL_42;
        v24 += 7;
        v18 = v25++ >= 9;
        if (v18)
        {
          v26 = 0;
          goto LABEL_44;
        }
      }
      v4[*v9] = 1;
LABEL_42:
      if (v4[*v9])
        v26 = 0;
LABEL_44:
      v5->_isPostSiriEngagement = v26 != 0;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v38 = objc_msgSend(v6, "copy");
  pseContents = v5->_pseContents;
  v5->_pseContents = (NSArray *)v38;

  v40 = v4[*v9];
  if (v40)
LABEL_49:
    v41 = 0;
  else
LABEL_50:
    v41 = v5;

  return v41;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_domain)
    PBDataWriterWriteStringField();
  if (self->_action)
    PBDataWriterWriteStringField();
  if (self->_hasIsPostSiriEngagement)
    PBDataWriterWriteBOOLField();
  if (self->_pseDelta)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMSiriPostSiriEngagementSignalDeltaEvent writeTo:](self->_pseDelta, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_pseContents;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        v15 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4, (_QWORD)v11);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

  if (self->_hasDonatedTimestamp)
    PBDataWriterWriteDoubleField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriPostSiriEngagementSignal writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriPostSiriEngagementSignal)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  BMSiriPostSiriEngagementSignalContent *v22;
  BMSiriPostSiriEngagementSignalContent *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  BMSiriPostSiriEngagementSignal *v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  id v49;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  id v57;
  BMSiriPostSiriEngagementSignal *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  BMSiriPostSiriEngagementSignalDeltaEvent *v63;
  void *v64;
  id v65;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  id v82;
  _BYTE v83[128];
  uint64_t v84;
  void *v85;
  uint64_t v86;
  BMSiriPostSiriEngagementSignalDeltaEvent *v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  _QWORD v93[3];

  v93[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("domain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = *MEMORY[0x1E0D025B8];
        v92 = *MEMORY[0x1E0CB2D50];
        v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("domain"));
        v93[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, &v92, 1);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2);
        v29 = 0;
        v7 = 0;
        *a4 = v32;
        goto LABEL_73;
      }
      v29 = 0;
      v7 = 0;
      goto LABEL_74;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("action"));
  v8 = objc_claimAutoreleasedReturnValue();
  v67 = (void *)v8;
  if (v8 && (v9 = (void *)v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v34 = *MEMORY[0x1E0D025B8];
        v90 = *MEMORY[0x1E0CB2D50];
        v65 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("action"));
        v91 = v65;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, 2, v35);
        v29 = 0;
        v10 = 0;
        *a4 = v36;
        goto LABEL_72;
      }
      v10 = 0;
      v29 = 0;
      goto LABEL_73;
    }
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isPostSiriEngagement"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v35 = v11;
      if (a4)
      {
        v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v37 = *MEMORY[0x1E0D025B8];
        v88 = *MEMORY[0x1E0CB2D50];
        v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isPostSiriEngagement"));
        v89 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v37, 2);
        v29 = 0;
        v65 = 0;
        *a4 = v38;

        goto LABEL_71;
      }
      v65 = 0;
      v29 = 0;
      goto LABEL_72;
    }
    v62 = v11;
    v65 = v11;
  }
  else
  {
    v62 = v11;
    v65 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pseDelta"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = v12;
        v76 = 0;
        v63 = -[BMSiriPostSiriEngagementSignalDeltaEvent initWithJSONDictionary:error:]([BMSiriPostSiriEngagementSignalDeltaEvent alloc], "initWithJSONDictionary:error:", v26, &v76);
        v27 = v76;
        if (!v27)
        {
          v59 = v12;
          v60 = v6;

          goto LABEL_13;
        }
        v28 = v27;
        if (a4)
          *a4 = objc_retainAutorelease(v27);

        v29 = 0;
      }
      else
      {
        if (!a4)
        {
          v29 = 0;
          v35 = v62;
          v26 = v12;
          goto LABEL_71;
        }
        v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v61 = *MEMORY[0x1E0D025B8];
        v86 = *MEMORY[0x1E0CB2D50];
        v63 = (BMSiriPostSiriEngagementSignalDeltaEvent *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("pseDelta"));
        v87 = v63;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v61, 2, v39);

        v29 = 0;
        v26 = v12;
      }
      v35 = v62;
      goto LABEL_70;
    }
  }
  v59 = v12;
  v60 = v6;
  v63 = 0;
LABEL_13:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pseContents"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqual:", v14);

  if (v15)
  {
    v56 = v10;
    v57 = v7;
    v58 = self;

    v13 = 0;
  }
  else
  {
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v29 = 0;
          v35 = v62;
          goto LABEL_69;
        }
        v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v48 = *MEMORY[0x1E0D025B8];
        v84 = *MEMORY[0x1E0CB2D50];
        v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("pseContents"));
        v85 = v68;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v49 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v48, 2, v25);
        v29 = 0;
        *a4 = v49;
LABEL_62:
        v35 = v62;
        goto LABEL_68;
      }
    }
    v56 = v10;
    v57 = v7;
    v58 = self;
  }
  v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v13 = v13;
  v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
  if (!v16)
    goto LABEL_32;
  v17 = v16;
  v18 = *(_QWORD *)v73;
  v55 = v5;
  while (2)
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v73 != v18)
        objc_enumerationMutation(v13);
      v20 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (a4)
        {
          v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v41 = *MEMORY[0x1E0D025B8];
          v81 = *MEMORY[0x1E0CB2D50];
          v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("pseContents"));
          v82 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 2, v42);

LABEL_55:
          v29 = 0;
          v25 = v13;
          v5 = v55;
          v10 = v56;
          v7 = v57;
          self = v58;
          v35 = v62;
          goto LABEL_67;
        }
        goto LABEL_61;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v44 = *MEMORY[0x1E0D025B8];
          v79 = *MEMORY[0x1E0CB2D50];
          v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("pseContents"));
          v80 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v45);

          goto LABEL_55;
        }
LABEL_61:
        v29 = 0;
        v25 = v13;
        v5 = v55;
        v10 = v56;
        v7 = v57;
        self = v58;
        goto LABEL_62;
      }
      v21 = v20;
      v22 = [BMSiriPostSiriEngagementSignalContent alloc];
      v71 = 0;
      v23 = -[BMSiriPostSiriEngagementSignalContent initWithJSONDictionary:error:](v22, "initWithJSONDictionary:error:", v21, &v71);
      v24 = v71;
      if (v24)
      {
        v46 = v24;
        v35 = v62;
        if (a4)
          *a4 = objc_retainAutorelease(v24);

        v29 = 0;
        v25 = v13;
        v5 = v55;
        v10 = v56;
        v7 = v57;
        self = v58;
        goto LABEL_67;
      }
      objc_msgSend(v68, "addObject:", v23);

    }
    v17 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
    v5 = v55;
    if (v17)
      continue;
    break;
  }
LABEL_32:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("donatedTimestamp"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_opt_class();
    v7 = v57;
    self = v58;
    v10 = v56;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = 0;
      goto LABEL_65;
    }
    objc_opt_class();
    v35 = v62;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v21;
      goto LABEL_66;
    }
    if (a4)
    {
      v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v53 = *MEMORY[0x1E0D025B8];
      v77 = *MEMORY[0x1E0CB2D50];
      v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("donatedTimestamp"));
      v78 = v51;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v54, "initWithDomain:code:userInfo:", v53, 2, v52);

    }
    v25 = 0;
    v29 = 0;
  }
  else
  {
    v25 = 0;
    v7 = v57;
    self = v58;
    v10 = v56;
LABEL_65:
    v35 = v62;
LABEL_66:
    self = -[BMSiriPostSiriEngagementSignal initWithDomain:action:isPostSiriEngagement:pseDelta:pseContents:donatedTimestamp:](self, "initWithDomain:action:isPostSiriEngagement:pseDelta:pseContents:donatedTimestamp:", v7, v10, v65, v63, v68, v25);
    v29 = self;
  }
LABEL_67:

LABEL_68:
LABEL_69:

  v26 = v59;
  v6 = v60;
LABEL_70:

LABEL_71:
LABEL_72:

LABEL_73:
LABEL_74:

  return v29;
}

- (id)_pseContentsJSONArray
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
  -[BMSiriPostSiriEngagementSignal pseContents](self, "pseContents", 0);
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
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[6];
  _QWORD v25[7];

  v25[6] = *MEMORY[0x1E0C80C00];
  -[BMSiriPostSiriEngagementSignal domain](self, "domain");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagementSignal action](self, "action");
  v4 = objc_claimAutoreleasedReturnValue();
  if (-[BMSiriPostSiriEngagementSignal hasIsPostSiriEngagement](self, "hasIsPostSiriEngagement"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriPostSiriEngagementSignal isPostSiriEngagement](self, "isPostSiriEngagement"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[BMSiriPostSiriEngagementSignal pseDelta](self, "pseDelta");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsonDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSiriPostSiriEngagementSignal _pseContentsJSONArray](self, "_pseContentsJSONArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMSiriPostSiriEngagementSignal hasDonatedTimestamp](self, "hasDonatedTimestamp")
    || (-[BMSiriPostSiriEngagementSignal donatedTimestamp](self, "donatedTimestamp"), fabs(v9) == INFINITY))
  {
    v11 = 0;
  }
  else
  {
    -[BMSiriPostSiriEngagementSignal donatedTimestamp](self, "donatedTimestamp");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriPostSiriEngagementSignal donatedTimestamp](self, "donatedTimestamp");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[0] = CFSTR("domain");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v20 = v12;
  v22 = (void *)v4;
  v25[0] = v12;
  v24[1] = CFSTR("action");
  v13 = (void *)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[1] = v13;
  v24[2] = CFSTR("isPostSiriEngagement");
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v3;
  v25[2] = v14;
  v24[3] = CFSTR("pseDelta");
  v15 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[3] = v15;
  v24[4] = CFSTR("pseContents");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v16;
  v24[5] = CFSTR("donatedTimestamp");
  v17 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 6, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v8)
      goto LABEL_22;
LABEL_29:

    if (v7)
      goto LABEL_23;
    goto LABEL_30;
  }

  if (!v8)
    goto LABEL_29;
LABEL_22:
  if (v7)
    goto LABEL_23;
LABEL_30:

LABEL_23:
  if (!v5)

  if (!v22)
  {

    if (v23)
      goto LABEL_27;
LABEL_32:

    goto LABEL_27;
  }
  if (!v23)
    goto LABEL_32;
LABEL_27:

  return v18;
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
  BOOL v12;
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
  double v32;
  double v33;
  double v34;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriPostSiriEngagementSignal domain](self, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domain");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriPostSiriEngagementSignal domain](self, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_29;
    }
    -[BMSiriPostSiriEngagementSignal action](self, "action");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "action");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriPostSiriEngagementSignal action](self, "action");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "action");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_29;
    }
    if (-[BMSiriPostSiriEngagementSignal hasIsPostSiriEngagement](self, "hasIsPostSiriEngagement")
      || objc_msgSend(v5, "hasIsPostSiriEngagement"))
    {
      if (!-[BMSiriPostSiriEngagementSignal hasIsPostSiriEngagement](self, "hasIsPostSiriEngagement"))
        goto LABEL_29;
      if (!objc_msgSend(v5, "hasIsPostSiriEngagement"))
        goto LABEL_29;
      v19 = -[BMSiriPostSiriEngagementSignal isPostSiriEngagement](self, "isPostSiriEngagement");
      if (v19 != objc_msgSend(v5, "isPostSiriEngagement"))
        goto LABEL_29;
    }
    -[BMSiriPostSiriEngagementSignal pseDelta](self, "pseDelta");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pseDelta");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMSiriPostSiriEngagementSignal pseDelta](self, "pseDelta");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pseDelta");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_29;
    }
    -[BMSiriPostSiriEngagementSignal pseContents](self, "pseContents");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pseContents");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v26 == (void *)v27)
    {

    }
    else
    {
      v28 = (void *)v27;
      -[BMSiriPostSiriEngagementSignal pseContents](self, "pseContents");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pseContents");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (!v31)
        goto LABEL_29;
    }
    if (!-[BMSiriPostSiriEngagementSignal hasDonatedTimestamp](self, "hasDonatedTimestamp")
      && !objc_msgSend(v5, "hasDonatedTimestamp"))
    {
      v12 = 1;
      goto LABEL_30;
    }
    if (-[BMSiriPostSiriEngagementSignal hasDonatedTimestamp](self, "hasDonatedTimestamp")
      && objc_msgSend(v5, "hasDonatedTimestamp"))
    {
      -[BMSiriPostSiriEngagementSignal donatedTimestamp](self, "donatedTimestamp");
      v33 = v32;
      objc_msgSend(v5, "donatedTimestamp");
      v12 = v33 == v34;
LABEL_30:

      goto LABEL_31;
    }
LABEL_29:
    v12 = 0;
    goto LABEL_30;
  }
  v12 = 0;
LABEL_31:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)action
{
  return self->_action;
}

- (BOOL)isPostSiriEngagement
{
  return self->_isPostSiriEngagement;
}

- (BOOL)hasIsPostSiriEngagement
{
  return self->_hasIsPostSiriEngagement;
}

- (void)setHasIsPostSiriEngagement:(BOOL)a3
{
  self->_hasIsPostSiriEngagement = a3;
}

- (BMSiriPostSiriEngagementSignalDeltaEvent)pseDelta
{
  return self->_pseDelta;
}

- (NSArray)pseContents
{
  return self->_pseContents;
}

- (double)donatedTimestamp
{
  return self->_donatedTimestamp;
}

- (BOOL)hasDonatedTimestamp
{
  return self->_hasDonatedTimestamp;
}

- (void)setHasDonatedTimestamp:(BOOL)a3
{
  self->_hasDonatedTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pseContents, 0);
  objc_storeStrong((id *)&self->_pseDelta, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_domain, 0);
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

    v7 = -[BMSiriPostSiriEngagementSignal initByReadFrom:]([BMSiriPostSiriEngagementSignal alloc], "initByReadFrom:", v6);
    v7[5] = 1;

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
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("domain"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("action"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isPostSiriEngagement"), 0, 0, 3, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("pseDelta_json"), 5, 1, &__block_literal_global_287);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("pseContents_json"), 5, 1, &__block_literal_global_288_64363);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("donatedTimestamp"), 1, 0, 6, 0, 0);
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
  return &unk_1E5F1EFB8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("domain"), 1, 13, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("action"), 2, 13, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isPostSiriEngagement"), 3, 12, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("pseDelta"), 4, 14, objc_opt_class());
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("pseContents"), 5, 14, objc_opt_class());
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("donatedTimestamp"), 6, 0, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __41__BMSiriPostSiriEngagementSignal_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pseContentsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __41__BMSiriPostSiriEngagementSignal_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pseDelta");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
