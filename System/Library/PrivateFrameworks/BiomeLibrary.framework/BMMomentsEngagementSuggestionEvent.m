@implementation BMMomentsEngagementSuggestionEvent

- (BMMomentsEngagementSuggestionEvent)initWithType:(int)a3 timestamp:(id)a4 fullBundleOrderedSet:(id)a5 clientIdentifier:(id)a6 viewContainerName:(id)a7 viewVisibleTime:(id)a8
{
  return -[BMMomentsEngagementSuggestionEvent initWithType:timestamp:fullBundleOrderedSet:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:notificationInfo:](self, "initWithType:timestamp:fullBundleOrderedSet:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:notificationInfo:", *(_QWORD *)&a3, a4, a5, a6, a7, a8, 0, 0, 0, 0);
}

- (BMMomentsEngagementSuggestionEvent)initWithType:(int)a3 timestamp:(id)a4 fullBundleOrderedSet:(id)a5 clientIdentifier:(id)a6 viewContainerName:(id)a7 viewVisibleTime:(id)a8 suggestionType:(id)a9 viewVisibleSuggestionsCount:(id)a10 viewTotalSuggestionsCount:(id)a11
{
  return -[BMMomentsEngagementSuggestionEvent initWithType:timestamp:fullBundleOrderedSet:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:notificationInfo:](self, "initWithType:timestamp:fullBundleOrderedSet:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:notificationInfo:", *(_QWORD *)&a3, a4, a5, a6, a7, a8, a9, a10, a11, 0);
}

- (BMMomentsEngagementSuggestionEvent)initWithType:(int)a3 timestamp:(id)a4 fullBundleOrderedSet:(id)a5 clientIdentifier:(id)a6 viewContainerName:(id)a7 viewVisibleTime:(id)a8 suggestionType:(id)a9 viewVisibleSuggestionsCount:(id)a10 viewTotalSuggestionsCount:(id)a11 notificationInfo:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  BMMomentsEngagementSuggestionEvent *v23;
  double v24;
  float v25;
  double v26;
  int v27;
  int v28;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v17 = a4;
  v34 = a5;
  v33 = a6;
  v32 = a7;
  v18 = a8;
  v31 = a9;
  v19 = a10;
  v20 = a11;
  v21 = v17;
  v22 = a12;
  v35.receiver = self;
  v35.super_class = (Class)BMMomentsEngagementSuggestionEvent;
  v23 = -[BMEventBase init](&v35, sel_init);
  if (v23)
  {
    v23->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v23->_type = a3;
    if (v21)
    {
      v23->_hasRaw_timestamp = 1;
      objc_msgSend(v21, "timeIntervalSince1970");
    }
    else
    {
      v23->_hasRaw_timestamp = 0;
      v24 = -1.0;
    }
    v23->_raw_timestamp = v24;
    objc_storeStrong((id *)&v23->_fullBundleOrderedSet, a5);
    objc_storeStrong((id *)&v23->_clientIdentifier, a6);
    objc_storeStrong((id *)&v23->_viewContainerName, a7);
    if (v18)
    {
      v23->_hasViewVisibleTime = 1;
      objc_msgSend(v18, "floatValue");
      v26 = v25;
    }
    else
    {
      v23->_hasViewVisibleTime = 0;
      v26 = -1.0;
    }
    v23->_viewVisibleTime = v26;
    objc_storeStrong((id *)&v23->_suggestionType, a9);
    if (v19)
    {
      v23->_hasViewVisibleSuggestionsCount = 1;
      v27 = objc_msgSend(v19, "intValue");
    }
    else
    {
      v23->_hasViewVisibleSuggestionsCount = 0;
      v27 = -1;
    }
    v23->_viewVisibleSuggestionsCount = v27;
    if (v20)
    {
      v23->_hasViewTotalSuggestionsCount = 1;
      v28 = objc_msgSend(v20, "intValue");
    }
    else
    {
      v23->_hasViewTotalSuggestionsCount = 0;
      v28 = -1;
    }
    v23->_viewTotalSuggestionsCount = v28;
    objc_storeStrong((id *)&v23->_notificationInfo, a12);
  }

  return v23;
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
  void *v14;
  id v15;
  id v16;

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMMomentsEngagementSuggestionTypeAsString(-[BMMomentsEngagementSuggestionEvent type](self, "type"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementSuggestionEvent timestamp](self, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementSuggestionEvent fullBundleOrderedSet](self, "fullBundleOrderedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementSuggestionEvent clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementSuggestionEvent viewContainerName](self, "viewContainerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEngagementSuggestionEvent viewVisibleTime](self, "viewVisibleTime");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementSuggestionEvent suggestionType](self, "suggestionType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEngagementSuggestionEvent viewVisibleSuggestionsCount](self, "viewVisibleSuggestionsCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEngagementSuggestionEvent viewTotalSuggestionsCount](self, "viewTotalSuggestionsCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementSuggestionEvent notificationInfo](self, "notificationInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "initWithFormat:", CFSTR("BMMomentsEngagementSuggestionEvent with type: %@, timestamp: %@, fullBundleOrderedSet: %@, clientIdentifier: %@, viewContainerName: %@, viewVisibleTime: %@, suggestionType: %@, viewVisibleSuggestionsCount: %@, viewTotalSuggestionsCount: %@, notificationInfo: %@"), v14, v3, v4, v5, v6, v8, v9, v10, v11, v12);

  return (NSString *)v16;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMomentsEngagementSuggestionEvent *v5;
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
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  unint64_t v31;
  double v32;
  int *v33;
  int *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  float v41;
  void *v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  BMMomentsEngagementNotificationInfo *v56;
  BMMomentsEngagementNotificationInfo *notificationInfo;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSArray *fullBundleOrderedSet;
  int v62;
  BMMomentsEngagementSuggestionEvent *v63;
  objc_super v65;
  uint64_t v66;
  uint64_t v67;

  v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)BMMomentsEngagementSuggestionEvent;
  v5 = -[BMEventBase init](&v65, sel_init);
  if (!v5)
    goto LABEL_82;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
    v11 = (int *)MEMORY[0x1E0D82BB8];
    v12 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
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
        v19 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v17);
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
          v23 = 0;
          v24 = 0;
          v25 = 0;
          while (1)
          {
            v26 = *v7;
            v27 = *(_QWORD *)&v4[v26];
            v28 = v27 + 1;
            if (v27 == -1 || v28 > *(_QWORD *)&v4[*v8])
              break;
            v29 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v27);
            *(_QWORD *)&v4[v26] = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if ((v29 & 0x80) == 0)
              goto LABEL_60;
            v23 += 7;
            v20 = v24++ >= 9;
            if (v20)
            {
              LODWORD(v25) = 0;
              goto LABEL_62;
            }
          }
          v4[*v9] = 1;
