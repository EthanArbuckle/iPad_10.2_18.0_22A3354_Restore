@implementation BMSiriPostSiriEngagement

- (BMSiriPostSiriEngagement)initWithUISessionID:(id)a3 taskID:(id)a4 taskType:(id)a5 conversationPath:(id)a6 appPattern:(id)a7 requestIds:(id)a8 engagementUnderstandingFeatures:(id)a9 pseEvents:(id)a10
{
  return -[BMSiriPostSiriEngagement initWithUISessionID:taskID:taskType:conversationPath:appPattern:requestIds:engagementUnderstandingFeatures:pseEvents:clientSessionId:lastRequestId:executionUUID:](self, "initWithUISessionID:taskID:taskType:conversationPath:appPattern:requestIds:engagementUnderstandingFeatures:pseEvents:clientSessionId:lastRequestId:executionUUID:", a3, a4, a5, a6, a7, a8, a9, a10, 0, 0, 0);
}

- (BMSiriPostSiriEngagement)initWithUISessionID:(id)a3 taskID:(id)a4 taskType:(id)a5 conversationPath:(id)a6 appPattern:(id)a7 requestIds:(id)a8 engagementUnderstandingFeatures:(id)a9 pseEvents:(id)a10 clientSessionId:(id)a11
{
  return -[BMSiriPostSiriEngagement initWithUISessionID:taskID:taskType:conversationPath:appPattern:requestIds:engagementUnderstandingFeatures:pseEvents:clientSessionId:lastRequestId:executionUUID:](self, "initWithUISessionID:taskID:taskType:conversationPath:appPattern:requestIds:engagementUnderstandingFeatures:pseEvents:clientSessionId:lastRequestId:executionUUID:", a3, a4, a5, a6, a7, a8, a9, a10, 0, 0, 0);
}

- (BMSiriPostSiriEngagement)initWithUISessionID:(id)a3 taskID:(id)a4 taskType:(id)a5 conversationPath:(id)a6 appPattern:(id)a7 requestIds:(id)a8 engagementUnderstandingFeatures:(id)a9 pseEvents:(id)a10 clientSessionId:(id)a11 lastRequestId:(id)a12 executionUUID:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  BMSiriPostSiriEngagement *v22;
  id v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v33 = a3;
  v25 = a4;
  v32 = a4;
  v31 = a5;
  v30 = a6;
  v29 = a7;
  v28 = a8;
  v27 = a9;
  v18 = a10;
  v19 = a11;
  v20 = a12;
  v21 = a13;
  v34.receiver = self;
  v34.super_class = (Class)BMSiriPostSiriEngagement;
  v22 = -[BMEventBase init](&v34, sel_init);
  if (v22)
  {
    v22->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v22->_UISessionID, a3);
    objc_storeStrong((id *)&v22->_taskID, v25);
    objc_storeStrong((id *)&v22->_taskType, a5);
    objc_storeStrong((id *)&v22->_conversationPath, a6);
    objc_storeStrong((id *)&v22->_appPattern, a7);
    objc_storeStrong((id *)&v22->_requestIds, a8);
    objc_storeStrong((id *)&v22->_engagementUnderstandingFeatures, a9);
    objc_storeStrong((id *)&v22->_pseEvents, a10);
    objc_storeStrong((id *)&v22->_clientSessionId, a11);
    objc_storeStrong((id *)&v22->_lastRequestId, a12);
    objc_storeStrong((id *)&v22->_executionUUID, a13);
  }

  return v22;
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
  -[BMSiriPostSiriEngagement UISessionID](self, "UISessionID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagement taskID](self, "taskID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagement taskType](self, "taskType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagement conversationPath](self, "conversationPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagement appPattern](self, "appPattern");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagement requestIds](self, "requestIds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagement engagementUnderstandingFeatures](self, "engagementUnderstandingFeatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagement pseEvents](self, "pseEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagement clientSessionId](self, "clientSessionId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagement lastRequestId](self, "lastRequestId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagement executionUUID](self, "executionUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "initWithFormat:", CFSTR("BMSiriPostSiriEngagement with UISessionID: %@, taskID: %@, taskType: %@, conversationPath: %@, appPattern: %@, requestIds: %@, engagementUnderstandingFeatures: %@, pseEvents: %@, clientSessionId: %@, lastRequestId: %@, executionUUID: %@"), v16, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return (NSString *)v15;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriPostSiriEngagement *v5;
  void *v6;
  void *v7;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  char v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  int v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  BMSiriPostSiriEngagementFeatures *v26;
  BMSiriPostSiriEngagementFeatures *engagementUnderstandingFeatures;
  id v28;
  void *v29;
  uint64_t v30;
  NSArray *requestIds;
  uint64_t v32;
  NSArray *pseEvents;
  int v34;
  BMSiriPostSiriEngagement *v35;
  objc_super v37;
  uint64_t v38;
  uint64_t v39;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BMSiriPostSiriEngagement;
  v5 = -[BMEventBase init](&v37, sel_init);
  if (!v5)
  {
LABEL_43:
    v35 = v5;
    goto LABEL_44;
  }
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (int *)MEMORY[0x1E0D82BF0];
  v9 = (int *)MEMORY[0x1E0D82BD8];
  v10 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_41:
    v30 = objc_msgSend(v6, "copy");
    requestIds = v5->_requestIds;
    v5->_requestIds = (NSArray *)v30;

    v32 = objc_msgSend(v7, "copy");
    pseEvents = v5->_pseEvents;
    v5->_pseEvents = (NSArray *)v32;

    v34 = v4[*v10];
    if (v34)
      goto LABEL_42;
    goto LABEL_43;
  }
  v11 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v10])
      goto LABEL_41;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    while (1)
    {
      v15 = *v8;
      v16 = *(_QWORD *)&v4[v15];
      v17 = v16 + 1;
      if (v16 == -1 || v17 > *(_QWORD *)&v4[*v9])
        break;
      v18 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v16);
      *(_QWORD *)&v4[v15] = v17;
      v14 |= (unint64_t)(v18 & 0x7F) << v12;
      if ((v18 & 0x80) == 0)
        goto LABEL_13;
      v12 += 7;
      if (v13++ >= 9)
      {
        v14 = 0;
        v20 = v4[*v10];
        goto LABEL_15;
      }
    }
    v4[*v10] = 1;
