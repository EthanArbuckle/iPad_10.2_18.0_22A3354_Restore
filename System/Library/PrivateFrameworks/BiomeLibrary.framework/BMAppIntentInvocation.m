@implementation BMAppIntentInvocation

- (BMAppIntentInvocation)initWithBundleID:(id)a3 source:(int)a4 executionUUID:(id)a5 executionDate:(id)a6 action:(id)a7 resolvedAction:(id)a8 actionOutput:(id)a9 predictions:(id)a10
{
  id v17;
  id v18;
  id v19;
  BMAppIntentInvocation *v20;
  uint64_t v21;
  NSData *raw_executionUUID;
  double v23;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v17 = a5;
  v18 = a6;
  v27 = a7;
  v26 = a8;
  v25 = a9;
  v19 = a10;
  v29.receiver = self;
  v29.super_class = (Class)BMAppIntentInvocation;
  v20 = -[BMEventBase init](&v29, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v20->_bundleID, a3);
    v20->_source = a4;
    if (v17)
    {
      v30[0] = 0;
      v30[1] = 0;
      objc_msgSend(v17, "getUUIDBytes:", v30);
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v30, 16);
      raw_executionUUID = v20->_raw_executionUUID;
      v20->_raw_executionUUID = (NSData *)v21;
    }
    else
    {
      raw_executionUUID = v20->_raw_executionUUID;
      v20->_raw_executionUUID = 0;
    }

    if (v18)
    {
      v20->_hasRaw_executionDate = 1;
      objc_msgSend(v18, "timeIntervalSince1970");
    }
    else
    {
      v20->_hasRaw_executionDate = 0;
      v23 = -1.0;
    }
    v20->_raw_executionDate = v23;
    objc_storeStrong((id *)&v20->_action, a7);
    objc_storeStrong((id *)&v20->_resolvedAction, a8);
    objc_storeStrong((id *)&v20->_actionOutput, a9);
    objc_storeStrong((id *)&v20->_predictions, a10);
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMAppIntentInvocation bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMAppIntentInvocationSourceAsString(-[BMAppIntentInvocation source](self, "source"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocation executionUUID](self, "executionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocation executionDate](self, "executionDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocation action](self, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocation resolvedAction](self, "resolvedAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocation actionOutput](self, "actionOutput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocation predictions](self, "predictions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAppIntentInvocation with bundleID: %@, source: %@, executionUUID: %@, executionDate: %@, action: %@, resolvedAction: %@, actionOutput: %@, predictions: %@"), v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAppIntentInvocation *v5;
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
  NSData *bundleID;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  NSData *v30;
  uint64_t v31;
  unint64_t v32;
  double v33;
  objc_class *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  NSArray *predictions;
  int v41;
  BMAppIntentInvocation *v42;
  objc_super v44;
  uint64_t v45;
  uint64_t v46;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BMAppIntentInvocation;
  v5 = -[BMEventBase init](&v44, sel_init);
  if (!v5)
  {
LABEL_60:
    v42 = v5;
    goto LABEL_61;
  }
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_58:
    v39 = objc_msgSend(v6, "copy");
    predictions = v5->_predictions;
    v5->_predictions = (NSArray *)v39;

    v41 = v4[*v9];
    if (v41)
      goto LABEL_59;
    goto LABEL_60;
  }
  v10 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v9])
      goto LABEL_58;
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
      goto LABEL_58;
    switch((v13 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        bundleID = (NSData *)v5->_bundleID;
        v5->_bundleID = (NSString *)v21;
        goto LABEL_32;
      case 2u:
        v23 = 0;
        v24 = 0;
        v25 = 0;
        while (2)
        {
          v26 = *v7;
          v27 = *(_QWORD *)&v4[v26];
          v28 = v27 + 1;
          if (v27 == -1 || v28 > *(_QWORD *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            v29 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v27);
            *(_QWORD *)&v4[v26] = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if (v29 < 0)
            {
              v23 += 7;
              v18 = v24++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9])
          LODWORD(v25) = 0;
LABEL_52:
        if (v25 >= 9)
          LODWORD(v25) = 0;
        v5->_source = v25;
        goto LABEL_57;
      case 3u:
        PBReaderReadData();
        v30 = (NSData *)objc_claimAutoreleasedReturnValue();
        if (-[NSData length](v30, "length") == 16)
        {
          bundleID = v5->_raw_executionUUID;
          v5->_raw_executionUUID = v30;
LABEL_32:

LABEL_57:
          if (*(_QWORD *)&v4[*v7] >= *(_QWORD *)&v4[*v8])
            goto LABEL_58;
          continue;
        }

LABEL_63:
LABEL_59:
        v42 = 0;
LABEL_61:

        return v42;
      case 4u:
        v5->_hasRaw_executionDate = 1;
        v31 = *v7;
        v32 = *(_QWORD *)&v4[v31];
        if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(_QWORD *)&v4[*v8])
        {
          v33 = *(double *)(*(_QWORD *)&v4[*v10] + v32);
          *(_QWORD *)&v4[v31] = v32 + 8;
        }
        else
        {
          v4[*v9] = 1;
          v33 = 0.0;
        }
        v5->_raw_executionDate = v33;
        goto LABEL_57;
      case 5u:
        v45 = 0;
        v46 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_63;
        v34 = -[BMAppIntentInvocationAction initByReadFrom:]([BMAppIntentInvocationAction alloc], "initByReadFrom:", v4);
        if (!v34)
          goto LABEL_63;
        v35 = 56;
        goto LABEL_45;
      case 6u:
        v45 = 0;
        v46 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_63;
        v34 = -[BMAppIntentInvocationAction initByReadFrom:]([BMAppIntentInvocationAction alloc], "initByReadFrom:", v4);
        if (!v34)
          goto LABEL_63;
        v35 = 64;
        goto LABEL_45;
      case 7u:
        v45 = 0;
        v46 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_63;
        v34 = -[BMAppIntentInvocationActionOutput initByReadFrom:]([BMAppIntentInvocationActionOutput alloc], "initByReadFrom:", v4);
        if (!v34)
          goto LABEL_63;
        v35 = 72;
LABEL_45:
        v36 = *(Class *)((char *)&v5->super.super.isa + v35);
        *(Class *)((char *)&v5->super.super.isa + v35) = v34;

        PBReaderRecallMark();
        goto LABEL_57;
      case 8u:
        v45 = 0;
        v46 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_63;
        v37 = -[BMAppIntentInvocationActionPrediction initByReadFrom:]([BMAppIntentInvocationActionPrediction alloc], "initByReadFrom:", v4);
        if (!v37)
          goto LABEL_63;
        v38 = v37;
        objc_msgSend(v6, "addObject:", v37);
        PBReaderRecallMark();

        goto LABEL_57;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          goto LABEL_63;
        goto LABEL_57;
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
  if (self->_bundleID)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_raw_executionUUID)
    PBDataWriterWriteDataField();
  if (self->_hasRaw_executionDate)
    PBDataWriterWriteDoubleField();
  if (self->_action)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMAppIntentInvocationAction writeTo:](self->_action, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_resolvedAction)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMAppIntentInvocationAction writeTo:](self->_resolvedAction, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_actionOutput)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMAppIntentInvocationActionOutput writeTo:](self->_actionOutput, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_predictions;
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
  -[BMAppIntentInvocation writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAppIntentInvocation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  BMAppIntentInvocation *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  id v24;
  id v25;
  id v26;
  double v27;
  double v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  int v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  BMAppIntentInvocationAction *v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  id v62;
  BMAppIntentInvocationActionPrediction *v63;
  BMAppIntentInvocationActionPrediction *v64;
  id v65;
  BMAppIntentInvocationActionOutput *v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  id *v97;
  id v98;
  uint64_t v99;
  void *v100;
  id *v101;
  uint64_t *v102;
  void *v103;
  uint64_t v104;
  id v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  BMAppIntentInvocationActionOutput *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  BMAppIntentInvocationAction *v131;
  uint64_t v132;
  void *v133;
  id v134;
  id v135;
  BMAppIntentInvocationAction *v136;
  void *v137;
  void *v138;
  id v139;
  id v140;
  id v141;
  id v142;
  void *v143;
  id v144;
  void *v145;
  id v146;
  id *v147;
  id v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  id v154;
  id v155;
  id v156;
  uint64_t v157;
  id v158;
  uint64_t v159;
  id v160;
  _BYTE v161[128];
  uint64_t v162;
  void *v163;
  uint64_t v164;
  BMAppIntentInvocationActionOutput *v165;
  uint64_t v166;
  BMAppIntentInvocationAction *v167;
  uint64_t v168;
  void *v169;
  uint64_t v170;
  id v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  _QWORD v179[3];

  v179[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v12 = *MEMORY[0x1E0D025B8];
        v178 = *MEMORY[0x1E0CB2D50];
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
        v179[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v179, &v178, 1);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v12;
        v8 = (void *)v13;
        v15 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v14, 2, v13);
        v7 = 0;
        v16 = 0;
        *a4 = v15;
        goto LABEL_107;
      }
      v7 = 0;
      v16 = 0;
      goto LABEL_108;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("source"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = a4;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v8;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v146 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v85 = v8;
          v86 = *MEMORY[0x1E0D025B8];
          v176 = *MEMORY[0x1E0CB2D50];
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("source"));
          v177 = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v177, &v176, 1);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v87 = v86;
          v8 = v85;
          v16 = 0;
          *v147 = (id)objc_msgSend(v146, "initWithDomain:code:userInfo:", v87, 2, v18);
          v9 = 0;
          goto LABEL_105;
        }
        v16 = 0;
        v9 = 0;
        goto LABEL_107;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAppIntentInvocationSourceFromString(v8));
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v10;
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("executionUUID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v147)
      {
        v140 = v7;
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v125 = v9;
        v31 = v8;
        v32 = *MEMORY[0x1E0D025B8];
        v172 = *MEMORY[0x1E0CB2D50];
        v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("executionUUID"));
        v173 = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v173, &v172, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v30;
        v7 = v140;
        v36 = v32;
        v8 = v31;
        v9 = v125;
        *v147 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v36, 2, v34);
        v18 = (id)v33;

        v16 = 0;
        goto LABEL_105;
      }
      v16 = 0;
      goto LABEL_106;
    }
    v139 = v7;
    v18 = v17;
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v18);
    if (!v21)
    {
      if (v147)
      {
        v90 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v17 = v18;
        v91 = v9;
        v92 = v8;
        v93 = *MEMORY[0x1E0D025B8];
        v174 = *MEMORY[0x1E0CB2D50];
        v94 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("executionUUID"));
        v175 = v94;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v175, &v174, 1);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = v93;
        v8 = v92;
        v9 = v91;
        v18 = v17;
        *v147 = (id)objc_msgSend(v90, "initWithDomain:code:userInfo:", v96, 2, v95);

        v16 = 0;
      }
      else
      {
        v16 = 0;
        v17 = v18;
      }
      v7 = v139;
      goto LABEL_105;
    }
    v22 = (void *)v21;

    v18 = v22;
    v7 = v139;
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("executionDate"));
  v19 = objc_claimAutoreleasedReturnValue();
  v145 = (void *)v19;
  if (v19 && (v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = (objc_class *)MEMORY[0x1E0C99D68];
      v24 = v7;
      v25 = v20;
      v26 = [v23 alloc];
      objc_msgSend(v25, "doubleValue");
      v28 = v27;

      v7 = v24;
      v29 = (id)objc_msgSend(v26, "initWithTimeIntervalSince1970:", v28);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        objc_msgSend(v37, "dateFromString:", v20);
        v143 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_32;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v147)
        {
          v144 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v127 = v9;
          v110 = v8;
          v111 = *MEMORY[0x1E0D025B8];
          v170 = *MEMORY[0x1E0CB2D50];
          v51 = v145;
          v48 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("executionDate"));
          v171 = v48;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v171, &v170, 1);
          v112 = objc_claimAutoreleasedReturnValue();
          v113 = v111;
          v8 = v110;
          v9 = v127;
          v138 = (void *)v112;
          v114 = (id)objc_msgSend(v144, "initWithDomain:code:userInfo:", v113, 2);
          v143 = 0;
          v16 = 0;
          *v147 = v114;

          goto LABEL_103;
        }
        v143 = 0;
        v16 = 0;
        v51 = v145;
        goto LABEL_104;
      }
      v29 = v20;
    }
    v143 = v29;
  }
  else
  {
    v143 = 0;
  }
