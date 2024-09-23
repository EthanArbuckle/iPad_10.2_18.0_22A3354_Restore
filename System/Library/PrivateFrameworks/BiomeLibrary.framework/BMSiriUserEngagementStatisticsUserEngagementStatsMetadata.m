@implementation BMSiriUserEngagementStatisticsUserEngagementStatsMetadata

- (BMSiriUserEngagementStatisticsUserEngagementStatsMetadata)initWithDeviceFamily:(id)a3 siriInputLocale:(id)a4 systemBuild:(id)a5 audioInputRoute:(id)a6 invocationSource:(id)a7 waitTime:(id)a8
{
  id v15;
  id v16;
  id v17;
  BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *v18;
  int v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)BMSiriUserEngagementStatisticsUserEngagementStatsMetadata;
  v18 = -[BMEventBase init](&v24, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v18->_deviceFamily, a3);
    objc_storeStrong((id *)&v18->_siriInputLocale, a4);
    objc_storeStrong((id *)&v18->_systemBuild, a5);
    objc_storeStrong((id *)&v18->_audioInputRoute, a6);
    objc_storeStrong((id *)&v18->_invocationSource, a7);
    if (v17)
    {
      v18->_hasWaitTime = 1;
      v19 = objc_msgSend(v17, "intValue");
    }
    else
    {
      v18->_hasWaitTime = 0;
      v19 = -1;
    }
    v18->_waitTime = v19;
  }

  return v18;
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
  -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata deviceFamily](self, "deviceFamily");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata siriInputLocale](self, "siriInputLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata systemBuild](self, "systemBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata audioInputRoute](self, "audioInputRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata invocationSource](self, "invocationSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata waitTime](self, "waitTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriUserEngagementStatisticsUserEngagementStatsMetadata with deviceFamily: %@, siriInputLocale: %@, systemBuild: %@, audioInputRoute: %@, invocationSource: %@, waitTime: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  void *v29;
  BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMSiriUserEngagementStatisticsUserEngagementStatsMetadata;
  v5 = -[BMEventBase init](&v32, sel_init);
  if (!v5)
    goto LABEL_43;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v8])
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v6;
        v14 = *(_QWORD *)&v4[v13];
        v15 = v14 + 1;
        if (v14 == -1 || v15 > *(_QWORD *)&v4[*v7])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v17 = v11++ >= 9;
        if (v17)
        {
          v12 = 0;
          v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v18 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v18 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 40;
          goto LABEL_34;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
          goto LABEL_34;
        case 3u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 56;
          goto LABEL_34;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 64;
          goto LABEL_34;
        case 5u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          v5->_hasWaitTime = 1;
          break;
        case 6u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 32;
LABEL_34:
          v29 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_42;
          continue;
      }
      while (1)
      {
        v25 = *v6;
        v26 = *(_QWORD *)&v4[v25];
        v27 = v26 + 1;
        if (v26 == -1 || v27 > *(_QWORD *)&v4[*v7])
          break;
        v28 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
        *(_QWORD *)&v4[v25] = v27;
        v24 |= (unint64_t)(v28 & 0x7F) << v22;
        if ((v28 & 0x80) == 0)
          goto LABEL_38;
        v22 += 7;
        v17 = v23++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_40;
        }
      }
      v4[*v8] = 1;
LABEL_38:
      if (v4[*v8])
        LODWORD(v24) = 0;
LABEL_40:
      v5->_waitTime = v24;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_42:
    v30 = 0;
  else
