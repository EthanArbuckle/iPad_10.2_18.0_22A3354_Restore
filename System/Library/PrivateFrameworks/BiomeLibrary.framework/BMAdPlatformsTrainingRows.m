@implementation BMAdPlatformsTrainingRows

- (BMAdPlatformsTrainingRows)initWithDeploymentID:(id)a3 experimentID:(id)a4 treatmentID:(id)a5 adamID:(id)a6 impressed:(id)a7 tapped:(id)a8 dupe:(id)a9 installed:(id)a10 errorCode:(id)a11 appUsageVector:(id)a12 appDownloadVector:(id)a13 installedAppVector:(id)a14 userQueryVector:(id)a15 serverResponse:(id)a16 recordID:(id)a17
{
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  BMAdPlatformsTrainingRows *v31;
  double v32;
  id v35;
  id v36;
  id v37;
  id v39;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  objc_super v47;

  v46 = a3;
  v35 = a4;
  v45 = a4;
  v36 = a5;
  v44 = a5;
  v37 = a6;
  v43 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = v22;
  v25 = a10;
  v26 = v21;
  v27 = a11;
  v42 = a12;
  v28 = a13;
  v29 = a14;
  v41 = a15;
  v39 = a16;
  v30 = a17;
  v47.receiver = self;
  v47.super_class = (Class)BMAdPlatformsTrainingRows;
  v31 = -[BMEventBase init](&v47, sel_init);
  if (v31)
  {
    v31->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v31->_deploymentID, a3);
    objc_storeStrong((id *)&v31->_experimentID, v35);
    objc_storeStrong((id *)&v31->_treatmentID, v36);
    objc_storeStrong((id *)&v31->_adamID, v37);
    if (v26)
    {
      v31->_hasImpressed = 1;
      v31->_impressed = objc_msgSend(v26, "BOOLValue");
    }
    else
    {
      v31->_hasImpressed = 0;
      v31->_impressed = 0;
    }
    if (v24)
    {
      v31->_hasTapped = 1;
      v31->_tapped = objc_msgSend(v24, "BOOLValue");
    }
    else
    {
      v31->_hasTapped = 0;
      v31->_tapped = 0;
    }
    if (v23)
    {
      v31->_hasDupe = 1;
      v31->_dupe = objc_msgSend(v23, "BOOLValue");
    }
    else
    {
      v31->_hasDupe = 0;
      v31->_dupe = 0;
    }
    if (v25)
    {
      v31->_hasInstalled = 1;
      v31->_installed = objc_msgSend(v25, "BOOLValue");
    }
    else
    {
      v31->_hasInstalled = 0;
      v31->_installed = 0;
    }
    if (v27)
    {
      v31->_hasErrorCode = 1;
      objc_msgSend(v27, "doubleValue");
    }
    else
    {
      v31->_hasErrorCode = 0;
      v32 = -1.0;
    }
    v31->_errorCode = v32;
    objc_storeStrong((id *)&v31->_appUsageVector, a12);
    objc_storeStrong((id *)&v31->_appDownloadVector, a13);
    objc_storeStrong((id *)&v31->_installedAppVector, a14);
    objc_storeStrong((id *)&v31->_userQueryVector, a15);
    objc_storeStrong((id *)&v31->_serverResponse, a16);
    objc_storeStrong((id *)&v31->_recordID, a17);
  }

  return v31;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMAdPlatformsTrainingRows deploymentID](self, "deploymentID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAdPlatformsTrainingRows experimentID](self, "experimentID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAdPlatformsTrainingRows treatmentID](self, "treatmentID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAdPlatformsTrainingRows adamID](self, "adamID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAdPlatformsTrainingRows impressed](self, "impressed"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAdPlatformsTrainingRows tapped](self, "tapped"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAdPlatformsTrainingRows dupe](self, "dupe"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAdPlatformsTrainingRows installed](self, "installed"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAdPlatformsTrainingRows errorCode](self, "errorCode");
  objc_msgSend(v3, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAdPlatformsTrainingRows appUsageVector](self, "appUsageVector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAdPlatformsTrainingRows appDownloadVector](self, "appDownloadVector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAdPlatformsTrainingRows installedAppVector](self, "installedAppVector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAdPlatformsTrainingRows userQueryVector](self, "userQueryVector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAdPlatformsTrainingRows serverResponse](self, "serverResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAdPlatformsTrainingRows recordID](self, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("BMAdPlatformsTrainingRows with deploymentID: %@, experimentID: %@, treatmentID: %@, adamID: %@, impressed: %@, tapped: %@, dupe: %@, installed: %@, errorCode: %@, appUsageVector: %@, appDownloadVector: %@, installedAppVector: %@, userQueryVector: %@, serverResponse: %@, recordID: %@"), v17, v21, v16, v15, v20, v14, v13, v12, v11, v4, v5, v6, v7, v8, v9);

  return (NSString *)v19;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAdPlatformsTrainingRows *v5;
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
  BOOL v19;
  uint64_t v20;
  int v21;
  uint64_t v23;
  uint64_t v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  uint64_t v53;
  unint64_t v54;
  double v55;
  void *v56;
  uint64_t v57;
  unint64_t v58;
  double v59;
  void *v60;
  uint64_t v61;
  unint64_t v62;
  double v63;
  void *v64;
  uint64_t v65;
  unint64_t v66;
  double v67;
  void *v68;
  uint64_t v69;
  unint64_t v70;
  double v71;
  void *v72;
  BOOL v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSArray *appUsageVector;
  uint64_t v83;
  NSArray *appDownloadVector;
  uint64_t v85;
  NSArray *installedAppVector;
  uint64_t v87;
  NSArray *userQueryVector;
  int v89;
  BMAdPlatformsTrainingRows *v90;
  void *v92;
  id v93;
  void *v94;
  objc_super v95;

  v4 = a3;
  v95.receiver = self;
  v95.super_class = (Class)BMAdPlatformsTrainingRows;
  v5 = -[BMEventBase init](&v95, sel_init);
  if (!v5)
    goto LABEL_107;
  v94 = (void *)objc_opt_new();
  v92 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (int *)MEMORY[0x1E0D82BF0];
  v9 = (int *)MEMORY[0x1E0D82BD8];
  v10 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v11 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v10])
        break;
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
        v19 = v13++ >= 9;
        if (v19)
        {
          v14 = 0;
          v20 = *v10;
          v21 = v4[v20];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      v20 = *v10;
      v21 = v4[v20];
      if (v4[v20])
        v14 = 0;
LABEL_15:
      if (v21 || (v14 & 7) == 4)
        break;
      switch((v14 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 32;
          goto LABEL_71;
        case 2u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 40;
          goto LABEL_71;
        case 3u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 48;
          goto LABEL_71;
        case 4u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 56;
          goto LABEL_71;
        case 5u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v5->_hasImpressed = 1;
          while (2)
          {
            v28 = *v8;
            v29 = *(_QWORD *)&v4[v28];
            v30 = v29 + 1;
            if (v29 == -1 || v30 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v29);
              *(_QWORD *)&v4[v28] = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                v19 = v26++ >= 9;
                if (v19)
                {
                  v27 = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v27 = 0;
LABEL_75:
          v73 = v27 != 0;
          v74 = 16;
          goto LABEL_88;
        case 6u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          v5->_hasTapped = 1;
          while (2)
          {
            v35 = *v8;
            v36 = *(_QWORD *)&v4[v35];
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v36);
              *(_QWORD *)&v4[v35] = v37;
              v34 |= (unint64_t)(v38 & 0x7F) << v32;
              if (v38 < 0)
              {
                v32 += 7;
                v19 = v33++ >= 9;
                if (v19)
                {
                  v34 = 0;
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v34 = 0;
LABEL_79:
          v73 = v34 != 0;
          v74 = 18;
          goto LABEL_88;
        case 7u:
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v5->_hasDupe = 1;
          while (2)
          {
            v42 = *v8;
            v43 = *(_QWORD *)&v4[v42];
            v44 = v43 + 1;
            if (v43 == -1 || v44 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v45 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v43);
              *(_QWORD *)&v4[v42] = v44;
              v41 |= (unint64_t)(v45 & 0x7F) << v39;
              if (v45 < 0)
              {
                v39 += 7;
                v19 = v40++ >= 9;
                if (v19)
                {
                  v41 = 0;
                  goto LABEL_83;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v41 = 0;
LABEL_83:
          v73 = v41 != 0;
          v74 = 20;
          goto LABEL_88;
        case 8u:
          v46 = 0;
          v47 = 0;
          v48 = 0;
          v5->_hasInstalled = 1;
          break;
        case 9u:
          v5->_hasErrorCode = 1;
          v53 = *v8;
          v54 = *(_QWORD *)&v4[v53];
          if (v54 <= 0xFFFFFFFFFFFFFFF7 && v54 + 8 <= *(_QWORD *)&v4[*v9])
          {
            v55 = *(double *)(*(_QWORD *)&v4[*v11] + v54);
            *(_QWORD *)&v4[v53] = v54 + 8;
          }
          else
          {
            v4[*v10] = 1;
            v55 = 0.0;
          }
          v5->_errorCode = v55;
          continue;
        case 0xAu:
          v56 = (void *)MEMORY[0x1E0CB37E8];
          v57 = *v8;
          v58 = *(_QWORD *)&v4[v57];
          if (v58 <= 0xFFFFFFFFFFFFFFF7 && v58 + 8 <= *(_QWORD *)&v4[*v9])
          {
            v59 = *(double *)(*(_QWORD *)&v4[*v11] + v58);
            *(_QWORD *)&v4[v57] = v58 + 8;
          }
          else
          {
            v4[v20] = 1;
            v59 = 0.0;
          }
          objc_msgSend(v56, "numberWithDouble:", v59, v92);
          v75 = objc_claimAutoreleasedReturnValue();
          if (!v75)
            goto LABEL_109;
          v76 = (void *)v75;
          v77 = v94;
          goto LABEL_103;
        case 0xBu:
          v60 = (void *)MEMORY[0x1E0CB37E8];
          v61 = *v8;
          v62 = *(_QWORD *)&v4[v61];
          if (v62 <= 0xFFFFFFFFFFFFFFF7 && v62 + 8 <= *(_QWORD *)&v4[*v9])
          {
            v63 = *(double *)(*(_QWORD *)&v4[*v11] + v62);
            *(_QWORD *)&v4[v61] = v62 + 8;
          }
          else
          {
            v4[v20] = 1;
            v63 = 0.0;
          }
          objc_msgSend(v60, "numberWithDouble:", v63, v92);
          v78 = objc_claimAutoreleasedReturnValue();
          if (!v78)
            goto LABEL_109;
          v76 = (void *)v78;
          v77 = v92;
          goto LABEL_103;
        case 0xCu:
          v64 = (void *)MEMORY[0x1E0CB37E8];
          v65 = *v8;
          v66 = *(_QWORD *)&v4[v65];
          if (v66 <= 0xFFFFFFFFFFFFFFF7 && v66 + 8 <= *(_QWORD *)&v4[*v9])
          {
            v67 = *(double *)(*(_QWORD *)&v4[*v11] + v66);
            *(_QWORD *)&v4[v65] = v66 + 8;
          }
          else
          {
            v4[v20] = 1;
            v67 = 0.0;
          }
          objc_msgSend(v64, "numberWithDouble:", v67, v92);
          v79 = objc_claimAutoreleasedReturnValue();
          if (!v79)
            goto LABEL_109;
          v76 = (void *)v79;
          v77 = v6;
          goto LABEL_103;
        case 0xDu:
          v68 = (void *)MEMORY[0x1E0CB37E8];
          v69 = *v8;
          v70 = *(_QWORD *)&v4[v69];
          if (v70 <= 0xFFFFFFFFFFFFFFF7 && v70 + 8 <= *(_QWORD *)&v4[*v9])
          {
            v71 = *(double *)(*(_QWORD *)&v4[*v11] + v70);
            *(_QWORD *)&v4[v69] = v70 + 8;
          }
          else
          {
            v4[v20] = 1;
            v71 = 0.0;
          }
          objc_msgSend(v68, "numberWithDouble:", v71, v92);
          v80 = objc_claimAutoreleasedReturnValue();
          if (!v80)
            goto LABEL_109;
          v76 = (void *)v80;
          v77 = v7;
LABEL_103:
          objc_msgSend(v77, "addObject:", v76);

          continue;
        case 0xEu:
          PBReaderReadData();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 104;
          goto LABEL_71;
        case 0xFu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 112;
LABEL_71:
          v72 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_109:

          goto LABEL_106;
      }
      while (1)
      {
        v49 = *v8;
        v50 = *(_QWORD *)&v4[v49];
        v51 = v50 + 1;
        if (v50 == -1 || v51 > *(_QWORD *)&v4[*v9])
          break;
        v52 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v50);
        *(_QWORD *)&v4[v49] = v51;
        v48 |= (unint64_t)(v52 & 0x7F) << v46;
        if ((v52 & 0x80) == 0)
          goto LABEL_85;
        v46 += 7;
        v19 = v47++ >= 9;
        if (v19)
        {
          v48 = 0;
          goto LABEL_87;
        }
      }
      v4[*v10] = 1;
LABEL_85:
      if (v4[*v10])
        v48 = 0;
LABEL_87:
      v73 = v48 != 0;
      v74 = 22;
LABEL_88:
      *((_BYTE *)&v5->super.super.isa + v74) = v73;
    }
    while (*(_QWORD *)&v4[*v8] < *(_QWORD *)&v4[*v9]);
  }
  v81 = objc_msgSend(v94, "copy", v92);
  appUsageVector = v5->_appUsageVector;
  v5->_appUsageVector = (NSArray *)v81;

  v83 = objc_msgSend(v93, "copy");
  appDownloadVector = v5->_appDownloadVector;
  v5->_appDownloadVector = (NSArray *)v83;

  v85 = objc_msgSend(v6, "copy");
  installedAppVector = v5->_installedAppVector;
  v5->_installedAppVector = (NSArray *)v85;

  v87 = objc_msgSend(v7, "copy");
  userQueryVector = v5->_userQueryVector;
  v5->_userQueryVector = (NSArray *)v87;

  v89 = v4[*v10];
  if (v89)
LABEL_106:
    v90 = 0;
  else
LABEL_107:
    v90 = v5;

  return v90;
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
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_deploymentID)
    PBDataWriterWriteStringField();
  if (self->_experimentID)
    PBDataWriterWriteStringField();
  if (self->_treatmentID)
    PBDataWriterWriteStringField();
  if (self->_adamID)
    PBDataWriterWriteStringField();
  if (self->_hasImpressed)
    PBDataWriterWriteBOOLField();
  if (self->_hasTapped)
    PBDataWriterWriteBOOLField();
  if (self->_hasDupe)
    PBDataWriterWriteBOOLField();
  if (self->_hasInstalled)
    PBDataWriterWriteBOOLField();
  if (self->_hasErrorCode)
    PBDataWriterWriteDoubleField();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = self->_appUsageVector;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v9), "doubleValue");
        PBDataWriterWriteDoubleField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self->_appDownloadVector;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v14), "doubleValue");
        PBDataWriterWriteDoubleField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self->_installedAppVector;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v19), "doubleValue");
        PBDataWriterWriteDoubleField();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v17);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self->_userQueryVector;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v24), "doubleValue", (_QWORD)v25);
        PBDataWriterWriteDoubleField();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
  }

  if (self->_serverResponse)
    PBDataWriterWriteDataField();
  if (self->_recordID)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAdPlatformsTrainingRows writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAdPlatformsTrainingRows)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  id *v27;
  id v28;
  uint64_t v29;
  BMAdPlatformsTrainingRows *v30;
  id v31;
  id *v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id *v39;
  uint64_t v40;
  BMAdPlatformsTrainingRows *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  uint64_t v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  BMAdPlatformsTrainingRows *v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  uint64_t v64;
  BMAdPlatformsTrainingRows *v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  id v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  id v90;
  id v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  id v97;
  void *v98;
  uint64_t v99;
  void *v100;
  id v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t j;
  uint64_t v109;
  void *v110;
  void *v111;
  int v112;
  id v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  id v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t k;
  uint64_t v130;
  void *v131;
  void *v132;
  int v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  id v142;
  uint64_t v143;
  id v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  id v156;
  uint64_t v157;
  id v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  id v163;
  uint64_t v164;
  id v165;
  void *v166;
  id v168;
  uint64_t v169;
  id v170;
  void *v171;
  uint64_t v172;
  uint64_t v173;
  id v174;
  id v175;
  id v176;
  id v177;
  uint64_t v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  id v195;
  void *v196;
  void *v197;
  id v198;
  id v199;
  void *v200;
  id v201;
  id v202;
  id v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  id v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  id obj;
  id obja;
  void *v216;
  id v217;
  BMAdPlatformsTrainingRows *v218;
  id v219;
  id v220;
  id v221;
  void *v222;
  void *v223;
  id v224;
  id v225;
  void *v226;
  id v227;
  id v228;
  id *v229;
  id v230;
  void *v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  uint64_t v248;
  void *v249;
  uint64_t v250;
  void *v251;
  uint64_t v252;
  void *v253;
  uint64_t v254;
  void *v255;
  _BYTE v256[128];
  uint64_t v257;
  void *v258;
  uint64_t v259;
  void *v260;
  uint64_t v261;
  void *v262;
  _BYTE v263[128];
  uint64_t v264;
  void *v265;
  uint64_t v266;
  void *v267;
  uint64_t v268;
  void *v269;
  _BYTE v270[128];
  uint64_t v271;
  void *v272;
  uint64_t v273;
  void *v274;
  uint64_t v275;
  void *v276;
  _BYTE v277[128];
  uint64_t v278;
  void *v279;
  uint64_t v280;
  id v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  id v285;
  uint64_t v286;
  id v287;
  uint64_t v288;
  id v289;
  uint64_t v290;
  id v291;
  uint64_t v292;
  id v293;
  uint64_t v294;
  void *v295;
  uint64_t v296;
  _QWORD v297[3];

  v297[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deploymentID"));
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("experimentID"));
    v230 = v8;
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v231 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v231;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("treatmentID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v229 = a4;
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v225 = 0;
        goto LABEL_10;
      }
      v24 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v225 = v10;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("adamID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v227 = 0;
          goto LABEL_13;
        }
        v25 = v7;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v227 = v11;
