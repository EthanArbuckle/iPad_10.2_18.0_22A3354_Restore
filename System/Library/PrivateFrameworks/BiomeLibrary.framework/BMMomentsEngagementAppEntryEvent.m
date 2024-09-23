@implementation BMMomentsEngagementAppEntryEvent

- (BMMomentsEngagementAppEntryEvent)initWithType:(int)a3 clientIdentifier:(id)a4 timestamp:(id)a5 identifier:(id)a6 startTime:(id)a7 endTime:(id)a8 totalCharacters:(id)a9 addedCharacters:(id)a10 usedPhotoAssets:(id)a11
{
  return -[BMMomentsEngagementAppEntryEvent initWithType:clientIdentifier:timestamp:identifier:startTime:endTime:totalCharacters:addedCharacters:usedPhotoAssets:appEntryEventType:bundleInterfaceTypes:bundleEvergreenTypes:](self, "initWithType:clientIdentifier:timestamp:identifier:startTime:endTime:totalCharacters:addedCharacters:usedPhotoAssets:appEntryEventType:bundleInterfaceTypes:bundleEvergreenTypes:", *(_QWORD *)&a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (BMMomentsEngagementAppEntryEvent)initWithType:(int)a3 clientIdentifier:(id)a4 timestamp:(id)a5 identifier:(id)a6 startTime:(id)a7 endTime:(id)a8 totalCharacters:(id)a9 addedCharacters:(id)a10 usedPhotoAssets:(id)a11 appEntryEventType:(id)a12 bundleInterfaceTypes:(id)a13 bundleEvergreenTypes:(id)a14
{
  return -[BMMomentsEngagementAppEntryEvent initWithType:clientIdentifier:timestamp:identifier:startTime:endTime:totalCharacters:addedCharacters:usedPhotoAssets:appEntryEventType:bundleInterfaceTypes:bundleEvergreenTypes:bundleSummary:assets:](self, "initWithType:clientIdentifier:timestamp:identifier:startTime:endTime:totalCharacters:addedCharacters:usedPhotoAssets:appEntryEventType:bundleInterfaceTypes:bundleEvergreenTypes:bundleSummary:assets:", *(_QWORD *)&a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, 0, MEMORY[0x1E0C9AA60]);
}

- (BMMomentsEngagementAppEntryEvent)initWithType:(int)a3 clientIdentifier:(id)a4 timestamp:(id)a5 identifier:(id)a6 startTime:(id)a7 endTime:(id)a8 totalCharacters:(id)a9 addedCharacters:(id)a10 usedPhotoAssets:(id)a11 appEntryEventType:(id)a12 bundleInterfaceTypes:(id)a13 bundleEvergreenTypes:(id)a14 bundleSummary:(id)a15 assets:(id)a16
{
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  BMMomentsEngagementAppEntryEvent *v30;
  double v31;
  double v32;
  double v33;
  int v34;
  int v35;
  id v39;
  id v41;
  id v42;
  id v43;
  id v44;
  objc_super v45;

  v44 = a4;
  v20 = a5;
  v39 = a6;
  v43 = a6;
  v21 = a7;
  v22 = a8;
  v23 = v20;
  v24 = a9;
  v25 = a10;
  v42 = a11;
  v41 = a12;
  v26 = a13;
  v27 = a14;
  v28 = a15;
  v29 = a16;
  v45.receiver = self;
  v45.super_class = (Class)BMMomentsEngagementAppEntryEvent;
  v30 = -[BMEventBase init](&v45, sel_init);
  if (v30)
  {
    v30->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v30->_type = a3;
    objc_storeStrong((id *)&v30->_clientIdentifier, a4);
    if (v23)
    {
      v30->_hasRaw_timestamp = 1;
      objc_msgSend(v23, "timeIntervalSince1970");
    }
    else
    {
      v30->_hasRaw_timestamp = 0;
      v31 = -1.0;
    }
    v30->_raw_timestamp = v31;
    objc_storeStrong((id *)&v30->_identifier, v39);
    if (v21)
    {
      v30->_hasRaw_startTime = 1;
      objc_msgSend(v21, "timeIntervalSince1970");
    }
    else
    {
      v30->_hasRaw_startTime = 0;
      v32 = -1.0;
    }
    v30->_raw_startTime = v32;
    if (v22)
    {
      v30->_hasRaw_endTime = 1;
      objc_msgSend(v22, "timeIntervalSince1970");
    }
    else
    {
      v30->_hasRaw_endTime = 0;
      v33 = -1.0;
    }
    v30->_raw_endTime = v33;
    if (v24)
    {
      v30->_hasTotalCharacters = 1;
      v34 = objc_msgSend(v24, "intValue");
    }
    else
    {
      v30->_hasTotalCharacters = 0;
      v34 = -1;
    }
    v30->_totalCharacters = v34;
    if (v25)
    {
      v30->_hasAddedCharacters = 1;
      v35 = objc_msgSend(v25, "intValue");
    }
    else
    {
      v30->_hasAddedCharacters = 0;
      v35 = -1;
    }
    v30->_addedCharacters = v35;
    objc_storeStrong((id *)&v30->_usedPhotoAssets, a11);
    objc_storeStrong((id *)&v30->_appEntryEventType, a12);
    objc_storeStrong((id *)&v30->_bundleInterfaceTypes, a13);
    objc_storeStrong((id *)&v30->_bundleEvergreenTypes, a14);
    objc_storeStrong((id *)&v30->_bundleSummary, a15);
    objc_storeStrong((id *)&v30->_assets, a16);
  }

  return v30;
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
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMMomentsEngagementAppEntryEventTypeAsString(-[BMMomentsEngagementAppEntryEvent type](self, "type"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEvent clientIdentifier](self, "clientIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEvent timestamp](self, "timestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEvent identifier](self, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEvent startTime](self, "startTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEvent endTime](self, "endTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEngagementAppEntryEvent totalCharacters](self, "totalCharacters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEngagementAppEntryEvent addedCharacters](self, "addedCharacters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEvent usedPhotoAssets](self, "usedPhotoAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEvent appEntryEventType](self, "appEntryEventType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEvent bundleInterfaceTypes](self, "bundleInterfaceTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEvent bundleEvergreenTypes](self, "bundleEvergreenTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEvent bundleSummary](self, "bundleSummary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEvent assets](self, "assets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "initWithFormat:", CFSTR("BMMomentsEngagementAppEntryEvent with type: %@, clientIdentifier: %@, timestamp: %@, identifier: %@, startTime: %@, endTime: %@, totalCharacters: %@, addedCharacters: %@, usedPhotoAssets: %@, appEntryEventType: %@, bundleInterfaceTypes: %@, bundleEvergreenTypes: %@, bundleSummary: %@, assets: %@"), v19, v18, v13, v17, v16, v3, v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v15;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMomentsEngagementAppEntryEvent *v5;
  void *v6;
  void *v7;
  void *v8;
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
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  objc_class *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  BMMomentsEngagementBundleSummary *v60;
  BMMomentsEngagementBundleSummary *bundleSummary;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSArray *identifier;
  uint64_t v67;
  NSArray *usedPhotoAssets;
  uint64_t v69;
  NSArray *bundleInterfaceTypes;
  uint64_t v71;
  NSArray *bundleEvergreenTypes;
  uint64_t v73;
  NSArray *assets;
  int v75;
  BMMomentsEngagementAppEntryEvent *v76;
  void *v78;
  id v79;
  void *v80;
  objc_super v81;
  uint64_t v82;
  uint64_t v83;

  v4 = a3;
  v81.receiver = self;
  v81.super_class = (Class)BMMomentsEngagementAppEntryEvent;
  v5 = -[BMEventBase init](&v81, sel_init);
  if (!v5)
    goto LABEL_99;
  v80 = (void *)objc_opt_new();
  v78 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = (int *)MEMORY[0x1E0D82BF0];
  v10 = (int *)MEMORY[0x1E0D82BD8];
  v11 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v12 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v11])
        break;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v9;
        v17 = *(_QWORD *)&v4[v16];
        v18 = v17 + 1;
        if (v17 == -1 || v18 > *(_QWORD *)&v4[*v10])
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
          v21 = v4[*v11];
          goto LABEL_15;
        }
      }
      v4[*v11] = 1;
LABEL_13:
      v21 = v4[*v11];
      if (v4[*v11])
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
            v26 = *v9;
            v27 = *(_QWORD *)&v4[v26];
            v28 = v27 + 1;
            if (v27 == -1 || v28 > *(_QWORD *)&v4[*v10])
              break;
            v29 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v27);
            *(_QWORD *)&v4[v26] = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if ((v29 & 0x80) == 0)
              goto LABEL_75;
            v23 += 7;
            v20 = v24++ >= 9;
            if (v20)
            {
              LODWORD(v25) = 0;
              goto LABEL_77;
            }
          }
          v4[*v11] = 1;
