@implementation BMIntelligenceEngineInteraction

- (BMIntelligenceEngineInteraction)initWithAbsoluteTimestamp:(id)a3 transcriptStatementId:(id)a4 appIntentInvocationUUID:(id)a5 sirikitIntentItemId:(id)a6 trigger:(int)a7 tupleInteraction:(id)a8 candidateInteractions:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  BMIntelligenceEngineInteraction *v19;
  double v20;
  uint64_t v21;
  NSData *raw_appIntentInvocationUUID;
  id v25;
  objc_super v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v25 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = a9;
  v26.receiver = self;
  v26.super_class = (Class)BMIntelligenceEngineInteraction;
  v19 = -[BMEventBase init](&v26, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v14)
    {
      v19->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v19->_hasRaw_absoluteTimestamp = 0;
      v20 = -1.0;
    }
    v19->_raw_absoluteTimestamp = v20;
    objc_storeStrong((id *)&v19->_transcriptStatementId, a4);
    if (v15)
    {
      v27[0] = 0;
      v27[1] = 0;
      objc_msgSend(v15, "getUUIDBytes:", v27);
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v27, 16);
      raw_appIntentInvocationUUID = v19->_raw_appIntentInvocationUUID;
      v19->_raw_appIntentInvocationUUID = (NSData *)v21;
    }
    else
    {
      raw_appIntentInvocationUUID = v19->_raw_appIntentInvocationUUID;
      v19->_raw_appIntentInvocationUUID = 0;
    }

    objc_storeStrong((id *)&v19->_sirikitIntentItemId, a6);
    v19->_trigger = a7;
    objc_storeStrong((id *)&v19->_tupleInteraction, a8);
    objc_storeStrong((id *)&v19->_candidateInteractions, a9);
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
  -[BMIntelligenceEngineInteraction absoluteTimestamp](self, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceEngineInteraction transcriptStatementId](self, "transcriptStatementId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceEngineInteraction appIntentInvocationUUID](self, "appIntentInvocationUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceEngineInteraction sirikitIntentItemId](self, "sirikitIntentItemId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMIntelligenceEngineInteractionDonationTriggerAsString(-[BMIntelligenceEngineInteraction trigger](self, "trigger"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceEngineInteraction tupleInteraction](self, "tupleInteraction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceEngineInteraction candidateInteractions](self, "candidateInteractions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMIntelligenceEngineInteraction with absoluteTimestamp: %@, transcriptStatementId: %@, appIntentInvocationUUID: %@, sirikitIntentItemId: %@, trigger: %@, tupleInteraction: %@, candidateInteractions: %@"), v4, v5, v6, v7, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMIntelligenceEngineInteraction *v5;
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
  unint64_t v22;
  double v23;
  objc_class *v24;
  uint64_t v25;
  NSData *v26;
  NSData *raw_appIntentInvocationUUID;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  NSArray *candidateInteractions;
  int v41;
  BMIntelligenceEngineInteraction *v42;
  objc_super v44;
  uint64_t v45;
  uint64_t v46;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BMIntelligenceEngineInteraction;
  v5 = -[BMEventBase init](&v44, sel_init);
  if (!v5)
  {
LABEL_57:
    v42 = v5;
    goto LABEL_58;
  }
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_55:
    v39 = objc_msgSend(v6, "copy");
    candidateInteractions = v5->_candidateInteractions;
    v5->_candidateInteractions = (NSArray *)v39;

    v41 = v4[*v9];
    if (v41)
      goto LABEL_56;
    goto LABEL_57;
  }
  v10 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v9])
      goto LABEL_55;
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
      goto LABEL_55;
    switch((v13 >> 3))
    {
      case 1u:
        v5->_hasRaw_absoluteTimestamp = 1;
        v21 = *v7;
        v22 = *(_QWORD *)&v4[v21];
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)&v4[*v8])
        {
          v23 = *(double *)(*(_QWORD *)&v4[*v10] + v22);
          *(_QWORD *)&v4[v21] = v22 + 8;
        }
        else
        {
          v4[*v9] = 1;
          v23 = 0.0;
        }
        v5->_raw_absoluteTimestamp = v23;
        goto LABEL_54;
      case 2u:
        v45 = 0;
        v46 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_60;
        v24 = -[BMIntelligenceEngineInteractionTranscriptStatementID initByReadFrom:]([BMIntelligenceEngineInteractionTranscriptStatementID alloc], "initByReadFrom:", v4);
        if (!v24)
          goto LABEL_60;
        v25 = 48;
        goto LABEL_42;
      case 3u:
        PBReaderReadData();
        v26 = (NSData *)objc_claimAutoreleasedReturnValue();
        if (-[NSData length](v26, "length") == 16)
        {
          raw_appIntentInvocationUUID = v5->_raw_appIntentInvocationUUID;
          v5->_raw_appIntentInvocationUUID = v26;
LABEL_31:

LABEL_54:
          if (*(_QWORD *)&v4[*v7] >= *(_QWORD *)&v4[*v8])
            goto LABEL_55;
          continue;
        }