LABEL_32:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("action"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v120 = v8;
      v69 = v38;
      if (v147)
      {
        v134 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v132 = *MEMORY[0x1E0D025B8];
        v168 = *MEMORY[0x1E0CB2D50];
        v70 = v7;
        v71 = v17;
        v72 = v18;
        v73 = v9;
        v74 = objc_alloc(MEMORY[0x1E0CB3940]);
        v115 = objc_opt_class();
        v75 = v74;
        v9 = v73;
        v18 = v72;
        v17 = v71;
        v7 = v70;
        v137 = (void *)objc_msgSend(v75, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v115, CFSTR("action"));
        v169 = v137;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v169, &v168, 1);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        *v147 = (id)objc_msgSend(v134, "initWithDomain:code:userInfo:", v132, 2, v76);

        v16 = 0;
        v48 = v69;
        v51 = v145;
        v8 = v120;

      }
      else
      {
        v16 = 0;
        v51 = v145;
        v48 = v69;
        v8 = v120;
      }
      goto LABEL_103;
    }
    v142 = v7;
    v48 = v38;
    v156 = 0;
    v136 = -[BMAppIntentInvocationAction initWithJSONDictionary:error:]([BMAppIntentInvocationAction alloc], "initWithJSONDictionary:error:", v48, &v156);
    v49 = v156;
    if (v49)
    {
      v50 = v49;
      if (v147)
        *v147 = objc_retainAutorelease(v49);

      v16 = 0;
      v7 = v142;
      v51 = v145;
      goto LABEL_102;
    }
    v130 = v38;

  }
  else
  {
    v130 = v38;
    v136 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resolvedAction"));
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = 0x1E0C99000uLL;
  v133 = (void *)v39;
  v135 = v18;
  if (v39 && (v41 = (void *)v39, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v147)
      {
        v129 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v124 = *MEMORY[0x1E0D025B8];
        v166 = *MEMORY[0x1E0CB2D50];
        v77 = v7;
        v78 = v17;
        v79 = v18;
        v80 = v9;
        v81 = objc_alloc(MEMORY[0x1E0CB3940]);
        v116 = objc_opt_class();
        v82 = v81;
        v9 = v80;
        v18 = v79;
        v17 = v78;
        v7 = v77;
        v131 = (BMAppIntentInvocationAction *)objc_msgSend(v82, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v116, CFSTR("resolvedAction"));
        v167 = v131;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v167, &v166, 1);
        v83 = objc_claimAutoreleasedReturnValue();
        v84 = v129;
        v128 = (void *)v83;
        v16 = 0;
        v51 = v145;
        *v147 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v124, 2);
        v48 = v130;
        goto LABEL_100;
      }
      v16 = 0;
      v51 = v145;
      v48 = v130;
      goto LABEL_101;
    }
    v52 = v41;
    v53 = [BMAppIntentInvocationAction alloc];
    v155 = 0;
    v131 = -[BMAppIntentInvocationAction initWithJSONDictionary:error:](v53, "initWithJSONDictionary:error:", v52, &v155);
    v54 = v155;
    if (v54)
    {
      v55 = v54;
      v128 = v52;
      if (v147)
        *v147 = objc_retainAutorelease(v54);

      v16 = 0;
LABEL_121:
      v51 = v145;
      v48 = v130;
      v18 = v135;
      goto LABEL_100;
    }

    v40 = 0x1E0C99000;
  }
  else
  {
    v131 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("actionOutput"));
  v42 = objc_claimAutoreleasedReturnValue();
  v122 = v6;
  v141 = v7;
  v128 = (void *)v42;
  if (!v42 || (v43 = (void *)v42, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v44 = v7;
    v123 = 0;
    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v147)
    {
      v121 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v88 = *MEMORY[0x1E0D025B8];
      v164 = *MEMORY[0x1E0CB2D50];
      v123 = (BMAppIntentInvocationActionOutput *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("actionOutput"));
      v165 = v123;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v165, &v164, 1);
      v45 = (id)objc_claimAutoreleasedReturnValue();
      v89 = (id)objc_msgSend(v121, "initWithDomain:code:userInfo:", v88, 2, v45);
      v16 = 0;
      *v147 = v89;
      v51 = v145;
      v48 = v130;
      v18 = v135;
      goto LABEL_99;
    }
    v16 = 0;
    goto LABEL_121;
  }
  v45 = v43;
  v66 = [BMAppIntentInvocationActionOutput alloc];
  v154 = 0;
  v123 = -[BMAppIntentInvocationActionOutput initWithJSONDictionary:error:](v66, "initWithJSONDictionary:error:", v45, &v154);
  v67 = v154;
  if (v67)
  {
    v68 = v67;
    v18 = v135;
    if (v147)
      *v147 = objc_retainAutorelease(v67);

    goto LABEL_111;
  }
  v44 = v7;