LABEL_75:
          if (v4[*v11])
            LODWORD(v25) = 0;
LABEL_77:
          if (v25 >= 5)
            LODWORD(v25) = 0;
          v5->_type = v25;
          continue;
        case 2u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 88;
          goto LABEL_60;
        case 3u:
          v5->_hasRaw_timestamp = 1;
          v32 = *v9;
          v33 = *(_QWORD *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)&v4[*v10])
          {
            v34 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v33);
            *(_QWORD *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v11] = 1;
            v34 = 0;
          }
          v64 = 24;
          goto LABEL_95;
        case 4u:
          v82 = 0;
          v83 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_101;
          v35 = -[BMMomentsEngagementSuggestionIdentifier initByReadFrom:]([BMMomentsEngagementSuggestionIdentifier alloc], "initByReadFrom:", v4);
          if (!v35)
            goto LABEL_101;
          v36 = v35;
          v37 = v80;
          goto LABEL_72;
        case 5u:
          v5->_hasRaw_startTime = 1;
          v38 = *v9;
          v39 = *(_QWORD *)&v4[v38];
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(_QWORD *)&v4[*v10])
          {
            v34 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v39);
            *(_QWORD *)&v4[v38] = v39 + 8;
          }
          else
          {
            v4[*v11] = 1;
            v34 = 0;
          }
          v64 = 40;
          goto LABEL_95;
        case 6u:
          v5->_hasRaw_endTime = 1;
          v40 = *v9;
          v41 = *(_QWORD *)&v4[v40];
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(_QWORD *)&v4[*v10])
          {
            v34 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v41);
            *(_QWORD *)&v4[v40] = v41 + 8;
          }
          else
          {
            v4[*v11] = 1;
            v34 = 0;
          }
          v64 = 56;
LABEL_95:
          *(Class *)((char *)&v5->super.super.isa + v64) = v34;
          continue;
        case 7u:
          v42 = 0;
          v43 = 0;
          v44 = 0;
          v5->_hasTotalCharacters = 1;
          while (2)
          {
            v45 = *v9;
            v46 = *(_QWORD *)&v4[v45];
            v47 = v46 + 1;
            if (v46 == -1 || v47 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v46);
              *(_QWORD *)&v4[v45] = v47;
              v44 |= (unint64_t)(v48 & 0x7F) << v42;
              if (v48 < 0)
              {
                v42 += 7;
                v20 = v43++ >= 9;
                if (v20)
                {
                  LODWORD(v44) = 0;
                  goto LABEL_83;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v44) = 0;
LABEL_83:
          v63 = 76;
          goto LABEL_88;
        case 8u:
          v49 = 0;
          v50 = 0;
          v44 = 0;
          v5->_hasAddedCharacters = 1;
          break;
        case 9u:
          v82 = 0;
          v83 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_101;
          v55 = -[BMMomentsEngagementPhotosAssets initByReadFrom:]([BMMomentsEngagementPhotosAssets alloc], "initByReadFrom:", v4);
          if (!v55)
            goto LABEL_101;
          v36 = v55;
          v37 = v78;
          goto LABEL_72;
        case 0xAu:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 112;
LABEL_60:
          v56 = *(Class *)((char *)&v5->super.super.isa + v31);
          *(Class *)((char *)&v5->super.super.isa + v31) = (Class)v30;

          continue;
        case 0xBu:
          PBReaderReadString();
          v57 = objc_claimAutoreleasedReturnValue();
          if (!v57)
            goto LABEL_101;
          v36 = (void *)v57;
          v58 = v6;
          goto LABEL_65;
        case 0xCu:
          PBReaderReadString();
          v59 = objc_claimAutoreleasedReturnValue();
          if (!v59)
            goto LABEL_101;
          v36 = (void *)v59;
          v58 = v7;
LABEL_65:
          objc_msgSend(v58, "addObject:", v36, v78);
          goto LABEL_73;
        case 0xDu:
          v82 = 0;
          v83 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_101;
          v60 = -[BMMomentsEngagementBundleSummary initByReadFrom:]([BMMomentsEngagementBundleSummary alloc], "initByReadFrom:", v4);
          if (!v60)
            goto LABEL_101;
          bundleSummary = v5->_bundleSummary;
          v5->_bundleSummary = v60;

          PBReaderRecallMark();
          continue;
        case 0xEu:
          v82 = 0;
          v83 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_101;
          v62 = -[BMMomentsEngagementAppEntryEventComposerAsset initByReadFrom:]([BMMomentsEngagementAppEntryEventComposerAsset alloc], "initByReadFrom:", v4);
          if (!v62)
            goto LABEL_101;
          v36 = v62;
          v37 = v8;
LABEL_72:
          objc_msgSend(v37, "addObject:", v36, v78);
          PBReaderRecallMark();
LABEL_73:

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_101:

          goto LABEL_98;
      }
      while (1)
      {
        v51 = *v9;
        v52 = *(_QWORD *)&v4[v51];
        v53 = v52 + 1;
        if (v52 == -1 || v53 > *(_QWORD *)&v4[*v10])
          break;
        v54 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v52);
        *(_QWORD *)&v4[v51] = v53;
        v44 |= (unint64_t)(v54 & 0x7F) << v49;
        if ((v54 & 0x80) == 0)
          goto LABEL_85;
        v49 += 7;
        v20 = v50++ >= 9;
        if (v20)
        {
          LODWORD(v44) = 0;
          goto LABEL_87;
        }
      }
      v4[*v11] = 1;
LABEL_85:
      if (v4[*v11])
        LODWORD(v44) = 0;
LABEL_87:
      v63 = 80;
LABEL_88:
      *(_DWORD *)((char *)&v5->super.super.isa + v63) = v44;
    }
    while (*(_QWORD *)&v4[*v9] < *(_QWORD *)&v4[*v10]);
  }
  v65 = objc_msgSend(v80, "copy", v78);
  identifier = v5->_identifier;
  v5->_identifier = (NSArray *)v65;

  v67 = objc_msgSend(v79, "copy");
  usedPhotoAssets = v5->_usedPhotoAssets;
  v5->_usedPhotoAssets = (NSArray *)v67;

  v69 = objc_msgSend(v6, "copy");
  bundleInterfaceTypes = v5->_bundleInterfaceTypes;
  v5->_bundleInterfaceTypes = (NSArray *)v69;

  v71 = objc_msgSend(v7, "copy");
  bundleEvergreenTypes = v5->_bundleEvergreenTypes;
  v5->_bundleEvergreenTypes = (NSArray *)v71;

  v73 = objc_msgSend(v8, "copy");
  assets = v5->_assets;
  v5->_assets = (NSArray *)v73;

  v75 = v4[*v11];
  if (v75)
LABEL_98:
    v76 = 0;
  else