LABEL_13:
    v20 = v4[*v10];
    if (v4[*v10])
      v14 = 0;
LABEL_15:
    if (v20 || (v14 & 7) == 4)
      goto LABEL_41;
    switch((v14 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 24;
        goto LABEL_39;
      case 2u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 32;
        goto LABEL_39;
      case 3u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 40;
        goto LABEL_39;
      case 4u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 48;
        goto LABEL_39;
      case 5u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 56;
        goto LABEL_39;
      case 6u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!v24)
          goto LABEL_45;
        v25 = (void *)v24;
        objc_msgSend(v6, "addObject:", v24);
        goto LABEL_35;
      case 7u:
        v38 = 0;
        v39 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_45;
        v26 = -[BMSiriPostSiriEngagementFeatures initByReadFrom:]([BMSiriPostSiriEngagementFeatures alloc], "initByReadFrom:", v4);
        if (!v26)
          goto LABEL_45;
        engagementUnderstandingFeatures = v5->_engagementUnderstandingFeatures;
        v5->_engagementUnderstandingFeatures = v26;

        PBReaderRecallMark();
        goto LABEL_40;
      case 8u:
        v38 = 0;
        v39 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_45;
        v28 = -[BMSiriPostSiriEngagementSignal initByReadFrom:]([BMSiriPostSiriEngagementSignal alloc], "initByReadFrom:", v4);
        if (!v28)
          goto LABEL_45;
        v25 = v28;
        objc_msgSend(v7, "addObject:", v28);
        PBReaderRecallMark();
LABEL_35:

        goto LABEL_40;
      case 9u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 88;
        goto LABEL_39;
      case 0xAu:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 96;
        goto LABEL_39;
      case 0xBu:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 104;
LABEL_39:
        v29 = *(Class *)((char *)&v5->super.super.isa + v23);
        *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

        goto LABEL_40;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_40:
          if (*(_QWORD *)&v4[*v8] >= *(_QWORD *)&v4[*v9])
            goto LABEL_41;
          continue;
        }
LABEL_45:

LABEL_42:
        v35 = 0;
