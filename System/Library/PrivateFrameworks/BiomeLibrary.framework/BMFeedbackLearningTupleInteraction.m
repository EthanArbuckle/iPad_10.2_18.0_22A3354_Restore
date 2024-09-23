@implementation BMFeedbackLearningTupleInteraction

- (BMFeedbackLearningTupleInteraction)initWithEventId:(id)a3 sessionId:(id)a4 absoluteTimestamp:(id)a5 tupleInteraction:(id)a6 candidateInteractions:(id)a7
{
  return -[BMFeedbackLearningTupleInteraction initWithEventId:sessionId:absoluteTimestamp:tupleInteraction:candidateInteractions:statementId:](self, "initWithEventId:sessionId:absoluteTimestamp:tupleInteraction:candidateInteractions:statementId:", a3, a4, a5, a6, a7, 0);
}

- (BMFeedbackLearningTupleInteraction)initWithEventId:(id)a3 sessionId:(id)a4 absoluteTimestamp:(id)a5 tupleInteraction:(id)a6 candidateInteractions:(id)a7 statementId:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BMFeedbackLearningTupleInteraction *v20;
  uint64_t v21;
  NSData *raw_eventId;
  uint64_t v23;
  NSData *raw_sessionId;
  double v25;
  unsigned int v26;
  objc_super v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)BMFeedbackLearningTupleInteraction;
  v20 = -[BMEventBase init](&v28, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v14)
    {
      v29 = 0;
      v30 = 0;
      objc_msgSend(v14, "getUUIDBytes:", &v29);
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v29, 16);
      raw_eventId = v20->_raw_eventId;
      v20->_raw_eventId = (NSData *)v21;
    }
    else
    {
      raw_eventId = v20->_raw_eventId;
      v20->_raw_eventId = 0;
    }

    if (v15)
    {
      v29 = 0;
      v30 = 0;
      objc_msgSend(v15, "getUUIDBytes:", &v29);
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v29, 16);
      raw_sessionId = v20->_raw_sessionId;
      v20->_raw_sessionId = (NSData *)v23;
    }
    else
    {
      raw_sessionId = v20->_raw_sessionId;
      v20->_raw_sessionId = 0;
    }

    if (v16)
    {
      v20->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v20->_hasRaw_absoluteTimestamp = 0;
      v25 = -1.0;
    }
    v20->_raw_absoluteTimestamp = v25;
    objc_storeStrong((id *)&v20->_tupleInteraction, a6);
    objc_storeStrong((id *)&v20->_candidateInteractions, a7);
    if (v19)
    {
      v20->_hasStatementId = 1;
      v26 = objc_msgSend(v19, "unsignedIntValue");
    }
    else
    {
      v26 = 0;
      v20->_hasStatementId = 0;
    }
    v20->_statementId = v26;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMFeedbackLearningTupleInteraction eventId](self, "eventId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFeedbackLearningTupleInteraction sessionId](self, "sessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFeedbackLearningTupleInteraction absoluteTimestamp](self, "absoluteTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFeedbackLearningTupleInteraction tupleInteraction](self, "tupleInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFeedbackLearningTupleInteraction candidateInteractions](self, "candidateInteractions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMFeedbackLearningTupleInteraction statementId](self, "statementId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMFeedbackLearningTupleInteraction with eventId: %@, sessionId: %@, absoluteTimestamp: %@, tupleInteraction: %@, candidateInteractions: %@, statementId: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMFeedbackLearningTupleInteraction *v5;
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
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  double v26;
  BMFeedbackLearningTupleInteractionTupleInteraction *v27;
  BMFeedbackLearningTupleInteractionTupleInteraction *tupleInteraction;
  id v29;
  void *v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  NSArray *candidateInteractions;
  int v40;
  BMFeedbackLearningTupleInteraction *v41;
  objc_super v43;
  uint64_t v44;
  uint64_t v45;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BMFeedbackLearningTupleInteraction;
  v5 = -[BMEventBase init](&v43, sel_init);
  if (!v5)
  {
LABEL_52:
    v41 = v5;
    goto LABEL_53;
  }
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_50:
    v38 = objc_msgSend(v6, "copy");
    candidateInteractions = v5->_candidateInteractions;
    v5->_candidateInteractions = (NSArray *)v38;

    v40 = v4[*v9];
    if (v40)
      goto LABEL_51;
    goto LABEL_52;
  }
  v10 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v9])
      goto LABEL_50;
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
      goto LABEL_50;
    switch((v13 >> 3))
    {
      case 1u:
        PBReaderReadData();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "length") != 16)
          goto LABEL_54;
        v22 = 16;
        goto LABEL_24;
      case 2u:
        PBReaderReadData();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "length") == 16)
        {
          v22 = 24;
LABEL_24:
          v23 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

LABEL_49:
          if (*(_QWORD *)&v4[*v7] >= *(_QWORD *)&v4[*v8])
            goto LABEL_50;
          continue;
        }