LABEL_99:
    v76 = v5;

  return v76;
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
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_clientIdentifier)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_timestamp)
    PBDataWriterWriteDoubleField();
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v5 = self->_identifier;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v51;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v51 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v9);
        v49 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v7);
  }

  if (self->_hasRaw_startTime)
    PBDataWriterWriteDoubleField();
  if (self->_hasRaw_endTime)
    PBDataWriterWriteDoubleField();
  if (self->_hasTotalCharacters)
    PBDataWriterWriteInt32Field();
  if (self->_hasAddedCharacters)
    PBDataWriterWriteInt32Field();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v11 = self->_usedPhotoAssets;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v46;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v46 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v15);
        v49 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v16, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v13);
  }

  if (self->_appEntryEventType)
    PBDataWriterWriteStringField();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v17 = self->_bundleInterfaceTypes;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v41, v56, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v42;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v42 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteStringField();
        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v41, v56, 16);
    }
    while (v19);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v22 = self->_bundleEvergreenTypes;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v37, v55, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v38;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v38 != v25)
          objc_enumerationMutation(v22);
        PBDataWriterWriteStringField();
        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v37, v55, 16);
    }
    while (v24);
  }

  if (self->_bundleSummary)
  {
    v49 = 0;
    PBDataWriterPlaceMark();
    -[BMMomentsEngagementBundleSummary writeTo:](self->_bundleSummary, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v27 = self->_assets;
  v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v33, v54, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v34;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v34 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v31);
        v49 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v32, "writeTo:", v4, (_QWORD)v33);
        PBDataWriterRecallMark();
        ++v31;
      }
      while (v29 != v31);
      v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v33, v54, 16);
    }
    while (v29);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMomentsEngagementAppEntryEvent writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMomentsEngagementAppEntryEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  BMMomentsEngagementAppEntryEvent *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  BMMomentsEngagementSuggestionIdentifier *v31;
  BMMomentsEngagementSuggestionIdentifier *v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id *v46;
  id v47;
  uint64_t v48;
  id v49;
  void *v50;
  id *v51;
  uint64_t *v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  id v78;
  BMMomentsEngagementPhotosAssets *v79;
  BMMomentsEngagementPhotosAssets *v80;
  id v81;
  uint64_t v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id v88;
  uint64_t v89;
  id v90;
  id v91;
  void *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  id v97;
  uint64_t v98;
  id v99;
  id v100;
  id v101;
  uint64_t v102;
  id v103;
  void *v104;
  id v105;
  uint64_t v106;
  void *v107;
  int v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  uint64_t i;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  int v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  id v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  id v128;
  id v129;
  uint64_t v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  id v139;
  uint64_t v140;
  void *v141;
  id v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  id v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  id v152;
  uint64_t v153;
  id v154;
  uint64_t v155;
  id v156;
  void *v157;
  void *v158;
  int v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  id v165;
  BMMomentsEngagementAppEntryEventComposerAsset *v166;
  BMMomentsEngagementAppEntryEventComposerAsset *v167;
  id v168;
  void *v169;
  id v170;
  BMMomentsEngagementBundleSummary *v171;
  id v172;
  void *v173;
  uint64_t v174;
  void *v175;
  id *v176;
  id v177;
  void *v178;
  void *v179;
  void **v180;
  uint64_t *v181;
  void *v182;
  id v183;
  uint64_t v184;
  void *v185;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  BMMomentsEngagementBundleSummary *v190;
  void *v191;
  uint64_t v192;
  uint64_t v193;
  id v194;
  id v195;
  void *v196;
  id v197;
  id v198;
  void *v199;
  id v200;
  id v201;
  id v202;
  uint64_t v203;
  id v204;
  void *v205;
  id v206;
  void *v207;
  void *v208;
  id v209;
  void *v210;
  void *v211;
  void *v212;
  id v213;
  id v214;
  id obj;
  void *v216;
  void *v217;
  BMMomentsEngagementAppEntryEvent *v218;
  void *v219;
  id v220;
  void *v221;
  id v222;
  id *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  id v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  id v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  id v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  id v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  uint64_t v253;
  void *v254;
  uint64_t v255;
  void *v256;
  _BYTE v257[128];
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  BMMomentsEngagementBundleSummary *v261;
  uint64_t v262;
  BMMomentsEngagementBundleSummary *v263;
  uint64_t v264;
  BMMomentsEngagementBundleSummary *v265;
  _BYTE v266[128];
  uint64_t v267;
  void *v268;
  uint64_t v269;
  void *v270;
  uint64_t v271;
  void *v272;
  _BYTE v273[128];
  uint64_t v274;
  void *v275;
  uint64_t v276;
  id v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  _BYTE v282[128];
  uint64_t v283;
  void *v284;
  uint64_t v285;
  id v286;
  uint64_t v287;
  id v288;
  uint64_t v289;
  id v290;
  uint64_t v291;
  id v292;
  uint64_t v293;
  id v294;
  uint64_t v295;
  id v296;
  _BYTE v297[128];
  uint64_t v298;
  void *v299;
  uint64_t v300;
  id v301;
  uint64_t v302;
  void *v303;
  uint64_t v304;
  _QWORD v305[4];

  v305[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0x1E0C99000uLL;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v56 = *MEMORY[0x1E0D025B8];
          v304 = *MEMORY[0x1E0CB2D50];
          v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("type"));
          v305[0] = v45;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v305, &v304, 1);
          v225 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = 0;
          v23 = 0;
          *a4 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v56, 2);
          goto LABEL_245;
        }
        v9 = 0;
        v23 = 0;
        goto LABEL_246;
      }
      v10 = v7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEngagementAppEntryEventTypeFromString(v10));
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
  v11 = objc_claimAutoreleasedReturnValue();
  v225 = (void *)v11;
  if (v11 && (v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v40 = *MEMORY[0x1E0D025B8];
        v302 = *MEMORY[0x1E0CB2D50];
        v41 = v9;
        v42 = objc_alloc(MEMORY[0x1E0CB3940]);
        v187 = objc_opt_class();
        v43 = v42;
        v9 = v41;
        v44 = (void *)objc_msgSend(v43, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v187, CFSTR("clientIdentifier"));
        v303 = v44;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v303, &v302, 1);
        v224 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0;
        v23 = 0;
        *a4 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v40, 2);
        goto LABEL_244;
      }
      v45 = 0;
      v23 = 0;
      goto LABEL_245;
    }
    v222 = v12;
  }
  else
  {
    v222 = 0;
  }
  v223 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v13 = objc_claimAutoreleasedReturnValue();
  v224 = (void *)v13;
  if (v13 && (v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = v14;
      v38 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v37, "doubleValue");
      v220 = (id)objc_msgSend(v38, "initWithTimeIntervalSince1970:");

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v53 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        v54 = v14;
        objc_msgSend(v53, "dateFromString:", v54);
        v220 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v23 = (BMMomentsEngagementAppEntryEvent *)a4;
          if (a4)
          {
            v88 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v89 = *MEMORY[0x1E0D025B8];
            v300 = *MEMORY[0x1E0CB2D50];
            v90 = v9;
            v91 = objc_alloc(MEMORY[0x1E0CB3940]);
            v188 = objc_opt_class();
            v92 = v91;
            v9 = v90;
            v15 = (id)objc_msgSend(v92, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), v188, CFSTR("timestamp"));
            v301 = v15;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v301, &v300, 1);
            v228 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = 0;
            v23 = 0;
            *v223 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 2);
            v45 = v222;

            goto LABEL_243;
          }
          v44 = 0;
          v45 = v222;
          goto LABEL_244;
        }
        v220 = v14;
      }
      v8 = 0x1E0C99000;
    }
  }
  else
  {
    v220 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v8 + 3640), "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  v221 = v7;
  if (v17)
  {

    v15 = 0;
  }
  else if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v223)
      {
        v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v19 = *MEMORY[0x1E0D025B8];
        v298 = *MEMORY[0x1E0CB2D50];
        v227 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("identifier"));
        v299 = v227;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v299, &v298, 1);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v18;
        v22 = (id)v20;
        v23 = 0;
        *v223 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v19, 2, v20);
        goto LABEL_55;
      }
      v23 = 0;
      v45 = v222;
      v44 = v220;
      goto LABEL_243;
    }
  }
  v227 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
  v249 = 0u;
  v250 = 0u;
  v251 = 0u;
  v252 = 0u;
  v15 = v15;
  v24 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v249, v297, 16);
  v218 = self;
  v219 = v9;
  v226 = v15;
  if (!v24)
  {
LABEL_31:

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("startTime"));
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v57 = v30;
        v58 = objc_alloc(MEMORY[0x1E0C99D68]);
        objc_msgSend(v57, "doubleValue");
        v22 = (id)objc_msgSend(v58, "initWithTimeIntervalSince1970:");

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v62 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          v63 = v30;
          objc_msgSend(v62, "dateFromString:", v63);
          v64 = objc_claimAutoreleasedReturnValue();

          v22 = (id)v64;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v22 = v223;
            if (!v223)
            {
              v23 = 0;
              v45 = v222;
              v44 = v220;
LABEL_241:

              v15 = v226;
              goto LABEL_242;
            }
            v126 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v127 = *MEMORY[0x1E0D025B8];
            v291 = *MEMORY[0x1E0CB2D50];
            v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("startTime"));
            v292 = v36;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v292, &v291, 1);
            v212 = (void *)objc_claimAutoreleasedReturnValue();
            v128 = (id)objc_msgSend(v126, "initWithDomain:code:userInfo:", v127, 2);
            v23 = 0;
            *v223 = v128;
            v22 = 0;
            v45 = v222;
            v44 = v220;

