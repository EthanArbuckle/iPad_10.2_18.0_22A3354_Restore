@implementation BMLifeEventActivity

- (BMLifeEventActivity)initWithStartDate:(id)a3 endDate:(id)a4 identifier:(id)a5 activityType:(int)a6 activitySource:(id)a7 confidence:(id)a8 members:(id)a9 metadata:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BMLifeEventActivity *v20;
  double v21;
  double v22;
  double v23;
  id v26;
  id v27;
  objc_super v28;

  v15 = a3;
  v16 = a4;
  v27 = a5;
  v26 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v28.receiver = self;
  v28.super_class = (Class)BMLifeEventActivity;
  v20 = -[BMEventBase init](&v28, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v15)
    {
      v20->_hasRaw_startDate = 1;
      objc_msgSend(v15, "timeIntervalSince1970");
    }
    else
    {
      v20->_hasRaw_startDate = 0;
      v21 = -1.0;
    }
    v20->_raw_startDate = v21;
    if (v16)
    {
      v20->_hasRaw_endDate = 1;
      objc_msgSend(v16, "timeIntervalSince1970");
    }
    else
    {
      v20->_hasRaw_endDate = 0;
      v22 = -1.0;
    }
    v20->_raw_endDate = v22;
    objc_storeStrong((id *)&v20->_identifier, a5);
    v20->_activityType = a6;
    objc_storeStrong((id *)&v20->_activitySource, a7);
    if (v17)
    {
      v20->_hasConfidence = 1;
      objc_msgSend(v17, "doubleValue");
    }
    else
    {
      v20->_hasConfidence = 0;
      v23 = -1.0;
    }
    v20->_confidence = v23;
    objc_storeStrong((id *)&v20->_members, a9);
    objc_storeStrong((id *)&v20->_metadata, a10);
  }

  return v20;
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
  -[BMLifeEventActivity startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLifeEventActivity endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLifeEventActivity identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMLifeEventActivityActivityTypeAsString(-[BMLifeEventActivity activityType](self, "activityType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLifeEventActivity activitySource](self, "activitySource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[BMLifeEventActivity confidence](self, "confidence");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLifeEventActivity members](self, "members");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLifeEventActivity metadata](self, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLifeEventActivity with startDate: %@, endDate: %@, identifier: %@, activityType: %@, activitySource: %@, confidence: %@, members: %@, metadata: %@"), v4, v5, v6, v7, v8, v10, v11, v12);

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLifeEventActivity *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  int *v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  BOOL v20;
  int v21;
  uint64_t v23;
  unint64_t v24;
  objc_class *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  NSString *identifier;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  objc_class *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  int *v41;
  int *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  NSArray *members;
  int v49;
  BMLifeEventActivity *v50;
  objc_super v52;
  uint64_t v53;
  uint64_t v54;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)BMLifeEventActivity;
  v5 = -[BMEventBase init](&v52, sel_init);
  if (!v5)
    goto LABEL_65;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v11 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v12 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v7;
        v17 = *(_QWORD *)&v4[v16];
        v18 = v17 + 1;
        if (v17 == -1 || v18 > *(_QWORD *)&v4[*v8])
          break;
        v19 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v17);
        *(_QWORD *)&v4[v16] = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0)
          goto LABEL_13;
        v13 += 7;
        v20 = v14++ >= 9;
        if (v20)
        {
          v15 = 0;
          v21 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v21 = v4[*v9];
      if (v4[*v9])
        v15 = 0;
LABEL_15:
      if (v21 || (v15 & 7) == 4)
        break;
      switch((v15 >> 3))
      {
        case 1u:
          *((_BYTE *)&v5->super.super.isa + v10[483]) = 1;
          v23 = *v7;
          v24 = *(_QWORD *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v25 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v24);
            *(_QWORD *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v25 = 0;
          }
          v46 = v11[484];
          goto LABEL_61;
        case 2u:
          v5->_hasRaw_endDate = 1;
          v26 = *v7;
          v27 = *(_QWORD *)&v4[v26];
          if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v25 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v27);
            *(_QWORD *)&v4[v26] = v27 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v25 = 0;
          }
          v46 = 40;
          goto LABEL_61;
        case 3u:
          PBReaderReadString();
          v28 = objc_claimAutoreleasedReturnValue();
          identifier = v5->_identifier;
          v5->_identifier = (NSString *)v28;

          continue;
        case 4u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          break;
        case 5u:
          v53 = 0;
          v54 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_67;
          v37 = -[BMLifeEventActivityActivitySource initByReadFrom:]([BMLifeEventActivityActivitySource alloc], "initByReadFrom:", v4);
          if (!v37)
            goto LABEL_67;
          v38 = 72;
          goto LABEL_48;
        case 6u:
          v5->_hasConfidence = 1;
          v39 = *v7;
          v40 = *(_QWORD *)&v4[v39];
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v25 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v40);
            *(_QWORD *)&v4[v39] = v40 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v25 = 0;
          }
          v46 = 80;
