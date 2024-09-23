@implementation BMSiriOnDeviceDigestExperimentMetricsEventMetadata

- (BMSiriOnDeviceDigestExperimentMetricsEventMetadata)initWithOddIdUUID:(id)a3 deviceAggregationId:(id)a4 userAggregationId:(id)a5 eventTimestampInMSSince1970:(id)a6 timeInterval:(id)a7 userAggregationIdRotationTimestampInMs:(id)a8 userAggregationIdExpirationTimestampInMs:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  BMSiriOnDeviceDigestExperimentMetricsEventMetadata *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v28.receiver = self;
  v28.super_class = (Class)BMSiriOnDeviceDigestExperimentMetricsEventMetadata;
  v20 = -[BMEventBase init](&v28, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v20->_oddIdUUID, a3);
    objc_storeStrong((id *)&v20->_deviceAggregationId, a4);
    objc_storeStrong((id *)&v20->_userAggregationId, a5);
    if (v16)
    {
      v20->_hasEventTimestampInMSSince1970 = 1;
      v21 = objc_msgSend(v16, "unsignedLongLongValue");
    }
    else
    {
      v21 = 0;
      v20->_hasEventTimestampInMSSince1970 = 0;
    }
    v20->_eventTimestampInMSSince1970 = v21;
    objc_storeStrong((id *)&v20->_timeInterval, a7);
    if (v18)
    {
      v20->_hasUserAggregationIdRotationTimestampInMs = 1;
      v22 = objc_msgSend(v18, "unsignedLongLongValue");
    }
    else
    {
      v22 = 0;
      v20->_hasUserAggregationIdRotationTimestampInMs = 0;
    }
    v20->_userAggregationIdRotationTimestampInMs = v22;
    if (v19)
    {
      v20->_hasUserAggregationIdExpirationTimestampInMs = 1;
      v23 = objc_msgSend(v19, "unsignedLongLongValue");
    }
    else
    {
      v23 = 0;
      v20->_hasUserAggregationIdExpirationTimestampInMs = 0;
    }
    v20->_userAggregationIdExpirationTimestampInMs = v23;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata oddIdUUID](self, "oddIdUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata deviceAggregationId](self, "deviceAggregationId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata userAggregationId](self, "userAggregationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata eventTimestampInMSSince1970](self, "eventTimestampInMSSince1970"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata timeInterval](self, "timeInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata userAggregationIdRotationTimestampInMs](self, "userAggregationIdRotationTimestampInMs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata userAggregationIdExpirationTimestampInMs](self, "userAggregationIdExpirationTimestampInMs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriOnDeviceDigestExperimentMetricsEventMetadata with oddIdUUID: %@, deviceAggregationId: %@, userAggregationId: %@, eventTimestampInMSSince1970: %@, timeInterval: %@, userAggregationIdRotationTimestampInMs: %@, userAggregationIdExpirationTimestampInMs: %@"), v4, v5, v6, v7, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriOnDeviceDigestExperimentMetricsEventMetadata *v5;
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
  void *v22;
  char v23;
  unsigned int v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval *v30;
  BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval *timeInterval;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  BMSiriOnDeviceDigestExperimentMetricsEventMetadata *v45;
  objc_super v47;
  uint64_t v48;
  uint64_t v49;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BMSiriOnDeviceDigestExperimentMetricsEventMetadata;
  v5 = -[BMEventBase init](&v47, sel_init);
  if (!v5)
    goto LABEL_66;
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
          v21 = 24;
          goto LABEL_25;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 32;
          goto LABEL_25;
        case 3u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 40;
LABEL_25:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 4u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v5->_hasEventTimestampInMSSince1970 = 1;
          while (2)
          {
            v26 = *v6;
            v27 = *(_QWORD *)&v4[v26];
            v28 = v27 + 1;
            if (v27 == -1 || v28 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v27);
              *(_QWORD *)&v4[v26] = v28;
              v25 |= (unint64_t)(v29 & 0x7F) << v23;
              if (v29 < 0)
              {
                v23 += 7;
                v17 = v24++ >= 9;
                if (v17)
                {
                  v25 = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v25 = 0;
LABEL_53:
          v44 = 48;
          goto LABEL_62;
        case 5u:
          v48 = 0;
          v49 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_65;
          v30 = -[BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval initByReadFrom:]([BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval alloc], "initByReadFrom:", v4);
          if (!v30)
            goto LABEL_65;
          timeInterval = v5->_timeInterval;
          v5->_timeInterval = v30;

          PBReaderRecallMark();
          continue;
        case 6u:
          v32 = 0;
          v33 = 0;
          v25 = 0;
          v5->_hasUserAggregationIdRotationTimestampInMs = 1;
          while (2)
          {
            v34 = *v6;
            v35 = *(_QWORD *)&v4[v34];
            v36 = v35 + 1;
            if (v35 == -1 || v36 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v35);
              *(_QWORD *)&v4[v34] = v36;
              v25 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v17 = v33++ >= 9;
                if (v17)
                {
                  v25 = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v25 = 0;
LABEL_57:
          v44 = 64;
          goto LABEL_62;
        case 7u:
          v38 = 0;
          v39 = 0;
          v25 = 0;
          v5->_hasUserAggregationIdExpirationTimestampInMs = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_65;
          continue;
      }
      while (1)
      {
        v40 = *v6;
        v41 = *(_QWORD *)&v4[v40];
        v42 = v41 + 1;
        if (v41 == -1 || v42 > *(_QWORD *)&v4[*v7])
          break;
        v43 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v41);
        *(_QWORD *)&v4[v40] = v42;
        v25 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0)
          goto LABEL_59;
        v38 += 7;
        v17 = v39++ >= 9;
        if (v17)
        {
          v25 = 0;
          goto LABEL_61;
        }
      }
      v4[*v8] = 1;
LABEL_59:
      if (v4[*v8])
        v25 = 0;
LABEL_61:
      v44 = 72;
LABEL_62:
      *(Class *)((char *)&v5->super.super.isa + v44) = (Class)v25;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_65:
    v45 = 0;
  else
LABEL_66:
    v45 = v5;

  return v45;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_oddIdUUID)
    PBDataWriterWriteStringField();
  if (self->_deviceAggregationId)
    PBDataWriterWriteStringField();
  if (self->_userAggregationId)
    PBDataWriterWriteStringField();
  if (self->_hasEventTimestampInMSSince1970)
    PBDataWriterWriteUint64Field();
  if (self->_timeInterval)
  {
    PBDataWriterPlaceMark();
    -[BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval writeTo:](self->_timeInterval, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_hasUserAggregationIdRotationTimestampInMs)
    PBDataWriterWriteUint64Field();
  if (self->_hasUserAggregationIdExpirationTimestampInMs)
    PBDataWriterWriteUint64Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriOnDeviceDigestExperimentMetricsEventMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  BMSiriOnDeviceDigestExperimentMetricsEventMetadata *v19;
  id v20;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  id *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval *v60;
  void *v61;
  id v62;
  id *v63;
  BMSiriOnDeviceDigestExperimentMetricsEventMetadata *v64;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval *v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  _QWORD v81[3];

  v81[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("oddIdUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceAggregationId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v19 = 0;
          goto LABEL_29;
        }
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30 = v8;
        v31 = *MEMORY[0x1E0D025B8];
        v78 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("deviceAggregationId"));
        v79 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
        v32 = a4;
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v31;
        v8 = v30;
        v34 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v33, 2, v11);
        v19 = 0;
        v10 = 0;
        *v32 = v34;
        goto LABEL_28;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userAggregationId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v7;
    v65 = v10;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v63)
        {
          v12 = 0;
          v19 = 0;
          goto LABEL_28;
        }
        v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v36 = v8;
        v37 = *MEMORY[0x1E0D025B8];
        v76 = *MEMORY[0x1E0CB2D50];
        v66 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("userAggregationId"));
        v77 = v66;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v35;
        v10 = v65;
        v39 = v37;
        v8 = v36;
        v19 = 0;
        v12 = 0;
        *v63 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 2, v13);