LABEL_240:
            v9 = v219;
            goto LABEL_241;
          }
          v22 = v30;
        }
      }
    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endTime"));
    v34 = objc_claimAutoreleasedReturnValue();
    v211 = (void *)v34;
    v213 = v22;
    if (!v34 || (v35 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v36 = 0;
      goto LABEL_72;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v59 = v35;
      v60 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v59, "doubleValue");
      v61 = v60;
      v22 = v213;
      v36 = (id)objc_msgSend(v61, "initWithTimeIntervalSince1970:");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v223)
          {
            v36 = 0;
            v23 = 0;
            v45 = v222;
            v44 = v220;
LABEL_239:

            goto LABEL_240;
          }
          v129 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v130 = *MEMORY[0x1E0D025B8];
          v289 = *MEMORY[0x1E0CB2D50];
          v209 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("endTime"));
          v290 = v209;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v290, &v289, 1);
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          v131 = (id)objc_msgSend(v129, "initWithDomain:code:userInfo:", v130, 2);
          v36 = 0;
          v23 = 0;
          *v223 = v131;
          v45 = v222;
          v44 = v220;
          goto LABEL_238;
        }
        v36 = v35;
LABEL_72:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalCharacters"));
        v66 = objc_claimAutoreleasedReturnValue();
        v210 = (void *)v66;
        if (!v66 || (v67 = (void *)v66, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v209 = 0;
          goto LABEL_75;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v209 = v67;
LABEL_75:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("addedCharacters"));
          v68 = objc_claimAutoreleasedReturnValue();
          v208 = (void *)v68;
          if (!v68 || (v69 = (void *)v68, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v204 = 0;
LABEL_78:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("usedPhotoAssets"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = objc_msgSend(v70, "isEqual:", v71);

            if (v72)
            {

              v70 = 0;
              goto LABEL_82;
            }
            if (!v70 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
LABEL_82:
              v216 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v70, "count"));
              v244 = 0u;
              v245 = 0u;
              v246 = 0u;
              v247 = 0u;
              obj = v70;
              v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v244, v282, 16);
              if (!v73)
                goto LABEL_92;
              v74 = v73;
              v75 = *(_QWORD *)v245;
              v201 = v6;
LABEL_84:
              v76 = 0;
              while (1)
              {
                if (*(_QWORD *)v245 != v75)
                  objc_enumerationMutation(obj);
                v77 = *(void **)(*((_QWORD *)&v244 + 1) + 8 * v76);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  break;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (v223)
                  {
                    v101 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v102 = *MEMORY[0x1E0D025B8];
                    v278 = *MEMORY[0x1E0CB2D50];
                    v203 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("usedPhotoAssets"));
                    v279 = v203;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v279, &v278, 1);
                    v99 = (id)objc_claimAutoreleasedReturnValue();
                    v103 = (id)objc_msgSend(v101, "initWithDomain:code:userInfo:", v102, 2, v99);
                    v23 = 0;
                    *v223 = v103;
                    goto LABEL_113;
                  }
                  goto LABEL_116;
                }
                v78 = v77;
                v79 = [BMMomentsEngagementPhotosAssets alloc];
                v243 = 0;
                v80 = -[BMMomentsEngagementPhotosAssets initWithJSONDictionary:error:](v79, "initWithJSONDictionary:error:", v78, &v243);
                v81 = v243;
                if (v81)
                {
                  v99 = v81;
                  v203 = (uint64_t)v78;
                  if (v223)
                    *v223 = objc_retainAutorelease(v81);

                  v23 = 0;
                  goto LABEL_113;
                }
                objc_msgSend(v216, "addObject:", v80);

                if (v74 == ++v76)
                {
                  v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v244, v282, 16);
                  v6 = v201;
                  if (!v74)
                  {
LABEL_92:

                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appEntryEventType"));
                    v82 = objc_claimAutoreleasedReturnValue();
                    v203 = v82;
                    if (v82)
                    {
                      v83 = (void *)v82;
                      objc_opt_class();
                      self = v218;
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v197 = 0;
                      }
                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          v7 = v221;
                          if (v223)
                          {
                            v206 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v132 = *MEMORY[0x1E0D025B8];
                            v276 = *MEMORY[0x1E0CB2D50];
                            v99 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("appEntryEventType"));
                            v277 = v99;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v277, &v276, 1);
                            v133 = objc_claimAutoreleasedReturnValue();
                            v134 = v206;
                            v207 = (void *)v133;
                            v135 = (id)objc_msgSend(v134, "initWithDomain:code:userInfo:", v132, 2);
                            v104 = 0;
                            v23 = 0;
                            *v223 = v135;
                            v22 = v213;

                            goto LABEL_232;
                          }
                          v104 = 0;
                          v23 = 0;
                          v22 = v213;
                          goto LABEL_233;
                        }
                        v197 = v83;
                      }
                    }
                    else
                    {
                      v197 = 0;
                      self = v218;
                    }
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleInterfaceTypes"));
                    v99 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0C99E38], "null");
                    v107 = (void *)objc_claimAutoreleasedReturnValue();
                    v108 = objc_msgSend(v99, "isEqual:", v107);

                    v22 = v213;
                    if (v108)
                    {

                      v99 = 0;
                      v7 = v221;
                    }
                    else
                    {
                      v7 = v221;
                      if (v99)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (!v223)
                          {
                            v23 = 0;
                            v104 = v197;
                            goto LABEL_232;
                          }
                          v200 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v145 = *MEMORY[0x1E0D025B8];
                          v274 = *MEMORY[0x1E0CB2D50];
                          v205 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("bundleInterfaceTypes"));
                          v275 = v205;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v275, &v274, 1);
                          v116 = (void *)objc_claimAutoreleasedReturnValue();
                          v146 = (id)objc_msgSend(v200, "initWithDomain:code:userInfo:", v145, 2, v116);
                          v23 = 0;
                          *v223 = v146;
                          goto LABEL_173;
                        }
                      }
                    }
                    v205 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v99, "count"));
                    v239 = 0u;
                    v240 = 0u;
                    v241 = 0u;
                    v242 = 0u;
                    v99 = v99;
                    v109 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v239, v273, 16);
                    if (!v109)
                      goto LABEL_137;
                    v110 = v109;
                    v111 = *(_QWORD *)v240;
                    while (1)
                    {
                      v112 = v6;
                      for (i = 0; i != v110; ++i)
                      {
                        if (*(_QWORD *)v240 != v111)
                          objc_enumerationMutation(v99);
                        v114 = *(void **)(*((_QWORD *)&v239 + 1) + 8 * i);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          if (v223)
                          {
                            v119 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v120 = *MEMORY[0x1E0D025B8];
                            v271 = *MEMORY[0x1E0CB2D50];
                            v199 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("bundleInterfaceTypes"));
                            v272 = v199;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v272, &v271, 1);
                            v121 = objc_claimAutoreleasedReturnValue();
                            v122 = v119;
                            v123 = v120;
LABEL_147:
                            v196 = (void *)v121;
                            v6 = v112;
                            v22 = v213;
                            v23 = 0;
                            *v223 = (id)objc_msgSend(v122, "initWithDomain:code:userInfo:", v123, 2);
                            v116 = v99;
                            self = v218;
                            goto LABEL_148;
                          }
LABEL_154:
                          v23 = 0;
                          v116 = v99;
                          v6 = v112;
                          self = v218;
                          v22 = v213;