LABEL_61:
          *(Class *)((char *)&v5->super.super.isa + v46) = v25;
          continue;
        case 7u:
          v53 = 0;
          v54 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_67;
          v41 = v11;
          v42 = v10;
          v43 = -[BMLifeEventActivityPerson initByReadFrom:]([BMLifeEventActivityPerson alloc], "initByReadFrom:", v4);
          if (!v43)
            goto LABEL_67;
          v44 = v43;
          objc_msgSend(v6, "addObject:", v43);
          PBReaderRecallMark();

          v10 = v42;
          v11 = v41;
          continue;
        case 8u:
          v53 = 0;
          v54 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_67;
          v37 = -[BMLifeEventActivityMetadata initByReadFrom:]([BMLifeEventActivityMetadata alloc], "initByReadFrom:", v4);
          if (!v37)
            goto LABEL_67;
          v38 = 96;
LABEL_48:
          v45 = *(Class *)((char *)&v5->super.super.isa + v38);
          *(Class *)((char *)&v5->super.super.isa + v38) = v37;

          PBReaderRecallMark();
          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_67:

          goto LABEL_64;
      }
      while (1)
      {
        v33 = *v7;
        v34 = *(_QWORD *)&v4[v33];
        v35 = v34 + 1;
        if (v34 == -1 || v35 > *(_QWORD *)&v4[*v8])
          break;
        v36 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v34);
        *(_QWORD *)&v4[v33] = v35;
        v32 |= (unint64_t)(v36 & 0x7F) << v30;
        if ((v36 & 0x80) == 0)
          goto LABEL_50;
        v30 += 7;
        v20 = v31++ >= 9;
        if (v20)
        {
          LODWORD(v32) = 0;
          goto LABEL_52;
        }
      }
      v4[*v9] = 1;
LABEL_50:
      if (v4[*v9])
        LODWORD(v32) = 0;
LABEL_52:
      if (v32 >= 0x12)
        LODWORD(v32) = 0;
      v5->_activityType = v32;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v47 = objc_msgSend(v6, "copy");
  members = v5->_members;
  v5->_members = (NSArray *)v47;

  v49 = v4[*v9];
  if (v49)
LABEL_64:
    v50 = 0;
  else