LABEL_44:

        return v35;
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
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_UISessionID)
    PBDataWriterWriteStringField();
  if (self->_taskID)
    PBDataWriterWriteStringField();
  if (self->_taskType)
    PBDataWriterWriteStringField();
  if (self->_conversationPath)
    PBDataWriterWriteStringField();
  if (self->_appPattern)
    PBDataWriterWriteStringField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_requestIds;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  if (self->_engagementUnderstandingFeatures)
  {
    v20 = 0;
    PBDataWriterPlaceMark();
    -[BMSiriPostSiriEngagementFeatures writeTo:](self->_engagementUnderstandingFeatures, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_pseEvents;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
        v20 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v15, "writeTo:", v4, (_QWORD)v16);
        PBDataWriterRecallMark();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
    }
    while (v12);
  }

  if (self->_clientSessionId)
    PBDataWriterWriteStringField();
  if (self->_lastRequestId)
    PBDataWriterWriteStringField();
  if (self->_executionUUID)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriPostSiriEngagement writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriPostSiriEngagement)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  BMSiriPostSiriEngagement *v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id *v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  uint64_t v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  id v84;
  BMSiriPostSiriEngagement *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  id v95;
  BMSiriPostSiriEngagementSignal *v96;
  BMSiriPostSiriEngagementSignal *v97;
  id v98;
  id v99;
  id v100;
  void *v101;
  id v102;
  uint64_t v103;
  id *v104;
  id v105;
  void *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  id *v110;
  id v111;
  id v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  id v121;
  void *v122;
  uint64_t v124;
  id v125;
  void *v126;
  id v127;
  uint64_t v128;
  void *v129;
  id v130;
  void *v131;
  uint64_t v132;
  void *v133;
  id v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  id v146;
  void *v147;
  id v148;
  id v149;
  void *v150;
  BMSiriPostSiriEngagementFeatures *v151;
  void *v152;
  BMSiriPostSiriEngagement *v153;
  void *v154;
  void *v155;
  id v156;
  id obj;
  id v158;
  id v159;
  void *v160;
  id v161;
  void *v162;
  id v163;
  void *v164;
  id v165;
  void *v166;
  id *v167;
  id *v168;
  id *v169;
  id *v170;
  id *v171;
  id v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  id v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  uint64_t v182;
  void *v183;
  uint64_t v184;
  void *v185;
  uint64_t v186;
  id v187;
  uint64_t v188;
  id v189;
  uint64_t v190;
  id v191;
  _BYTE v192[128];
  uint64_t v193;
  void *v194;
  uint64_t v195;
  BMSiriPostSiriEngagementFeatures *v196;
  uint64_t v197;
  BMSiriPostSiriEngagementFeatures *v198;
  uint64_t v199;
  BMSiriPostSiriEngagementFeatures *v200;
  _BYTE v201[128];
  uint64_t v202;
  void *v203;
  uint64_t v204;
  id v205;
  uint64_t v206;
  void *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  uint64_t v212;
  _QWORD v213[3];

  v213[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UISessionID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v165 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v165 = v9;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskType"));
      v10 = objc_claimAutoreleasedReturnValue();
      v166 = (void *)v10;
      if (!v10 || (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v163 = 0;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("conversationPath"));
        v12 = objc_claimAutoreleasedReturnValue();
        v164 = (void *)v12;
        if (v12 && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
              v67 = v8;
              v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v170 = a4;
              v69 = v9;
              v70 = *MEMORY[0x1E0D025B8];
              v206 = *MEMORY[0x1E0CB2D50];
              v71 = v7;
              v72 = objc_alloc(MEMORY[0x1E0CB3940]);
              v140 = objc_opt_class();
              v73 = v72;
              v7 = v71;
              v74 = (void *)objc_msgSend(v73, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v140, CFSTR("conversationPath"));
              v207 = v74;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v207, &v206, 1);
              v75 = objc_claimAutoreleasedReturnValue();
              v76 = v68;
              v8 = v67;
              v77 = v70;
              v9 = v69;
              v162 = (void *)v75;
              v63 = 0;
              v36 = 0;
              *v170 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v77, 2);
              v32 = v165;
              goto LABEL_126;
            }
            v63 = 0;
            v36 = 0;
            v32 = v165;
            goto LABEL_127;
          }
          v161 = v13;
        }
        else
        {
          v161 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appPattern"));
        v14 = objc_claimAutoreleasedReturnValue();
        v162 = (void *)v14;
        v159 = v8;
        v160 = v9;
        if (v14 && (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
              v171 = a4;
              v78 = v9;
              v79 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v80 = v7;
              v81 = *MEMORY[0x1E0D025B8];
              v204 = *MEMORY[0x1E0CB2D50];
              v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("appPattern"));
              v205 = v16;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v205, &v204, 1);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v82 = v79;
              v9 = v78;
              v83 = v81;
              v7 = v80;
              v158 = 0;
              v36 = 0;
              *v171 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v83, 2, v19);
              v32 = v165;
              v63 = v161;
              goto LABEL_124;
            }
            v74 = 0;
            v36 = 0;
            v32 = v165;
            v63 = v161;
            goto LABEL_126;
          }
          v154 = v7;
          v158 = v15;
        }
        else
        {
          v154 = v7;
          v158 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requestIds"));
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if (v18)
        {
          v153 = self;

          v16 = 0;
        }
        else
        {
          if (v16)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                v36 = 0;
                v7 = v154;
                v63 = v161;
                v32 = v165;
                goto LABEL_125;
              }
              v84 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v85 = self;
              v86 = *MEMORY[0x1E0D025B8];
              v202 = *MEMORY[0x1E0CB2D50];
              v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("requestIds"));
              v203 = v19;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v203, &v202, 1);
              v87 = objc_claimAutoreleasedReturnValue();
              v88 = v86;
              self = v85;
              v36 = 0;
              *a4 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v88, 2, v87);
              v66 = (void *)v87;
              goto LABEL_64;
            }
          }
          v153 = self;
        }
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
        v178 = 0u;
        v179 = 0u;
        v180 = 0u;
        v181 = 0u;
        v16 = v16;
        v20 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v178, v201, 16);
        v167 = a4;
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v179;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v179 != v22)
                objc_enumerationMutation(v16);
              v24 = *(_QWORD *)(*((_QWORD *)&v178 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v48 = v167;
                if (v167)
                {
                  v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v50 = *MEMORY[0x1E0D025B8];
                  v199 = *MEMORY[0x1E0CB2D50];
                  v151 = (BMSiriPostSiriEngagementFeatures *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("requestIds"));
                  v200 = v151;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v200, &v199, 1);
                  obj = (id)objc_claimAutoreleasedReturnValue();
                  v51 = (void *)objc_msgSend(v49, "initWithDomain:code:userInfo:", v50, 2);
                  v32 = v165;
                  goto LABEL_55;
                }
LABEL_59:
                v36 = 0;
                v66 = v16;
                self = v153;
LABEL_64:
                v7 = v154;
                v63 = v161;
                v32 = v165;
                goto LABEL_123;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v167)
                  goto LABEL_59;
                v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v65 = *MEMORY[0x1E0D025B8];
                v197 = *MEMORY[0x1E0CB2D50];
                v151 = (BMSiriPostSiriEngagementFeatures *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("requestIds"));
                v198 = v151;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v198, &v197, 1);
                obj = (id)objc_claimAutoreleasedReturnValue();
                v51 = (void *)objc_msgSend(v64, "initWithDomain:code:userInfo:", v65, 2);
                v32 = v165;
                v48 = v167;