LABEL_173:
                          v104 = v197;
                          goto LABEL_231;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (v223)
                          {
                            v124 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v125 = *MEMORY[0x1E0D025B8];
                            v269 = *MEMORY[0x1E0CB2D50];
                            v199 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleInterfaceTypes"));
                            v270 = v199;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v270, &v269, 1);
                            v121 = objc_claimAutoreleasedReturnValue();
                            v122 = v124;
                            v123 = v125;
                            goto LABEL_147;
                          }
                          goto LABEL_154;
                        }
                        v115 = v114;
                        objc_msgSend(v205, "addObject:", v115);

                      }
                      v110 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v239, v273, 16);
                      v6 = v112;
                      self = v218;
                      if (!v110)
                      {
LABEL_137:

                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleEvergreenTypes"));
                        v116 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(MEMORY[0x1E0C99E38], "null");
                        v117 = (void *)objc_claimAutoreleasedReturnValue();
                        v118 = objc_msgSend(v116, "isEqual:", v117);

                        if (v118)
                        {

                          v116 = 0;
                        }
                        else if (v116)
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            v198 = v116;
                            if (!v223)
                            {
                              v23 = 0;
                              v22 = v213;
                              v104 = v197;
                              goto LABEL_231;
                            }
                            v154 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v155 = *MEMORY[0x1E0D025B8];
                            v267 = *MEMORY[0x1E0CB2D50];
                            v199 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("bundleEvergreenTypes"));
                            v268 = v199;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v268, &v267, 1);
                            v196 = (void *)objc_claimAutoreleasedReturnValue();
                            v156 = (id)objc_msgSend(v154, "initWithDomain:code:userInfo:", v155, 2);
                            v23 = 0;
                            *v223 = v156;
                            goto LABEL_186;
                          }
                        }
                        v199 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v116, "count"));
                        v235 = 0u;
                        v236 = 0u;
                        v237 = 0u;
                        v238 = 0u;
                        v198 = v116;
                        v136 = objc_msgSend(v198, "countByEnumeratingWithState:objects:count:", &v235, v266, 16);
                        if (!v136)
                          goto LABEL_168;
                        v137 = v136;
                        v138 = *(_QWORD *)v236;
LABEL_161:
                        v139 = v6;
                        v140 = 0;
                        while (1)
                        {
                          if (*(_QWORD *)v236 != v138)
                            objc_enumerationMutation(v198);
                          v141 = *(void **)(*((_QWORD *)&v235 + 1) + 8 * v140);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                            break;
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            if (v223)
                            {
                              v152 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v153 = *MEMORY[0x1E0D025B8];
                              v262 = *MEMORY[0x1E0CB2D50];
                              v190 = (BMMomentsEngagementBundleSummary *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleEvergreenTypes"));
                              v263 = v190;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v263, &v262, 1);
                              v149 = objc_claimAutoreleasedReturnValue();
                              v150 = v152;
                              v151 = v153;
                              goto LABEL_178;
                            }
                            goto LABEL_182;
                          }
                          v142 = v141;
                          objc_msgSend(v199, "addObject:", v142);

                          if (v137 == ++v140)
                          {
                            v137 = objc_msgSend(v198, "countByEnumeratingWithState:objects:count:", &v235, v266, 16);
                            v6 = v139;
                            self = v218;
                            if (!v137)
                            {
LABEL_168:

                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSummary"));
                              v143 = objc_claimAutoreleasedReturnValue();
                              v196 = (void *)v143;
                              if (!v143)
                              {
                                v190 = 0;
                                v22 = v213;
                                goto LABEL_188;
                              }
                              v144 = (void *)v143;
                              objc_opt_class();
                              v22 = v213;
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v190 = 0;
                                goto LABEL_188;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v170 = v144;
                                v171 = [BMMomentsEngagementBundleSummary alloc];
                                v234 = 0;
                                v190 = -[BMMomentsEngagementBundleSummary initWithJSONDictionary:error:](v171, "initWithJSONDictionary:error:", v170, &v234);
                                v172 = v234;
                                if (v172)
                                {
                                  v173 = v172;
                                  v194 = v170;
                                  if (v223)
                                    *v223 = objc_retainAutorelease(v172);

                                  v23 = 0;
                                  v196 = v170;
                                  goto LABEL_227;
                                }

LABEL_188:
                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("assets"));
                                v157 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                v158 = (void *)objc_claimAutoreleasedReturnValue();
                                v159 = objc_msgSend(v157, "isEqual:", v158);

                                if (v159)
                                {

                                  v157 = 0;
                                }
                                else if (v157)
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    v194 = v157;
                                    if (v223)
                                    {
                                      v214 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v193 = *MEMORY[0x1E0D025B8];
                                      v258 = *MEMORY[0x1E0CB2D50];
                                      v184 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("assets"));
                                      v259 = v184;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v259, &v258, 1);
                                      v185 = (void *)objc_claimAutoreleasedReturnValue();
                                      *v223 = (id)objc_msgSend(v214, "initWithDomain:code:userInfo:", v193, 2, v185);
                                      v169 = (void *)v184;

                                      v23 = 0;
                                      v104 = v197;
                                      goto LABEL_221;
                                    }
                                    v23 = 0;
                                    goto LABEL_227;
                                  }
                                }
                                v191 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v157, "count"));
                                v230 = 0u;
                                v231 = 0u;
                                v232 = 0u;
                                v233 = 0u;
                                v194 = v157;
                                v160 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v230, v257, 16);
                                if (!v160)
                                  goto LABEL_202;
                                v161 = v160;
                                v162 = *(_QWORD *)v231;
                                v202 = v6;
LABEL_194:
                                v163 = 0;
                                while (1)
                                {
                                  if (*(_QWORD *)v231 != v162)
                                    objc_enumerationMutation(v194);
                                  v164 = *(void **)(*((_QWORD *)&v230 + 1) + 8 * v163);
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                    break;
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    v6 = v202;
                                    self = v218;
                                    v176 = v223;
                                    v22 = v213;
                                    if (!v223)
                                      goto LABEL_220;
                                    v177 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v189 = *MEMORY[0x1E0D025B8];
                                    v253 = *MEMORY[0x1E0CB2D50];
                                    v178 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("assets"));
                                    v254 = v178;
                                    v179 = (void *)MEMORY[0x1E0C99D80];
                                    v180 = &v254;
                                    v181 = &v253;
                                    goto LABEL_215;
                                  }
                                  v165 = v164;
                                  v166 = [BMMomentsEngagementAppEntryEventComposerAsset alloc];
                                  v229 = 0;
                                  v167 = -[BMMomentsEngagementAppEntryEventComposerAsset initWithJSONDictionary:error:](v166, "initWithJSONDictionary:error:", v165, &v229);
                                  v168 = v229;
                                  if (v168)
                                  {
                                    v182 = v168;
                                    v183 = v165;
                                    if (v223)
                                      *v223 = objc_retainAutorelease(v168);

                                    v6 = v202;
                                    self = v218;
                                    v22 = v213;
                                    v178 = v183;
LABEL_219:

LABEL_220:
                                    v23 = 0;
                                    v7 = v221;
                                    v104 = v197;
                                    v169 = v191;
                                    goto LABEL_221;
                                  }
                                  objc_msgSend(v191, "addObject:", v167);

                                  if (v161 == ++v163)
                                  {
                                    v6 = v202;
                                    self = v218;
                                    v161 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v230, v257, 16);
                                    if (v161)
                                      goto LABEL_194;
LABEL_202:

                                    v169 = v191;
                                    v104 = v197;
                                    v22 = v213;
                                    self = -[BMMomentsEngagementAppEntryEvent initWithType:clientIdentifier:timestamp:identifier:startTime:endTime:totalCharacters:addedCharacters:usedPhotoAssets:appEntryEventType:bundleInterfaceTypes:bundleEvergreenTypes:bundleSummary:assets:](self, "initWithType:clientIdentifier:timestamp:identifier:startTime:endTime:totalCharacters:addedCharacters:usedPhotoAssets:appEntryEventType:bundleInterfaceTypes:bundleEvergreenTypes:bundleSummary:assets:", objc_msgSend(v219, "intValue"), v222, v220, v227, v213, v36, v209, v204, v216, v197, v205, v199, v190, v191);
                                    v23 = self;
                                    v7 = v221;