LABEL_65:
    v50 = v5;

  return v50;
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
  if (self->_hasRaw_startDate)
    PBDataWriterWriteDoubleField();
  if (self->_hasRaw_endDate)
    PBDataWriterWriteDoubleField();
  if (self->_identifier)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_activitySource)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMLifeEventActivityActivitySource writeTo:](self->_activitySource, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_hasConfidence)
    PBDataWriterWriteDoubleField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_members;
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

  if (self->_metadata)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMLifeEventActivityMetadata writeTo:](self->_metadata, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLifeEventActivity writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLifeEventActivity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  objc_class *v17;
  id v18;
  id v19;
  double v20;
  double v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  BMLifeEventActivity *v31;
  void *v32;
  BMLifeEventActivityActivitySource *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  BMLifeEventActivityMetadata *v45;
  BMLifeEventActivityPerson *v46;
  BMLifeEventActivityPerson *v47;
  id v48;
  void *v49;
  id *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  void *v65;
  id v66;
  id *v67;
  id v68;
  uint64_t v69;
  void *v70;
  BMLifeEventActivityMetadata **v71;
  uint64_t *v72;
  void *v73;
  void *v74;
  id v75;
  uint64_t v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  id v84;
  id v85;
  void *v86;
  id v87;
  id *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  id v92;
  uint64_t v93;
  id *v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  id v100;
  id v101;
  BMLifeEventActivityActivitySource *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id *v117;
  void *v118;
  id *v119;
  id v121;
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  id v127;
  uint64_t v128;
  BMLifeEventActivityMetadata *v129;
  uint64_t v130;
  BMLifeEventActivityMetadata *v131;
  uint64_t v132;
  BMLifeEventActivityMetadata *v133;
  _BYTE v134[128];
  uint64_t v135;
  void *v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  BMLifeEventActivityActivitySource *v140;
  uint64_t v141;
  id v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  id *v146;
  uint64_t v147;
  _QWORD v148[3];

  v148[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("startDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (objc_class *)MEMORY[0x1E0C99D68];
      v9 = v6;
      v10 = [v8 alloc];
      objc_msgSend(v9, "doubleValue");
      v12 = v11;

      v13 = (id)objc_msgSend(v10, "initWithTimeIntervalSince1970:", v12);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        objc_msgSend(v14, "dateFromString:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v87 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v88 = a4;
          v89 = *MEMORY[0x1E0D025B8];
          v147 = *MEMORY[0x1E0CB2D50];
          v90 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("startDate"));
          v148[0] = v90;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v148, &v147, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = v87;
          v16 = (void *)v90;
          v7 = 0;
          v31 = 0;
          *v88 = (id)objc_msgSend(v91, "initWithDomain:code:userInfo:", v89, 2, v15);
          goto LABEL_100;
        }
        v7 = 0;
        v31 = 0;
        goto LABEL_101;
      }
      v13 = v6;
    }
    v7 = v13;
  }
  else
  {
    v7 = 0;
  }
LABEL_9:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("endDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (objc_class *)MEMORY[0x1E0C99D68];
      v18 = v15;
      v19 = [v17 alloc];
      objc_msgSend(v18, "doubleValue");
      v21 = v20;

      v22 = (id)objc_msgSend(v19, "initWithTimeIntervalSince1970:", v21);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        objc_msgSend(v23, "dateFromString:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v92 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v93 = *MEMORY[0x1E0D025B8];
          v145 = *MEMORY[0x1E0CB2D50];
          v94 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("endDate"));
          v146 = v94;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = v93;
          a4 = v94;
          v96 = (id)objc_msgSend(v92, "initWithDomain:code:userInfo:", v95, 2, v24);
          v16 = 0;
          v31 = 0;
          *v119 = v96;
          goto LABEL_99;
        }
        v16 = 0;
        v31 = 0;
        goto LABEL_100;
      }
      v22 = v15;
    }
    v16 = v22;
  }
  else
  {
    v16 = 0;
  }
LABEL_17:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v112 = v16;
        v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = *MEMORY[0x1E0D025B8];
        v143 = *MEMORY[0x1E0CB2D50];
        v118 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
        v144 = v118;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v27;
        v16 = v112;
        v30 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v28, 2, v25);
        v31 = 0;
        *a4 = v30;
        a4 = 0;
        goto LABEL_98;
      }
      v31 = 0;
      goto LABEL_99;
    }
    a4 = v24;
  }
  else
  {
    a4 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("activityType"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v7;
  v117 = a4;
  if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v25;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v119)
        {
          v115 = v16;
          v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v79 = *MEMORY[0x1E0D025B8];
          v141 = *MEMORY[0x1E0CB2D50];
          v52 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("activityType"));
          v142 = v52;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1);
          v80 = objc_claimAutoreleasedReturnValue();
          v81 = v78;
          v16 = v115;
          v82 = v79;
          v33 = (BMLifeEventActivityActivitySource *)v80;
          v118 = 0;
          v31 = 0;
          *v119 = (id)objc_msgSend(v81, "initWithDomain:code:userInfo:", v82, 2, v80);
          goto LABEL_96;
        }
        v118 = 0;
        v31 = 0;
        goto LABEL_98;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMLifeEventActivityActivityTypeFromString(v25));
      v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    v118 = v26;
  }
  else
  {
    v118 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("activitySource"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v32 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v104 = v32;
    v33 = 0;
    goto LABEL_35;
  }
  v110 = v25;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v55 = v32;
    if (!v119)
    {
      v31 = 0;
      v52 = v55;
      goto LABEL_97;
    }
    v114 = v16;
    v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v108 = *MEMORY[0x1E0D025B8];
    v139 = *MEMORY[0x1E0CB2D50];
    v57 = v15;
    v58 = objc_alloc(MEMORY[0x1E0CB3940]);
    v59 = v55;
    v99 = objc_opt_class();
    v60 = v58;
    v15 = v57;
    v33 = (BMLifeEventActivityActivitySource *)objc_msgSend(v60, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v99, CFSTR("activitySource"));
    v140 = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v56;
    v16 = v114;
    *v119 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v108, 2, v61);

    v31 = 0;
    v52 = v59;