LABEL_54:

LABEL_55:
LABEL_51:
        v41 = 0;
LABEL_53:

        return v41;
      case 3u:
        v5->_hasRaw_absoluteTimestamp = 1;
        v24 = *v7;
        v25 = *(_QWORD *)&v4[v24];
        if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(_QWORD *)&v4[*v8])
        {
          v26 = *(double *)(*(_QWORD *)&v4[*v10] + v25);
          *(_QWORD *)&v4[v24] = v25 + 8;
        }
        else
        {
          v4[*v9] = 1;
          v26 = 0.0;
        }
        v5->_raw_absoluteTimestamp = v26;
        goto LABEL_49;
      case 4u:
        v44 = 0;
        v45 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_55;
        v27 = -[BMFeedbackLearningTupleInteractionTupleInteraction initByReadFrom:]([BMFeedbackLearningTupleInteractionTupleInteraction alloc], "initByReadFrom:", v4);
        if (!v27)
          goto LABEL_55;
        tupleInteraction = v5->_tupleInteraction;
        v5->_tupleInteraction = v27;

        PBReaderRecallMark();
        goto LABEL_49;
      case 5u:
        v44 = 0;
        v45 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_55;
        v29 = -[BMFeedbackLearningTupleInteractionCandidateInteraction initByReadFrom:]([BMFeedbackLearningTupleInteractionCandidateInteraction alloc], "initByReadFrom:", v4);
        if (!v29)
          goto LABEL_55;
        v30 = v29;
        objc_msgSend(v6, "addObject:", v29);
        PBReaderRecallMark();

        goto LABEL_49;
      case 6u:
        v31 = 0;
        v32 = 0;
        v33 = 0;
        v5->_hasStatementId = 1;
        while (2)
        {
          v34 = *v7;
          v35 = *(_QWORD *)&v4[v34];
          v36 = v35 + 1;
          if (v35 == -1 || v36 > *(_QWORD *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            v37 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v35);
            *(_QWORD *)&v4[v34] = v36;
            v33 |= (unint64_t)(v37 & 0x7F) << v31;
            if (v37 < 0)
            {
              v31 += 7;
              v18 = v32++ >= 9;
              if (v18)
              {
                LODWORD(v33) = 0;
                goto LABEL_46;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9])
          LODWORD(v33) = 0;
LABEL_46:
        v5->_statementId = v33;
        goto LABEL_49;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          goto LABEL_55;
        goto LABEL_49;
    }
  }
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
  if (self->_raw_eventId)
    PBDataWriterWriteDataField();
  if (self->_raw_sessionId)
    PBDataWriterWriteDataField();
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_tupleInteraction)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMFeedbackLearningTupleInteractionTupleInteraction writeTo:](self->_tupleInteraction, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_candidateInteractions;
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

  if (self->_hasStatementId)
    PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMFeedbackLearningTupleInteraction writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMFeedbackLearningTupleInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  id v27;
  BMFeedbackLearningTupleInteractionCandidateInteraction *v28;
  BMFeedbackLearningTupleInteractionCandidateInteraction *v29;
  id v30;
  id v31;
  objc_class *v32;
  id v33;
  id v34;
  double v35;
  double v36;
  id v37;
  id v38;
  void *v39;
  BMFeedbackLearningTupleInteraction *v40;
  id v41;
  id *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  id v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  void *v58;
  uint64_t v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  void *v67;
  id v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  id v74;
  id v75;
  id *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  id v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  id v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  void *v99;
  BMFeedbackLearningTupleInteraction *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  void *v108;
  void *v109;
  BMFeedbackLearningTupleInteractionTupleInteraction *v110;
  void *v111;
  void *v112;
  id *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  id v119;
  id v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  id v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  id v129;
  uint64_t v130;
  id v131;
  _BYTE v132[128];
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  id v144;
  uint64_t v145;
  _QWORD v146[3];

  v146[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v42 = a4;
        v43 = *MEMORY[0x1E0D025B8];
        v143 = *MEMORY[0x1E0CB2D50];
        v44 = v7;
        v45 = objc_alloc(MEMORY[0x1E0CB3940]);
        v95 = objc_opt_class();
        v46 = v45;
        v7 = v44;
        v8 = (id)objc_msgSend(v46, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v95, CFSTR("eventId"));
        v144 = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1);
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = v43;
        v9 = (void *)v47;
        v40 = 0;
        *v42 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v48, 2, v47);
        goto LABEL_83;
      }
      v40 = 0;
      goto LABEL_85;
    }
    v8 = v7;
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
    if (!v17)
    {
      if (!a4)
      {
        v40 = 0;
        goto LABEL_84;
      }
      v75 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v76 = a4;
      v77 = *MEMORY[0x1E0D025B8];
      v145 = *MEMORY[0x1E0CB2D50];
      v78 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("eventId"));
      v146[0] = v78;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v146, &v145, 1);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v77;
      v9 = (void *)v78;
      *v76 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v80, 2, v79);

      goto LABEL_66;
    }
    v18 = (void *)v17;
    v113 = a4;

    v8 = v18;
  }
  else
  {
    v113 = a4;
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sessionId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v9;
        v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v19);
        if (!v20)
        {
          v81 = v19;
          if (v113)
          {
            v119 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v82 = v9;
            v83 = *MEMORY[0x1E0D025B8];
            v141 = *MEMORY[0x1E0CB2D50];
            v116 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("sessionId"));
            v142 = v116;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = v83;
            v9 = v82;
            *v113 = (id)objc_msgSend(v119, "initWithDomain:code:userInfo:", v85, 2, v84);

            v40 = 0;
            v10 = v81;

          }
          else
          {
            v40 = 0;
            v10 = v19;
          }
          goto LABEL_82;
        }
        v21 = (void *)v20;

        v10 = v21;
        goto LABEL_7;
      }
      if (v113)
      {
        v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v50 = v9;
        v51 = *MEMORY[0x1E0D025B8];
        v139 = *MEMORY[0x1E0CB2D50];
        v52 = v8;
        v53 = objc_alloc(MEMORY[0x1E0CB3940]);
        v96 = objc_opt_class();
        v54 = v53;
        v8 = v52;
        v10 = (void *)objc_msgSend(v54, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v96, CFSTR("sessionId"));
        v140 = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1);
        v55 = objc_claimAutoreleasedReturnValue();
        v56 = v51;
        v9 = v50;
        v115 = (void *)v55;
        v40 = 0;
        *v113 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v56, 2);

        goto LABEL_82;
      }