LABEL_41:
  v18 = v135;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("predictions"));
  v45 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v40 + 3640), "null");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v45, "isEqual:", v46);

  v126 = v9;
  if (!v47)
  {
    if (!v45 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v118 = v17;
      v119 = v8;
      v117 = v5;
      goto LABEL_56;
    }
    v7 = v44;
    if (v147)
    {
      v106 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v107 = *MEMORY[0x1E0D025B8];
      v162 = *MEMORY[0x1E0CB2D50];
      v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("predictions"));
      v163 = v56;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v163, &v162, 1);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = v107;
      v7 = v141;
      *v147 = (id)objc_msgSend(v106, "initWithDomain:code:userInfo:", v109, 2, v108);

      v16 = 0;
LABEL_96:
      v51 = v145;
      goto LABEL_97;
    }
LABEL_111:
    v16 = 0;
    v51 = v145;
    goto LABEL_98;
  }
  v118 = v17;
  v119 = v8;
  v117 = v5;

  v45 = 0;
LABEL_56:
  v51 = v145;
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v45, "count"));
  v150 = 0u;
  v151 = 0u;
  v152 = 0u;
  v153 = 0u;
  v45 = v45;
  v57 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v150, v161, 16);
  if (!v57)
    goto LABEL_66;
  v58 = v57;
  v59 = *(_QWORD *)v151;
  while (2)
  {
    for (i = 0; i != v58; ++i)
    {
      if (*(_QWORD *)v151 != v59)
        objc_enumerationMutation(v45);
      v61 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v117;
        v8 = v119;
        v97 = v147;
        v18 = v135;
        if (v147)
        {
          v98 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v99 = *MEMORY[0x1E0D025B8];
          v159 = *MEMORY[0x1E0CB2D50];
          v62 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("predictions"));
          v160 = v62;
          v100 = (void *)MEMORY[0x1E0C99D80];
          v101 = &v160;
          v102 = &v159;
LABEL_90:
          objc_msgSend(v100, "dictionaryWithObjects:forKeys:count:", v101, v102, 1);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = v99;
          v18 = v135;
          *v97 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v104, 2, v103);
LABEL_94:

        }