LABEL_13:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("impressed"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v222 = v11;
          if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v13 = v7;
            v224 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = v7;
            v224 = v12;
LABEL_16:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tapped"));
            v14 = objc_claimAutoreleasedReturnValue();
            v218 = self;
            v223 = (void *)v14;
            if (!v14 || (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v221 = 0;
              goto LABEL_19;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v221 = v15;
LABEL_19:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dupe"));
              v7 = v13;
              v226 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v226 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v16 = 0;
                goto LABEL_22;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v16 = v226;
LABEL_22:
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("installed"));
                v17 = objc_claimAutoreleasedReturnValue();
                v210 = (void *)v17;
                if (!v17 || (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v209 = 0;
                  goto LABEL_25;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v209 = v18;
LABEL_25:
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("errorCode"));
                  v19 = objc_claimAutoreleasedReturnValue();
                  v211 = v10;
                  v219 = v6;
                  v203 = v16;
                  v208 = (void *)v19;
                  if (!v19 || (v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v202 = 0;
LABEL_28:
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appUsageVector"));
                    v21 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0C99E38], "null");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = objc_msgSend(v21, "isEqual:", v22);

                    if (v23)
                    {
                      v204 = v12;
                      v201 = v9;

                      v21 = 0;
LABEL_53:
                      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v21, "count"));
                      v244 = 0u;
                      v245 = 0u;
                      v246 = 0u;
                      v247 = 0u;
                      v21 = v21;
                      v48 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v244, v277, 16);
                      if (!v48)
                        goto LABEL_62;
                      v49 = v48;
                      v50 = *(_QWORD *)v245;
                      while (1)
                      {
                        for (i = 0; i != v49; ++i)
                        {
                          if (*(_QWORD *)v245 != v50)
                            objc_enumerationMutation(v21);
                          v52 = *(_QWORD *)(*((_QWORD *)&v244 + 1) + 8 * i);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            if (v229)
                            {
                              v75 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v76 = *MEMORY[0x1E0D025B8];
                              v275 = *MEMORY[0x1E0CB2D50];
                              v216 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("appUsageVector"));
                              v276 = v216;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v276, &v275, 1);
                              v77 = (void *)objc_claimAutoreleasedReturnValue();
                              v78 = v75;
                              v79 = v76;
LABEL_81:
                              v9 = v201;
                              v35 = v225;
                              v11 = v222;
                              v30 = 0;
                              *v229 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v79, 2, v77);
                              obj = v21;
                              goto LABEL_82;
                            }