LABEL_27:

        v7 = v61;
LABEL_28:

        goto LABEL_29;
      }
      v12 = v11;
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventTimestampInMSSince1970"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v12;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v63)
        {
          v66 = 0;
          v19 = 0;
          goto LABEL_27;
        }
        v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v41 = v8;
        v42 = *MEMORY[0x1E0D025B8];
        v74 = *MEMORY[0x1E0CB2D50];
        v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("eventTimestampInMSSince1970"));
        v75 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = v40;
        v10 = v65;
        v45 = v42;
        v8 = v41;
        v60 = (BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval *)v43;
        v19 = 0;
        v66 = 0;
        *v63 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v45, 2);
        goto LABEL_25;
      }
      v66 = v13;
    }
    else
    {
      v66 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timeInterval"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = self;
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v63)
        {
          v19 = 0;
          goto LABEL_26;
        }
        v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v59 = v8;
        v47 = *MEMORY[0x1E0D025B8];
        v72 = *MEMORY[0x1E0CB2D50];
        v60 = (BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("timeInterval"));
        v73 = v60;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v46;
        v10 = v65;
        v50 = v47;
        v8 = v59;
        *v63 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v50, 2, v48);

        v19 = 0;
        v20 = v14;
LABEL_25:

        v14 = v20;