LABEL_95:

        v16 = 0;
        v7 = v141;
        v17 = v118;
        goto LABEL_96;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v5 = v117;
        v8 = v119;
        v97 = v147;
        v18 = v135;
        if (v147)
        {
          v98 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v99 = *MEMORY[0x1E0D025B8];
          v157 = *MEMORY[0x1E0CB2D50];
          v62 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("predictions"));
          v158 = v62;
          v100 = (void *)MEMORY[0x1E0C99D80];
          v101 = &v158;
          v102 = &v157;
          goto LABEL_90;
        }
        goto LABEL_95;
      }
      v62 = v61;
      v63 = [BMAppIntentInvocationActionPrediction alloc];
      v149 = 0;
      v64 = -[BMAppIntentInvocationActionPrediction initWithJSONDictionary:error:](v63, "initWithJSONDictionary:error:", v62, &v149);
      v65 = v149;
      if (v65)
      {
        v103 = v65;
        if (v147)
          *v147 = objc_retainAutorelease(v65);

        v5 = v117;
        v8 = v119;
        v18 = v135;
        goto LABEL_94;
      }
      objc_msgSend(v56, "addObject:", v64);

    }
    v58 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v150, v161, 16);
    v51 = v145;
    if (v58)
      continue;
    break;
  }