LABEL_60:
LABEL_56:
        v42 = 0;
LABEL_58:

        return v42;
      case 4u:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        raw_appIntentInvocationUUID = (NSData *)v5->_sirikitIntentItemId;
        v5->_sirikitIntentItemId = (NSString *)v28;
        goto LABEL_31;
      case 5u:
        v29 = 0;
        v30 = 0;
        v31 = 0;
        while (2)
        {
          v32 = *v7;
          v33 = *(_QWORD *)&v4[v32];
          v34 = v33 + 1;
          if (v33 == -1 || v34 > *(_QWORD *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            v35 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v33);
            *(_QWORD *)&v4[v32] = v34;
            v31 |= (unint64_t)(v35 & 0x7F) << v29;
            if (v35 < 0)
            {
              v29 += 7;
              v18 = v30++ >= 9;
              if (v18)
              {
                LODWORD(v31) = 0;
                goto LABEL_49;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9])
          LODWORD(v31) = 0;
LABEL_49:
        if (v31 >= 5)
          LODWORD(v31) = 0;
        v5->_trigger = v31;
        goto LABEL_54;
      case 6u:
        v45 = 0;
        v46 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_60;
        v24 = -[BMIntelligenceEngineInteractionTupleInteraction initByReadFrom:]([BMIntelligenceEngineInteractionTupleInteraction alloc], "initByReadFrom:", v4);
        if (!v24)
          goto LABEL_60;
        v25 = 64;
LABEL_42:
        v36 = *(Class *)((char *)&v5->super.super.isa + v25);
        *(Class *)((char *)&v5->super.super.isa + v25) = v24;

        PBReaderRecallMark();
        goto LABEL_54;
      case 7u:
        v45 = 0;
        v46 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_60;
        v37 = -[BMIntelligenceEngineInteractionCandidateInteraction initByReadFrom:]([BMIntelligenceEngineInteractionCandidateInteraction alloc], "initByReadFrom:", v4);
        if (!v37)
          goto LABEL_60;
        v38 = v37;
        objc_msgSend(v6, "addObject:", v37);
        PBReaderRecallMark();

        goto LABEL_54;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          goto LABEL_60;
        goto LABEL_54;
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
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_transcriptStatementId)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMIntelligenceEngineInteractionTranscriptStatementID writeTo:](self->_transcriptStatementId, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_raw_appIntentInvocationUUID)
    PBDataWriterWriteDataField();
  if (self->_sirikitIntentItemId)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_tupleInteraction)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMIntelligenceEngineInteractionTupleInteraction writeTo:](self->_tupleInteraction, "writeTo:", v4);
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

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMIntelligenceEngineInteraction writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMIntelligenceEngineInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4
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
  id *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  id v24;
  id v25;
  void *v26;
  BMIntelligenceEngineInteraction *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  BMIntelligenceEngineInteractionCandidateInteraction *v68;
  BMIntelligenceEngineInteractionCandidateInteraction *v69;
  id v70;
  id *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  id *v75;
  uint64_t *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  id v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  id v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  id v99;
  id v100;
  id *v101;
  id *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  BMIntelligenceEngineInteractionTupleInteraction *v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  id v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  BMIntelligenceEngineInteractionTranscriptStatementID *v121;
  id v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  id v128;
  id v129;
  uint64_t v130;
  id v131;
  uint64_t v132;
  id v133;
  _BYTE v134[128];
  uint64_t v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  id v140;
  uint64_t v141;
  id v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  BMIntelligenceEngineInteractionTranscriptStatementID *v148;
  uint64_t v149;
  _QWORD v150[3];

  v150[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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

      v13 = (id)objc_msgSend(v10, "initWithTimeIntervalSinceReferenceDate:", v12);
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
        if (!a4)
        {
          v7 = 0;
          v27 = 0;
          goto LABEL_94;
        }
        v91 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v92 = v5;
        v93 = *MEMORY[0x1E0D025B8];
        v149 = *MEMORY[0x1E0CB2D50];
        v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
        v150[0] = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v150, &v149, 1);
        v94 = objc_claimAutoreleasedReturnValue();
        v95 = v93;
        v5 = v92;
        v121 = (BMIntelligenceEngineInteractionTranscriptStatementID *)v94;
        v7 = 0;
        v27 = 0;
        *a4 = (id)objc_msgSend(v91, "initWithDomain:code:userInfo:", v95, 2);
        goto LABEL_92;
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
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transcriptStatementId"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v121 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = v15;
    v129 = 0;
    v121 = -[BMIntelligenceEngineInteractionTranscriptStatementID initWithJSONDictionary:error:]([BMIntelligenceEngineInteractionTranscriptStatementID alloc], "initWithJSONDictionary:error:", v24, &v129);
    v25 = v129;
    if (v25)
    {
      v26 = v25;
      if (a4)
        *a4 = objc_retainAutorelease(v25);

      v27 = 0;
      goto LABEL_92;
    }