LABEL_66:
      v40 = 0;
      goto LABEL_83;
    }
  }
  v10 = 0;
LABEL_7:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v11 = objc_claimAutoreleasedReturnValue();
  v109 = (void *)v11;
  if (v11 && (v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = (objc_class *)MEMORY[0x1E0C99D68];
      v33 = v12;
      v34 = [v32 alloc];
      objc_msgSend(v33, "doubleValue");
      v36 = v35;

      v114 = (id)objc_msgSend(v34, "initWithTimeIntervalSinceReferenceDate:", v36);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v57 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        objc_msgSend(v57, "dateFromString:", v12);
        v114 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v113)
          {
            v105 = v9;
            v87 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v107 = v8;
            v88 = *MEMORY[0x1E0D025B8];
            v137 = *MEMORY[0x1E0CB2D50];
            v37 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
            v138 = v37;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1);
            v89 = objc_claimAutoreleasedReturnValue();
            v90 = v87;
            v91 = v88;
            v9 = v105;
            v8 = v107;
            v112 = (void *)v89;
            v114 = 0;
            v40 = 0;
            *v113 = (id)objc_msgSend(v90, "initWithDomain:code:userInfo:", v91, 2);

            goto LABEL_80;
          }
          v114 = 0;
          v40 = 0;
          goto LABEL_81;
        }
        v114 = v12;
      }
    }
  }
  else
  {
    v114 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tupleInteraction"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v10;
  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v58 = v13;
      if (v113)
      {
        v118 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v104 = v9;
        v59 = *MEMORY[0x1E0D025B8];
        v135 = *MEMORY[0x1E0CB2D50];
        v60 = v8;
        v61 = objc_alloc(MEMORY[0x1E0CB3940]);
        v97 = objc_opt_class();
        v62 = v61;
        v8 = v60;
        v111 = (void *)objc_msgSend(v62, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v97, CFSTR("tupleInteraction"));
        v136 = v111;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v59;
        v9 = v104;
        *v113 = (id)objc_msgSend(v118, "initWithDomain:code:userInfo:", v64, 2, v63);

        v40 = 0;
        v37 = v58;

      }
      else
      {
        v40 = 0;
        v37 = v13;
      }
      goto LABEL_80;
    }
    v37 = v13;
    v125 = 0;
    v110 = -[BMFeedbackLearningTupleInteractionTupleInteraction initWithJSONDictionary:error:]([BMFeedbackLearningTupleInteractionTupleInteraction alloc], "initWithJSONDictionary:error:", v37, &v125);
    v38 = v125;
    if (v38)
    {
      v39 = v38;
      if (v113)
        *v113 = objc_retainAutorelease(v38);

      v40 = 0;
      goto LABEL_79;
    }
    v102 = v13;
    v106 = v8;

  }
  else
  {
    v102 = v13;
    v106 = v8;
    v110 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("candidateInteractions"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  v103 = v9;
  if (v16)
  {
    v100 = self;
    v101 = v6;

    v14 = 0;
  }
  else
  {
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v113)
        {
          v72 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v73 = *MEMORY[0x1E0D025B8];
          v133 = *MEMORY[0x1E0CB2D50];
          v117 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("candidateInteractions"));
          v134 = v117;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          v74 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v73, 2, v31);
          v40 = 0;
          *v113 = v74;
          goto LABEL_77;
        }
        v40 = 0;
        goto LABEL_78;
      }
    }
    v100 = self;
    v101 = v6;
  }
  v117 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v14 = v14;
  v22 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v121, v132, 16);
  if (!v22)
    goto LABEL_34;
  v23 = v22;
  v24 = *(_QWORD *)v122;
  v99 = v7;
  while (2)
  {
    for (i = 0; i != v23; ++i)
    {
      if (*(_QWORD *)v122 != v24)
        objc_enumerationMutation(v14);
      v26 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v113)
        {
          v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v66 = *MEMORY[0x1E0D025B8];
          v130 = *MEMORY[0x1E0CB2D50];
          v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("candidateInteractions"));
          v131 = v27;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *v113 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v66, 2, v67);