LABEL_66:

  v7 = v141;
  v18 = v135;
  v16 = -[BMAppIntentInvocation initWithBundleID:source:executionUUID:executionDate:action:resolvedAction:actionOutput:predictions:](self, "initWithBundleID:source:executionUUID:executionDate:action:resolvedAction:actionOutput:predictions:", v141, objc_msgSend(v126, "intValue"), v135, v143, v136, v131, v123, v56);
  self = v16;
  v5 = v117;
  v17 = v118;
  v8 = v119;
LABEL_97:

  v9 = v126;
LABEL_98:
  v48 = v130;
LABEL_99:

  v6 = v122;
LABEL_100:

LABEL_101:
LABEL_102:

LABEL_103:
LABEL_104:

LABEL_105:
LABEL_106:

LABEL_107:
LABEL_108:

  return v16;
}

- (id)_predictionsJSONArray
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
  -[BMAppIntentInvocation predictions](self, "predictions", 0);
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[8];
  _QWORD v35[10];

  v35[8] = *MEMORY[0x1E0C80C00];
  -[BMAppIntentInvocation bundleID](self, "bundleID");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAppIntentInvocation source](self, "source"));
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocation executionUUID](self, "executionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = objc_claimAutoreleasedReturnValue();

  -[BMAppIntentInvocation executionDate](self, "executionDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAppIntentInvocation executionDate](self, "executionDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  -[BMAppIntentInvocation action](self, "action");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "jsonDictionary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMAppIntentInvocation resolvedAction](self, "resolvedAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "jsonDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMAppIntentInvocation actionOutput](self, "actionOutput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "jsonDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMAppIntentInvocation _predictionsJSONArray](self, "_predictionsJSONArray");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = CFSTR("bundleID");
  v17 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v17;
  v35[0] = v17;
  v34[1] = CFSTR("source");
  v18 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v18;
  v35[1] = v18;
  v34[2] = CFSTR("executionUUID");
  v19 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v3;
  v27 = (void *)v19;
  v35[2] = v19;
  v34[3] = CFSTR("executionDate");
  v20 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v4;
  v35[3] = v20;
  v34[4] = CFSTR("action");
  v21 = v33;
  if (!v33)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v6;
  v35[4] = v21;
  v34[5] = CFSTR("resolvedAction");
  v22 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35[5] = v22;
  v34[6] = CFSTR("actionOutput");
  v23 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35[6] = v23;
  v34[7] = CFSTR("predictions");
  v24 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35[7] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (v15)
      goto LABEL_22;
  }
  else
  {

    if (v15)
      goto LABEL_22;
  }

LABEL_22:
  if (!v13)

  if (!v33)
  if (!v10)

  if (v30)
  {
    if (v31)
      goto LABEL_30;
LABEL_35:

    if (v32)
      goto LABEL_31;
LABEL_36:

    goto LABEL_31;
  }

  if (!v31)
    goto LABEL_35;
LABEL_30:
  if (!v32)
    goto LABEL_36;
LABEL_31:

  return v25;
}