LABEL_86:
                            v30 = 0;
                            obj = v21;
                            v9 = v201;
                            v35 = v225;
                            v11 = v222;
                            goto LABEL_87;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            if (v229)
                            {
                              v86 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v87 = *MEMORY[0x1E0D025B8];
                              v273 = *MEMORY[0x1E0CB2D50];
                              v216 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("appUsageVector"));
                              v274 = v216;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v274, &v273, 1);
                              v77 = (void *)objc_claimAutoreleasedReturnValue();
                              v78 = v86;
                              v79 = v87;
                              goto LABEL_81;
                            }
                            goto LABEL_86;
                          }
                          objc_msgSend(v47, "addObject:", v52);
                        }
                        v49 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v244, v277, 16);
                        if (!v49)
                        {
LABEL_62:

                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appDownloadVector"));
                          v53 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(MEMORY[0x1E0C99E38], "null");
                          v54 = (void *)objc_claimAutoreleasedReturnValue();
                          v55 = objc_msgSend(v53, "isEqual:", v54);

                          if (v55)
                          {

                            v53 = 0;
                            v11 = v222;
LABEL_94:
                            v216 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v53, "count"));
                            v240 = 0u;
                            v241 = 0u;
                            v242 = 0u;
                            v243 = 0u;
                            obj = v53;
                            v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v240, v270, 16);
                            if (!v105)
                              goto LABEL_103;
                            v106 = v105;
                            v107 = *(_QWORD *)v241;
                            while (1)
                            {
                              for (j = 0; j != v106; ++j)
                              {
                                if (*(_QWORD *)v241 != v107)
                                  objc_enumerationMutation(obj);
                                v109 = *(_QWORD *)(*((_QWORD *)&v240 + 1) + 8 * j);
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  if (v229)
                                  {
                                    v118 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v119 = *MEMORY[0x1E0D025B8];
                                    v268 = *MEMORY[0x1E0CB2D50];
                                    v200 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("appDownloadVector"));
                                    v269 = v200;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v269, &v268, 1);
                                    v120 = objc_claimAutoreleasedReturnValue();
                                    v121 = v118;
                                    v122 = v119;
LABEL_114:
                                    v198 = (id)v120;
                                    v35 = v225;
                                    v11 = v222;
                                    v12 = v204;
                                    v30 = 0;
                                    *v229 = (id)objc_msgSend(v121, "initWithDomain:code:userInfo:", v122, 2);
                                    v77 = obj;
                                    v9 = v201;
                                    goto LABEL_115;
                                  }