LABEL_12:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("appIntentInvocationUUID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v27 = 0;
          goto LABEL_91;
        }
        v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v40 = a4;
        v41 = v7;
        v42 = v15;
        v43 = *MEMORY[0x1E0D025B8];
        v143 = *MEMORY[0x1E0CB2D50];
        v44 = v40;
        v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("appIntentInvocationUUID"));
        v144 = v45;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1);
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = v43;
        v15 = v42;
        v7 = v41;
        v48 = (void *)v46;
        v27 = 0;
        *v44 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v47, 2, v46);
        goto LABEL_89;
      }
      v117 = v7;
      v28 = v16;
      v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v28);
      if (!v29)
      {
        if (!a4)
        {
          v27 = 0;
          v45 = v28;
          v7 = v117;
          goto LABEL_90;
        }
        v86 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v102 = a4;
        v87 = v15;
        v88 = *MEMORY[0x1E0D025B8];
        v145 = *MEMORY[0x1E0CB2D50];
        v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("appIntentInvocationUUID"));
        v146 = v48;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = v88;
        v15 = v87;
        *v102 = (id)objc_msgSend(v86, "initWithDomain:code:userInfo:", v90, 2, v89);

        v27 = 0;
        v45 = v28;
        v7 = v117;
LABEL_89:

LABEL_90:
LABEL_91:

        v24 = v15;
        goto LABEL_92;
      }
      v30 = v29;
      v111 = v6;
      v17 = a4;

      v115 = (void *)v30;
      v7 = v117;
    }
    else
    {
      v111 = v6;
      v17 = a4;
      v115 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sirikitIntentItemId"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v17)
        {
          v114 = 0;
          v27 = 0;
          v45 = v115;
          v6 = v111;
          goto LABEL_88;
        }
        v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v119 = v7;
        v50 = v15;
        v51 = *MEMORY[0x1E0D025B8];
        v141 = *MEMORY[0x1E0CB2D50];
        v112 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sirikitIntentItemId"));
        v142 = v112;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1);
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = v51;
        v15 = v50;
        v7 = v119;
        v114 = 0;
        v27 = 0;
        *v17 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v53, 2, v52);
        v19 = (void *)v52;
        goto LABEL_111;
      }
      v114 = v18;
    }
    else
    {
      v114 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trigger"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v16;
    if (!v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v112 = 0;
      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v112 = v19;
      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMIntelligenceEngineInteractionDonationTriggerFromString(v19));
      v112 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tupleInteraction"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = v19;
      if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v104 = v20;
        v105 = v15;
        v107 = 0;
LABEL_24:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("candidateInteractions"));
        v21 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqual:", v22);

        v116 = v7;
        if (v23)
        {
          v101 = v17;
          v103 = v18;

          v21 = 0;
LABEL_59:
          v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v21, "count"));
          v124 = 0u;
          v125 = 0u;
          v126 = 0u;
          v127 = 0u;
          v21 = v21;
          v62 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v124, v134, 16);
          if (!v62)
            goto LABEL_69;
          v63 = v62;
          v64 = *(_QWORD *)v125;
          v100 = v5;