LABEL_60:
          if (v4[*v9])
            LODWORD(v25) = 0;
LABEL_62:
          if (v25 >= 0x20)
            LODWORD(v25) = 0;
          *(_DWORD *)((char *)&v5->super.super.isa + v10[536]) = v25;
          continue;
        case 2u:
          *((_BYTE *)&v5->super.super.isa + v12[537]) = 1;
          v30 = *v7;
          v31 = *(_QWORD *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v32 = *(double *)(*(_QWORD *)&v4[*v11] + v31);
            *(_QWORD *)&v4[v30] = v31 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v32 = 0.0;
          }
          v59 = 24;
          goto LABEL_78;
        case 3u:
          v66 = 0;
          v67 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_84;
          v33 = v12;
          v34 = v10;
          v35 = -[BMMomentsEngagementBundleSummary initByReadFrom:]([BMMomentsEngagementBundleSummary alloc], "initByReadFrom:", v4);
          if (!v35)
            goto LABEL_84;
          v36 = v35;
          objc_msgSend(v6, "addObject:", v35);
          PBReaderRecallMark();

          v10 = v34;
          v12 = v33;
          continue;
        case 4u:
          PBReaderReadString();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = 64;
          goto LABEL_41;
        case 5u:
          PBReaderReadString();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = 72;
          goto LABEL_41;
        case 6u:
          v5->_hasViewVisibleTime = 1;
          v39 = *v7;
          v40 = *(_QWORD *)&v4[v39];
          if (v40 <= 0xFFFFFFFFFFFFFFFBLL && v40 + 4 <= *(_QWORD *)&v4[*v8])
          {
            v41 = *(float *)(*(_QWORD *)&v4[*v11] + v40);
            *(_QWORD *)&v4[v39] = v40 + 4;
          }
          else
          {
            v4[*v9] = 1;
            v41 = 0.0;
          }
          v32 = v41;
          v59 = 80;
LABEL_78:
          *(double *)((char *)&v5->super.super.isa + v59) = v32;
          continue;
        case 7u:
          PBReaderReadString();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = 88;