LABEL_221:

LABEL_228:
                                    v116 = v198;
LABEL_229:

LABEL_230:
LABEL_231:

LABEL_232:
                                    v83 = (void *)v203;
LABEL_233:

                                    v45 = v222;
LABEL_234:
                                    v44 = v220;
LABEL_235:

                                    goto LABEL_236;
                                  }
                                }
                                v6 = v202;
                                self = v218;
                                v176 = v223;
                                v22 = v213;
                                if (!v223)
                                  goto LABEL_220;
                                v177 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v189 = *MEMORY[0x1E0D025B8];
                                v255 = *MEMORY[0x1E0CB2D50];
                                v178 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("assets"));
                                v256 = v178;
                                v179 = (void *)MEMORY[0x1E0C99D80];
                                v180 = &v256;
                                v181 = &v255;
LABEL_215:
                                objc_msgSend(v179, "dictionaryWithObjects:forKeys:count:", v180, v181, 1);
                                v182 = (void *)objc_claimAutoreleasedReturnValue();
                                *v176 = (id)objc_msgSend(v177, "initWithDomain:code:userInfo:", v189, 2, v182);
                                goto LABEL_219;
                              }
                              if (v223)
                              {
                                v195 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v192 = *MEMORY[0x1E0D025B8];
                                v260 = *MEMORY[0x1E0CB2D50];
                                v190 = (BMMomentsEngagementBundleSummary *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("bundleSummary"));
                                v261 = v190;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v261, &v260, 1);
                                v174 = objc_claimAutoreleasedReturnValue();
                                v175 = v195;
                                v194 = (id)v174;
                                v23 = 0;
                                *v223 = (id)objc_msgSend(v175, "initWithDomain:code:userInfo:", v192, 2);
                                v22 = v213;
LABEL_227:
                                v104 = v197;
                                goto LABEL_228;
                              }
                              v23 = 0;
LABEL_186:
                              v22 = v213;
                              v104 = v197;
                              v116 = v198;
                              goto LABEL_230;
                            }
                            goto LABEL_161;
                          }
                        }
                        if (v223)
                        {
                          v147 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v148 = *MEMORY[0x1E0D025B8];
                          v264 = *MEMORY[0x1E0CB2D50];
                          v190 = (BMMomentsEngagementBundleSummary *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("bundleEvergreenTypes"));
                          v265 = v190;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v265, &v264, 1);
                          v149 = objc_claimAutoreleasedReturnValue();
                          v150 = v147;
                          v151 = v148;
LABEL_178:
                          v194 = (id)v149;
                          v6 = v139;
                          v22 = v213;
                          v23 = 0;
                          *v223 = (id)objc_msgSend(v150, "initWithDomain:code:userInfo:", v151, 2);
                          v104 = v197;
                          v116 = v198;
                          v196 = v198;
                          self = v218;
                          goto LABEL_229;
                        }
LABEL_182:
                        v23 = 0;
                        v116 = v198;
                        v196 = v198;
                        v6 = v139;
                        self = v218;
                        v22 = v213;
LABEL_148:
                        v104 = v197;
                        goto LABEL_230;
                      }
                    }
                  }
                  goto LABEL_84;
                }
              }
              if (v223)
              {
                v97 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v98 = *MEMORY[0x1E0D025B8];
                v280 = *MEMORY[0x1E0CB2D50];
                v203 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("usedPhotoAssets"));
                v281 = v203;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v281, &v280, 1);
                v99 = (id)objc_claimAutoreleasedReturnValue();
                v100 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v98, 2, v99);
                v23 = 0;
                *v223 = v100;
LABEL_113:
                v22 = v213;
                v104 = obj;
                v6 = v201;
                self = v218;
                v7 = v221;
                goto LABEL_232;
              }
LABEL_116:
              v23 = 0;
              v22 = v213;
              v104 = obj;
              v6 = v201;
              self = v218;
              v7 = v221;
              v45 = v222;
              goto LABEL_234;
            }
            obj = v70;
            if (v223)
            {
              v105 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v106 = *MEMORY[0x1E0D025B8];
              v283 = *MEMORY[0x1E0CB2D50];
              v216 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("usedPhotoAssets"));
              v284 = v216;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v284, &v283, 1);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = 0;
              *v223 = (id)objc_msgSend(v105, "initWithDomain:code:userInfo:", v106, 2, v104);
              v45 = v222;
              v44 = v220;
              v22 = v213;
              self = v218;
              goto LABEL_235;
            }
            v23 = 0;
            v45 = v222;
            v44 = v220;
            v22 = v213;
            self = v218;
LABEL_236:

            goto LABEL_237;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v204 = v69;
            goto LABEL_78;
          }
          if (v223)
          {
            v93 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v94 = *MEMORY[0x1E0D025B8];
            v285 = *MEMORY[0x1E0CB2D50];
            obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("addedCharacters"));
            v286 = obj;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v286, &v285, 1);
            v95 = objc_claimAutoreleasedReturnValue();
            v96 = v93;
            v22 = v213;
            v217 = (void *)v95;
            v204 = 0;
            v23 = 0;
            *v223 = (id)objc_msgSend(v96, "initWithDomain:code:userInfo:", v94, 2);
            v45 = v222;
            v44 = v220;

            goto LABEL_236;
          }
          v204 = 0;
          v23 = 0;
LABEL_144:
          v45 = v222;
          v44 = v220;
LABEL_237:

          goto LABEL_238;
        }
        if (v223)
        {
          v84 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v85 = *MEMORY[0x1E0D025B8];
          v287 = *MEMORY[0x1E0CB2D50];
          v204 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("totalCharacters"));
          v288 = v204;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v288, &v287, 1);
          v86 = objc_claimAutoreleasedReturnValue();
          v87 = v84;
          v22 = v213;
          v208 = (void *)v86;
          v209 = 0;
          v23 = 0;
          *v223 = (id)objc_msgSend(v87, "initWithDomain:code:userInfo:", v85, 2);
          goto LABEL_144;
        }
        v209 = 0;
        v23 = 0;
        v45 = v222;
        v44 = v220;
LABEL_238:

        goto LABEL_239;
      }
      v59 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
      v65 = v35;
      objc_msgSend(v59, "dateFromString:", v65);
      v36 = (id)objc_claimAutoreleasedReturnValue();

      v22 = v213;
    }

    goto LABEL_72;
  }
  v25 = v24;
  v26 = *(_QWORD *)v250;
LABEL_23:
  v27 = v6;
  v28 = 0;
  while (1)
  {
    if (*(_QWORD *)v250 != v26)
      objc_enumerationMutation(v15);
    v29 = *(void **)(*((_QWORD *)&v249 + 1) + 8 * v28);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v46 = v223;
      if (!v223)
        goto LABEL_54;
      v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v48 = *MEMORY[0x1E0D025B8];
      v293 = *MEMORY[0x1E0CB2D50];
      v49 = v15;
      v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("identifier"));
      v294 = v30;
      v50 = (void *)MEMORY[0x1E0C99D80];
      v51 = &v294;
      v52 = &v293;
LABEL_47:
      objc_msgSend(v50, "dictionaryWithObjects:forKeys:count:", v51, v52, 1);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      *v46 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v48, 2, v36);
      v22 = v49;
LABEL_51:
      v6 = v27;
      self = v218;
      v45 = v222;
      v44 = v220;
      goto LABEL_240;
    }
    v30 = v29;
    v31 = [BMMomentsEngagementSuggestionIdentifier alloc];
    v248 = 0;
    v32 = -[BMMomentsEngagementSuggestionIdentifier initWithJSONDictionary:error:](v31, "initWithJSONDictionary:error:", v30, &v248);
    v33 = v248;
    if (v33)
    {
      v36 = v33;
      if (v223)
        *v223 = objc_retainAutorelease(v33);

      v23 = 0;
      v22 = v226;
      goto LABEL_51;
    }
    objc_msgSend(v227, "addObject:", v32);

    ++v28;
    v15 = v226;
    if (v25 == v28)
    {
      v25 = objc_msgSend(v226, "countByEnumeratingWithState:objects:count:", &v249, v297, 16);
      v6 = v27;
      self = v218;
      v9 = v219;
      if (!v25)
        goto LABEL_31;
      goto LABEL_23;
    }
  }
  v46 = v223;
  if (v223)
  {
    v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v48 = *MEMORY[0x1E0D025B8];
    v295 = *MEMORY[0x1E0CB2D50];
    v49 = v15;
    v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("identifier"));
    v296 = v30;
    v50 = (void *)MEMORY[0x1E0C99D80];
    v51 = &v296;
    v52 = &v295;
    goto LABEL_47;
  }