LABEL_26:

        v12 = v62;
        goto LABEL_27;
      }
      v20 = v14;
      v67 = 0;
      v60 = -[BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval initWithJSONDictionary:error:]([BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval alloc], "initWithJSONDictionary:error:", v20, &v67);
      v22 = v67;
      if (v22)
      {
        v23 = v22;
        if (v63)
          *v63 = objc_retainAutorelease(v22);

        v19 = 0;
        v10 = v65;
        goto LABEL_25;
      }

    }
    else
    {
      v60 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userAggregationIdRotationTimestampInMs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v8;
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v63)
        {
          v19 = 0;
          v16 = 0;
          goto LABEL_24;
        }
        v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v52 = *MEMORY[0x1E0D025B8];
        v70 = *MEMORY[0x1E0CB2D50];
        v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("userAggregationIdRotationTimestampInMs"));
        v71 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v52, 2, v17);
        v19 = 0;
        v16 = 0;
        *v63 = v53;
        goto LABEL_23;
      }
      v16 = v15;
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userAggregationIdExpirationTimestampInMs"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v63)
        {
          v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v56 = *MEMORY[0x1E0D025B8];
          v68 = *MEMORY[0x1E0CB2D50];
          v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("userAggregationIdExpirationTimestampInMs"));
          v69 = v54;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *v63 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v56, 2, v55);

        }
        v18 = 0;
        v19 = 0;
        goto LABEL_23;
      }
      v18 = v17;
    }
    else
    {
      v18 = 0;
    }
    v19 = -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata initWithOddIdUUID:deviceAggregationId:userAggregationId:eventTimestampInMSSince1970:timeInterval:userAggregationIdRotationTimestampInMs:userAggregationIdExpirationTimestampInMs:](v64, "initWithOddIdUUID:deviceAggregationId:userAggregationId:eventTimestampInMSSince1970:timeInterval:userAggregationIdRotationTimestampInMs:userAggregationIdExpirationTimestampInMs:", v58, v65, v62, v66, v60, v16, v18);
    v64 = v19;
LABEL_23:

    v10 = v65;
LABEL_24:

    v20 = v14;
    self = v64;
    v8 = v58;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v19 = 0;
    v8 = 0;
    goto LABEL_30;
  }
  v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v25 = *MEMORY[0x1E0D025B8];
  v80 = *MEMORY[0x1E0CB2D50];
  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("oddIdUUID"));
  v81[0] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, &v80, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v24;
  v10 = (id)v26;
  v28 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v25, 2, v9);
  v19 = 0;
  v8 = 0;
  *a4 = v28;
LABEL_29:

LABEL_30:
  return v19;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[7];
  _QWORD v25[9];

  v25[7] = *MEMORY[0x1E0C80C00];
  -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata oddIdUUID](self, "oddIdUUID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata deviceAggregationId](self, "deviceAggregationId");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata userAggregationId](self, "userAggregationId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSiriOnDeviceDigestExperimentMetricsEventMetadata hasEventTimestampInMSSince1970](self, "hasEventTimestampInMSSince1970"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata eventTimestampInMSSince1970](self, "eventTimestampInMSSince1970"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata timeInterval](self, "timeInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsonDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BMSiriOnDeviceDigestExperimentMetricsEventMetadata hasUserAggregationIdRotationTimestampInMs](self, "hasUserAggregationIdRotationTimestampInMs"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata userAggregationIdRotationTimestampInMs](self, "userAggregationIdRotationTimestampInMs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsEventMetadata hasUserAggregationIdExpirationTimestampInMs](self, "hasUserAggregationIdExpirationTimestampInMs"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata userAggregationIdExpirationTimestampInMs](self, "userAggregationIdExpirationTimestampInMs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v24[0] = CFSTR("oddIdUUID");
  v10 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v10;
  v25[0] = v10;
  v24[1] = CFSTR("deviceAggregationId");
  v11 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v11;
  v25[1] = v11;
  v24[2] = CFSTR("userAggregationId");
  v12 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v3;
  v25[2] = v12;
  v24[3] = CFSTR("eventTimestampInMSSince1970");
  v13 = v23;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v4;
  v25[3] = v13;
  v24[4] = CFSTR("timeInterval");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v14;
  v24[5] = CFSTR("userAggregationIdRotationTimestampInMs");
  v15 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[5] = v15;
  v24[6] = CFSTR("userAggregationIdExpirationTimestampInMs");
  v16 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[6] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
      goto LABEL_26;
  }
  else
  {

    if (v8)
      goto LABEL_26;
  }

LABEL_26:
  if (!v7)

  if (!v23)
  if (v5)
  {
    if (v21)
      goto LABEL_32;
LABEL_37:

    if (v22)
      goto LABEL_33;
LABEL_38:

    goto LABEL_33;
  }

  if (!v21)
    goto LABEL_37;
LABEL_32:
  if (!v22)
    goto LABEL_38;
LABEL_33:

  return v17;
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
  unint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  unint64_t v32;
  unint64_t v33;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata oddIdUUID](self, "oddIdUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oddIdUUID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata oddIdUUID](self, "oddIdUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "oddIdUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_34;
    }
    -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata deviceAggregationId](self, "deviceAggregationId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceAggregationId");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata deviceAggregationId](self, "deviceAggregationId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceAggregationId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_34;
    }
    -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata userAggregationId](self, "userAggregationId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userAggregationId");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata userAggregationId](self, "userAggregationId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userAggregationId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_34;
    }
    if (-[BMSiriOnDeviceDigestExperimentMetricsEventMetadata hasEventTimestampInMSSince1970](self, "hasEventTimestampInMSSince1970")|| objc_msgSend(v5, "hasEventTimestampInMSSince1970"))
    {
      if (!-[BMSiriOnDeviceDigestExperimentMetricsEventMetadata hasEventTimestampInMSSince1970](self, "hasEventTimestampInMSSince1970"))goto LABEL_34;
      if (!objc_msgSend(v5, "hasEventTimestampInMSSince1970"))
        goto LABEL_34;
      v25 = -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata eventTimestampInMSSince1970](self, "eventTimestampInMSSince1970");
      if (v25 != objc_msgSend(v5, "eventTimestampInMSSince1970"))
        goto LABEL_34;
    }
    -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata timeInterval](self, "timeInterval");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeInterval");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v26 == (void *)v27)
    {

    }
    else
    {
      v28 = (void *)v27;
      -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata timeInterval](self, "timeInterval");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeInterval");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (!v31)
        goto LABEL_34;
    }
    if (!-[BMSiriOnDeviceDigestExperimentMetricsEventMetadata hasUserAggregationIdRotationTimestampInMs](self, "hasUserAggregationIdRotationTimestampInMs")&& !objc_msgSend(v5, "hasUserAggregationIdRotationTimestampInMs")|| -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata hasUserAggregationIdRotationTimestampInMs](self, "hasUserAggregationIdRotationTimestampInMs")&& objc_msgSend(v5, "hasUserAggregationIdRotationTimestampInMs")&& (v32 = -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata userAggregationIdRotationTimestampInMs](self, "userAggregationIdRotationTimestampInMs"), v32 == objc_msgSend(v5, "userAggregationIdRotationTimestampInMs")))
    {
      if (!-[BMSiriOnDeviceDigestExperimentMetricsEventMetadata hasUserAggregationIdExpirationTimestampInMs](self, "hasUserAggregationIdExpirationTimestampInMs")&& !objc_msgSend(v5, "hasUserAggregationIdExpirationTimestampInMs"))
      {
        v12 = 1;
        goto LABEL_35;
      }
      if (-[BMSiriOnDeviceDigestExperimentMetricsEventMetadata hasUserAggregationIdExpirationTimestampInMs](self, "hasUserAggregationIdExpirationTimestampInMs")&& objc_msgSend(v5, "hasUserAggregationIdExpirationTimestampInMs"))
      {
        v33 = -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata userAggregationIdExpirationTimestampInMs](self, "userAggregationIdExpirationTimestampInMs");
        v12 = v33 == objc_msgSend(v5, "userAggregationIdExpirationTimestampInMs");
LABEL_35:

        goto LABEL_36;
      }
    }