LABEL_41:
          v42 = *(Class *)((char *)&v5->super.super.isa + v38);
          *(Class *)((char *)&v5->super.super.isa + v38) = (Class)v37;

          continue;
        case 8u:
          v43 = 0;
          v44 = 0;
          v45 = 0;
          v5->_hasViewVisibleSuggestionsCount = 1;
          while (2)
          {
            v46 = *v7;
            v47 = *(_QWORD *)&v4[v46];
            v48 = v47 + 1;
            if (v47 == -1 || v48 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v49 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v47);
              *(_QWORD *)&v4[v46] = v48;
              v45 |= (unint64_t)(v49 & 0x7F) << v43;
              if (v49 < 0)
              {
                v43 += 7;
                v20 = v44++ >= 9;
                if (v20)
                {
                  LODWORD(v45) = 0;
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v45) = 0;
LABEL_68:
          v58 = 44;
          goto LABEL_73;
        case 9u:
          v50 = 0;
          v51 = 0;
          v45 = 0;
          v5->_hasViewTotalSuggestionsCount = 1;
          break;
        case 0xAu:
          v66 = 0;
          v67 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_84;
          v56 = -[BMMomentsEngagementNotificationInfo initByReadFrom:]([BMMomentsEngagementNotificationInfo alloc], "initByReadFrom:", v4);
          if (!v56)
            goto LABEL_84;
          notificationInfo = v5->_notificationInfo;
          v5->_notificationInfo = v56;

          PBReaderRecallMark();
          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_84:

          goto LABEL_81;
      }
      while (1)
      {
        v52 = *v7;
        v53 = *(_QWORD *)&v4[v52];
        v54 = v53 + 1;
        if (v53 == -1 || v54 > *(_QWORD *)&v4[*v8])
          break;
        v55 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v53);
        *(_QWORD *)&v4[v52] = v54;
        v45 |= (unint64_t)(v55 & 0x7F) << v50;
        if ((v55 & 0x80) == 0)
          goto LABEL_70;
        v50 += 7;
        v20 = v51++ >= 9;
        if (v20)
        {
          LODWORD(v45) = 0;
          goto LABEL_72;
        }
      }
      v4[*v9] = 1;
LABEL_70:
      if (v4[*v9])
        LODWORD(v45) = 0;
LABEL_72:
      v58 = 48;
LABEL_73:
      *(_DWORD *)((char *)&v5->super.super.isa + v58) = v45;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v60 = objc_msgSend(v6, "copy");
  fullBundleOrderedSet = v5->_fullBundleOrderedSet;
  v5->_fullBundleOrderedSet = (NSArray *)v60;

  v62 = v4[*v9];
  if (v62)
LABEL_81:
    v63 = 0;
  else
LABEL_82:
    v63 = v5;

  return v63;
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
  PBDataWriterWriteUint32Field();
  if (self->_hasRaw_timestamp)
    PBDataWriterWriteDoubleField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_fullBundleOrderedSet;
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

  if (self->_clientIdentifier)
    PBDataWriterWriteStringField();
  if (self->_viewContainerName)
    PBDataWriterWriteStringField();
  if (self->_hasViewVisibleTime)
    PBDataWriterWriteFloatField();
  if (self->_suggestionType)
    PBDataWriterWriteStringField();
  if (self->_hasViewVisibleSuggestionsCount)
    PBDataWriterWriteInt32Field();
  if (self->_hasViewTotalSuggestionsCount)
    PBDataWriterWriteInt32Field();
  if (self->_notificationInfo)
  {
    PBDataWriterPlaceMark();
    -[BMMomentsEngagementNotificationInfo writeTo:](self->_notificationInfo, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMomentsEngagementSuggestionEvent writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMomentsEngagementSuggestionEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;
  id v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  BMMomentsEngagementBundleSummary *v27;
  BMMomentsEngagementBundleSummary *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  id *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id *v38;
  uint64_t *v39;
  id v40;
  BMMomentsEngagementSuggestionEvent *v41;
  id *v42;
  id v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  BMMomentsEngagementNotificationInfo *v62;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  uint64_t v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  id v78;
  id v79;
  BMMomentsEngagementNotificationInfo *v80;
  id v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  id v105;
  void *v106;
  id v107;
  id v108;
  void *v109;
  id v110;
  void *v111;
  BMMomentsEngagementSuggestionEvent *v112;
  id v113;
  id v114;
  void *v115;
  void *v116;
  id *v117;
  void *v119;
  void *v120;
  id v121;
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  uint64_t v127;
  BMMomentsEngagementNotificationInfo *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  id v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  id v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  id v140;
  uint64_t v141;
  id v142;
  uint64_t v143;
  id v144;
  _BYTE v145[128];
  uint64_t v146;
  void *v147;
  uint64_t v148;
  id v149;
  uint64_t v150;
  _QWORD v151[3];

  v151[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v117 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v42 = a4;
        if (a4)
        {
          v46 = v6;
          v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v48 = *MEMORY[0x1E0D025B8];
          v150 = *MEMORY[0x1E0CB2D50];
          v49 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("type"));
          v151[0] = v49;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v151, &v150, 1);
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = v47;
          v6 = v46;
          v9 = (void *)v49;
          v52 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v48, 2, v50);
          v42 = 0;
          v41 = 0;
          *a4 = v52;
          v8 = (void *)v50;
          goto LABEL_85;
        }
        v41 = 0;
        goto LABEL_86;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEngagementSuggestionTypeFromString(v6));
      v117 = (id *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v117 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v7 = objc_claimAutoreleasedReturnValue();
  v116 = (void *)v7;
  if (!v7 || (v8 = (void *)v7, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (objc_class *)MEMORY[0x1E0C99D68];
    v11 = v6;
    v12 = v8;
    v13 = [v10 alloc];
    objc_msgSend(v12, "doubleValue");
    v15 = v14;

    v6 = v11;
    v16 = (id)objc_msgSend(v13, "initWithTimeIntervalSince1970:", v15);
LABEL_11:
    v9 = v16;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    objc_msgSend(v17, "dateFromString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fullBundleOrderedSet"));
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    v115 = v9;
    if (v20)
    {
      v111 = v6;
      v112 = self;

      v18 = 0;
    }
    else
    {
      if (v18)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v41 = 0;
            v42 = v117;
            goto LABEL_84;
          }
          v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v44 = *MEMORY[0x1E0D025B8];
          v146 = *MEMORY[0x1E0CB2D50];
          v119 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("fullBundleOrderedSet"));
          v147 = v119;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1);
          v30 = (id)objc_claimAutoreleasedReturnValue();
          v45 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v30);
          v41 = 0;
          *a4 = v45;
          goto LABEL_49;
        }
      }
      v111 = v6;
      v112 = self;
    }
    v119 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v18, "count"));
    v123 = 0u;
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v18 = v18;
    v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v123, v145, 16);
    if (!v21)
      goto LABEL_31;
    v22 = v21;
    v23 = *(_QWORD *)v124;
    v110 = v5;