LABEL_54:
  v23 = 0;
  v22 = v15;
  v6 = v27;
  self = v218;
  v9 = v219;
LABEL_55:
  v45 = v222;
  v44 = v220;
LABEL_242:

LABEL_243:
LABEL_244:

LABEL_245:
LABEL_246:

  return v23;
}

- (id)_identifierJSONArray
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
  -[BMMomentsEngagementAppEntryEvent identifier](self, "identifier", 0);
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

- (id)_usedPhotoAssetsJSONArray
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
  -[BMMomentsEngagementAppEntryEvent usedPhotoAssets](self, "usedPhotoAssets", 0);
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

- (id)_bundleInterfaceTypesJSONArray
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
  -[BMMomentsEngagementAppEntryEvent bundleInterfaceTypes](self, "bundleInterfaceTypes", 0);
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

- (id)_bundleEvergreenTypesJSONArray
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
  -[BMMomentsEngagementAppEntryEvent bundleEvergreenTypes](self, "bundleEvergreenTypes", 0);
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

- (id)_assetsJSONArray
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
  -[BMMomentsEngagementAppEntryEvent assets](self, "assets", 0);
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
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
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
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[14];
  _QWORD v54[16];

  v54[14] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEngagementAppEntryEvent type](self, "type"));
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEvent clientIdentifier](self, "clientIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEvent timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEngagementAppEntryEvent timestamp](self, "timestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  -[BMMomentsEngagementAppEntryEvent _identifierJSONArray](self, "_identifierJSONArray");
  v9 = objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEvent startTime](self, "startTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEngagementAppEntryEvent startTime](self, "startTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    objc_msgSend(v11, "numberWithDouble:");
    v52 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v52 = 0;
  }

  -[BMMomentsEngagementAppEntryEvent endTime](self, "endTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEngagementAppEntryEvent endTime](self, "endTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    objc_msgSend(v14, "numberWithDouble:");
    v51 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v51 = 0;
  }

  if (-[BMMomentsEngagementAppEntryEvent hasTotalCharacters](self, "hasTotalCharacters"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEngagementAppEntryEvent totalCharacters](self, "totalCharacters"));
    v50 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v50 = 0;
  }
  if (-[BMMomentsEngagementAppEntryEvent hasAddedCharacters](self, "hasAddedCharacters"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEngagementAppEntryEvent addedCharacters](self, "addedCharacters"));
    v49 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v49 = 0;
  }
  -[BMMomentsEngagementAppEntryEvent _usedPhotoAssetsJSONArray](self, "_usedPhotoAssetsJSONArray");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEvent appEntryEventType](self, "appEntryEventType");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEvent _bundleInterfaceTypesJSONArray](self, "_bundleInterfaceTypesJSONArray");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEvent _bundleEvergreenTypesJSONArray](self, "_bundleEvergreenTypesJSONArray");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEvent bundleSummary](self, "bundleSummary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "jsonDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMMomentsEngagementAppEntryEvent _assetsJSONArray](self, "_assetsJSONArray");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = CFSTR("type");
  v19 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v19;
  v54[0] = v19;
  v53[1] = CFSTR("clientIdentifier");
  v20 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v20;
  v54[1] = v20;
  v53[2] = CFSTR("timestamp");
  v21 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v21;
  v54[2] = v21;
  v53[3] = CFSTR("identifier");
  v22 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v22;
  v54[3] = v22;
  v53[4] = CFSTR("startTime");
  v23 = (uint64_t)v52;
  if (!v52)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v3;
  v54[4] = v23;
  v53[5] = CFSTR("endTime");
  v24 = (uint64_t)v51;
  if (!v51)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v4;
  v54[5] = v24;
  v53[6] = CFSTR("totalCharacters");
  v25 = v50;
  if (!v50)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42 = v8;
  v54[6] = v25;
  v53[7] = CFSTR("addedCharacters");
  v26 = v49;
  if (!v49)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v9;
  v54[7] = v26;
  v53[8] = CFSTR("usedPhotoAssets");
  v27 = v48;
  if (!v48)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v23;
  v54[8] = v27;
  v53[9] = CFSTR("appEntryEventType");
  v28 = v47;
  if (!v47)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v24;
  v54[9] = v28;
  v53[10] = CFSTR("bundleInterfaceTypes");
  v29 = v46;
  if (!v46)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v54[10] = v29;
  v53[11] = CFSTR("bundleEvergreenTypes");
  v30 = v45;
  if (!v45)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v54[11] = v30;
  v53[12] = CFSTR("bundleSummary");
  v31 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v54[12] = v31;
  v53[13] = CFSTR("assets");
  v32 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v54[13] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 14);
  v40 = (id)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v17)
      goto LABEL_46;
  }
  else
  {

    if (v17)
      goto LABEL_46;
  }

LABEL_46:
  if (!v45)

  if (!v46)
  if (!v47)

  if (!v48)
  if (!v49)

  if (!v50)
  if (!v51)

  if (v52)
  {
    if (v41)
      goto LABEL_62;
  }
  else
  {

    if (v41)
    {
LABEL_62:
      if (v42)
        goto LABEL_63;
      goto LABEL_70;
    }
  }

  if (v42)
  {
LABEL_63:
    if (v43)
      goto LABEL_64;
LABEL_71:

    if (v44)
      goto LABEL_65;
LABEL_72:

    goto LABEL_65;
  }
LABEL_70:

  if (!v43)
    goto LABEL_71;
LABEL_64:
  if (!v44)
    goto LABEL_72;
LABEL_65:

  return v40;
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

- (NSDate)startTime
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_startTime)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_startTime);
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