- (NSUUID)executionUUID
{
  NSData *raw_executionUUID;
  void *v3;

  raw_executionUUID = self->_raw_executionUUID;
  if (raw_executionUUID)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_executionUUID, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSUUID *)v3;
}

- (NSDate)executionDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_executionDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_executionDate);
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
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMAppIntentInvocation bundleID](self, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAppIntentInvocation bundleID](self, "bundleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_26;
    }
    v13 = -[BMAppIntentInvocation source](self, "source");
    if (v13 == objc_msgSend(v5, "source"))
    {
      -[BMAppIntentInvocation executionUUID](self, "executionUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "executionUUID");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[BMAppIntentInvocation executionUUID](self, "executionUUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "executionUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_26;
      }
      -[BMAppIntentInvocation executionDate](self, "executionDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "executionDate");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMAppIntentInvocation executionDate](self, "executionDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "executionDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_26;
      }
      -[BMAppIntentInvocation action](self, "action");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "action");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[BMAppIntentInvocation action](self, "action");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "action");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_26;
      }
      -[BMAppIntentInvocation resolvedAction](self, "resolvedAction");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resolvedAction");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v32 == (void *)v33)
      {

      }
      else
      {
        v34 = (void *)v33;
        -[BMAppIntentInvocation resolvedAction](self, "resolvedAction");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "resolvedAction");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqual:", v36);

        if (!v37)
          goto LABEL_26;
      }
      -[BMAppIntentInvocation actionOutput](self, "actionOutput");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "actionOutput");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v38 == (void *)v39)
      {

      }
      else
      {
        v40 = (void *)v39;
        -[BMAppIntentInvocation actionOutput](self, "actionOutput");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "actionOutput");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v41, "isEqual:", v42);

        if (!v43)
          goto LABEL_26;
      }
      -[BMAppIntentInvocation predictions](self, "predictions");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "predictions");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45 == v46)
      {
        v12 = 1;
      }
      else
      {
        -[BMAppIntentInvocation predictions](self, "predictions");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "predictions");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v47, "isEqual:", v48);

      }
      goto LABEL_27;
    }