LABEL_56:
          v40 = 0;
          v31 = v14;
          self = v100;
          v6 = v101;
          v7 = v99;
LABEL_60:
          v10 = v108;
          goto LABEL_76;
        }
LABEL_63:
        v40 = 0;
        v31 = v14;
        self = v100;
        v6 = v101;
        v7 = v99;
        v10 = v108;
        goto LABEL_77;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v113)
        {
          v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v69 = *MEMORY[0x1E0D025B8];
          v128 = *MEMORY[0x1E0CB2D50];
          v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("candidateInteractions"));
          v129 = v27;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *v113 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v69, 2, v70);

          goto LABEL_56;
        }
        goto LABEL_63;
      }
      v27 = v26;
      v28 = [BMFeedbackLearningTupleInteractionCandidateInteraction alloc];
      v120 = 0;
      v29 = -[BMFeedbackLearningTupleInteractionCandidateInteraction initWithJSONDictionary:error:](v28, "initWithJSONDictionary:error:", v27, &v120);
      v30 = v120;
      if (v30)
      {
        v71 = v30;
        v7 = v99;
        if (v113)
          *v113 = objc_retainAutorelease(v30);

        v40 = 0;
        v31 = v14;
        self = v100;
        v6 = v101;
        goto LABEL_60;
      }
      objc_msgSend(v117, "addObject:", v29);

    }
    v23 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v121, v132, 16);
    v7 = v99;
    if (v23)
      continue;
    break;
  }