LABEL_55:
                v36 = 0;
                *v48 = v51;
                v66 = v16;
                self = v153;
                v7 = v154;
LABEL_56:
                v63 = v161;
                goto LABEL_122;
              }
              objc_msgSend(v19, "addObject:", v24);
            }
            v21 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v178, v201, 16);
            a4 = v167;
          }
          while (v21);
        }

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("engagementUnderstandingFeatures"));
        v25 = objc_claimAutoreleasedReturnValue();
        v150 = (void *)v25;
        if (!v25 || (v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v151 = 0;
          goto LABEL_39;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v99 = v26;
          v177 = 0;
          v151 = -[BMSiriPostSiriEngagementFeatures initWithJSONDictionary:error:]([BMSiriPostSiriEngagementFeatures alloc], "initWithJSONDictionary:error:", v99, &v177);
          v100 = v177;
          if (!v100)
          {

LABEL_39:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pseEvents"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v27, "isEqual:", v28);

            if (v29)
            {

              v27 = 0;
            }
            else
            {
              v7 = v154;
              if (v27)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  obj = v27;
                  if (!a4)
                  {
                    v36 = 0;
                    self = v153;
                    v32 = v165;
                    v63 = v161;
                    v66 = v150;
                    goto LABEL_122;
                  }
                  v113 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v114 = *MEMORY[0x1E0D025B8];
                  v193 = *MEMORY[0x1E0CB2D50];
                  v152 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("pseEvents"));
                  v194 = v152;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v194, &v193, 1);
                  v115 = objc_claimAutoreleasedReturnValue();
                  v116 = v113;
                  v7 = v154;
                  v117 = v114;
                  v118 = (void *)v115;
                  v36 = 0;
                  *a4 = (id)objc_msgSend(v116, "initWithDomain:code:userInfo:", v117, 2, v115);
                  goto LABEL_106;
                }
              }
            }
            v152 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v27, "count"));
            v173 = 0u;
            v174 = 0u;
            v175 = 0u;
            v176 = 0u;
            v89 = v27;
            v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v173, v192, 16);
            obj = v89;
            if (!v90)
              goto LABEL_78;
            v91 = v90;
            v92 = *(_QWORD *)v174;
LABEL_70:
            v93 = 0;
            while (1)
            {
              if (*(_QWORD *)v174 != v92)
                objc_enumerationMutation(obj);
              v94 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * v93);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                break;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (a4)
                {
                  v107 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v108 = *MEMORY[0x1E0D025B8];
                  v188 = *MEMORY[0x1E0CB2D50];
                  v110 = a4;
                  v95 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("pseEvents"));
                  v189 = v95;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v189, &v188, 1);
                  v109 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_98;
                }
                goto LABEL_105;
              }
              v95 = v94;
              v96 = [BMSiriPostSiriEngagementSignal alloc];
              v172 = 0;
              v97 = -[BMSiriPostSiriEngagementSignal initWithJSONDictionary:error:](v96, "initWithJSONDictionary:error:", v95, &v172);
              v98 = v172;
              if (v98)
              {
                v111 = v98;
                if (v167)
                  *v167 = objc_retainAutorelease(v98);

                v36 = 0;
                goto LABEL_102;
              }
              objc_msgSend(v152, "addObject:", v97);

              ++v93;
              a4 = v167;
              if (v91 == v93)
              {
                v89 = obj;
                v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v173, v192, 16);
                if (v91)
                  goto LABEL_70;