LABEL_23:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v124 != v23)
        objc_enumerationMutation(v18);
      v25 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v24);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v34 = a4;
        if (a4)
        {
          v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v36 = *MEMORY[0x1E0D025B8];
          v141 = *MEMORY[0x1E0CB2D50];
          v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("fullBundleOrderedSet"));
          v142 = v26;
          v37 = (void *)MEMORY[0x1E0C99D80];
          v38 = &v142;
          v39 = &v141;
          goto LABEL_41;
        }
        goto LABEL_48;
      }
      v26 = v25;
      v27 = [BMMomentsEngagementBundleSummary alloc];
      v122 = 0;
      v28 = -[BMMomentsEngagementBundleSummary initWithJSONDictionary:error:](v27, "initWithJSONDictionary:error:", v26, &v122);
      v29 = v122;
      if (v29)
      {
        v33 = v29;
        if (a4)
          *a4 = objc_retainAutorelease(v29);

        v41 = 0;
        goto LABEL_45;
      }
      objc_msgSend(v119, "addObject:", v28);

      if (v22 == ++v24)
      {
        v22 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v123, v145, 16);
        v5 = v110;
        if (v22)
          goto LABEL_23;
LABEL_31:

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
        v26 = (id)objc_claimAutoreleasedReturnValue();
        if (!v26 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v30 = 0;
          goto LABEL_34;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v30 = v26;
LABEL_34:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("viewContainerName"));
          v31 = objc_claimAutoreleasedReturnValue();
          v9 = v115;
          v109 = (void *)v31;
          if (!v31)
          {
            v33 = 0;
            self = v112;
            goto LABEL_57;
          }
          v32 = (void *)v31;
          objc_opt_class();
          self = v112;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v33 = 0;
LABEL_57:
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("viewVisibleTime"));
            v53 = objc_claimAutoreleasedReturnValue();
            v106 = (void *)v53;
            v107 = v30;
            if (v53)
            {
              v54 = (void *)v53;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v108 = v54;
                  goto LABEL_60;
                }
                if (a4)
                {
                  v83 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v84 = *MEMORY[0x1E0D025B8];
                  v135 = *MEMORY[0x1E0CB2D50];
                  v113 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("viewVisibleTime"));
                  v136 = v113;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
                  v85 = objc_claimAutoreleasedReturnValue();
                  v86 = v84;
                  v30 = v107;
                  v104 = (void *)v85;
                  v41 = 0;
                  v108 = 0;
                  *a4 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v86, 2);
                  v6 = v111;
                  v42 = v117;
                  goto LABEL_77;
                }
                v108 = 0;
                v41 = 0;
                v6 = v111;
                v42 = v117;
                goto LABEL_78;
              }
            }
            v108 = 0;
