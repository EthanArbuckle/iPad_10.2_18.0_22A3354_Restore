@implementation BMEvaluationCommonMetadata

- (BMEvaluationCommonMetadata)initWithFeatureDomain:(id)a3 bundleId:(id)a4 evaluationUuid:(id)a5 isHighPriority:(id)a6 diagnostics:(id)a7 prefilledQuestions:(id)a8 auxiliaryAttributes:(id)a9 systemBuild:(id)a10 modelVersion:(id)a11
{
  id v18;
  id v19;
  BMEvaluationCommonMetadata *v20;
  uint64_t v21;
  NSData *raw_evaluationUuid;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v29 = a4;
  v18 = a5;
  v19 = a6;
  v28 = a7;
  v27 = a8;
  v26 = a9;
  v25 = a10;
  v24 = a11;
  v31.receiver = self;
  v31.super_class = (Class)BMEvaluationCommonMetadata;
  v20 = -[BMEventBase init](&v31, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v20->_featureDomain, a3);
    objc_storeStrong((id *)&v20->_bundleId, a4);
    if (v18)
    {
      v32[0] = 0;
      v32[1] = 0;
      objc_msgSend(v18, "getUUIDBytes:", v32);
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v32, 16);
      raw_evaluationUuid = v20->_raw_evaluationUuid;
      v20->_raw_evaluationUuid = (NSData *)v21;
    }
    else
    {
      raw_evaluationUuid = v20->_raw_evaluationUuid;
      v20->_raw_evaluationUuid = 0;
    }

    if (v19)
    {
      v20->_hasIsHighPriority = 1;
      v20->_isHighPriority = objc_msgSend(v19, "BOOLValue");
    }
    else
    {
      v20->_hasIsHighPriority = 0;
      v20->_isHighPriority = 0;
    }
    objc_storeStrong((id *)&v20->_diagnostics, a7);
    objc_storeStrong((id *)&v20->_prefilledQuestions, a8);
    objc_storeStrong((id *)&v20->_auxiliaryAttributes, a9);
    objc_storeStrong((id *)&v20->_systemBuild, a10);
    objc_storeStrong((id *)&v20->_modelVersion, a11);
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
  -[BMEvaluationCommonMetadata featureDomain](self, "featureDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMEvaluationCommonMetadata bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMEvaluationCommonMetadata evaluationUuid](self, "evaluationUuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMEvaluationCommonMetadata isHighPriority](self, "isHighPriority"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMEvaluationCommonMetadata diagnostics](self, "diagnostics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMEvaluationCommonMetadata prefilledQuestions](self, "prefilledQuestions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMEvaluationCommonMetadata auxiliaryAttributes](self, "auxiliaryAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMEvaluationCommonMetadata systemBuild](self, "systemBuild");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMEvaluationCommonMetadata modelVersion](self, "modelVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMEvaluationCommonMetadata with featureDomain: %@, bundleId: %@, evaluationUuid: %@, isHighPriority: %@, diagnostics: %@, prefilledQuestions: %@, auxiliaryAttributes: %@, systemBuild: %@, modelVersion: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMEvaluationCommonMetadata *v5;
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
  NSData *v23;
  NSData *raw_evaluationUuid;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  id v32;
  void *v33;
  BMCustomAttributes *v34;
  BMCustomAttributes *auxiliaryAttributes;
  uint64_t v36;
  NSArray *prefilledQuestions;
  int v38;
  BMEvaluationCommonMetadata *v39;
  objc_super v41;
  uint64_t v42;
  uint64_t v43;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMEvaluationCommonMetadata;
  v5 = -[BMEventBase init](&v41, sel_init);
  if (!v5)
  {
LABEL_52:
    v39 = v5;
    goto LABEL_53;
  }
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_50:
    v36 = objc_msgSend(v6, "copy");
    prefilledQuestions = v5->_prefilledQuestions;
    v5->_prefilledQuestions = (NSArray *)v36;

    v38 = v4[*v9];
    if (v38)
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
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 32;
        goto LABEL_40;
      case 2u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 40;
        goto LABEL_40;
      case 3u:
        PBReaderReadData();
        v23 = (NSData *)objc_claimAutoreleasedReturnValue();
        if (-[NSData length](v23, "length") == 16)
        {
          raw_evaluationUuid = v5->_raw_evaluationUuid;
          v5->_raw_evaluationUuid = v23;
LABEL_41:

LABEL_42:
          if (*(_QWORD *)&v4[*v7] >= *(_QWORD *)&v4[*v8])
            goto LABEL_50;
          continue;
        }

LABEL_55:
LABEL_51:
        v39 = 0;
LABEL_53:

        return v39;
      case 4u:
        v25 = 0;
        v26 = 0;
        v27 = 0;
        v5->_hasIsHighPriority = 1;
        while (2)
        {
          v28 = *v7;
          v29 = *(_QWORD *)&v4[v28];
          v30 = v29 + 1;
          if (v29 == -1 || v30 > *(_QWORD *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            v31 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v29);
            *(_QWORD *)&v4[v28] = v30;
            v27 |= (unint64_t)(v31 & 0x7F) << v25;
            if (v31 < 0)
            {
              v25 += 7;
              v18 = v26++ >= 9;
              if (v18)
              {
                v27 = 0;
                goto LABEL_49;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9])
          v27 = 0;
LABEL_49:
        v5->_isHighPriority = v27 != 0;
        goto LABEL_42;
      case 5u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 48;
        goto LABEL_40;
      case 6u:
        v42 = 0;
        v43 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_55;
        v32 = -[BMEvaluationCommonMetadataQuestionAnswer initByReadFrom:]([BMEvaluationCommonMetadataQuestionAnswer alloc], "initByReadFrom:", v4);
        if (!v32)
          goto LABEL_55;
        v33 = v32;
        objc_msgSend(v6, "addObject:", v32);
        PBReaderRecallMark();

        goto LABEL_42;
      case 7u:
        v42 = 0;
        v43 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_55;
        v34 = -[BMCustomAttributes initByReadFrom:]([BMCustomAttributes alloc], "initByReadFrom:", v4);
        if (!v34)
          goto LABEL_55;
        auxiliaryAttributes = v5->_auxiliaryAttributes;
        v5->_auxiliaryAttributes = v34;

        PBReaderRecallMark();
        goto LABEL_42;
      case 8u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 72;
        goto LABEL_40;
      case 9u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 80;
LABEL_40:
        raw_evaluationUuid = *(NSData **)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;
        goto LABEL_41;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          goto LABEL_55;
        goto LABEL_42;
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
  if (self->_featureDomain)
    PBDataWriterWriteStringField();
  if (self->_bundleId)
    PBDataWriterWriteStringField();
  if (self->_raw_evaluationUuid)
    PBDataWriterWriteDataField();
  if (self->_hasIsHighPriority)
    PBDataWriterWriteBOOLField();
  if (self->_diagnostics)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_prefilledQuestions;
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

  if (self->_auxiliaryAttributes)
  {
    PBDataWriterPlaceMark();
    -[BMCustomAttributes writeTo:](self->_auxiliaryAttributes, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_systemBuild)
    PBDataWriterWriteStringField();
  if (self->_modelVersion)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMEvaluationCommonMetadata writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMEvaluationCommonMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BMCustomAttributes *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  BMCustomAttributes *v26;
  BMEvaluationCommonMetadataQuestionAnswer *v27;
  BMEvaluationCommonMetadataQuestionAnswer *v28;
  BMCustomAttributes *v29;
  id v30;
  uint64_t v31;
  BMEvaluationCommonMetadata *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  BMEvaluationCommonMetadata *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  id *v74;
  id v75;
  uint64_t v76;
  void *v77;
  BMCustomAttributes **v78;
  uint64_t *v79;
  BMCustomAttributes *v80;
  id v81;
  id v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  void *v88;
  id v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  uint64_t v94;
  BMCustomAttributes *v95;
  BMCustomAttributes *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  uint64_t v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  id v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  BMCustomAttributes *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  id v121;
  void *v122;
  id v123;
  id v124;
  BMEvaluationCommonMetadata *v125;
  BMEvaluationCommonMetadata *v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  void *v135;
  void *v136;
  id v137;
  id v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  id v146;
  uint64_t v147;
  BMCustomAttributes *v148;
  uint64_t v149;
  BMCustomAttributes *v150;
  uint64_t v151;
  BMCustomAttributes *v152;
  _BYTE v153[128];
  uint64_t v154;
  void *v155;
  uint64_t v156;
  BMCustomAttributes *v157;
  uint64_t v158;
  id v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  _QWORD v167[3];

  v167[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("featureDomain"));
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
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v132 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v132 = v8;
LABEL_7:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("evaluationUuid"));
      v9 = objc_claimAutoreleasedReturnValue();
      v133 = (void *)v9;
      if (!v9 || (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v131 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v39 = 0;
          v35 = v132;
LABEL_107:

          goto LABEL_108;
        }
        v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v47 = v8;
        v48 = *MEMORY[0x1E0D025B8];
        v160 = *MEMORY[0x1E0CB2D50];
        v49 = v7;
        v50 = objc_alloc(MEMORY[0x1E0CB3940]);
        v113 = objc_opt_class();
        v51 = v50;
        v7 = v49;
        v52 = objc_msgSend(v51, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v113, CFSTR("evaluationUuid"));
        v161 = v52;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v161, &v160, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v48;
        v8 = v47;
        v43 = (void *)v52;
        *a4 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v54, 2, v53);

        v39 = 0;
        v35 = v132;
LABEL_106:

        goto LABEL_107;
      }
      v126 = self;
      v18 = v10;
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v18);
      if (v19)
      {
        v20 = v19;

        v131 = (void *)v20;
        self = v126;
LABEL_10:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isHighPriority"));
        v11 = objc_claimAutoreleasedReturnValue();
        v130 = (void *)v11;
        if (!v11 || (v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v124 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v124 = v12;
LABEL_13:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("diagnostics"));
          v13 = objc_claimAutoreleasedReturnValue();
          v128 = (void *)v13;
          if (v13 && (v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a4)
              {
                v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v66 = v7;
                v67 = *MEMORY[0x1E0D025B8];
                v156 = *MEMORY[0x1E0CB2D50];
                v68 = v8;
                v69 = objc_alloc(MEMORY[0x1E0CB3940]);
                v115 = objc_opt_class();
                v70 = v69;
                v8 = v68;
                v15 = (BMCustomAttributes *)objc_msgSend(v70, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v115, CFSTR("diagnostics"));
                v157 = v15;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v157, &v156, 1);
                v71 = objc_claimAutoreleasedReturnValue();
                v72 = v67;
                v7 = v66;
                v136 = (void *)v71;
                v73 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v72, 2);
                v39 = 0;
                v129 = 0;
                *a4 = v73;
                v43 = v131;
                v35 = v132;

                goto LABEL_102;
              }
              v129 = 0;
              v39 = 0;
              v43 = v131;
              v35 = v132;
              goto LABEL_103;
            }
            v122 = v8;
            v129 = v14;
          }
          else
          {
            v122 = v8;
            v129 = 0;
          }
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("prefilledQuestions"));
          v15 = (BMCustomAttributes *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[BMCustomAttributes isEqual:](v15, "isEqual:", v16);

          if (v17)
          {
            v118 = v6;
            v120 = v5;
            v125 = self;

            v15 = 0;
          }
          else
          {
            if (v15)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (a4)
                {
                  v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v83 = v7;
                  v84 = *MEMORY[0x1E0D025B8];
                  v154 = *MEMORY[0x1E0CB2D50];
                  v135 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("prefilledQuestions"));
                  v155 = v135;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1);
                  v26 = (BMCustomAttributes *)objc_claimAutoreleasedReturnValue();
                  v85 = v84;
                  v7 = v83;
                  v86 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v85, 2, v26);
                  v39 = 0;
                  *a4 = v86;
                  goto LABEL_68;
                }
                v39 = 0;
                v8 = v122;
                v43 = v131;
                v35 = v132;
                goto LABEL_102;
              }
            }
            v118 = v6;
            v120 = v5;
            v125 = self;
          }
          v135 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[BMCustomAttributes count](v15, "count"));
          v139 = 0u;
          v140 = 0u;
          v141 = 0u;
          v142 = 0u;
          v15 = v15;
          v21 = -[BMCustomAttributes countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v139, v153, 16);
          v121 = v7;
          if (!v21)
            goto LABEL_38;
          v22 = v21;
          v23 = *(_QWORD *)v140;