LABEL_78:

                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientSessionId"));
                v95 = (id)objc_claimAutoreleasedReturnValue();
                if (v95)
                {
                  objc_opt_class();
                  v7 = v154;
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v148 = 0;
                    goto LABEL_108;
                  }
                  objc_opt_class();
                  v9 = v160;
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v148 = v95;
                    goto LABEL_109;
                  }
                  if (v167)
                  {
                    v149 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v124 = *MEMORY[0x1E0D025B8];
                    v186 = *MEMORY[0x1E0CB2D50];
                    v125 = objc_alloc(MEMORY[0x1E0CB3940]);
                    v142 = objc_opt_class();
                    v126 = v125;
                    v7 = v154;
                    v111 = (id)objc_msgSend(v126, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v142, CFSTR("clientSessionId"));
                    v187 = v111;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v187, &v186, 1);
                    v147 = (void *)objc_claimAutoreleasedReturnValue();
                    v127 = (id)objc_msgSend(v149, "initWithDomain:code:userInfo:", v124, 2);
                    v36 = 0;
                    v148 = 0;
                    *v167 = v127;
                    goto LABEL_150;
                  }
                  v148 = 0;
                  v36 = 0;
                  v32 = v165;
LABEL_120:

                  v63 = v161;
                  v118 = v148;
                  v66 = v150;
LABEL_121:

                  self = v153;
LABEL_122:

LABEL_123:
LABEL_124:

LABEL_125:
                  v74 = v158;
                  v8 = v159;
LABEL_126:

LABEL_127:
                  v44 = v163;
LABEL_128:

                  goto LABEL_129;
                }
                v148 = 0;
                v7 = v154;
LABEL_108:
                v9 = v160;
LABEL_109:
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastRequestId"));
                v119 = objc_claimAutoreleasedReturnValue();
                v147 = (void *)v119;
                if (!v119 || (v120 = (void *)v119, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v111 = 0;
                  goto LABEL_112;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v111 = v120;
LABEL_112:
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("executionUUID"));
                  v121 = (id)objc_claimAutoreleasedReturnValue();
                  v155 = v121;
                  if (!v121)
                  {
LABEL_115:
                    v32 = v165;
                    goto LABEL_116;
                  }
                  v122 = v121;
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v121 = 0;
                    goto LABEL_115;
                  }
                  objc_opt_class();
                  v32 = v165;
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v121 = v122;
LABEL_116:
                    v145 = v121;
                    v36 = -[BMSiriPostSiriEngagement initWithUISessionID:taskID:taskType:conversationPath:appPattern:requestIds:engagementUnderstandingFeatures:pseEvents:clientSessionId:lastRequestId:executionUUID:](v153, "initWithUISessionID:taskID:taskType:conversationPath:appPattern:requestIds:engagementUnderstandingFeatures:pseEvents:clientSessionId:lastRequestId:executionUUID:", v159, v32, v163, v161, v158, v19, v151, v152, v148, v111, v121);
                    v153 = v36;
                  }
                  else
                  {
                    if (v167)
                    {
                      v146 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v144 = *MEMORY[0x1E0D025B8];
                      v182 = *MEMORY[0x1E0CB2D50];
                      v135 = v7;
                      v136 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("executionUUID"));
                      v183 = v136;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v183, &v182, 1);
                      v137 = (void *)objc_claimAutoreleasedReturnValue();
                      *v167 = (id)objc_msgSend(v146, "initWithDomain:code:userInfo:", v144, 2, v137);

                      v7 = v135;
                    }
                    v145 = 0;
                    v36 = 0;
                  }
LABEL_117:

                }
                else
                {
                  if (v167)
                  {
                    v156 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v128 = *MEMORY[0x1E0D025B8];
                    v184 = *MEMORY[0x1E0CB2D50];
                    v129 = v7;
                    v130 = objc_alloc(MEMORY[0x1E0CB3940]);
                    v143 = objc_opt_class();
                    v131 = v130;
                    v7 = v129;
                    v145 = (void *)objc_msgSend(v131, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v143, CFSTR("lastRequestId"));
                    v185 = v145;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v185, &v184, 1);
                    v132 = objc_claimAutoreleasedReturnValue();
                    v133 = v156;
                    v155 = (void *)v132;
                    v134 = (id)objc_msgSend(v133, "initWithDomain:code:userInfo:", v128, 2);
                    v36 = 0;
                    v111 = 0;
                    *v167 = v134;
                    v32 = v165;
                    goto LABEL_117;
                  }
                  v111 = 0;
                  v36 = 0;