LABEL_60:
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("suggestionType"));
            v55 = objc_claimAutoreleasedReturnValue();
            v104 = (void *)v55;
            if (v55)
            {
              v56 = (void *)v55;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v113 = v56;
                  goto LABEL_63;
                }
                if (a4)
                {
                  v114 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v87 = *MEMORY[0x1E0D025B8];
                  v133 = *MEMORY[0x1E0CB2D50];
                  v105 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("suggestionType"));
                  v134 = v105;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  v88 = (id)objc_msgSend(v114, "initWithDomain:code:userInfo:", v87, 2);
                  v41 = 0;
                  v113 = 0;
                  *a4 = v88;
                  v6 = v111;
                  v42 = v117;
                  goto LABEL_76;
                }
                v113 = 0;
                v41 = 0;
                v6 = v111;
                v42 = v117;
                goto LABEL_77;
              }
            }
            v113 = 0;
LABEL_63:
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("viewVisibleSuggestionsCount"));
            v57 = objc_claimAutoreleasedReturnValue();
            v101 = (void *)v57;
            if (v57 && (v58 = (void *)v57, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v105 = v58;
                goto LABEL_66;
              }
              if (!a4)
              {
                v105 = 0;
                v41 = 0;
                v6 = v111;
                v42 = v117;
                goto LABEL_76;
              }
              v89 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v90 = *MEMORY[0x1E0D025B8];
              v131 = *MEMORY[0x1E0CB2D50];
              v102 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("viewVisibleSuggestionsCount"));
              v132 = v102;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v132, &v131, 1);
              v91 = objc_claimAutoreleasedReturnValue();
              v92 = v90;
              v30 = v107;
              v100 = (void *)v91;
              v41 = 0;
              v105 = 0;
              *a4 = (id)objc_msgSend(v89, "initWithDomain:code:userInfo:", v92, 2);
            }
            else
            {
              v105 = 0;
LABEL_66:
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("viewTotalSuggestionsCount"));
              v59 = objc_claimAutoreleasedReturnValue();
              v100 = (void *)v59;
              if (!v59 || (v60 = (void *)v59, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v102 = 0;
LABEL_69:
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("notificationInfo"));
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v61 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v62 = 0;
                  v42 = v117;
                  goto LABEL_72;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v79 = v61;
                  v80 = [BMMomentsEngagementNotificationInfo alloc];
                  v121 = 0;
                  v98 = v79;
                  v62 = -[BMMomentsEngagementNotificationInfo initWithJSONDictionary:error:](v80, "initWithJSONDictionary:error:", v79, &v121);
                  v81 = v121;
                  v42 = v117;
                  v9 = v115;
                  if (v81)
                  {
                    v82 = v81;
                    if (a4)
                      *a4 = objc_retainAutorelease(v81);

                    v61 = v98;
                    v41 = 0;
                  }
                  else
                  {

LABEL_72:
                    self = -[BMMomentsEngagementSuggestionEvent initWithType:timestamp:fullBundleOrderedSet:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:notificationInfo:](self, "initWithType:timestamp:fullBundleOrderedSet:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:notificationInfo:", objc_msgSend(v42, "intValue"), v9, v119, v107, v33, v108, v113, v105, v102, v62);
                    v41 = self;
                  }
LABEL_73:

                }
                else
                {
                  v42 = v117;
                  if (a4)
                  {
                    v99 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v97 = *MEMORY[0x1E0D025B8];
                    v127 = *MEMORY[0x1E0CB2D50];
                    v62 = (BMMomentsEngagementNotificationInfo *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("notificationInfo"));
                    v128 = v62;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    *a4 = (id)objc_msgSend(v99, "initWithDomain:code:userInfo:", v97, 2, v95);

                    v41 = 0;
                    v9 = v115;
                    goto LABEL_73;
                  }
                  v41 = 0;
                  v9 = v115;
                }

                v6 = v111;
                v30 = v107;
LABEL_75:

LABEL_76:
LABEL_77:

LABEL_78:
LABEL_79:

LABEL_80:
LABEL_81:

LABEL_82:
LABEL_84:

                v8 = v116;
                goto LABEL_85;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v102 = v60;
                goto LABEL_69;
              }
              if (a4)
              {
                v103 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v93 = *MEMORY[0x1E0D025B8];
                v129 = *MEMORY[0x1E0CB2D50];
                v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("viewTotalSuggestionsCount"));
                v130 = v61;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
                v62 = (BMMomentsEngagementNotificationInfo *)objc_claimAutoreleasedReturnValue();
                v94 = (id)objc_msgSend(v103, "initWithDomain:code:userInfo:", v93, 2, v62);
                v41 = 0;
                v102 = 0;
                *a4 = v94;
                v42 = v117;
                goto LABEL_73;
              }
              v102 = 0;
              v41 = 0;
            }
            v6 = v111;
            v42 = v117;
            goto LABEL_75;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v33 = v32;
            v9 = v115;
            goto LABEL_57;
          }
          if (a4)
          {
            v67 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v68 = *MEMORY[0x1E0D025B8];
            v137 = *MEMORY[0x1E0CB2D50];
            v69 = v30;
            v70 = objc_alloc(MEMORY[0x1E0CB3940]);
            v96 = objc_opt_class();
            v71 = v70;
            v30 = v69;
            v108 = (id)objc_msgSend(v71, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v96, CFSTR("viewContainerName"));
            v138 = v108;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1);
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v68, 2);
            v41 = 0;
            v33 = 0;
            *a4 = v72;
            v6 = v111;
            v42 = v117;
            v9 = v115;
            goto LABEL_78;
          }
          v33 = 0;
          v41 = 0;
        }
        else
        {
          self = v112;
          if (!a4)
          {
            v30 = 0;
            v41 = 0;
            v6 = v111;
            v42 = v117;
            v9 = v115;
            goto LABEL_81;
          }
          v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v65 = *MEMORY[0x1E0D025B8];
          v139 = *MEMORY[0x1E0CB2D50];
          v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clientIdentifier"));
          v140 = v33;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v65, 2);
          v41 = 0;
          v30 = 0;
          *a4 = v66;
        }
        v6 = v111;
        v42 = v117;
        v9 = v115;
        goto LABEL_79;
      }
    }
    v34 = a4;
    if (a4)
    {
      v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v36 = *MEMORY[0x1E0D025B8];
      v143 = *MEMORY[0x1E0CB2D50];
      v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("fullBundleOrderedSet"));
      v144 = v26;
      v37 = (void *)MEMORY[0x1E0C99D80];
      v38 = &v144;
      v39 = &v143;
LABEL_41:
      objc_msgSend(v37, "dictionaryWithObjects:forKeys:count:", v38, v39, 1);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      v40 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v36, 2, v33);
      v41 = 0;
      *v34 = v40;
LABEL_45:
      v30 = v18;
      v5 = v110;
      v6 = v111;
      self = v112;
      v9 = v115;
      v42 = v117;
      goto LABEL_80;
    }
LABEL_48:
    v41 = 0;
    v30 = v18;
    v5 = v110;
    v6 = v111;
    self = v112;
    v9 = v115;
LABEL_49:
    v42 = v117;
    goto LABEL_82;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v8;
    goto LABEL_11;
  }
  if (a4)
  {
    v73 = v6;
    v74 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v75 = *MEMORY[0x1E0D025B8];
    v148 = *MEMORY[0x1E0CB2D50];
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("timestamp"));
    v149 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v149, &v148, 1);
    v76 = objc_claimAutoreleasedReturnValue();
    v77 = v74;
    v6 = v73;
    v120 = (void *)v76;
    v78 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v75, 2);
    v9 = 0;
    v41 = 0;
    *a4 = v78;
    v42 = v117;

    goto LABEL_84;
  }
  v9 = 0;
  v41 = 0;
  v42 = v117;
LABEL_85:

LABEL_86:
  return v41;
}

- (id)_fullBundleOrderedSetJSONArray
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
  -[BMMomentsEngagementSuggestionEvent fullBundleOrderedSet](self, "fullBundleOrderedSet", 0);
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
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[10];
  _QWORD v40[12];

  v40[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEngagementSuggestionEvent type](self, "type"));
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementSuggestionEvent timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEngagementSuggestionEvent timestamp](self, "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  -[BMMomentsEngagementSuggestionEvent _fullBundleOrderedSetJSONArray](self, "_fullBundleOrderedSetJSONArray");
  v8 = objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementSuggestionEvent clientIdentifier](self, "clientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementSuggestionEvent viewContainerName](self, "viewContainerName");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!-[BMMomentsEngagementSuggestionEvent hasViewVisibleTime](self, "hasViewVisibleTime")
    || (-[BMMomentsEngagementSuggestionEvent viewVisibleTime](self, "viewVisibleTime"), fabs(v11) == INFINITY))
  {
    v38 = 0;
  }
  else
  {
    -[BMMomentsEngagementSuggestionEvent viewVisibleTime](self, "viewVisibleTime");
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEngagementSuggestionEvent viewVisibleTime](self, "viewVisibleTime");
    objc_msgSend(v12, "numberWithDouble:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMMomentsEngagementSuggestionEvent suggestionType](self, "suggestionType");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEngagementSuggestionEvent hasViewVisibleSuggestionsCount](self, "hasViewVisibleSuggestionsCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEngagementSuggestionEvent viewVisibleSuggestionsCount](self, "viewVisibleSuggestionsCount"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = 0;
  }
  if (-[BMMomentsEngagementSuggestionEvent hasViewTotalSuggestionsCount](self, "hasViewTotalSuggestionsCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEngagementSuggestionEvent viewTotalSuggestionsCount](self, "viewTotalSuggestionsCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  -[BMMomentsEngagementSuggestionEvent notificationInfo](self, "notificationInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "jsonDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v39[0] = CFSTR("type");
  v16 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v16;
  v40[0] = v16;
  v39[1] = CFSTR("timestamp");
  v17 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v17;
  v40[1] = v17;
  v39[2] = CFSTR("fullBundleOrderedSet");
  v18 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v18;
  v40[2] = v18;
  v39[3] = CFSTR("clientIdentifier");
  v19 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v3;
  v28 = (void *)v19;
  v40[3] = v19;
  v39[4] = CFSTR("viewContainerName");
  v20 = (void *)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v7;
  v40[4] = v20;
  v39[5] = CFSTR("viewVisibleTime");
  v21 = v38;
  if (!v38)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v8;
  v40[5] = v21;
  v39[6] = CFSTR("suggestionType");
  v22 = v36;
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40[6] = v22;
  v39[7] = CFSTR("viewVisibleSuggestionsCount");
  v23 = v37;
  if (!v37)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v10;
  v40[7] = v23;
  v39[8] = CFSTR("viewTotalSuggestionsCount");
  v25 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40[8] = v25;
  v39[9] = CFSTR("notificationInfo");
  v26 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40[9] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 10);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (v13)
      goto LABEL_36;
  }
  else
  {

    if (v13)
      goto LABEL_36;
  }

LABEL_36:
  if (!v37)

  if (!v36)
  if (!v38)

  if (!v24)
  if (v9)
  {
    if (v33)
      goto LABEL_46;
  }
  else
  {

    if (v33)
    {
LABEL_46:
      if (v34)
        goto LABEL_47;
LABEL_53:

      if (v35)
        goto LABEL_48;
LABEL_54:

      goto LABEL_48;
    }
  }

  if (!v34)
    goto LABEL_53;
LABEL_47:
  if (!v35)
    goto LABEL_54;
LABEL_48:

  return v32;
}