LABEL_30:
          v24 = 0;
          while (1)
          {
            if (*(_QWORD *)v140 != v23)
              objc_enumerationMutation(v15);
            v25 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * v24);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v74 = a4;
              if (a4)
              {
                v75 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v76 = *MEMORY[0x1E0D025B8];
                v149 = *MEMORY[0x1E0CB2D50];
                v26 = (BMCustomAttributes *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("prefilledQuestions"));
                v150 = v26;
                v77 = (void *)MEMORY[0x1E0C99D80];
                v78 = &v150;
                v79 = &v149;
                goto LABEL_59;
              }
              goto LABEL_67;
            }
            v26 = v25;
            v27 = [BMEvaluationCommonMetadataQuestionAnswer alloc];
            v138 = 0;
            v28 = -[BMEvaluationCommonMetadataQuestionAnswer initWithJSONDictionary:error:](v27, "initWithJSONDictionary:error:", v26, &v138);
            v29 = (BMCustomAttributes *)v138;
            if (v29)
            {
              v80 = v29;
              v8 = v122;
              v43 = v131;
              v35 = v132;
              if (a4)
                *a4 = objc_retainAutorelease(v29);

              v39 = 0;
              v117 = v15;
              v6 = v118;
              v5 = v120;
              self = v125;
LABEL_99:

              v7 = v121;
              v26 = v117;
              goto LABEL_100;
            }
            objc_msgSend(v135, "addObject:", v28);

            if (v22 == ++v24)
            {
              v22 = -[BMCustomAttributes countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v139, v153, 16);
              v7 = v121;
              if (v22)
                goto LABEL_30;
LABEL_38:

              v5 = v120;
              objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("auxiliaryAttributes"));
              v26 = (BMCustomAttributes *)objc_claimAutoreleasedReturnValue();
              if (!v26)
              {
                v117 = 0;
                self = v125;
                v6 = v118;
                goto LABEL_71;
              }
              objc_opt_class();
              self = v125;
              v6 = v118;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v117 = v26;
                v26 = 0;
                goto LABEL_71;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v80 = v26;
                v95 = [BMCustomAttributes alloc];
                v137 = 0;
                v96 = v26;
                v26 = -[BMCustomAttributes initWithJSONDictionary:error:](v95, "initWithJSONDictionary:error:", v80, &v137);
                v97 = v137;
                v8 = v122;
                if (v97)
                {
                  v98 = v97;
                  v43 = v131;
                  v35 = v132;
                  if (a4)
                    *a4 = objc_retainAutorelease(v97);

                  v39 = 0;
                  v117 = v80;
                  goto LABEL_99;
                }
                v117 = v96;