LABEL_66:
    v25 = v110;
    v7 = v116;
    goto LABEL_96;
  }
  v51 = v16;
  v52 = v32;
  v127 = 0;
  v33 = -[BMLifeEventActivityActivitySource initWithJSONDictionary:error:]([BMLifeEventActivityActivitySource alloc], "initWithJSONDictionary:error:", v52, &v127);
  v53 = v127;
  if (v53)
  {
    v54 = v53;
    if (v119)
      *v119 = objc_retainAutorelease(v53);

    v31 = 0;
    v16 = v51;
    goto LABEL_66;
  }
  v104 = v32;

  v25 = v110;
LABEL_35:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("confidence"));
  v34 = objc_claimAutoreleasedReturnValue();
  v106 = (void *)v34;
  v111 = v15;
  v113 = v16;
  if (v34 && (v35 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v119)
      {
        v63 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v64 = *MEMORY[0x1E0D025B8];
        v137 = *MEMORY[0x1E0CB2D50];
        v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("confidence"));
        v138 = v36;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v63;
        v16 = v113;
        v66 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v64, 2, v39);
        v31 = 0;
        v107 = 0;
        *v119 = v66;
        goto LABEL_93;
      }
      v31 = 0;
      v107 = 0;
      goto LABEL_95;
    }
    v107 = v35;
  }
  else
  {
    v107 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("members"));
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v36, "isEqual:", v37);

  v103 = v6;
  if (v38)
  {
    v102 = v33;
    v109 = v25;
    v105 = v24;

    v36 = 0;
  }
  else
  {
    if (v36)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v119)
        {
          v75 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v76 = *MEMORY[0x1E0D025B8];
          v135 = *MEMORY[0x1E0CB2D50];
          v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("members"));
          v136 = v39;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v76, 2, v49);
          v31 = 0;
          *v119 = v77;
          goto LABEL_92;
        }
        v31 = 0;
        v16 = v113;
        goto LABEL_94;
      }
    }
    v102 = v33;
    v109 = v25;
    v105 = v24;
  }
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v36, "count"));
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v36 = v36;
  v40 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v123, v134, 16);
  if (!v40)
    goto LABEL_53;
  v41 = v40;
  v42 = *(_QWORD *)v124;
  v101 = v5;
  while (2)
  {
    for (i = 0; i != v41; ++i)
    {
      if (*(_QWORD *)v124 != v42)
        objc_enumerationMutation(v36);
      v44 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v67 = v119;
        if (v119)
        {
          v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v69 = *MEMORY[0x1E0D025B8];
          v132 = *MEMORY[0x1E0CB2D50];
          v45 = (BMLifeEventActivityMetadata *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("members"));
          v133 = v45;
          v70 = (void *)MEMORY[0x1E0C99D80];
          v71 = &v133;
          v72 = &v132;
LABEL_73:
          objc_msgSend(v70, "dictionaryWithObjects:forKeys:count:", v71, v72, 1);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          *v67 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v69, 2, v73);

LABEL_79:
          v31 = 0;
          v49 = v36;
          v5 = v101;
          v33 = v102;
          v7 = v116;
          goto LABEL_80;
        }
LABEL_87:
        v31 = 0;
        v49 = v36;
        v5 = v101;
        v33 = v102;
LABEL_88:
        v24 = v105;
        v25 = v109;
        goto LABEL_92;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v67 = v119;
        if (v119)
        {
          v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v69 = *MEMORY[0x1E0D025B8];
          v130 = *MEMORY[0x1E0CB2D50];
          v45 = (BMLifeEventActivityMetadata *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("members"));
          v131 = v45;
          v70 = (void *)MEMORY[0x1E0C99D80];
          v71 = &v131;
          v72 = &v130;
          goto LABEL_73;
        }
        goto LABEL_87;
      }
      v45 = v44;
      v46 = [BMLifeEventActivityPerson alloc];
      v122 = 0;
      v47 = -[BMLifeEventActivityPerson initWithJSONDictionary:error:](v46, "initWithJSONDictionary:error:", v45, &v122);
      v48 = v122;
      if (v48)
      {
        v74 = v48;
        if (v119)
          *v119 = objc_retainAutorelease(v48);

        goto LABEL_79;
      }
      objc_msgSend(v39, "addObject:", v47);

    }
    v41 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v123, v134, 16);
    v5 = v101;
    if (v41)
      continue;
    break;
  }