- (NSDate)timestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_timestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_timestamp);
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
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
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
  double v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMMomentsEngagementSuggestionEvent type](self, "type");
    if (v6 == objc_msgSend(v5, "type"))
    {
      -[BMMomentsEngagementSuggestionEvent timestamp](self, "timestamp");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timestamp");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[BMMomentsEngagementSuggestionEvent timestamp](self, "timestamp");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "timestamp");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_41;
      }
      -[BMMomentsEngagementSuggestionEvent fullBundleOrderedSet](self, "fullBundleOrderedSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fullBundleOrderedSet");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[BMMomentsEngagementSuggestionEvent fullBundleOrderedSet](self, "fullBundleOrderedSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fullBundleOrderedSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_41;
      }
      -[BMMomentsEngagementSuggestionEvent clientIdentifier](self, "clientIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientIdentifier");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMMomentsEngagementSuggestionEvent clientIdentifier](self, "clientIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "clientIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_41;
      }
      -[BMMomentsEngagementSuggestionEvent viewContainerName](self, "viewContainerName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "viewContainerName");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[BMMomentsEngagementSuggestionEvent viewContainerName](self, "viewContainerName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "viewContainerName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_41;
      }
      if (-[BMMomentsEngagementSuggestionEvent hasViewVisibleTime](self, "hasViewVisibleTime")
        || objc_msgSend(v5, "hasViewVisibleTime"))
      {
        if (!-[BMMomentsEngagementSuggestionEvent hasViewVisibleTime](self, "hasViewVisibleTime"))
          goto LABEL_41;
        if (!objc_msgSend(v5, "hasViewVisibleTime"))
          goto LABEL_41;
        -[BMMomentsEngagementSuggestionEvent viewVisibleTime](self, "viewVisibleTime");
        v33 = v32;
        objc_msgSend(v5, "viewVisibleTime");
        if (v33 != v34)
          goto LABEL_41;
      }
      -[BMMomentsEngagementSuggestionEvent suggestionType](self, "suggestionType");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "suggestionType");
      v36 = objc_claimAutoreleasedReturnValue();
      if (v35 == (void *)v36)
      {

      }
      else
      {
        v37 = (void *)v36;
        -[BMMomentsEngagementSuggestionEvent suggestionType](self, "suggestionType");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "suggestionType");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v38, "isEqual:", v39);

        if (!v40)
          goto LABEL_41;
      }
      if (!-[BMMomentsEngagementSuggestionEvent hasViewVisibleSuggestionsCount](self, "hasViewVisibleSuggestionsCount")
        && !objc_msgSend(v5, "hasViewVisibleSuggestionsCount")
        || -[BMMomentsEngagementSuggestionEvent hasViewVisibleSuggestionsCount](self, "hasViewVisibleSuggestionsCount")
        && objc_msgSend(v5, "hasViewVisibleSuggestionsCount")
        && (v41 = -[BMMomentsEngagementSuggestionEvent viewVisibleSuggestionsCount](self, "viewVisibleSuggestionsCount"),
            v41 == objc_msgSend(v5, "viewVisibleSuggestionsCount")))
      {
        if (!-[BMMomentsEngagementSuggestionEvent hasViewTotalSuggestionsCount](self, "hasViewTotalSuggestionsCount")
          && !objc_msgSend(v5, "hasViewTotalSuggestionsCount")
          || -[BMMomentsEngagementSuggestionEvent hasViewTotalSuggestionsCount](self, "hasViewTotalSuggestionsCount")
          && objc_msgSend(v5, "hasViewTotalSuggestionsCount")
          && (v42 = -[BMMomentsEngagementSuggestionEvent viewTotalSuggestionsCount](self, "viewTotalSuggestionsCount"),
              v42 == objc_msgSend(v5, "viewTotalSuggestionsCount")))
        {
          -[BMMomentsEngagementSuggestionEvent notificationInfo](self, "notificationInfo");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "notificationInfo");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43 == v44)
          {
            v13 = 1;
          }
          else
          {
            -[BMMomentsEngagementSuggestionEvent notificationInfo](self, "notificationInfo");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "notificationInfo");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v45, "isEqual:", v46);

          }
          goto LABEL_42;
        }
      }
    }