LABEL_71:
                objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("systemBuild"));
                v87 = objc_claimAutoreleasedReturnValue();
                v127 = (void *)v87;
                if (!v87)
                {
                  v80 = 0;
                  v8 = v122;
                  goto LABEL_88;
                }
                v88 = (void *)v87;
                objc_opt_class();
                v8 = v122;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v80 = 0;
                  goto LABEL_88;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v80 = v88;
LABEL_88:
                  objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("modelVersion"));
                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v99)
                  {
                    v101 = v8;
                    v102 = v6;
                    v103 = 0;
                    v100 = 0;
                    goto LABEL_95;
                  }
                  objc_opt_class();
                  v100 = v99;
                  v101 = v8;
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v102 = v6;
                    v103 = 0;
                    goto LABEL_95;
                  }
                  objc_opt_class();
                  v102 = v6;
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v103 = v99;
LABEL_95:
                    self = -[BMEvaluationCommonMetadata initWithFeatureDomain:bundleId:evaluationUuid:isHighPriority:diagnostics:prefilledQuestions:auxiliaryAttributes:systemBuild:modelVersion:](self, "initWithFeatureDomain:bundleId:evaluationUuid:isHighPriority:diagnostics:prefilledQuestions:auxiliaryAttributes:systemBuild:modelVersion:", v121, v132, v131, v124, v129, v135, v26, v80, v103);
                    v39 = self;
                  }
                  else
                  {
                    if (a4)
                    {
                      v123 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v119 = *MEMORY[0x1E0D025B8];
                      v143 = *MEMORY[0x1E0CB2D50];
                      v110 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("modelVersion"));
                      v144 = v110;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1);
                      v111 = (void *)objc_claimAutoreleasedReturnValue();
                      *a4 = (id)objc_msgSend(v123, "initWithDomain:code:userInfo:", v119, 2, v111);

                    }
                    v103 = 0;
                    v39 = 0;
                  }