LABEL_119:
                                  v30 = 0;
                                  v77 = obj;
                                  v9 = v201;
                                  v35 = v225;
                                  v11 = v222;
LABEL_82:
                                  v16 = v203;
                                  v12 = v204;
                                  goto LABEL_186;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                {
                                  if (v229)
                                  {
                                    v123 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v124 = *MEMORY[0x1E0D025B8];
                                    v266 = *MEMORY[0x1E0CB2D50];
                                    v200 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("appDownloadVector"));
                                    v267 = v200;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v267, &v266, 1);
                                    v120 = objc_claimAutoreleasedReturnValue();
                                    v121 = v123;
                                    v122 = v124;
                                    goto LABEL_114;
                                  }
                                  goto LABEL_119;
                                }
                                objc_msgSend(v216, "addObject:", v109);
                              }
                              v106 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v240, v270, 16);
                              v11 = v222;
                              if (!v106)
                              {
LABEL_103:

                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("installedAppVector"));
                                v110 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                v111 = (void *)objc_claimAutoreleasedReturnValue();
                                v112 = objc_msgSend(v110, "isEqual:", v111);

                                if (v112)
                                {

                                  goto LABEL_124;
                                }
                                if (v110)
                                {
                                  objc_opt_class();
                                  v199 = v110;
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    if (!v229)
                                    {
                                      v30 = 0;
                                      v9 = v201;
                                      v35 = v225;
                                      v16 = v203;
                                      v12 = v204;
                                      v77 = v199;
                                      goto LABEL_186;
                                    }
                                    v156 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v157 = *MEMORY[0x1E0D025B8];
                                    v264 = *MEMORY[0x1E0CB2D50];
                                    v200 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("installedAppVector"));
                                    v265 = v200;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v265, &v264, 1);
                                    v198 = (id)objc_claimAutoreleasedReturnValue();
                                    v30 = 0;
                                    *v229 = (id)objc_msgSend(v156, "initWithDomain:code:userInfo:", v157, 2);
                                    v9 = v201;
                                    v35 = v225;
                                    v16 = v203;
                                    v12 = v204;
LABEL_164:
                                    v77 = v199;
                                    goto LABEL_185;
                                  }
                                  v125 = v110;
                                }
                                else
                                {
LABEL_124:
                                  v125 = 0;
                                }
                                v200 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v125, "count"));
                                v236 = 0u;
                                v237 = 0u;
                                v238 = 0u;
                                v239 = 0u;
                                v199 = v125;
                                v126 = objc_msgSend(v199, "countByEnumeratingWithState:objects:count:", &v236, v263, 16);
                                if (!v126)
                                  goto LABEL_134;
                                v127 = v126;
                                v128 = *(_QWORD *)v237;
                                while (1)
                                {
                                  for (k = 0; k != v127; ++k)
                                  {
                                    if (*(_QWORD *)v237 != v128)
                                      objc_enumerationMutation(v199);
                                    v130 = *(_QWORD *)(*((_QWORD *)&v236 + 1) + 8 * k);
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      if (v229)
                                      {
                                        v137 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v138 = *MEMORY[0x1E0D025B8];
                                        v261 = *MEMORY[0x1E0CB2D50];
                                        v197 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("installedAppVector"));
                                        v262 = v197;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v262, &v261, 1);
                                        v139 = objc_claimAutoreleasedReturnValue();
                                        v140 = v137;
                                        v141 = v138;
LABEL_142:
                                        v195 = (id)v139;
                                        v35 = v225;
                                        v11 = v222;
                                        v12 = v204;
                                        v30 = 0;
                                        *v229 = (id)objc_msgSend(v140, "initWithDomain:code:userInfo:", v141, 2);
                                        v77 = v199;
                                        v198 = v199;
                                        v9 = v201;
                                        v16 = v203;
                                        goto LABEL_183;
                                      }
LABEL_143:
                                      v30 = 0;
                                      v77 = v199;
                                      v198 = v199;
                                      v9 = v201;
                                      v35 = v225;
                                      v11 = v222;
                                      v12 = v204;
LABEL_115:
                                      v16 = v203;
                                      goto LABEL_185;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (v229)
                                      {
                                        v142 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v143 = *MEMORY[0x1E0D025B8];
                                        v259 = *MEMORY[0x1E0CB2D50];
                                        v197 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("installedAppVector"));
                                        v260 = v197;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v260, &v259, 1);
                                        v139 = objc_claimAutoreleasedReturnValue();
                                        v140 = v142;
                                        v141 = v143;
                                        goto LABEL_142;
                                      }
                                      goto LABEL_143;
                                    }
                                    objc_msgSend(v200, "addObject:", v130);
                                  }
                                  v127 = objc_msgSend(v199, "countByEnumeratingWithState:objects:count:", &v236, v263, 16);
                                  v11 = v222;
                                  if (!v127)
                                  {
LABEL_134:

                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userQueryVector"));
                                    v131 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                    v132 = (void *)objc_claimAutoreleasedReturnValue();
                                    v133 = objc_msgSend(v131, "isEqual:", v132);

                                    if (v133)
                                    {

                                      v131 = 0;
                                      goto LABEL_149;
                                    }
                                    if (v131)
                                    {
                                      objc_opt_class();
                                      v16 = v203;
                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                      {
                                        v198 = v131;
                                        if (v229)
                                        {
                                          v144 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v145 = *MEMORY[0x1E0D025B8];
                                          v257 = *MEMORY[0x1E0CB2D50];
                                          v197 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("userQueryVector"));
                                          v258 = v197;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v258, &v257, 1);
                                          v146 = objc_claimAutoreleasedReturnValue();
                                          v147 = v145;
                                          v16 = v203;
                                          v30 = 0;
                                          *v229 = (id)objc_msgSend(v144, "initWithDomain:code:userInfo:", v147, 2, v146);
                                          v148 = (void *)v146;
                                          v9 = v201;
                                          v35 = v225;
                                          v12 = v204;
                                          v77 = v199;
                                          goto LABEL_184;
                                        }
                                        v30 = 0;
                                        v9 = v201;
                                        v35 = v225;
                                        v12 = v204;
                                        goto LABEL_164;
                                      }
                                    }
                                    else
                                    {
LABEL_149:
                                      v16 = v203;
                                    }
                                    v197 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v131, "count"));
                                    v232 = 0u;
                                    v233 = 0u;
                                    v234 = 0u;
                                    v235 = 0u;
                                    v198 = v131;
                                    v149 = objc_msgSend(v198, "countByEnumeratingWithState:objects:count:", &v232, v256, 16);
                                    if (!v149)
                                      goto LABEL_159;
                                    v150 = v149;
                                    v151 = *(_QWORD *)v233;
LABEL_152:
                                    v152 = 0;
                                    while (1)
                                    {
                                      if (*(_QWORD *)v233 != v151)
                                        objc_enumerationMutation(v198);
                                      v153 = *(_QWORD *)(*((_QWORD *)&v232 + 1) + 8 * v152);
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                        break;
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                      {
                                        if (v229)
                                        {
                                          v163 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v164 = *MEMORY[0x1E0D025B8];
                                          v252 = *MEMORY[0x1E0CB2D50];
                                          v194 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("userQueryVector"));
                                          v253 = v194;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v253, &v252, 1);
                                          v160 = objc_claimAutoreleasedReturnValue();
                                          v161 = v163;
                                          v162 = v164;
                                          goto LABEL_169;
                                        }
                                        goto LABEL_170;
                                      }
                                      objc_msgSend(v197, "addObject:", v153);
                                      if (v150 == ++v152)
                                      {
                                        v150 = objc_msgSend(v198, "countByEnumeratingWithState:objects:count:", &v232, v256, 16);
                                        v11 = v222;
                                        v16 = v203;
                                        if (v150)
                                          goto LABEL_152;
LABEL_159:

                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serverResponse"));
                                        v154 = objc_claimAutoreleasedReturnValue();
                                        v194 = (void *)v154;
                                        if (!v154)
                                        {
                                          v195 = 0;
                                          v9 = v201;
                                          v12 = v204;
                                          goto LABEL_175;
                                        }
                                        v155 = (void *)v154;
                                        objc_opt_class();
                                        v9 = v201;
                                        v12 = v204;
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v195 = 0;
                                          goto LABEL_175;
                                        }
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v195 = v155;
LABEL_175:
                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("recordID"));
                                          v165 = (id)objc_claimAutoreleasedReturnValue();
                                          v190 = v165;
                                          if (!v165)
                                          {
LABEL_178:
                                            v35 = v225;
                                            goto LABEL_179;
                                          }
                                          v166 = v165;
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v165 = 0;
                                            goto LABEL_178;
                                          }
                                          objc_opt_class();
                                          v35 = v225;
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v165 = v166;
                                            v11 = v222;