LABEL_53:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("metadata"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v49)
  {
    v45 = 0;
    v50 = v117;
    v24 = v105;
    v25 = v109;
    v33 = v102;
    goto LABEL_90;
  }
  objc_opt_class();
  v33 = v102;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v45 = 0;
    v24 = v105;
    v25 = v109;
    goto LABEL_56;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v84 = v49;
    v121 = 0;
    v45 = -[BMLifeEventActivityMetadata initWithJSONDictionary:error:]([BMLifeEventActivityMetadata alloc], "initWithJSONDictionary:error:", v84, &v121);
    v85 = v121;
    if (v85)
    {
      v86 = v85;
      v24 = v105;
      if (v119)
        *v119 = objc_retainAutorelease(v85);

      v49 = v84;
      v31 = 0;
      v25 = v109;
      v7 = v116;
      goto LABEL_91;
    }

    v24 = v105;
    v25 = v109;
LABEL_56:
    v50 = v117;
LABEL_90:
    v31 = -[BMLifeEventActivity initWithStartDate:endDate:identifier:activityType:activitySource:confidence:members:metadata:](self, "initWithStartDate:endDate:identifier:activityType:activitySource:confidence:members:metadata:", v7, v113, v50, objc_msgSend(v118, "intValue"), v33, v107, v39, v45);
    self = v31;
    goto LABEL_91;
  }
  if (!v119)
  {
    v31 = 0;
    goto LABEL_88;
  }
  v100 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v97 = *MEMORY[0x1E0D025B8];
  v128 = *MEMORY[0x1E0CB2D50];
  v45 = (BMLifeEventActivityMetadata *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("metadata"));
  v129 = v45;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  *v119 = (id)objc_msgSend(v100, "initWithDomain:code:userInfo:", v97, 2, v98);

  v7 = v116;
  v31 = 0;
LABEL_80:
  v24 = v105;
  v25 = v109;
LABEL_91:

LABEL_92:
  v6 = v103;
  v16 = v113;
LABEL_93:

LABEL_94:
  v15 = v111;
LABEL_95:
  v52 = v104;

LABEL_96:
LABEL_97:

  a4 = v117;
LABEL_98:

LABEL_99:
LABEL_100:

LABEL_101:
  return v31;
}

- (id)_membersJSONArray
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
  -[BMLifeEventActivity members](self, "members", 0);
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
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[8];
  _QWORD v38[10];

  v38[8] = *MEMORY[0x1E0C80C00];
  -[BMLifeEventActivity startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLifeEventActivity startDate](self, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMLifeEventActivity endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLifeEventActivity endDate](self, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  -[BMLifeEventActivity identifier](self, "identifier");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLifeEventActivity activityType](self, "activityType"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLifeEventActivity activitySource](self, "activitySource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "jsonDictionary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[BMLifeEventActivity hasConfidence](self, "hasConfidence")
    || (-[BMLifeEventActivity confidence](self, "confidence"), fabs(v13) == INFINITY))
  {
    v15 = 0;
  }
  else
  {
    -[BMLifeEventActivity confidence](self, "confidence");
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLifeEventActivity confidence](self, "confidence");
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMLifeEventActivity _membersJSONArray](self, "_membersJSONArray");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLifeEventActivity metadata](self, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "jsonDictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v37[0] = CFSTR("startDate");
  v19 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v19;
  v38[0] = v19;
  v37[1] = CFSTR("endDate");
  v20 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v20;
  v38[1] = v20;
  v37[2] = CFSTR("identifier");
  v21 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v6;
  v30 = (void *)v21;
  v38[2] = v21;
  v37[3] = CFSTR("activityType");
  v22 = v36;
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v10;
  v38[3] = v22;
  v37[4] = CFSTR("activitySource");
  v23 = v35;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v11;
  v38[4] = v23;
  v37[5] = CFSTR("confidence");
  v25 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[5] = v25;
  v37[6] = CFSTR("members");
  v26 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[6] = v26;
  v37[7] = CFSTR("metadata");
  v27 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[7] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v16)
      goto LABEL_29;