LABEL_96:

                  v6 = v102;
                  v8 = v101;
                }
                else
                {
                  if (a4)
                  {
                    v101 = v122;
                    v102 = v6;
                    v107 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v108 = *MEMORY[0x1E0D025B8];
                    v145 = *MEMORY[0x1E0CB2D50];
                    v103 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("systemBuild"));
                    v146 = v103;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1);
                    v100 = (void *)objc_claimAutoreleasedReturnValue();
                    v109 = (id)objc_msgSend(v107, "initWithDomain:code:userInfo:", v108, 2, v100);
                    v39 = 0;
                    v80 = 0;
                    *a4 = v109;
                    goto LABEL_96;
                  }
                  v39 = 0;
                  v80 = 0;
                }

LABEL_98:
                v43 = v131;
                v35 = v132;
                goto LABEL_99;
              }
              if (a4)
              {
                v116 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v105 = *MEMORY[0x1E0D025B8];
                v147 = *MEMORY[0x1E0CB2D50];
                v117 = v26;
                v26 = (BMCustomAttributes *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("auxiliaryAttributes"));
                v148 = v26;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
                v80 = (BMCustomAttributes *)objc_claimAutoreleasedReturnValue();
                v106 = v105;
                v6 = v118;
                v39 = 0;
                *a4 = (id)objc_msgSend(v116, "initWithDomain:code:userInfo:", v106, 2, v80);
LABEL_60:
                v8 = v122;
                goto LABEL_98;
              }
              v39 = 0;