LABEL_179:
                                            v193 = v165;
                                            v30 = objc_retain(-[BMAdPlatformsTrainingRows initWithDeploymentID:experimentID:treatmentID:adamID:impressed:tapped:dupe:installed:errorCode:appUsageVector:appDownloadVector:installedAppVector:userQueryVector:serverResponse:recordID:](v218, "initWithDeploymentID:experimentID:treatmentID:adamID:impressed:tapped:dupe:installed:errorCode:appUsageVector:appDownloadVector:installedAppVector:userQueryVector:serverResponse:recordID:", v230, v9, v35, v227, v224, v221, v16, v209, v202, v47, v216, v200, v197, v195,
                                                      v165));
                                            v218 = v30;
                                          }
                                          else
                                          {
                                            if (v229)
                                            {
                                              v196 = v7;
                                              v175 = v9;
                                              v176 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v177 = v16;
                                              v178 = *MEMORY[0x1E0D025B8];
                                              v248 = *MEMORY[0x1E0CB2D50];
                                              v179 = v12;
                                              v180 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("recordID"));
                                              v249 = v180;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v249, &v248, 1);
                                              v181 = (void *)objc_claimAutoreleasedReturnValue();
                                              v182 = v176;
                                              v9 = v175;
                                              v7 = v196;
                                              v183 = v178;
                                              v16 = v177;
                                              v35 = v225;
                                              *v229 = (id)objc_msgSend(v182, "initWithDomain:code:userInfo:", v183, 2, v181);

                                              v12 = v179;
                                            }
                                            v193 = 0;
                                            v30 = 0;
                                            v11 = v222;
                                          }

LABEL_181:
                                        }
                                        else
                                        {
                                          if (v229)
                                          {
                                            v168 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v169 = *MEMORY[0x1E0D025B8];
                                            v250 = *MEMORY[0x1E0CB2D50];
                                            v170 = objc_alloc(MEMORY[0x1E0CB3940]);
                                            v189 = objc_opt_class();
                                            v171 = v170;
                                            v12 = v204;
                                            v193 = (void *)objc_msgSend(v171, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), v189, CFSTR("serverResponse"));
                                            v251 = v193;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v251, &v250, 1);
                                            v172 = objc_claimAutoreleasedReturnValue();
                                            v173 = v169;
                                            v16 = v203;
                                            v191 = (void *)v172;
                                            v174 = (id)objc_msgSend(v168, "initWithDomain:code:userInfo:", v173, 2);
                                            v30 = 0;
                                            v195 = 0;
                                            *v229 = v174;
                                            v35 = v225;

                                            goto LABEL_181;
                                          }
                                          v195 = 0;
                                          v30 = 0;
                                          v35 = v225;
                                        }
LABEL_182:

                                        v77 = v199;
LABEL_183:
                                        v148 = v195;
LABEL_184:

LABEL_185:
LABEL_186:

LABEL_187:
LABEL_188:

                                        v6 = v219;
                                        goto LABEL_189;
                                      }
                                    }
                                    if (v229)
                                    {
                                      v158 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v159 = *MEMORY[0x1E0D025B8];
                                      v254 = *MEMORY[0x1E0CB2D50];
                                      v194 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("userQueryVector"));
                                      v255 = v194;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v255, &v254, 1);
                                      v160 = objc_claimAutoreleasedReturnValue();
                                      v161 = v158;
                                      v162 = v159;
LABEL_169:
                                      v192 = (void *)v160;
                                      v35 = v225;
                                      v11 = v222;
                                      v12 = v204;
                                      v30 = 0;
                                      *v229 = (id)objc_msgSend(v161, "initWithDomain:code:userInfo:", v162, 2);
                                      v195 = v198;
                                      v9 = v201;
                                      v16 = v203;

                                      goto LABEL_182;
                                    }
LABEL_170:
                                    v30 = 0;
                                    v148 = v198;
                                    v77 = v199;
                                    v9 = v201;
                                    v35 = v225;
                                    v11 = v222;
                                    v16 = v203;
                                    v12 = v204;
                                    goto LABEL_184;
                                  }
                                }
                              }
                            }
                          }
                          v11 = v222;
                          if (!v53)
                            goto LABEL_94;
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                            goto LABEL_94;
                          obj = v53;
                          if (v229)
                          {
                            v134 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v135 = *MEMORY[0x1E0D025B8];
                            v271 = *MEMORY[0x1E0CB2D50];
                            v216 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("appDownloadVector"));
                            v272 = v216;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v272, &v271, 1);
                            v136 = objc_claimAutoreleasedReturnValue();
                            v30 = 0;
                            *v229 = (id)objc_msgSend(v134, "initWithDomain:code:userInfo:", v135, 2, v136);
                            v77 = (void *)v136;
                            v9 = v201;
                            v35 = v225;
                            goto LABEL_82;
                          }
                          v30 = 0;
                          v9 = v201;
                          v35 = v225;
LABEL_87:
                          v16 = v203;
                          v12 = v204;
                          goto LABEL_187;
                        }
                      }
                    }
                    if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v204 = v12;
                      v201 = v9;
                      goto LABEL_53;
                    }
                    if (v229)
                    {
                      v113 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v114 = v12;
                      v115 = *MEMORY[0x1E0D025B8];
                      v278 = *MEMORY[0x1E0CB2D50];
                      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("appUsageVector"));
                      v279 = v47;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v279, &v278, 1);
                      v116 = objc_claimAutoreleasedReturnValue();
                      v117 = v115;
                      v12 = v114;
                      obja = (id)v116;
                      v30 = 0;
                      *v229 = (id)objc_msgSend(v113, "initWithDomain:code:userInfo:", v117, 2);
                      v35 = v225;
                      v11 = v222;
                      v16 = v203;

                      goto LABEL_188;
                    }
                    v30 = 0;
                    v35 = v225;
                    v11 = v222;
                    v16 = v203;
LABEL_189:
                    v96 = v202;

                    v10 = v211;
                    goto LABEL_190;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v202 = v20;
                    goto LABEL_28;
                  }
                  if (v229)
                  {
                    v97 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v98 = v12;
                    v99 = *MEMORY[0x1E0D025B8];
                    v280 = *MEMORY[0x1E0CB2D50];
                    v100 = v11;
                    v101 = objc_alloc(MEMORY[0x1E0CB3940]);
                    v188 = objc_opt_class();
                    v102 = v101;
                    v11 = v100;
                    v21 = (id)objc_msgSend(v102, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v188, CFSTR("errorCode"));
                    v281 = v21;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v281, &v280, 1);
                    v103 = objc_claimAutoreleasedReturnValue();
                    v104 = v99;
                    v12 = v98;
                    v47 = (void *)v103;
                    v202 = 0;
                    v30 = 0;
                    *v229 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v104, 2);
                    v35 = v225;
                    goto LABEL_188;
                  }
                  v96 = 0;
                  v30 = 0;
                  v35 = v225;