LABEL_26:
    v12 = 0;
LABEL_27:

    goto LABEL_28;
  }
  v12 = 0;
LABEL_28:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (int)source
{
  return self->_source;
}

- (BMAppIntentInvocationAction)action
{
  return self->_action;
}

- (BMAppIntentInvocationAction)resolvedAction
{
  return self->_resolvedAction;
}

- (BMAppIntentInvocationActionOutput)actionOutput
{
  return self->_actionOutput;
}

- (NSArray)predictions
{
  return self->_predictions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_actionOutput, 0);
  objc_storeStrong((id *)&self->_resolvedAction, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_raw_executionUUID, 0);
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

    v4 = -[BMAppIntentInvocation initByReadFrom:]([BMAppIntentInvocation alloc], "initByReadFrom:", v7);
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
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("source"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("executionUUID"), 6, 0, 3, 14, 3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("executionDate"), 3, 0, 4, 0, 2);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("action_json"), 5, 1, &__block_literal_global_819);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("resolvedAction_json"), 5, 1, &__block_literal_global_820);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("actionOutput_json"), 5, 1, &__block_literal_global_821);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("predictions_json"), 5, 1, &__block_literal_global_822);
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
  return &unk_1E5F1CC78;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 1, 13, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("source"), 2, 4, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("executionUUID"), 3, 14, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("executionDate"), 4, 0, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("action"), 5, 14, objc_opt_class());
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("resolvedAction"), 6, 14, objc_opt_class());
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("actionOutput"), 7, 14, objc_opt_class());
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("predictions"), 8, 14, objc_opt_class());
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __32__BMAppIntentInvocation_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_predictionsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __32__BMAppIntentInvocation_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __32__BMAppIntentInvocation_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolvedAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __32__BMAppIntentInvocation_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