LABEL_34:
    v12 = 0;
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

- (NSString)oddIdUUID
{
  return self->_oddIdUUID;
}

- (NSString)deviceAggregationId
{
  return self->_deviceAggregationId;
}

- (NSString)userAggregationId
{
  return self->_userAggregationId;
}

- (unint64_t)eventTimestampInMSSince1970
{
  return self->_eventTimestampInMSSince1970;
}

- (BOOL)hasEventTimestampInMSSince1970
{
  return self->_hasEventTimestampInMSSince1970;
}

- (void)setHasEventTimestampInMSSince1970:(BOOL)a3
{
  self->_hasEventTimestampInMSSince1970 = a3;
}

- (BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval)timeInterval
{
  return self->_timeInterval;
}

- (unint64_t)userAggregationIdRotationTimestampInMs
{
  return self->_userAggregationIdRotationTimestampInMs;
}

- (BOOL)hasUserAggregationIdRotationTimestampInMs
{
  return self->_hasUserAggregationIdRotationTimestampInMs;
}

- (void)setHasUserAggregationIdRotationTimestampInMs:(BOOL)a3
{
  self->_hasUserAggregationIdRotationTimestampInMs = a3;
}

- (unint64_t)userAggregationIdExpirationTimestampInMs
{
  return self->_userAggregationIdExpirationTimestampInMs;
}

- (BOOL)hasUserAggregationIdExpirationTimestampInMs
{
  return self->_hasUserAggregationIdExpirationTimestampInMs;
}

- (void)setHasUserAggregationIdExpirationTimestampInMs:(BOOL)a3
{
  self->_hasUserAggregationIdExpirationTimestampInMs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeInterval, 0);
  objc_storeStrong((id *)&self->_userAggregationId, 0);
  objc_storeStrong((id *)&self->_deviceAggregationId, 0);
  objc_storeStrong((id *)&self->_oddIdUUID, 0);
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

    v4 = -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata initByReadFrom:]([BMSiriOnDeviceDigestExperimentMetricsEventMetadata alloc], "initByReadFrom:", v7);
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
  void *v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("oddIdUUID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceAggregationId"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userAggregationId"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventTimestampInMSSince1970"), 0, 0, 4, 5, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("timeInterval_json"), 5, 1, &__block_literal_global_47731);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userAggregationIdRotationTimestampInMs"), 0, 0, 6, 5, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userAggregationIdExpirationTimestampInMs"), 0, 0, 7, 5, 0);
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
  return &unk_1E5F1D878;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("oddIdUUID"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceAggregationId"), 2, 13, 0, v2);
  v11[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userAggregationId"), 3, 13, 0);
  v11[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventTimestampInMSSince1970"), 4, 5, 0);
  v11[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timeInterval"), 5, 14, objc_opt_class());
  v11[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userAggregationIdRotationTimestampInMs"), 6, 5, 0);
  v11[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userAggregationIdExpirationTimestampInMs"), 7, 5, 0);
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __61__BMSiriOnDeviceDigestExperimentMetricsEventMetadata_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BMSiriOnDeviceDigestExperimentMetricsEventMetadata)initWithOddIdUUID:(id)a3 deviceAggregationId:(id)a4 userAggregationId:(id)a5 eventTimestampInMSSince1970:(id)a6 timeInterval:(id)a7
{
  return -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata initWithOddIdUUID:deviceAggregationId:userAggregationId:eventTimestampInMSSince1970:timeInterval:userAggregationIdRotationTimestampInMs:userAggregationIdExpirationTimestampInMs:](self, "initWithOddIdUUID:deviceAggregationId:userAggregationId:eventTimestampInMSSince1970:timeInterval:userAggregationIdRotationTimestampInMs:userAggregationIdExpirationTimestampInMs:", a3, a4, a5, a6, a7, 0, 0);
}

@end