- (NSDate)endTime
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_endTime)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_endTime);
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
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  int v38;
  int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v71;
  void *v72;
  void *v73;
  void *v74;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMMomentsEngagementAppEntryEvent type](self, "type");
    if (v6 == objc_msgSend(v5, "type"))
    {
      -[BMMomentsEngagementAppEntryEvent clientIdentifier](self, "clientIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[BMMomentsEngagementAppEntryEvent clientIdentifier](self, "clientIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "clientIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_52;
      }
      -[BMMomentsEngagementAppEntryEvent timestamp](self, "timestamp");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timestamp");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[BMMomentsEngagementAppEntryEvent timestamp](self, "timestamp");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "timestamp");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_52;
      }
      -[BMMomentsEngagementAppEntryEvent identifier](self, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMMomentsEngagementAppEntryEvent identifier](self, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_52;
      }
      -[BMMomentsEngagementAppEntryEvent startTime](self, "startTime");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startTime");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[BMMomentsEngagementAppEntryEvent startTime](self, "startTime");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "startTime");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_52;
      }
      -[BMMomentsEngagementAppEntryEvent endTime](self, "endTime");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endTime");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v32 == (void *)v33)
      {

      }
      else
      {
        v34 = (void *)v33;
        -[BMMomentsEngagementAppEntryEvent endTime](self, "endTime");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "endTime");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqual:", v36);

        if (!v37)
          goto LABEL_52;
      }
      if (-[BMMomentsEngagementAppEntryEvent hasTotalCharacters](self, "hasTotalCharacters")
        || objc_msgSend(v5, "hasTotalCharacters"))
      {
        if (!-[BMMomentsEngagementAppEntryEvent hasTotalCharacters](self, "hasTotalCharacters"))
          goto LABEL_52;
        if (!objc_msgSend(v5, "hasTotalCharacters"))
          goto LABEL_52;
        v38 = -[BMMomentsEngagementAppEntryEvent totalCharacters](self, "totalCharacters");
        if (v38 != objc_msgSend(v5, "totalCharacters"))
          goto LABEL_52;
      }
      if (-[BMMomentsEngagementAppEntryEvent hasAddedCharacters](self, "hasAddedCharacters")
        || objc_msgSend(v5, "hasAddedCharacters"))
      {
        if (!-[BMMomentsEngagementAppEntryEvent hasAddedCharacters](self, "hasAddedCharacters"))
          goto LABEL_52;
        if (!objc_msgSend(v5, "hasAddedCharacters"))
          goto LABEL_52;
        v39 = -[BMMomentsEngagementAppEntryEvent addedCharacters](self, "addedCharacters");
        if (v39 != objc_msgSend(v5, "addedCharacters"))
          goto LABEL_52;
      }
      -[BMMomentsEngagementAppEntryEvent usedPhotoAssets](self, "usedPhotoAssets");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "usedPhotoAssets");
      v41 = objc_claimAutoreleasedReturnValue();
      if (v40 == (void *)v41)
      {

      }
      else
      {
        v42 = (void *)v41;
        -[BMMomentsEngagementAppEntryEvent usedPhotoAssets](self, "usedPhotoAssets");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "usedPhotoAssets");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v43, "isEqual:", v44);

        if (!v45)
          goto LABEL_52;
      }
      -[BMMomentsEngagementAppEntryEvent appEntryEventType](self, "appEntryEventType");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appEntryEventType");
      v47 = objc_claimAutoreleasedReturnValue();
      if (v46 == (void *)v47)
      {

      }
      else
      {
        v48 = (void *)v47;
        -[BMMomentsEngagementAppEntryEvent appEntryEventType](self, "appEntryEventType");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appEntryEventType");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v49, "isEqual:", v50);

        if (!v51)
          goto LABEL_52;
      }
      -[BMMomentsEngagementAppEntryEvent bundleInterfaceTypes](self, "bundleInterfaceTypes");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleInterfaceTypes");
      v53 = objc_claimAutoreleasedReturnValue();
      if (v52 == (void *)v53)
      {

      }
      else
      {
        v54 = (void *)v53;
        -[BMMomentsEngagementAppEntryEvent bundleInterfaceTypes](self, "bundleInterfaceTypes");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bundleInterfaceTypes");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v55, "isEqual:", v56);

        if (!v57)
          goto LABEL_52;
      }
      -[BMMomentsEngagementAppEntryEvent bundleEvergreenTypes](self, "bundleEvergreenTypes");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleEvergreenTypes");
      v59 = objc_claimAutoreleasedReturnValue();
      if (v58 == (void *)v59)
      {

      }
      else
      {
        v60 = (void *)v59;
        -[BMMomentsEngagementAppEntryEvent bundleEvergreenTypes](self, "bundleEvergreenTypes");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bundleEvergreenTypes");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v61, "isEqual:", v62);

        if (!v63)
          goto LABEL_52;
      }
      -[BMMomentsEngagementAppEntryEvent bundleSummary](self, "bundleSummary");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleSummary");
      v65 = objc_claimAutoreleasedReturnValue();
      if (v64 == (void *)v65)
      {

      }
      else
      {
        v66 = (void *)v65;
        -[BMMomentsEngagementAppEntryEvent bundleSummary](self, "bundleSummary");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bundleSummary");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(v67, "isEqual:", v68);

        if (!v69)
          goto LABEL_52;
      }
      -[BMMomentsEngagementAppEntryEvent assets](self, "assets");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "assets");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      if (v71 == v72)
      {
        v13 = 1;
      }
      else
      {
        -[BMMomentsEngagementAppEntryEvent assets](self, "assets");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "assets");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v73, "isEqual:", v74);

      }
      goto LABEL_53;
    }
LABEL_52:
    v13 = 0;
LABEL_53:

    goto LABEL_54;
  }
  v13 = 0;
LABEL_54:

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

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSArray)identifier
{
  return self->_identifier;
}

- (int)totalCharacters
{
  return self->_totalCharacters;
}

- (BOOL)hasTotalCharacters
{
  return self->_hasTotalCharacters;
}

- (void)setHasTotalCharacters:(BOOL)a3
{
  self->_hasTotalCharacters = a3;
}

- (int)addedCharacters
{
  return self->_addedCharacters;
}

- (BOOL)hasAddedCharacters
{
  return self->_hasAddedCharacters;
}

- (void)setHasAddedCharacters:(BOOL)a3
{
  self->_hasAddedCharacters = a3;
}

- (NSArray)usedPhotoAssets
{
  return self->_usedPhotoAssets;
}

- (NSString)appEntryEventType
{
  return self->_appEntryEventType;
}

- (NSArray)bundleInterfaceTypes
{
  return self->_bundleInterfaceTypes;
}

- (NSArray)bundleEvergreenTypes
{
  return self->_bundleEvergreenTypes;
}

- (BMMomentsEngagementBundleSummary)bundleSummary
{
  return self->_bundleSummary;
}

- (NSArray)assets
{
  return self->_assets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_bundleSummary, 0);
  objc_storeStrong((id *)&self->_bundleEvergreenTypes, 0);
  objc_storeStrong((id *)&self->_bundleInterfaceTypes, 0);
  objc_storeStrong((id *)&self->_appEntryEventType, 0);
  objc_storeStrong((id *)&self->_usedPhotoAssets, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
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

    v4 = -[BMMomentsEngagementAppEntryEvent initByReadFrom:]([BMMomentsEngagementAppEntryEvent alloc], "initByReadFrom:", v7);
    v4[17] = 0;

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
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[16];

  v18[14] = *MEMORY[0x1E0C80C00];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("type"), 0, 0, 1, 4, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientIdentifier"), 2, 0, 2, 13, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timestamp"), 3, 0, 3, 0, 2);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("identifier_json"), 5, 1, &__block_literal_global_601);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("startTime"), 3, 0, 5, 0, 2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("endTime"), 3, 0, 6, 0, 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("totalCharacters"), 0, 0, 7, 2, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("addedCharacters"), 0, 0, 8, 2, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("usedPhotoAssets_json"), 5, 1, &__block_literal_global_602);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appEntryEventType"), 2, 0, 10, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("bundleInterfaceTypes_json"), 5, 1, &__block_literal_global_603);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("bundleEvergreenTypes_json"), 5, 1, &__block_literal_global_604);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("bundleSummary_json"), 5, 1, &__block_literal_global_605);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("assets_json"), 5, 1, &__block_literal_global_606);
  v18[0] = v17;
  v18[1] = v16;
  v18[2] = v15;
  v18[3] = v14;
  v18[4] = v2;
  v18[5] = v3;
  v18[6] = v4;
  v18[7] = v5;
  v18[8] = v13;
  v18[9] = v12;
  v18[10] = v6;
  v18[11] = v11;
  v18[12] = v7;
  v18[13] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 14);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D650;
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
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[16];

  v18[14] = *MEMORY[0x1E0C80C00];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("type"), 1, 4, 0);
  v18[0] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientIdentifier"), 2, 13, 0);
  v18[1] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timestamp"), 3, 0, 0);
  v18[2] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 4, 14, objc_opt_class());
  v18[3] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("startTime"), 5, 0, 0);
  v18[4] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("endTime"), 6, 0, 0);
  v18[5] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("totalCharacters"), 7, 2, 0);
  v18[6] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("addedCharacters"), 8, 2, 0);
  v18[7] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("usedPhotoAssets"), 9, 14, objc_opt_class());
  v18[8] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appEntryEventType"), 10, 13, 0);
  v18[9] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleInterfaceTypes"), 11, 13, 0);
  v18[10] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleEvergreenTypes"), 12, 13, 0);
  v18[11] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleSummary"), 13, 14, objc_opt_class());
  v18[12] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("assets"), 14, 14, objc_opt_class());
  v18[13] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __43__BMMomentsEngagementAppEntryEvent_columns__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_assetsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __43__BMMomentsEngagementAppEntryEvent_columns__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __43__BMMomentsEngagementAppEntryEvent_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_bundleEvergreenTypesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __43__BMMomentsEngagementAppEntryEvent_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_bundleInterfaceTypesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __43__BMMomentsEngagementAppEntryEvent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_usedPhotoAssetsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __43__BMMomentsEngagementAppEntryEvent_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_identifierJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