LABEL_61:
          v65 = 0;
          while (1)
          {
            if (*(_QWORD *)v125 != v64)
              objc_enumerationMutation(v21);
            v66 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * v65);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v5 = v100;
              v71 = v101;
              v6 = v111;
              v18 = v103;
              if (!v101)
                goto LABEL_81;
              v99 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v72 = v111;
              v73 = *MEMORY[0x1E0D025B8];
              v130 = *MEMORY[0x1E0CB2D50];
              v67 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("candidateInteractions"));
              v131 = v67;
              v74 = (void *)MEMORY[0x1E0C99D80];
              v75 = &v131;
              v76 = &v130;
              goto LABEL_74;
            }
            v67 = v66;
            v68 = [BMIntelligenceEngineInteractionCandidateInteraction alloc];
            v123 = 0;
            v69 = -[BMIntelligenceEngineInteractionCandidateInteraction initWithJSONDictionary:error:](v68, "initWithJSONDictionary:error:", v67, &v123);
            v70 = v123;
            if (v70)
            {
              v77 = v70;
              if (v101)
                *v101 = objc_retainAutorelease(v70);

              v5 = v100;
              v6 = v111;
              v79 = v116;
              v18 = v103;
LABEL_80:

              v7 = v79;
LABEL_81:

              v27 = 0;
              goto LABEL_82;
            }
            objc_msgSend(v61, "addObject:", v69);

            if (v63 == ++v65)
            {
              v63 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v124, v134, 16);
              v5 = v100;
              if (v63)
                goto LABEL_61;
LABEL_69:

              v38 = v107;
              v27 = -[BMIntelligenceEngineInteraction initWithAbsoluteTimestamp:transcriptStatementId:appIntentInvocationUUID:sirikitIntentItemId:trigger:tupleInteraction:candidateInteractions:](self, "initWithAbsoluteTimestamp:transcriptStatementId:appIntentInvocationUUID:sirikitIntentItemId:trigger:tupleInteraction:candidateInteractions:", v7, v121, v115, v114, objc_msgSend(v112, "intValue"), v107, v61);
              self = v27;
              v6 = v111;
              v18 = v103;
LABEL_83:

              v19 = v109;
              v35 = v104;
              goto LABEL_84;
            }
          }
          v5 = v100;
          v71 = v101;
          v6 = v111;
          v18 = v103;
          if (!v101)
            goto LABEL_81;
          v99 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v72 = v111;
          v73 = *MEMORY[0x1E0D025B8];
          v132 = *MEMORY[0x1E0CB2D50];
          v67 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("candidateInteractions"));
          v133 = v67;
          v74 = (void *)MEMORY[0x1E0C99D80];
          v75 = &v133;
          v76 = &v132;
LABEL_74:
          objc_msgSend(v74, "dictionaryWithObjects:forKeys:count:", v75, v76, 1);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = v73;
          v6 = v72;
          v16 = v110;
          v79 = v116;
          *v71 = (id)objc_msgSend(v99, "initWithDomain:code:userInfo:", v78, 2, v77);
          goto LABEL_80;
        }
        if (!v21)
        {
          v101 = v17;
          v103 = v18;
          goto LABEL_59;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v101 = v17;
          v103 = v18;
          goto LABEL_59;
        }
        if (v17)
        {
          v81 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v82 = *MEMORY[0x1E0D025B8];
          v135 = *MEMORY[0x1E0CB2D50];
          v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("candidateInteractions"));
          v136 = v61;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
          v83 = v18;
          v84 = v7;
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          *v17 = (id)objc_msgSend(v81, "initWithDomain:code:userInfo:", v82, 2, v85);

          v7 = v84;
          v18 = v83;
          v27 = 0;
          v6 = v111;
LABEL_82:
          v38 = v107;
          goto LABEL_83;
        }
        v27 = 0;
        v35 = v104;
        v6 = v111;
        v38 = v107;
LABEL_84:

        v15 = v105;
        goto LABEL_85;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = v20;
        v128 = 0;
        v107 = -[BMIntelligenceEngineInteractionTupleInteraction initWithJSONDictionary:error:]([BMIntelligenceEngineInteractionTupleInteraction alloc], "initWithJSONDictionary:error:", v35, &v128);
        v36 = v128;
        if (!v36)
        {
          v104 = v20;
          v105 = v15;

          goto LABEL_24;
        }
        v37 = v36;
        if (v17)
          *v17 = objc_retainAutorelease(v36);

        v27 = 0;
        v6 = v111;
        v38 = v107;
      }
      else
      {
        if (!v17)
        {
          v27 = 0;
          v6 = v111;
          goto LABEL_86;
        }
        v108 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v120 = v7;
        v54 = v15;
        v55 = *MEMORY[0x1E0D025B8];
        v137 = *MEMORY[0x1E0CB2D50];
        v56 = v18;
        v57 = v17;
        v58 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("tupleInteraction"));
        v138 = v58;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v55;
        v15 = v54;
        v7 = v120;
        *v57 = (id)objc_msgSend(v108, "initWithDomain:code:userInfo:", v60, 2, v59);
        v18 = v56;
        v16 = v110;

        v27 = 0;
        v35 = v20;
        v38 = (void *)v58;
        v6 = v111;
      }