LABEL_150:
                  v32 = v165;
                }

LABEL_119:
                goto LABEL_120;
              }
            }
            if (a4)
            {
              v107 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v108 = *MEMORY[0x1E0D025B8];
              v190 = *MEMORY[0x1E0CB2D50];
              v95 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("pseEvents"));
              v191 = v95;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v191, &v190, 1);
              v109 = objc_claimAutoreleasedReturnValue();
              v110 = a4;
LABEL_98:
              v111 = (id)v109;
              v112 = (id)objc_msgSend(v107, "initWithDomain:code:userInfo:", v108, 2, v109);
              v36 = 0;
              *v110 = v112;
LABEL_102:
              v7 = v154;
              v148 = obj;
              v9 = v160;
              v32 = v165;
              goto LABEL_119;
            }
LABEL_105:
            v36 = 0;
            v7 = v154;
            v118 = obj;
            v9 = v160;
LABEL_106:
            v32 = v165;
            v63 = v161;
            v66 = v150;
            goto LABEL_121;
          }
          v101 = v100;
          self = v153;
          if (a4)
            *a4 = objc_retainAutorelease(v100);

          v36 = 0;
          obj = v99;
          v66 = v99;
          v7 = v154;
        }
        else
        {
          if (!a4)
          {
            v36 = 0;
            self = v153;
            v7 = v154;
            v63 = v161;
            v32 = v165;
            v66 = v150;
            goto LABEL_123;
          }
          v102 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v103 = *MEMORY[0x1E0D025B8];
          v195 = *MEMORY[0x1E0CB2D50];
          v104 = a4;
          v105 = objc_alloc(MEMORY[0x1E0CB3940]);
          v141 = objc_opt_class();
          v106 = v105;
          v66 = v150;
          v151 = (BMSiriPostSiriEngagementFeatures *)objc_msgSend(v106, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v141, CFSTR("engagementUnderstandingFeatures"));
          v196 = v151;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v196, &v195, 1);
          obj = (id)objc_claimAutoreleasedReturnValue();
          v36 = 0;
          *v104 = (id)objc_msgSend(v102, "initWithDomain:code:userInfo:", v103, 2);
          self = v153;
          v7 = v154;
        }
        v32 = v165;
        goto LABEL_56;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v163 = v11;
        goto LABEL_10;
      }
      if (a4)
      {
        v52 = v8;
        v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v169 = a4;
        v54 = v9;
        v55 = *MEMORY[0x1E0D025B8];
        v208 = *MEMORY[0x1E0CB2D50];
        v56 = v7;
        v57 = objc_alloc(MEMORY[0x1E0CB3940]);
        v139 = objc_opt_class();
        v58 = v57;
        v7 = v56;
        v59 = objc_msgSend(v58, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v139, CFSTR("taskType"));
        v209 = v59;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v209, &v208, 1);
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = v53;
        v8 = v52;
        v62 = v55;
        v9 = v54;
        v63 = (void *)v59;
        v164 = (void *)v60;
        v44 = 0;
        v36 = 0;
        *v169 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v62, 2);
        v32 = v165;
        goto LABEL_128;
      }
      v44 = 0;
      v36 = 0;
      v32 = v165;
LABEL_129:

      goto LABEL_130;
    }
    if (a4)
    {
      v37 = v8;
      v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v168 = a4;
      v39 = v9;
      v40 = *MEMORY[0x1E0D025B8];
      v210 = *MEMORY[0x1E0CB2D50];
      v41 = v7;
      v42 = objc_alloc(MEMORY[0x1E0CB3940]);
      v138 = objc_opt_class();
      v43 = v42;
      v7 = v41;
      v44 = (void *)objc_msgSend(v43, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v138, CFSTR("taskID"));
      v211 = v44;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v211, &v210, 1);
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = v38;
      v8 = v37;
      v47 = v40;
      v9 = v39;
      v166 = (void *)v45;
      v32 = 0;
      v36 = 0;
      *v168 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 2);
      goto LABEL_129;
    }
    v32 = 0;
    v36 = 0;
LABEL_130:

    goto LABEL_131;
  }
  if (a4)
  {
    v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v31 = *MEMORY[0x1E0D025B8];
    v212 = *MEMORY[0x1E0CB2D50];
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("UISessionID"));
    v213[0] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v213, &v212, 1);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v31;
    v9 = (void *)v33;
    v35 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v34, 2, v33);
    v8 = 0;
    v36 = 0;
    *a4 = v35;
    goto LABEL_130;
  }
  v8 = 0;
  v36 = 0;
LABEL_131:

  return v36;
}