LABEL_39:

    if (v15)
      goto LABEL_30;
    goto LABEL_40;
  }

  if (!v16)
    goto LABEL_39;
LABEL_29:
  if (v15)
    goto LABEL_30;
LABEL_40:

LABEL_30:
  if (!v35)

  if (!v36)
  if (v24)
  {
    if (v33)
      goto LABEL_36;
LABEL_42:

    if (v34)
      goto LABEL_37;
LABEL_43:

    goto LABEL_37;
  }

  if (!v33)
    goto LABEL_42;
LABEL_36:
  if (!v34)
    goto LABEL_43;
LABEL_37:

  return v28;
}

- (NSDate)startDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_startDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_startDate);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)endDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_endDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_endDate);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
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
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMLifeEventActivity startDate](self, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMLifeEventActivity startDate](self, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_27;
    }
    -[BMLifeEventActivity endDate](self, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMLifeEventActivity endDate](self, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_27;
    }
    -[BMLifeEventActivity identifier](self, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMLifeEventActivity identifier](self, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_27;
    }
    v25 = -[BMLifeEventActivity activityType](self, "activityType");
    if (v25 == objc_msgSend(v5, "activityType"))
    {
      -[BMLifeEventActivity activitySource](self, "activitySource");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activitySource");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[BMLifeEventActivity activitySource](self, "activitySource");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "activitySource");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_27;
      }
      if (-[BMLifeEventActivity hasConfidence](self, "hasConfidence")
        || objc_msgSend(v5, "hasConfidence"))
      {
        if (!-[BMLifeEventActivity hasConfidence](self, "hasConfidence"))
          goto LABEL_27;
        if (!objc_msgSend(v5, "hasConfidence"))
          goto LABEL_27;
        -[BMLifeEventActivity confidence](self, "confidence");
        v33 = v32;
        objc_msgSend(v5, "confidence");
        if (v33 != v34)
          goto LABEL_27;
      }
      -[BMLifeEventActivity members](self, "members");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "members");
      v36 = objc_claimAutoreleasedReturnValue();
      if (v35 == (void *)v36)
      {

      }
      else
      {
        v37 = (void *)v36;
        -[BMLifeEventActivity members](self, "members");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "members");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v38, "isEqual:", v39);

        if (!v40)
          goto LABEL_27;
      }
      -[BMLifeEventActivity metadata](self, "metadata");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "metadata");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42 == v43)
      {
        v12 = 1;
      }
      else
      {
        -[BMLifeEventActivity metadata](self, "metadata");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "metadata");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v44, "isEqual:", v45);

      }
      goto LABEL_28;
    }
LABEL_27:
    v12 = 0;
LABEL_28:

    goto LABEL_29;
  }
  v12 = 0;
LABEL_29:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int)activityType
{
  return self->_activityType;
}

- (BMLifeEventActivityActivitySource)activitySource
{
  return self->_activitySource;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)hasConfidence
{
  return self->_hasConfidence;
}

- (void)setHasConfidence:(BOOL)a3
{
  self->_hasConfidence = a3;
}

- (NSArray)members
{
  return self->_members;
}

- (BMLifeEventActivityMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong((id *)&self->_activitySource, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
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

    v4 = -[BMLifeEventActivity initByReadFrom:]([BMLifeEventActivity alloc], "initByReadFrom:", v7);
    v4[13] = 0;

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
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("startDate"), 3, 0, 1, 0, 2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("endDate"), 3, 0, 2, 0, 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activityType"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("activitySource_json"), 5, 1, &__block_literal_global_265);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("confidence"), 1, 0, 6, 0, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("members_json"), 5, 1, &__block_literal_global_266_13599);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("metadata_json"), 5, 1, &__block_literal_global_267);
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B5E0;
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
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("startDate"), 1, 0, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("endDate"), 2, 0, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 3, 13, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activityType"), 4, 4, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activitySource"), 5, 14, objc_opt_class());
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("confidence"), 6, 0, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("members"), 7, 14, objc_opt_class());
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("metadata"), 8, 14, objc_opt_class());
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __30__BMLifeEventActivity_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __30__BMLifeEventActivity_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_membersJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __30__BMLifeEventActivity_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activitySource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