LABEL_190:

                  goto LABEL_191;
                }
                if (v229)
                {
                  v217 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v207 = v12;
                  v88 = v10;
                  v89 = *MEMORY[0x1E0D025B8];
                  v282 = *MEMORY[0x1E0CB2D50];
                  v90 = v16;
                  v91 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v187 = objc_opt_class();
                  v92 = v91;
                  v16 = v90;
                  v93 = objc_msgSend(v92, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v187, CFSTR("installed"));
                  v283 = v93;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v283, &v282, 1);
                  v94 = objc_claimAutoreleasedReturnValue();
                  v11 = v222;
                  v95 = v89;
                  v10 = v88;
                  v12 = v207;
                  v208 = (void *)v94;
                  v209 = 0;
                  v30 = 0;
                  *v229 = (id)objc_msgSend(v217, "initWithDomain:code:userInfo:", v95, 2);
                  v96 = (void *)v93;
                  v35 = v225;
                  goto LABEL_190;
                }
                v209 = 0;
                v30 = 0;
LABEL_117:
                v35 = v225;
LABEL_191:

                goto LABEL_192;
              }
              if (v229)
              {
                v80 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v206 = v12;
                v81 = v10;
                v82 = *MEMORY[0x1E0D025B8];
                v284 = *MEMORY[0x1E0CB2D50];
                v209 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("dupe"));
                v285 = v209;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v285, &v284, 1);
                v83 = objc_claimAutoreleasedReturnValue();
                v84 = v80;
                v11 = v222;
                v85 = v82;
                v10 = v81;
                v12 = v206;
                v210 = (void *)v83;
                v16 = 0;
                v30 = 0;
                *v229 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v85, 2);
                goto LABEL_117;
              }
              v16 = 0;
              v30 = 0;
              v35 = v225;
LABEL_192:

              self = v218;
              goto LABEL_193;
            }
            if (v229)
            {
              v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v205 = v12;
              v71 = v10;
              v72 = *MEMORY[0x1E0D025B8];
              v286 = *MEMORY[0x1E0CB2D50];
              v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("tapped"));
              v287 = v16;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v287, &v286, 1);
              v226 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = v70;
              v11 = v222;
              v74 = v72;
              v10 = v71;
              v12 = v205;
              v221 = 0;
              v30 = 0;
              *v229 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v74, 2, v226);
              v35 = v225;
              v7 = v13;
              goto LABEL_192;
            }
            v221 = 0;
            v30 = 0;
            v35 = v225;
            v7 = v13;
LABEL_193:

            goto LABEL_194;
          }
          if (v229)
          {
            v63 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v213 = v10;
            v64 = *MEMORY[0x1E0D025B8];
            v288 = *MEMORY[0x1E0CB2D50];
            v65 = self;
            v66 = objc_alloc(MEMORY[0x1E0CB3940]);
            v186 = objc_opt_class();
            v67 = v66;
            self = v65;
            v221 = (id)objc_msgSend(v67, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v186, CFSTR("impressed"));
            v289 = v221;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v289, &v288, 1);
            v68 = objc_claimAutoreleasedReturnValue();
            v11 = v222;
            v69 = v64;
            v10 = v213;
            v223 = (void *)v68;
            v224 = 0;
            v30 = 0;
            *v229 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v69, 2);
            v35 = v225;
            goto LABEL_193;
          }
          v224 = 0;
          v30 = 0;
          v35 = v225;
LABEL_194:

          goto LABEL_195;
        }
        if (v229)
        {
          v228 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v212 = v10;
          v56 = *MEMORY[0x1E0D025B8];
          v290 = *MEMORY[0x1E0CB2D50];
          v57 = self;
          v58 = objc_alloc(MEMORY[0x1E0CB3940]);
          v185 = objc_opt_class();
          v59 = v58;
          self = v57;
          v224 = (id)objc_msgSend(v59, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v185, CFSTR("adamID"));
          v291 = v224;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v291, &v290, 1);
          v60 = objc_claimAutoreleasedReturnValue();
          v61 = v56;
          v10 = v212;
          v62 = (id)objc_msgSend(v228, "initWithDomain:code:userInfo:", v61, 2, v60);
          v227 = 0;
          v30 = 0;
          *v229 = v62;
          v7 = v25;
          v12 = (void *)v60;
          v35 = v225;
          goto LABEL_194;
        }
        v227 = 0;
        v30 = 0;
        v35 = v225;
LABEL_195:

        goto LABEL_196;
      }
      if (a4)
      {
        v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v220 = v6;
        v39 = a4;
        v40 = *MEMORY[0x1E0D025B8];
        v292 = *MEMORY[0x1E0CB2D50];
        v41 = self;
        v42 = objc_alloc(MEMORY[0x1E0CB3940]);
        v184 = objc_opt_class();
        v43 = v42;
        self = v41;
        v227 = (id)objc_msgSend(v43, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v184, CFSTR("treatmentID"));
        v293 = v227;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v293, &v292, 1);
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = v40;
        v11 = (void *)v44;
        v46 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v45, 2, v44);
        v35 = 0;
        v30 = 0;
        *v39 = v46;
        v6 = v220;
        v7 = v24;
        goto LABEL_195;
      }
      v35 = 0;
      v30 = 0;
LABEL_196:

      v8 = v230;
      goto LABEL_197;
    }
    if (a4)
    {
      v31 = v6;
      v32 = a4;
      v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v34 = *MEMORY[0x1E0D025B8];
      v294 = *MEMORY[0x1E0CB2D50];
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("experimentID"));
      v295 = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v295, &v294, 1);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v34;
      v10 = (void *)v36;
      v9 = 0;
      v30 = 0;
      *v32 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v37, 2, v36);
      v6 = v31;
      goto LABEL_196;
    }
    v9 = 0;
    v30 = 0;
LABEL_197:

    goto LABEL_198;
  }
  if (a4)
  {
    v26 = v6;
    v27 = a4;
    v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v29 = *MEMORY[0x1E0D025B8];
    v296 = *MEMORY[0x1E0CB2D50];
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("deploymentID"));
    v297[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v297, &v296, 1);
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v30 = 0;
    *v27 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2);
    v6 = v26;
    goto LABEL_197;
  }
  v8 = 0;
  v30 = 0;
LABEL_198:

  return v30;
}