- (id)_requestIdsJSONArray
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
  -[BMSiriPostSiriEngagement requestIds](self, "requestIds", 0);
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

- (id)_pseEventsJSONArray
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
  -[BMSiriPostSiriEngagement pseEvents](self, "pseEvents", 0);
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
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[11];
  _QWORD v38[13];

  v38[11] = *MEMORY[0x1E0C80C00];
  -[BMSiriPostSiriEngagement UISessionID](self, "UISessionID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagement taskID](self, "taskID");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagement taskType](self, "taskType");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagement conversationPath](self, "conversationPath");
  v6 = objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagement appPattern](self, "appPattern");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagement _requestIdsJSONArray](self, "_requestIdsJSONArray");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagement engagementUnderstandingFeatures](self, "engagementUnderstandingFeatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "jsonDictionary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSiriPostSiriEngagement _pseEventsJSONArray](self, "_pseEventsJSONArray");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagement clientSessionId](self, "clientSessionId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagement lastRequestId](self, "lastRequestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriPostSiriEngagement executionUUID](self, "executionUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = CFSTR("UISessionID");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v12;
  v38[0] = v12;
  v37[1] = CFSTR("taskID");
  v13 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v13;
  v38[1] = v13;
  v37[2] = CFSTR("taskType");
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v14;
  v38[2] = v14;
  v37[3] = CFSTR("conversationPath");
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v3;
  v25 = (void *)v15;
  v38[3] = v15;
  v37[4] = CFSTR("appPattern");
  v16 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v4;
  v24 = (void *)v16;
  v38[4] = v16;
  v37[5] = CFSTR("requestIds");
  v17 = v36;
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v5;
  v38[5] = v17;
  v37[6] = CFSTR("engagementUnderstandingFeatures");
  v18 = v35;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v6;
  v38[6] = v18;
  v37[7] = CFSTR("pseEvents");
  v19 = v34;
  if (!v34)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[7] = v19;
  v37[8] = CFSTR("clientSessionId");
  v20 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[8] = v20;
  v37[9] = CFSTR("lastRequestId");
  v21 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[9] = v21;
  v37[10] = CFSTR("executionUUID");
  v22 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[10] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 11);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      goto LABEL_25;
LABEL_40:

    if (v9)
      goto LABEL_26;
    goto LABEL_41;
  }

  if (!v10)
    goto LABEL_40;
LABEL_25:
  if (v9)
    goto LABEL_26;
LABEL_41:

LABEL_26:
  if (!v34)

  if (!v35)
  if (!v36)

  if (!v7)
  if (v30)
  {
    if (v31)
      goto LABEL_36;
  }
  else
  {

    if (v31)
    {
LABEL_36:
      if (v32)
        goto LABEL_37;
LABEL_44:

      if (v33)
        goto LABEL_38;
LABEL_45:

      goto LABEL_38;
    }
  }

  if (!v32)
    goto LABEL_44;
LABEL_37:
  if (!v33)
    goto LABEL_45;
LABEL_38:

  return v29;
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
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  void *v68;
  void *v69;
  void *v70;
  void *v71;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriPostSiriEngagement UISessionID](self, "UISessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UISessionID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriPostSiriEngagement UISessionID](self, "UISessionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UISessionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_41;
    }
    -[BMSiriPostSiriEngagement taskID](self, "taskID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriPostSiriEngagement taskID](self, "taskID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "taskID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_41;
    }
    -[BMSiriPostSiriEngagement taskType](self, "taskType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskType");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSiriPostSiriEngagement taskType](self, "taskType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "taskType");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_41;
    }
    -[BMSiriPostSiriEngagement conversationPath](self, "conversationPath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conversationPath");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMSiriPostSiriEngagement conversationPath](self, "conversationPath");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "conversationPath");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_41;
    }
    -[BMSiriPostSiriEngagement appPattern](self, "appPattern");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appPattern");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMSiriPostSiriEngagement appPattern](self, "appPattern");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appPattern");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_41;
    }
    -[BMSiriPostSiriEngagement requestIds](self, "requestIds");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestIds");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMSiriPostSiriEngagement requestIds](self, "requestIds");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "requestIds");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_41;
    }
    -[BMSiriPostSiriEngagement engagementUnderstandingFeatures](self, "engagementUnderstandingFeatures");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "engagementUnderstandingFeatures");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMSiriPostSiriEngagement engagementUnderstandingFeatures](self, "engagementUnderstandingFeatures");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "engagementUnderstandingFeatures");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_41;
    }
    -[BMSiriPostSiriEngagement pseEvents](self, "pseEvents");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pseEvents");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v49 == (void *)v50)
    {

    }
    else
    {
      v51 = (void *)v50;
      -[BMSiriPostSiriEngagement pseEvents](self, "pseEvents");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pseEvents");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "isEqual:", v53);

      if (!v54)
        goto LABEL_41;
    }
    -[BMSiriPostSiriEngagement clientSessionId](self, "clientSessionId");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientSessionId");
    v56 = objc_claimAutoreleasedReturnValue();
    if (v55 == (void *)v56)
    {

    }
    else
    {
      v57 = (void *)v56;
      -[BMSiriPostSiriEngagement clientSessionId](self, "clientSessionId");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientSessionId");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "isEqual:", v59);

      if (!v60)
        goto LABEL_41;
    }
    -[BMSiriPostSiriEngagement lastRequestId](self, "lastRequestId");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastRequestId");
    v62 = objc_claimAutoreleasedReturnValue();
    if (v61 == (void *)v62)
    {

    }
    else
    {
      v63 = (void *)v62;
      -[BMSiriPostSiriEngagement lastRequestId](self, "lastRequestId");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastRequestId");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v64, "isEqual:", v65);

      if (!v66)
      {
LABEL_41:
        v12 = 0;
LABEL_42:

        goto LABEL_43;
      }
    }
    -[BMSiriPostSiriEngagement executionUUID](self, "executionUUID");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "executionUUID");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68 == v69)
    {
      v12 = 1;
    }
    else
    {
      -[BMSiriPostSiriEngagement executionUUID](self, "executionUUID");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "executionUUID");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v70, "isEqual:", v71);

    }
    goto LABEL_42;
  }
  v12 = 0;