LABEL_34:

  v6 = v101;
  objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("statementId"));
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    v31 = 0;
    self = v100;
    v10 = v108;
    goto LABEL_75;
  }
  objc_opt_class();
  self = v100;
  v10 = v108;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = 0;
    goto LABEL_75;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = v27;
LABEL_75:
    self = -[BMFeedbackLearningTupleInteraction initWithEventId:sessionId:absoluteTimestamp:tupleInteraction:candidateInteractions:statementId:](self, "initWithEventId:sessionId:absoluteTimestamp:tupleInteraction:candidateInteractions:statementId:", v106, v10, v114, v110, v117, v31);
    v40 = self;
  }
  else
  {
    v31 = v113;
    if (v113)
    {
      v98 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v92 = *MEMORY[0x1E0D025B8];
      v126 = *MEMORY[0x1E0CB2D50];
      v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("statementId"));
      v127 = v93;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      *v113 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v92, 2, v94);

      v31 = 0;
    }
    v40 = 0;
  }
LABEL_76:

LABEL_77:
  v9 = v103;
LABEL_78:

  v37 = v102;
  v8 = v106;
LABEL_79:

LABEL_80:
  v12 = v109;
LABEL_81:

LABEL_82:
LABEL_83:

LABEL_84:
LABEL_85:

  return v40;
}

- (id)_candidateInteractionsJSONArray
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
  -[BMFeedbackLearningTupleInteraction candidateInteractions](self, "candidateInteractions", 0);
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
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[6];
  _QWORD v28[7];

  v28[6] = *MEMORY[0x1E0C80C00];
  -[BMFeedbackLearningTupleInteraction eventId](self, "eventId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = objc_claimAutoreleasedReturnValue();

  -[BMFeedbackLearningTupleInteraction sessionId](self, "sessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = objc_claimAutoreleasedReturnValue();

  -[BMFeedbackLearningTupleInteraction absoluteTimestamp](self, "absoluteTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMFeedbackLearningTupleInteraction absoluteTimestamp](self, "absoluteTimestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  -[BMFeedbackLearningTupleInteraction tupleInteraction](self, "tupleInteraction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "jsonDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMFeedbackLearningTupleInteraction _candidateInteractionsJSONArray](self, "_candidateInteractionsJSONArray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMFeedbackLearningTupleInteraction hasStatementId](self, "hasStatementId"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMFeedbackLearningTupleInteraction statementId](self, "statementId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  v26 = (void *)v4;
  v27[0] = CFSTR("eventId");
  v15 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v23 = v15;
  v25 = (void *)v6;
  v28[0] = v15;
  v27[1] = CFSTR("sessionId");
  v16 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[1] = v16;
  v27[2] = CFSTR("absoluteTimestamp");
  v17 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[2] = v17;
  v27[3] = CFSTR("tupleInteraction");
  v18 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[3] = v18;
  v27[4] = CFSTR("candidateInteractions");
  v19 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[4] = v19;
  v27[5] = CFSTR("statementId");
  v20 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[5] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 6, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v13)
      goto LABEL_21;
  }
  else
  {

    if (v13)
    {
LABEL_21:
      if (v12)
        goto LABEL_22;
LABEL_30:

      if (v10)
        goto LABEL_23;
      goto LABEL_31;
    }
  }

  if (!v12)
    goto LABEL_30;
LABEL_22:
  if (v10)
    goto LABEL_23;
LABEL_31:

LABEL_23:
  if (!v25)

  if (!v26)
  return v21;
}

- (NSUUID)eventId
{
  NSData *raw_eventId;
  void *v3;

  raw_eventId = self->_raw_eventId;
  if (raw_eventId)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_eventId, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSUUID *)v3;
}