- (id)_appUsageVectorJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BMAdPlatformsTrainingRows appUsageVector](self, "appUsageVector", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "doubleValue");
        if (fabs(v10) == INFINITY)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
        else
        {
          objc_msgSend(v9, "doubleValue");
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_appDownloadVectorJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BMAdPlatformsTrainingRows appDownloadVector](self, "appDownloadVector", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "doubleValue");
        if (fabs(v10) == INFINITY)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
        else
        {
          objc_msgSend(v9, "doubleValue");
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_installedAppVectorJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BMAdPlatformsTrainingRows installedAppVector](self, "installedAppVector", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "doubleValue");
        if (fabs(v10) == INFINITY)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
        else
        {
          objc_msgSend(v9, "doubleValue");
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_userQueryVectorJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BMAdPlatformsTrainingRows userQueryVector](self, "userQueryVector", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "doubleValue");
        if (fabs(v10) == INFINITY)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
        else
        {
          objc_msgSend(v9, "doubleValue");
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  _QWORD v56[15];
  _QWORD v57[17];

  v57[15] = *MEMORY[0x1E0C80C00];
  -[BMAdPlatformsTrainingRows deploymentID](self, "deploymentID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMAdPlatformsTrainingRows experimentID](self, "experimentID");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMAdPlatformsTrainingRows treatmentID](self, "treatmentID");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMAdPlatformsTrainingRows adamID](self, "adamID");
  v6 = objc_claimAutoreleasedReturnValue();
  if (-[BMAdPlatformsTrainingRows hasImpressed](self, "hasImpressed"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAdPlatformsTrainingRows impressed](self, "impressed"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (-[BMAdPlatformsTrainingRows hasTapped](self, "hasTapped"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAdPlatformsTrainingRows tapped](self, "tapped"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (-[BMAdPlatformsTrainingRows hasDupe](self, "hasDupe"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAdPlatformsTrainingRows dupe](self, "dupe"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if (-[BMAdPlatformsTrainingRows hasInstalled](self, "hasInstalled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAdPlatformsTrainingRows installed](self, "installed"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  if (!-[BMAdPlatformsTrainingRows hasErrorCode](self, "hasErrorCode")
    || (-[BMAdPlatformsTrainingRows errorCode](self, "errorCode"), fabs(v11) == INFINITY))
  {
    v55 = 0;
  }
  else
  {
    -[BMAdPlatformsTrainingRows errorCode](self, "errorCode");
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAdPlatformsTrainingRows errorCode](self, "errorCode");
    objc_msgSend(v12, "numberWithDouble:");
    v55 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[BMAdPlatformsTrainingRows _appUsageVectorJSONArray](self, "_appUsageVectorJSONArray");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAdPlatformsTrainingRows _appDownloadVectorJSONArray](self, "_appDownloadVectorJSONArray");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAdPlatformsTrainingRows _installedAppVectorJSONArray](self, "_installedAppVectorJSONArray");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAdPlatformsTrainingRows _userQueryVectorJSONArray](self, "_userQueryVectorJSONArray");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAdPlatformsTrainingRows serverResponse](self, "serverResponse");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMAdPlatformsTrainingRows recordID](self, "recordID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = CFSTR("deploymentID");
  v15 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v15;
  v57[0] = v15;
  v56[1] = CFSTR("experimentID");
  v16 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v16;
  v57[1] = v16;
  v56[2] = CFSTR("treatmentID");
  v17 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v17;
  v57[2] = v17;
  v56[3] = CFSTR("adamID");
  v18 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v18;
  v57[3] = v18;
  v56[4] = CFSTR("impressed");
  v19 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v19;
  v57[4] = v19;
  v56[5] = CFSTR("tapped");
  v20 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v20;
  v57[5] = v20;
  v56[6] = CFSTR("dupe");
  v21 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v46 = v9;
  v47 = v8;
  v37 = (void *)v21;
  v57[6] = v21;
  v56[7] = CFSTR("installed");
  v22 = (uint64_t)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v5;
  v36 = (void *)v22;
  v57[7] = v22;
  v56[8] = CFSTR("errorCode");
  v24 = (uint64_t)v55;
  if (!v55)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v34 = v24;
  v57[8] = v24;
  v56[9] = CFSTR("appUsageVector");
  v25 = v54;
  if (!v54)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v24, v36, v37, v38, v39, v40, v41, v42, v43);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v3;
  v49 = (void *)v6;
  v57[9] = v25;
  v56[10] = CFSTR("appDownloadVector");
  v26 = v53;
  if (!v53)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v45 = v7;
  v27 = (void *)v4;
  v57[10] = v26;
  v56[11] = CFSTR("installedAppVector");
  v28 = v52;
  if (!v52)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = v23;
  v57[11] = v28;
  v56[12] = CFSTR("userQueryVector");
  v30 = v51;
  if (!v51)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v57[12] = v30;
  v56[13] = CFSTR("serverResponse");
  v31 = v50;
  if (!v50)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v57[13] = v31;
  v56[14] = CFSTR("recordID");
  v32 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v57[14] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 15, v34);
  v44 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)

  if (!v50)
  if (!v51)

  if (!v52)
  if (!v53)

  if (!v54)
  if (!v55)

  if (!v10)
  if (v46)
  {
    if (v47)
      goto LABEL_65;
  }
  else
  {

    if (v47)
    {
LABEL_65:
      if (v45)
        goto LABEL_66;
      goto LABEL_73;
    }
  }

  if (v45)
  {
LABEL_66:
    if (v49)
      goto LABEL_67;
    goto LABEL_74;
  }
LABEL_73:

  if (v49)
  {
LABEL_67:
    if (v29)
      goto LABEL_68;
    goto LABEL_75;
  }
LABEL_74:

  if (v29)
  {
LABEL_68:
    if (v27)
      goto LABEL_69;
LABEL_76:

    if (v48)
      goto LABEL_70;
LABEL_77:

    goto LABEL_70;
  }
LABEL_75:

  if (!v27)
    goto LABEL_76;
LABEL_69:
  if (!v48)
    goto LABEL_77;
LABEL_70:

  return v44;
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
  int v32;
  int v33;
  int v34;
  double v35;
  double v36;
  double v37;
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
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  void *v69;
  void *v70;
  void *v71;
  void *v72;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMAdPlatformsTrainingRows deploymentID](self, "deploymentID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deploymentID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAdPlatformsTrainingRows deploymentID](self, "deploymentID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deploymentID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_62;
    }
    -[BMAdPlatformsTrainingRows experimentID](self, "experimentID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "experimentID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMAdPlatformsTrainingRows experimentID](self, "experimentID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "experimentID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_62;
    }
    -[BMAdPlatformsTrainingRows treatmentID](self, "treatmentID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "treatmentID");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMAdPlatformsTrainingRows treatmentID](self, "treatmentID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "treatmentID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_62;
    }
    -[BMAdPlatformsTrainingRows adamID](self, "adamID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "adamID");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMAdPlatformsTrainingRows adamID](self, "adamID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "adamID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_62;
    }
    if (-[BMAdPlatformsTrainingRows hasImpressed](self, "hasImpressed")
      || objc_msgSend(v5, "hasImpressed"))
    {
      if (!-[BMAdPlatformsTrainingRows hasImpressed](self, "hasImpressed"))
        goto LABEL_62;
      if (!objc_msgSend(v5, "hasImpressed"))
        goto LABEL_62;
      v31 = -[BMAdPlatformsTrainingRows impressed](self, "impressed");
      if (v31 != objc_msgSend(v5, "impressed"))
        goto LABEL_62;
    }
    if (-[BMAdPlatformsTrainingRows hasTapped](self, "hasTapped") || objc_msgSend(v5, "hasTapped"))
    {
      if (!-[BMAdPlatformsTrainingRows hasTapped](self, "hasTapped"))
        goto LABEL_62;
      if (!objc_msgSend(v5, "hasTapped"))
        goto LABEL_62;
      v32 = -[BMAdPlatformsTrainingRows tapped](self, "tapped");
      if (v32 != objc_msgSend(v5, "tapped"))
        goto LABEL_62;
    }
    if (-[BMAdPlatformsTrainingRows hasDupe](self, "hasDupe") || objc_msgSend(v5, "hasDupe"))
    {
      if (!-[BMAdPlatformsTrainingRows hasDupe](self, "hasDupe"))
        goto LABEL_62;
      if (!objc_msgSend(v5, "hasDupe"))
        goto LABEL_62;
      v33 = -[BMAdPlatformsTrainingRows dupe](self, "dupe");
      if (v33 != objc_msgSend(v5, "dupe"))
        goto LABEL_62;
    }
    if (-[BMAdPlatformsTrainingRows hasInstalled](self, "hasInstalled")
      || objc_msgSend(v5, "hasInstalled"))
    {
      if (!-[BMAdPlatformsTrainingRows hasInstalled](self, "hasInstalled"))
        goto LABEL_62;
      if (!objc_msgSend(v5, "hasInstalled"))
        goto LABEL_62;
      v34 = -[BMAdPlatformsTrainingRows installed](self, "installed");
      if (v34 != objc_msgSend(v5, "installed"))
        goto LABEL_62;
    }
    if (-[BMAdPlatformsTrainingRows hasErrorCode](self, "hasErrorCode")
      || objc_msgSend(v5, "hasErrorCode"))
    {
      if (!-[BMAdPlatformsTrainingRows hasErrorCode](self, "hasErrorCode"))
        goto LABEL_62;
      if (!objc_msgSend(v5, "hasErrorCode"))
        goto LABEL_62;
      -[BMAdPlatformsTrainingRows errorCode](self, "errorCode");
      v36 = v35;
      objc_msgSend(v5, "errorCode");
      if (v36 != v37)
        goto LABEL_62;
    }
    -[BMAdPlatformsTrainingRows appUsageVector](self, "appUsageVector");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appUsageVector");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v38 == (void *)v39)
    {

    }
    else
    {
      v40 = (void *)v39;
      -[BMAdPlatformsTrainingRows appUsageVector](self, "appUsageVector");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appUsageVector");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v41, "isEqual:", v42);

      if (!v43)
        goto LABEL_62;
    }
    -[BMAdPlatformsTrainingRows appDownloadVector](self, "appDownloadVector");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appDownloadVector");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v44 == (void *)v45)
    {

    }
    else
    {
      v46 = (void *)v45;
      -[BMAdPlatformsTrainingRows appDownloadVector](self, "appDownloadVector");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appDownloadVector");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v47, "isEqual:", v48);

      if (!v49)
        goto LABEL_62;
    }
    -[BMAdPlatformsTrainingRows installedAppVector](self, "installedAppVector");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "installedAppVector");
    v51 = objc_claimAutoreleasedReturnValue();
    if (v50 == (void *)v51)
    {

    }
    else
    {
      v52 = (void *)v51;
      -[BMAdPlatformsTrainingRows installedAppVector](self, "installedAppVector");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "installedAppVector");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v53, "isEqual:", v54);

      if (!v55)
        goto LABEL_62;
    }
    -[BMAdPlatformsTrainingRows userQueryVector](self, "userQueryVector");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userQueryVector");
    v57 = objc_claimAutoreleasedReturnValue();
    if (v56 == (void *)v57)
    {

    }
    else
    {
      v58 = (void *)v57;
      -[BMAdPlatformsTrainingRows userQueryVector](self, "userQueryVector");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userQueryVector");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v59, "isEqual:", v60);

      if (!v61)
        goto LABEL_62;
    }
    -[BMAdPlatformsTrainingRows serverResponse](self, "serverResponse");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverResponse");
    v63 = objc_claimAutoreleasedReturnValue();
    if (v62 == (void *)v63)
    {

    }
    else
    {
      v64 = (void *)v63;
      -[BMAdPlatformsTrainingRows serverResponse](self, "serverResponse");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serverResponse");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v65, "isEqual:", v66);

      if (!v67)
      {
LABEL_62:
        v12 = 0;
LABEL_63:

        goto LABEL_64;
      }
    }
    -[BMAdPlatformsTrainingRows recordID](self, "recordID");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordID");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v69 == v70)
    {
      v12 = 1;
    }
    else
    {
      -[BMAdPlatformsTrainingRows recordID](self, "recordID");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordID");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v71, "isEqual:", v72);

    }
    goto LABEL_63;
  }
  v12 = 0;