LABEL_68:
              v8 = v122;
              v43 = v131;
              v35 = v132;
LABEL_100:

LABEL_102:
LABEL_103:
              v64 = v124;
LABEL_104:

              goto LABEL_105;
            }
          }
          v74 = a4;
          if (a4)
          {
            v75 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v76 = *MEMORY[0x1E0D025B8];
            v151 = *MEMORY[0x1E0CB2D50];
            v26 = (BMCustomAttributes *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("prefilledQuestions"));
            v152 = v26;
            v77 = (void *)MEMORY[0x1E0C99D80];
            v78 = &v152;
            v79 = &v151;
LABEL_59:
            objc_msgSend(v77, "dictionaryWithObjects:forKeys:count:", v78, v79, 1);
            v80 = (BMCustomAttributes *)objc_claimAutoreleasedReturnValue();
            v81 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v76, 2, v80);
            v39 = 0;
            *v74 = v81;
            v117 = v15;
            v6 = v118;
            v5 = v120;
            self = v125;
            goto LABEL_60;
          }
LABEL_67:
          v39 = 0;
          v26 = v15;
          v6 = v118;
          v5 = v120;
          self = v125;
          v7 = v121;
          goto LABEL_68;
        }
        if (a4)
        {
          v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v56 = v8;
          v57 = *MEMORY[0x1E0D025B8];
          v158 = *MEMORY[0x1E0CB2D50];
          v58 = v7;
          v59 = objc_alloc(MEMORY[0x1E0CB3940]);
          v114 = objc_opt_class();
          v60 = v59;
          v7 = v58;
          v129 = (id)objc_msgSend(v60, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v114, CFSTR("isHighPriority"));
          v159 = v129;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v159, &v158, 1);
          v61 = objc_claimAutoreleasedReturnValue();
          v62 = v57;
          v8 = v56;
          v128 = (void *)v61;
          v63 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v62, 2);
          v39 = 0;
          v64 = 0;
          *a4 = v63;
          v43 = v131;
          v35 = v132;
          goto LABEL_104;
        }
        v39 = 0;
        v64 = 0;
        v43 = v131;
        v35 = v132;