LABEL_85:

      v20 = v35;
LABEL_86:

      v45 = v115;
LABEL_87:

LABEL_88:
      v48 = v114;
      goto LABEL_89;
    }
    if (v17)
    {
      v113 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v106 = v15;
      v96 = *MEMORY[0x1E0D025B8];
      v139 = *MEMORY[0x1E0CB2D50];
      v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("trigger"));
      v140 = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v96;
      v15 = v106;
      v98 = (id)objc_msgSend(v113, "initWithDomain:code:userInfo:", v97, 2, v38);
      v112 = 0;
      v27 = 0;
      *v17 = v98;
      v6 = v111;
      goto LABEL_85;
    }
    v112 = 0;
    v27 = 0;
LABEL_111:
    v45 = v115;
    v6 = v111;
    goto LABEL_87;
  }
  if (a4)
  {
    v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v118 = v7;
    v32 = v15;
    v33 = *MEMORY[0x1E0D025B8];
    v147 = *MEMORY[0x1E0CB2D50];
    v121 = (BMIntelligenceEngineInteractionTranscriptStatementID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("transcriptStatementId"));
    v148 = v121;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v33, 2, v34);

    v27 = 0;
    v24 = v32;
    v7 = v118;
LABEL_92:

    v15 = v24;
    goto LABEL_93;
  }
  v27 = 0;
LABEL_93:

LABEL_94:
  return v27;
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
  -[BMIntelligenceEngineInteraction candidateInteractions](self, "candidateInteractions", 0);
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
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[7];
  _QWORD v31[9];

  v31[7] = *MEMORY[0x1E0C80C00];
  -[BMIntelligenceEngineInteraction absoluteTimestamp](self, "absoluteTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMIntelligenceEngineInteraction absoluteTimestamp](self, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMIntelligenceEngineInteraction transcriptStatementId](self, "transcriptStatementId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jsonDictionary");
  v8 = objc_claimAutoreleasedReturnValue();

  -[BMIntelligenceEngineInteraction appIntentInvocationUUID](self, "appIntentInvocationUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMIntelligenceEngineInteraction sirikitIntentItemId](self, "sirikitIntentItemId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMIntelligenceEngineInteraction trigger](self, "trigger"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceEngineInteraction tupleInteraction](self, "tupleInteraction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "jsonDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMIntelligenceEngineInteraction _candidateInteractionsJSONArray](self, "_candidateInteractionsJSONArray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = CFSTR("absoluteTimestamp");
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v15;
  v31[0] = v15;
  v30[1] = CFSTR("transcriptStatementId");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v16;
  v31[1] = v16;
  v30[2] = CFSTR("appIntentInvocationUUID");
  v17 = (uint64_t)v29;
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v31[2] = v17;
  v30[3] = CFSTR("sirikitIntentItemId");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v17;
  v28 = (void *)v6;
  v31[3] = v18;
  v30[4] = CFSTR("trigger");
  v19 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v8;
  v31[4] = v19;
  v30[5] = CFSTR("tupleInteraction");
  v21 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[5] = v21;
  v30[6] = CFSTR("candidateInteractions");
  v22 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[6] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v13)
      goto LABEL_20;
LABEL_28:

    if (v11)
      goto LABEL_21;
    goto LABEL_29;
  }

  if (!v13)
    goto LABEL_28;
LABEL_20:
  if (v11)
    goto LABEL_21;
LABEL_29:

LABEL_21:
  if (!v10)

  if (v29)
  {
    if (v20)
      goto LABEL_25;
LABEL_31:

    if (v28)
      goto LABEL_26;
LABEL_32:

    goto LABEL_26;
  }

  if (!v20)
    goto LABEL_31;
LABEL_25:
  if (!v28)
    goto LABEL_32;
LABEL_26:

  return v23;
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