- (NSUUID)sessionId
{
  NSData *raw_sessionId;
  void *v3;

  raw_sessionId = self->_raw_sessionId;
  if (raw_sessionId)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_sessionId, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSUUID *)v3;
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
  BOOL v12;
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
  unsigned int v37;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMFeedbackLearningTupleInteraction eventId](self, "eventId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventId");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMFeedbackLearningTupleInteraction eventId](self, "eventId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_28;
    }
    -[BMFeedbackLearningTupleInteraction sessionId](self, "sessionId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionId");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMFeedbackLearningTupleInteraction sessionId](self, "sessionId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sessionId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_28;
    }
    -[BMFeedbackLearningTupleInteraction absoluteTimestamp](self, "absoluteTimestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMFeedbackLearningTupleInteraction absoluteTimestamp](self, "absoluteTimestamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_28;
    }
    -[BMFeedbackLearningTupleInteraction tupleInteraction](self, "tupleInteraction");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tupleInteraction");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMFeedbackLearningTupleInteraction tupleInteraction](self, "tupleInteraction");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tupleInteraction");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_28;
    }
    -[BMFeedbackLearningTupleInteraction candidateInteractions](self, "candidateInteractions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidateInteractions");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMFeedbackLearningTupleInteraction candidateInteractions](self, "candidateInteractions");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "candidateInteractions");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_28;
    }
    if (!-[BMFeedbackLearningTupleInteraction hasStatementId](self, "hasStatementId")
      && !objc_msgSend(v5, "hasStatementId"))
    {
      v12 = 1;
      goto LABEL_29;
    }
    if (-[BMFeedbackLearningTupleInteraction hasStatementId](self, "hasStatementId")
      && objc_msgSend(v5, "hasStatementId"))
    {
      v37 = -[BMFeedbackLearningTupleInteraction statementId](self, "statementId");
      v12 = v37 == objc_msgSend(v5, "statementId");
LABEL_29:

      goto LABEL_30;
    }
LABEL_28:
    v12 = 0;
    goto LABEL_29;
  }
  v12 = 0;
LABEL_30:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMFeedbackLearningTupleInteractionTupleInteraction)tupleInteraction
{
  return self->_tupleInteraction;
}

- (NSArray)candidateInteractions
{
  return self->_candidateInteractions;
}

- (unsigned)statementId
{
  return self->_statementId;
}

- (BOOL)hasStatementId
{
  return self->_hasStatementId;
}

- (void)setHasStatementId:(BOOL)a3
{
  self->_hasStatementId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateInteractions, 0);
  objc_storeStrong((id *)&self->_tupleInteraction, 0);
  objc_storeStrong((id *)&self->_raw_sessionId, 0);
  objc_storeStrong((id *)&self->_raw_eventId, 0);
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

    v4 = -[BMFeedbackLearningTupleInteraction initByReadFrom:]([BMFeedbackLearningTupleInteraction alloc], "initByReadFrom:", v7);
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
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventId"), 6, 0, 1, 14, 3);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sessionId"), 6, 0, 2, 14, 3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 3, 0, 1);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("tupleInteraction_json"), 5, 1, &__block_literal_global_186_60053);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("candidateInteractions_json"), 5, 1, &__block_literal_global_187);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("statementId"), 0, 0, 6, 4, 0);
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
  return &unk_1E5F1E9E8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventId"), 1, 14, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sessionId"), 2, 14, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 3, 0, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tupleInteraction"), 4, 14, objc_opt_class());
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("candidateInteractions"), 5, 14, objc_opt_class());
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("statementId"), 6, 4, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __45__BMFeedbackLearningTupleInteraction_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_candidateInteractionsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __45__BMFeedbackLearningTupleInteraction_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tupleInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