LABEL_105:

        goto LABEL_106;
      }
      if (a4)
      {
        v89 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v90 = v8;
        v91 = *MEMORY[0x1E0D025B8];
        v162 = *MEMORY[0x1E0CB2D50];
        v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("evaluationUuid"));
        v163 = v92;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v163, &v162, 1);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = v91;
        v8 = v90;
        *a4 = (id)objc_msgSend(v89, "initWithDomain:code:userInfo:", v94, 2, v93);

      }
      v39 = 0;
      v43 = v18;
      v133 = v18;
      v35 = v132;
LABEL_77:
      self = v126;
      goto LABEL_106;
    }
    if (a4)
    {
      v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v41 = v8;
      v42 = *MEMORY[0x1E0D025B8];
      v164 = *MEMORY[0x1E0CB2D50];
      v126 = self;
      v133 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleId"));
      v165 = v133;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v165, &v164, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v42;
      v8 = v41;
      v45 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v44, 2, v43);
      v39 = 0;
      v35 = 0;
      *a4 = v45;
      goto LABEL_77;
    }
    v35 = 0;
    v39 = 0;
LABEL_108:

    goto LABEL_109;
  }
  if (a4)
  {
    v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v31 = *MEMORY[0x1E0D025B8];
    v166 = *MEMORY[0x1E0CB2D50];
    v32 = self;
    v33 = objc_alloc(MEMORY[0x1E0CB3940]);
    v112 = objc_opt_class();
    v34 = v33;
    self = v32;
    v35 = (void *)objc_msgSend(v34, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v112, CFSTR("featureDomain"));
    v167[0] = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v167, &v166, 1);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v31;
    v8 = (void *)v36;
    v38 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v37, 2, v36);
    v39 = 0;
    v7 = 0;
    *a4 = v38;
    goto LABEL_108;
  }
  v39 = 0;
  v7 = 0;
LABEL_109:

  return v39;
}