LABEL_41:
    v13 = 0;
LABEL_42:

    goto LABEL_43;
  }
  v13 = 0;
LABEL_43:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)type
{
  return self->_type;
}

- (NSArray)fullBundleOrderedSet
{
  return self->_fullBundleOrderedSet;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)viewContainerName
{
  return self->_viewContainerName;
}

- (double)viewVisibleTime
{
  return self->_viewVisibleTime;
}

- (BOOL)hasViewVisibleTime
{
  return self->_hasViewVisibleTime;
}

- (void)setHasViewVisibleTime:(BOOL)a3
{
  self->_hasViewVisibleTime = a3;
}

- (NSString)suggestionType
{
  return self->_suggestionType;
}

- (int)viewVisibleSuggestionsCount
{
  return self->_viewVisibleSuggestionsCount;
}

- (BOOL)hasViewVisibleSuggestionsCount
{
  return self->_hasViewVisibleSuggestionsCount;
}

- (void)setHasViewVisibleSuggestionsCount:(BOOL)a3
{
  self->_hasViewVisibleSuggestionsCount = a3;
}

- (int)viewTotalSuggestionsCount
{
  return self->_viewTotalSuggestionsCount;
}

- (BOOL)hasViewTotalSuggestionsCount
{
  return self->_hasViewTotalSuggestionsCount;
}

- (void)setHasViewTotalSuggestionsCount:(BOOL)a3
{
  self->_hasViewTotalSuggestionsCount = a3;
}

- (BMMomentsEngagementNotificationInfo)notificationInfo
{
  return self->_notificationInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationInfo, 0);
  objc_storeStrong((id *)&self->_suggestionType, 0);
  objc_storeStrong((id *)&self->_viewContainerName, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_fullBundleOrderedSet, 0);
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

    v4 = -[BMMomentsEngagementSuggestionEvent initByReadFrom:]([BMMomentsEngagementSuggestionEvent alloc], "initByReadFrom:", v7);
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
  id v13;
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("type"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timestamp"), 3, 0, 2, 0, 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("fullBundleOrderedSet_json"), 5, 1, &__block_literal_global_491);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientIdentifier"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("viewContainerName"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("viewVisibleTime"), 1, 0, 6, 1, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("suggestionType"), 2, 0, 7, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("viewVisibleSuggestionsCount"), 0, 0, 8, 2, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("viewTotalSuggestionsCount"), 0, 0, 9, 2, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("notificationInfo_json"), 5, 1, &__block_literal_global_492);
  v14[0] = v2;
  v14[1] = v3;
  v14[2] = v4;
  v14[3] = v5;
  v14[4] = v6;
  v14[5] = v7;
  v14[6] = v8;
  v14[7] = v9;
  v14[8] = v10;
  v14[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D620;
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
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("type"), 1, 4, 0);
  v14[0] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timestamp"), 2, 0, 0);
  v14[1] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fullBundleOrderedSet"), 3, 14, objc_opt_class());
  v14[2] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientIdentifier"), 4, 13, 0);
  v14[3] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("viewContainerName"), 5, 13, 0);
  v14[4] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("viewVisibleTime"), 6, 1, 0);
  v14[5] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("suggestionType"), 7, 13, 0);
  v14[6] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("viewVisibleSuggestionsCount"), 8, 2, 0);
  v14[7] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("viewTotalSuggestionsCount"), 9, 2, 0);
  v14[8] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("notificationInfo"), 10, 14, objc_opt_class());
  v14[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __45__BMMomentsEngagementSuggestionEvent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __45__BMMomentsEngagementSuggestionEvent_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_fullBundleOrderedSetJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