LABEL_43:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)UISessionID
{
  return self->_UISessionID;
}

- (NSString)taskID
{
  return self->_taskID;
}

- (NSString)taskType
{
  return self->_taskType;
}

- (NSString)conversationPath
{
  return self->_conversationPath;
}

- (NSString)appPattern
{
  return self->_appPattern;
}

- (NSArray)requestIds
{
  return self->_requestIds;
}

- (BMSiriPostSiriEngagementFeatures)engagementUnderstandingFeatures
{
  return self->_engagementUnderstandingFeatures;
}

- (NSArray)pseEvents
{
  return self->_pseEvents;
}

- (NSString)clientSessionId
{
  return self->_clientSessionId;
}

- (NSString)lastRequestId
{
  return self->_lastRequestId;
}

- (NSString)executionUUID
{
  return self->_executionUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionUUID, 0);
  objc_storeStrong((id *)&self->_lastRequestId, 0);
  objc_storeStrong((id *)&self->_clientSessionId, 0);
  objc_storeStrong((id *)&self->_pseEvents, 0);
  objc_storeStrong((id *)&self->_engagementUnderstandingFeatures, 0);
  objc_storeStrong((id *)&self->_requestIds, 0);
  objc_storeStrong((id *)&self->_appPattern, 0);
  objc_storeStrong((id *)&self->_conversationPath, 0);
  objc_storeStrong((id *)&self->_taskType, 0);
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_UISessionID, 0);
}

+ (unsigned)latestDataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;
  _DWORD *v8;

  v5 = a3;
  if (a4 == 1)
  {
    v6 = off_1E5E4B4D8;
  }
  else
  {
    if (a4)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = off_1E5E4B500;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v5);
  v8 = (_DWORD *)objc_msgSend(objc_alloc(*v6), "initByReadFrom:", v7);
  v8[4] = a4;

LABEL_7:
  return v8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("UISessionID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("taskID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("taskType"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("conversationPath"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appPattern"), 2, 0, 5, 13, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("requestIds_json"), 5, 1, &__block_literal_global_365);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("engagementUnderstandingFeatures_json"), 5, 1, &__block_literal_global_366);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("pseEvents_json"), 5, 1, &__block_literal_global_367_64447);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientSessionId"), 2, 0, 9, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("lastRequestId"), 2, 0, 10, 13, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("executionUUID"), 2, 0, 11, 13, 0);
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
  return &unk_1E5F1EFD0;
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
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("UISessionID"), 1, 13, 0);
  v15[0] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("taskID"), 2, 13, 0);
  v15[1] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("taskType"), 3, 13, 0);
  v15[2] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("conversationPath"), 4, 13, 0);
  v15[3] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appPattern"), 5, 13, 0);
  v15[4] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("requestIds"), 6, 13, 0);
  v15[5] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("engagementUnderstandingFeatures"), 7, 14, objc_opt_class());
  v15[6] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("pseEvents"), 8, 14, objc_opt_class());
  v15[7] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientSessionId"), 9, 13, 0);
  v15[8] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("lastRequestId"), 10, 13, 0);
  v15[9] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("executionUUID"), 11, 13, 0);
  v15[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __35__BMSiriPostSiriEngagement_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pseEventsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __35__BMSiriPostSiriEngagement_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "engagementUnderstandingFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __35__BMSiriPostSiriEngagement_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_requestIdsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