- (id)_prefilledQuestionsJSONArray
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
  -[BMEvaluationCommonMetadata prefilledQuestions](self, "prefilledQuestions", 0);
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
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  -[BMEvaluationCommonMetadata featureDomain](self, "featureDomain");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMEvaluationCommonMetadata bundleId](self, "bundleId");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMEvaluationCommonMetadata evaluationUuid](self, "evaluationUuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = objc_claimAutoreleasedReturnValue();

  if (-[BMEvaluationCommonMetadata hasIsHighPriority](self, "hasIsHighPriority"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMEvaluationCommonMetadata isHighPriority](self, "isHighPriority"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[BMEvaluationCommonMetadata diagnostics](self, "diagnostics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMEvaluationCommonMetadata _prefilledQuestionsJSONArray](self, "_prefilledQuestionsJSONArray");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMEvaluationCommonMetadata auxiliaryAttributes](self, "auxiliaryAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "jsonDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMEvaluationCommonMetadata systemBuild](self, "systemBuild");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMEvaluationCommonMetadata modelVersion](self, "modelVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = CFSTR("featureDomain");
  v13 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v13;
  v34[0] = v13;
  v33[1] = CFSTR("bundleId");
  v14 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v14;
  v34[1] = v14;
  v33[2] = CFSTR("evaluationUuid");
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v3;
  v25 = (void *)v15;
  v34[2] = v15;
  v33[3] = CFSTR("isHighPriority");
  v16 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v4;
  v24 = (void *)v16;
  v34[3] = v16;
  v33[4] = CFSTR("diagnostics");
  v17 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v6;
  v34[4] = v17;
  v33[5] = CFSTR("prefilledQuestions");
  v18 = v32;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v7;
  v34[5] = v18;
  v33[6] = CFSTR("auxiliaryAttributes");
  v20 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[6] = v20;
  v33[7] = CFSTR("systemBuild");
  v21 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[7] = v21;
  v33[8] = CFSTR("modelVersion");
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
      goto LABEL_24;
LABEL_36:

    if (v10)
      goto LABEL_25;
    goto LABEL_37;
  }

  if (!v11)
    goto LABEL_36;
LABEL_24:
  if (v10)
    goto LABEL_25;
LABEL_37:

LABEL_25:
  if (!v32)

  if (!v8)
  if (!v19)

  if (v29)
  {
    if (v30)
      goto LABEL_33;
LABEL_39:

    if (v31)
      goto LABEL_34;
LABEL_40:

    goto LABEL_34;
  }

  if (!v30)
    goto LABEL_39;
LABEL_33:
  if (!v31)
    goto LABEL_40;
LABEL_34:

  return v28;
}

- (NSUUID)evaluationUuid
{
  NSData *raw_evaluationUuid;
  void *v3;

  raw_evaluationUuid = self->_raw_evaluationUuid;
  if (raw_evaluationUuid)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_evaluationUuid, 3);
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
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMEvaluationCommonMetadata featureDomain](self, "featureDomain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "featureDomain");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMEvaluationCommonMetadata featureDomain](self, "featureDomain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "featureDomain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_34;
    }
    -[BMEvaluationCommonMetadata bundleId](self, "bundleId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleId");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMEvaluationCommonMetadata bundleId](self, "bundleId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_34;
    }
    -[BMEvaluationCommonMetadata evaluationUuid](self, "evaluationUuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "evaluationUuid");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMEvaluationCommonMetadata evaluationUuid](self, "evaluationUuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "evaluationUuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_34;
    }
    if (-[BMEvaluationCommonMetadata hasIsHighPriority](self, "hasIsHighPriority")
      || objc_msgSend(v5, "hasIsHighPriority"))
    {
      if (!-[BMEvaluationCommonMetadata hasIsHighPriority](self, "hasIsHighPriority"))
        goto LABEL_34;
      if (!objc_msgSend(v5, "hasIsHighPriority"))
        goto LABEL_34;
      v25 = -[BMEvaluationCommonMetadata isHighPriority](self, "isHighPriority");
      if (v25 != objc_msgSend(v5, "isHighPriority"))
        goto LABEL_34;
    }
    -[BMEvaluationCommonMetadata diagnostics](self, "diagnostics");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "diagnostics");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v26 == (void *)v27)
    {

    }
    else
    {
      v28 = (void *)v27;
      -[BMEvaluationCommonMetadata diagnostics](self, "diagnostics");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "diagnostics");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (!v31)
        goto LABEL_34;
    }
    -[BMEvaluationCommonMetadata prefilledQuestions](self, "prefilledQuestions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prefilledQuestions");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v32 == (void *)v33)
    {

    }
    else
    {
      v34 = (void *)v33;
      -[BMEvaluationCommonMetadata prefilledQuestions](self, "prefilledQuestions");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "prefilledQuestions");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "isEqual:", v36);

      if (!v37)
        goto LABEL_34;
    }
    -[BMEvaluationCommonMetadata auxiliaryAttributes](self, "auxiliaryAttributes");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "auxiliaryAttributes");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v38 == (void *)v39)
    {

    }
    else
    {
      v40 = (void *)v39;
      -[BMEvaluationCommonMetadata auxiliaryAttributes](self, "auxiliaryAttributes");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "auxiliaryAttributes");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v41, "isEqual:", v42);

      if (!v43)
        goto LABEL_34;
    }
    -[BMEvaluationCommonMetadata systemBuild](self, "systemBuild");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemBuild");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v44 == (void *)v45)
    {

    }
    else
    {
      v46 = (void *)v45;
      -[BMEvaluationCommonMetadata systemBuild](self, "systemBuild");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "systemBuild");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v47, "isEqual:", v48);

      if (!v49)
      {
LABEL_34:
        v12 = 0;
LABEL_35:

        goto LABEL_36;
      }
    }
    -[BMEvaluationCommonMetadata modelVersion](self, "modelVersion");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modelVersion");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51 == v52)
    {
      v12 = 1;
    }
    else
    {
      -[BMEvaluationCommonMetadata modelVersion](self, "modelVersion");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "modelVersion");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v53, "isEqual:", v54);

    }
    goto LABEL_35;
  }
  v12 = 0;