- (NSUUID)appIntentInvocationUUID
{
  NSData *raw_appIntentInvocationUUID;
  void *v3;

  raw_appIntentInvocationUUID = self->_raw_appIntentInvocationUUID;
  if (raw_appIntentInvocationUUID)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_appIntentInvocationUUID, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSUUID *)v3;
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
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMIntelligenceEngineInteraction absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMIntelligenceEngineInteraction absoluteTimestamp](self, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_22;
    }
    -[BMIntelligenceEngineInteraction transcriptStatementId](self, "transcriptStatementId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transcriptStatementId");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMIntelligenceEngineInteraction transcriptStatementId](self, "transcriptStatementId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transcriptStatementId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_22;
    }
    -[BMIntelligenceEngineInteraction appIntentInvocationUUID](self, "appIntentInvocationUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appIntentInvocationUUID");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMIntelligenceEngineInteraction appIntentInvocationUUID](self, "appIntentInvocationUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appIntentInvocationUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_22;
    }
    -[BMIntelligenceEngineInteraction sirikitIntentItemId](self, "sirikitIntentItemId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sirikitIntentItemId");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMIntelligenceEngineInteraction sirikitIntentItemId](self, "sirikitIntentItemId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sirikitIntentItemId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_22;
    }
    v31 = -[BMIntelligenceEngineInteraction trigger](self, "trigger");
    if (v31 == objc_msgSend(v5, "trigger"))
    {
      -[BMIntelligenceEngineInteraction tupleInteraction](self, "tupleInteraction");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tupleInteraction");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v32 == (void *)v33)
      {

      }
      else
      {
        v34 = (void *)v33;
        -[BMIntelligenceEngineInteraction tupleInteraction](self, "tupleInteraction");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "tupleInteraction");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqual:", v36);

        if (!v37)
          goto LABEL_22;
      }
      -[BMIntelligenceEngineInteraction candidateInteractions](self, "candidateInteractions");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "candidateInteractions");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39 == v40)
      {
        v12 = 1;
      }
      else
      {
        -[BMIntelligenceEngineInteraction candidateInteractions](self, "candidateInteractions");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "candidateInteractions");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v41, "isEqual:", v42);

      }
      goto LABEL_23;
    }
LABEL_22:
    v12 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v12 = 0;
LABEL_24:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMIntelligenceEngineInteractionTranscriptStatementID)transcriptStatementId
{
  return self->_transcriptStatementId;
}

- (NSString)sirikitIntentItemId
{
  return self->_sirikitIntentItemId;
}

- (int)trigger
{
  return self->_trigger;
}

- (BMIntelligenceEngineInteractionTupleInteraction)tupleInteraction
{
  return self->_tupleInteraction;
}

- (NSArray)candidateInteractions
{
  return self->_candidateInteractions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateInteractions, 0);
  objc_storeStrong((id *)&self->_tupleInteraction, 0);
  objc_storeStrong((id *)&self->_sirikitIntentItemId, 0);
  objc_storeStrong((id *)&self->_transcriptStatementId, 0);
  objc_storeStrong((id *)&self->_raw_appIntentInvocationUUID, 0);
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

    v4 = -[BMIntelligenceEngineInteraction initByReadFrom:]([BMIntelligenceEngineInteraction alloc], "initByReadFrom:", v7);
    v4[10] = 0;

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
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 1, 0, 1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("transcriptStatementId_json"), 5, 1, &__block_literal_global_252_26626);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appIntentInvocationUUID"), 6, 0, 3, 14, 3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sirikitIntentItemId"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("trigger"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("tupleInteraction_json"), 5, 1, &__block_literal_global_253);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("candidateInteractions_json"), 5, 1, &__block_literal_global_254);
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C0F0;
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
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 1, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("transcriptStatementId"), 2, 14, objc_opt_class(), v2);
  v11[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appIntentInvocationUUID"), 3, 14, 0);
  v11[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sirikitIntentItemId"), 4, 13, 0);
  v11[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("trigger"), 5, 4, 0);
  v11[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tupleInteraction"), 6, 14, objc_opt_class());
  v11[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("candidateInteractions"), 7, 14, objc_opt_class());
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __42__BMIntelligenceEngineInteraction_columns__block_invoke_3(uint64_t a1, void *a2)
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

id __42__BMIntelligenceEngineInteraction_columns__block_invoke_2(uint64_t a1, void *a2)
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

id __42__BMIntelligenceEngineInteraction_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transcriptStatementId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