LABEL_64:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)deploymentID
{
  return self->_deploymentID;
}

- (NSString)experimentID
{
  return self->_experimentID;
}

- (NSString)treatmentID
{
  return self->_treatmentID;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (BOOL)impressed
{
  return self->_impressed;
}

- (BOOL)hasImpressed
{
  return self->_hasImpressed;
}

- (void)setHasImpressed:(BOOL)a3
{
  self->_hasImpressed = a3;
}

- (BOOL)tapped
{
  return self->_tapped;
}

- (BOOL)hasTapped
{
  return self->_hasTapped;
}

- (void)setHasTapped:(BOOL)a3
{
  self->_hasTapped = a3;
}

- (BOOL)dupe
{
  return self->_dupe;
}

- (BOOL)hasDupe
{
  return self->_hasDupe;
}

- (void)setHasDupe:(BOOL)a3
{
  self->_hasDupe = a3;
}

- (BOOL)installed
{
  return self->_installed;
}

- (BOOL)hasInstalled
{
  return self->_hasInstalled;
}

- (void)setHasInstalled:(BOOL)a3
{
  self->_hasInstalled = a3;
}

- (double)errorCode
{
  return self->_errorCode;
}

- (BOOL)hasErrorCode
{
  return self->_hasErrorCode;
}

- (void)setHasErrorCode:(BOOL)a3
{
  self->_hasErrorCode = a3;
}

- (NSArray)appUsageVector
{
  return self->_appUsageVector;
}

- (NSArray)appDownloadVector
{
  return self->_appDownloadVector;
}

- (NSArray)installedAppVector
{
  return self->_installedAppVector;
}

- (NSArray)userQueryVector
{
  return self->_userQueryVector;
}

- (NSData)serverResponse
{
  return self->_serverResponse;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_serverResponse, 0);
  objc_storeStrong((id *)&self->_userQueryVector, 0);
  objc_storeStrong((id *)&self->_installedAppVector, 0);
  objc_storeStrong((id *)&self->_appDownloadVector, 0);
  objc_storeStrong((id *)&self->_appUsageVector, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_treatmentID, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_deploymentID, 0);
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

    v4 = -[BMAdPlatformsTrainingRows initByReadFrom:]([BMAdPlatformsTrainingRows alloc], "initByReadFrom:", v7);
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
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[17];

  v19[15] = *MEMORY[0x1E0C80C00];
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deploymentID"), 2, 0, 1, 13, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("experimentID"), 2, 0, 2, 13, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("treatmentID"), 2, 0, 3, 13, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("adamID"), 2, 0, 4, 13, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("impressed"), 0, 0, 5, 12, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tapped"), 0, 0, 6, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("dupe"), 0, 0, 7, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("installed"), 0, 0, 8, 12, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("errorCode"), 1, 0, 9, 0, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("appUsageVector_json"), 5, 1, &__block_literal_global_20718);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("appDownloadVector_json"), 5, 1, &__block_literal_global_62);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("installedAppVector_json"), 5, 1, &__block_literal_global_63);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("userQueryVector_json"), 5, 1, &__block_literal_global_64);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("serverResponse"), 4, 0, 14, 14, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("recordID"), 2, 0, 15, 13, 0);
  v19[0] = v18;
  v19[1] = v17;
  v19[2] = v16;
  v19[3] = v15;
  v19[4] = v14;
  v19[5] = v2;
  v19[6] = v3;
  v19[7] = v4;
  v19[8] = v13;
  v19[9] = v12;
  v19[10] = v5;
  v19[11] = v6;
  v19[12] = v11;
  v19[13] = v7;
  v19[14] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 15);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1BB20;
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
  void *v18;
  _QWORD v19[17];

  v19[15] = *MEMORY[0x1E0C80C00];
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deploymentID"), 1, 13, 0);
  v19[0] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("experimentID"), 2, 13, 0);
  v19[1] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("treatmentID"), 3, 13, 0);
  v19[2] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("adamID"), 4, 13, 0);
  v19[3] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("impressed"), 5, 12, 0);
  v19[4] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tapped"), 6, 12, 0);
  v19[5] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dupe"), 7, 12, 0);
  v19[6] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("installed"), 8, 12, 0);
  v19[7] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("errorCode"), 9, 0, 0);
  v19[8] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appUsageVector"), 10, 0, 0);
  v19[9] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appDownloadVector"), 11, 0, 0);
  v19[10] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("installedAppVector"), 12, 0, 0);
  v19[11] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userQueryVector"), 13, 0, 0);
  v19[12] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("serverResponse"), 14, 14, 0);
  v19[13] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("recordID"), 15, 13, 0);
  v19[14] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __36__BMAdPlatformsTrainingRows_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_userQueryVectorJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __36__BMAdPlatformsTrainingRows_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_installedAppVectorJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __36__BMAdPlatformsTrainingRows_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_appDownloadVectorJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __36__BMAdPlatformsTrainingRows_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_appUsageVectorJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