LABEL_36:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)featureDomain
{
  return self->_featureDomain;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (BOOL)isHighPriority
{
  return self->_isHighPriority;
}

- (BOOL)hasIsHighPriority
{
  return self->_hasIsHighPriority;
}

- (void)setHasIsHighPriority:(BOOL)a3
{
  self->_hasIsHighPriority = a3;
}

- (NSString)diagnostics
{
  return self->_diagnostics;
}

- (NSArray)prefilledQuestions
{
  return self->_prefilledQuestions;
}

- (BMCustomAttributes)auxiliaryAttributes
{
  return self->_auxiliaryAttributes;
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_auxiliaryAttributes, 0);
  objc_storeStrong((id *)&self->_prefilledQuestions, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_featureDomain, 0);
  objc_storeStrong((id *)&self->_raw_evaluationUuid, 0);
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

    v4 = -[BMEvaluationCommonMetadata initByReadFrom:]([BMEvaluationCommonMetadata alloc], "initByReadFrom:", v7);
    v4[7] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("featureDomain"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleId"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("evaluationUuid"), 6, 0, 3, 14, 3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isHighPriority"), 0, 0, 4, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("diagnostics"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("prefilledQuestions_json"), 5, 1, &__block_literal_global_301);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("auxiliaryAttributes_json"), 5, 1, &__block_literal_global_302);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("systemBuild"), 2, 0, 8, 13, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("modelVersion"), 2, 0, 9, 13, 0);
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
  return &unk_1E5F1BD60;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("featureDomain"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleId"), 2, 13, 0, v2);
  v13[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("evaluationUuid"), 3, 14, 0);
  v13[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isHighPriority"), 4, 12, 0);
  v13[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("diagnostics"), 5, 13, 0);
  v13[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("prefilledQuestions"), 6, 14, objc_opt_class());
  v13[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("auxiliaryAttributes"), 7, 14, objc_opt_class());
  v13[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("systemBuild"), 8, 13, 0);
  v13[7] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("modelVersion"), 9, 13, 0);
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __37__BMEvaluationCommonMetadata_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auxiliaryAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __37__BMEvaluationCommonMetadata_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_prefilledQuestionsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