LABEL_43:
    v30 = v5;

  return v30;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_deviceFamily)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_siriInputLocale)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_systemBuild)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_audioInputRoute)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_invocationSource)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasWaitTime)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriUserEngagementStatisticsUserEngagementStatsMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *v16;
  void *v17;
  id v19;
  id *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id *v25;
  uint64_t v26;
  id *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id *v45;
  id v46;
  id *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id *v62;
  uint64_t v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceFamily"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("siriInputLocale"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v17 = 0;
          v16 = 0;
          goto LABEL_25;
        }
        v23 = v8;
        v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v25 = a4;
        v26 = *MEMORY[0x1E0D025B8];
        v61 = *MEMORY[0x1E0CB2D50];
        v27 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("siriInputLocale"));
        v62 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v24;
        v8 = v23;
        v29 = v26;
        a4 = v27;
        v16 = 0;
        v17 = 0;
        *v25 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2, v10);
        goto LABEL_24;
      }
      v51 = v9;
    }
    else
    {
      v51 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("systemBuild"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v16 = 0;
          v17 = v51;
          goto LABEL_24;
        }
        v30 = v8;
        v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v32 = a4;
        v33 = *MEMORY[0x1E0D025B8];
        v59 = *MEMORY[0x1E0CB2D50];
        v50 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("systemBuild"));
        v60 = v50;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v31;
        v8 = v30;
        v35 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v33, 2, v11);
        v16 = 0;
        a4 = 0;
        *v32 = v35;
        goto LABEL_22;
      }
      v47 = v10;
    }
    else
    {
      v47 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("audioInputRoute"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v8;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v50 = 0;
          v16 = 0;
          v17 = v51;
          a4 = v47;
          goto LABEL_23;
        }
        v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v37 = *MEMORY[0x1E0D025B8];
        v57 = *MEMORY[0x1E0CB2D50];
        v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("audioInputRoute"));
        v58 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2, v12);
        v16 = 0;
        v50 = 0;
        *a4 = v38;
        goto LABEL_57;
      }
      v50 = v11;
    }
    else
    {
      v50 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("invocationSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
LABEL_16:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("waitTime"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v44 = *MEMORY[0x1E0D025B8];
            v53 = *MEMORY[0x1E0CB2D50];
            v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("waitTime"));
            v54 = v42;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v44, 2, v43);

          }
          v15 = 0;
          v16 = 0;
          a4 = v47;
          goto LABEL_20;
        }
        v15 = v14;
      }
      else
      {
        v15 = 0;
      }
      a4 = v47;
      v16 = -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata initWithDeviceFamily:siriInputLocale:systemBuild:audioInputRoute:invocationSource:waitTime:](v52, "initWithDeviceFamily:siriInputLocale:systemBuild:audioInputRoute:invocationSource:waitTime:", v48, v51, v47, v50, v13, v15);
      v52 = v16;
LABEL_20:

LABEL_21:
      v8 = v48;
LABEL_22:
      v17 = v51;
LABEL_23:

      self = v52;
LABEL_24:

      v7 = v49;
      goto LABEL_25;
    }
    if (a4)
    {
      v45 = a4;
      v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v40 = *MEMORY[0x1E0D025B8];
      v55 = *MEMORY[0x1E0CB2D50];
      v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("invocationSource"));
      v56 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v40, 2, v14);
      v16 = 0;
      v13 = 0;
      a4 = v47;
      *v45 = v41;
      goto LABEL_20;
    }
    v13 = 0;
    v16 = 0;
LABEL_57:
    a4 = v47;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v16 = 0;
    v8 = 0;
    goto LABEL_26;
  }
  v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v20 = a4;
  v21 = *MEMORY[0x1E0D025B8];
  v63 = *MEMORY[0x1E0CB2D50];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("deviceFamily"));
  v64[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v21, 2, v9);
  v16 = 0;
  v8 = 0;
  *v20 = v22;
LABEL_25:

LABEL_26:
  return v16;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  _QWORD v23[7];

  v23[6] = *MEMORY[0x1E0C80C00];
  -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata deviceFamily](self, "deviceFamily");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata siriInputLocale](self, "siriInputLocale");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata systemBuild](self, "systemBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata audioInputRoute](self, "audioInputRoute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata invocationSource](self, "invocationSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata hasWaitTime](self, "hasWaitTime"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata waitTime](self, "waitTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v22[0] = CFSTR("deviceFamily");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v9;
  v21 = (void *)v4;
  v23[0] = v9;
  v22[1] = CFSTR("siriInputLocale");
  v10 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v18 = v10;
  v23[1] = v10;
  v22[2] = CFSTR("systemBuild");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v10, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[2] = v11;
  v22[3] = CFSTR("audioInputRoute");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v3;
  v23[3] = v12;
  v22[4] = CFSTR("invocationSource");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[4] = v14;
  v22[5] = CFSTR("waitTime");
  v15 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[5] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 6, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_18;
  }
  else
  {

    if (v7)
    {
LABEL_18:
      if (v6)
        goto LABEL_19;
LABEL_25:

      if (v5)
        goto LABEL_20;
      goto LABEL_26;
    }
  }

  if (!v6)
    goto LABEL_25;
LABEL_19:
  if (v5)
    goto LABEL_20;
LABEL_26:

LABEL_20:
  if (!v21)
  {

    if (v13)
      goto LABEL_22;
LABEL_28:

    goto LABEL_22;
  }
  if (!v13)
    goto LABEL_28;
LABEL_22:

  return v16;
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
  int v37;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata deviceFamily](self, "deviceFamily");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceFamily");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata deviceFamily](self, "deviceFamily");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceFamily");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_28;
    }
    -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata siriInputLocale](self, "siriInputLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "siriInputLocale");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata siriInputLocale](self, "siriInputLocale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "siriInputLocale");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_28;
    }
    -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata systemBuild](self, "systemBuild");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemBuild");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata systemBuild](self, "systemBuild");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "systemBuild");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_28;
    }
    -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata audioInputRoute](self, "audioInputRoute");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "audioInputRoute");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata audioInputRoute](self, "audioInputRoute");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "audioInputRoute");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_28;
    }
    -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata invocationSource](self, "invocationSource");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invocationSource");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata invocationSource](self, "invocationSource");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "invocationSource");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_28;
    }
    if (!-[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata hasWaitTime](self, "hasWaitTime")
      && !objc_msgSend(v5, "hasWaitTime"))
    {
      v12 = 1;
      goto LABEL_29;
    }
    if (-[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata hasWaitTime](self, "hasWaitTime")
      && objc_msgSend(v5, "hasWaitTime"))
    {
      v37 = -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata waitTime](self, "waitTime");
      v12 = v37 == objc_msgSend(v5, "waitTime");
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

- (NSString)deviceFamily
{
  return self->_deviceFamily;
}

- (NSString)siriInputLocale
{
  return self->_siriInputLocale;
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (NSString)audioInputRoute
{
  return self->_audioInputRoute;
}

- (NSString)invocationSource
{
  return self->_invocationSource;
}

- (int)waitTime
{
  return self->_waitTime;
}

- (BOOL)hasWaitTime
{
  return self->_hasWaitTime;
}

- (void)setHasWaitTime:(BOOL)a3
{
  self->_hasWaitTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationSource, 0);
  objc_storeStrong((id *)&self->_audioInputRoute, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_siriInputLocale, 0);
  objc_storeStrong((id *)&self->_deviceFamily, 0);
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

    v4 = -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata initByReadFrom:]([BMSiriUserEngagementStatisticsUserEngagementStatsMetadata alloc], "initByReadFrom:", v7);
    v4[5] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceFamily"), 2, 0, 6, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("siriInputLocale"), 2, 0, 1, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("systemBuild"), 2, 0, 2, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("audioInputRoute"), 2, 0, 3, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("invocationSource"), 2, 0, 4, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("waitTime"), 0, 0, 5, 2, 0);
  v10[0] = v3;
  v10[1] = v4;
  v10[2] = v5;
  v10[3] = v6;
  v10[4] = v7;
  v10[5] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1FB10;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceFamily"), 6, 13, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("siriInputLocale"), 1, 13, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("systemBuild"), 2, 13, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("audioInputRoute"), 3, 13, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("invocationSource"), 4, 13, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("waitTime"), 5, 2, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
