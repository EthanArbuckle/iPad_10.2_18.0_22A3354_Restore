@implementation BMSiriSELFProcessedEvent

- (BMSiriSELFProcessedEvent)initWithLogicalTimestamp:(id)a3 clusterRepresentativeId:(id)a4 componentId:(id)a5 anyEventType:(id)a6 innerType:(id)a7 messageUuid:(id)a8 eventData:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  BMSiriSELFProcessedEvent *v20;
  int v21;
  int v22;
  uint64_t v23;
  NSData *raw_messageUuid;
  id v26;
  id v27;
  id v28;
  objc_super v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v27 = a4;
  v26 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v29.receiver = self;
  v29.super_class = (Class)BMSiriSELFProcessedEvent;
  v20 = -[BMEventBase init](&v29, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v26, v27, v28);
    objc_storeStrong((id *)&v20->_logicalTimestamp, a3);
    objc_storeStrong((id *)&v20->_clusterRepresentativeId, a4);
    objc_storeStrong((id *)&v20->_componentId, a5);
    if (v16)
    {
      v20->_hasAnyEventType = 1;
      v21 = objc_msgSend(v16, "intValue");
    }
    else
    {
      v20->_hasAnyEventType = 0;
      v21 = -1;
    }
    v20->_anyEventType = v21;
    if (v17)
    {
      v20->_hasInnerType = 1;
      v22 = objc_msgSend(v17, "intValue");
    }
    else
    {
      v20->_hasInnerType = 0;
      v22 = -1;
    }
    v20->_innerType = v22;
    if (v18)
    {
      v30[0] = 0;
      v30[1] = 0;
      objc_msgSend(v18, "getUUIDBytes:", v30);
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v30, 16);
      raw_messageUuid = v20->_raw_messageUuid;
      v20->_raw_messageUuid = (NSData *)v23;
    }
    else
    {
      raw_messageUuid = v20->_raw_messageUuid;
      v20->_raw_messageUuid = 0;
    }

    objc_storeStrong((id *)&v20->_eventData, a9);
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
  -[BMSiriSELFProcessedEvent logicalTimestamp](self, "logicalTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriSELFProcessedEvent clusterRepresentativeId](self, "clusterRepresentativeId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriSELFProcessedEvent componentId](self, "componentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriSELFProcessedEvent anyEventType](self, "anyEventType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriSELFProcessedEvent innerType](self, "innerType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriSELFProcessedEvent messageUuid](self, "messageUuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriSELFProcessedEvent eventData](self, "eventData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriSELFProcessedEvent with logicalTimestamp: %@, clusterRepresentativeId: %@, componentId: %@, anyEventType: %@, innerType: %@, messageUuid: %@, eventData: %@"), v4, v5, v6, v7, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriSELFProcessedEvent *v5;
  int *v6;
  int *v7;
  int *v8;
  __objc2_class **v9;
  __objc2_class **v10;
  int *v11;
  int *v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  BOOL v19;
  int v20;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  int *v36;
  __objc2_class **v37;
  __objc2_class **v38;
  NSData *v39;
  NSData *raw_messageUuid;
  uint64_t v41;
  NSData *eventData;
  uint64_t v43;
  BMSiriSELFProcessedEvent *v44;
  objc_super v46;
  uint64_t v47;
  uint64_t v48;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)BMSiriSELFProcessedEvent;
  v5 = -[BMEventBase init](&v46, sel_init);
  if (!v5)
  {
LABEL_61:
    v44 = v5;
    goto LABEL_62;
  }
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_59:
    if (v4[*v8])
      goto LABEL_60;
    goto LABEL_61;
  }
  v9 = off_1E5E4B000;
  v10 = off_1E5E4B000;
  v11 = &OBJC_IVAR___BMAdPlatformsTrainingRows__userQueryVector;
  v12 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v8])
      goto LABEL_59;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v16 = *v6;
      v17 = *(_QWORD *)&v4[v16];
      if (v17 == -1 || v17 >= *(_QWORD *)&v4[*v7])
        break;
      v18 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v17);
      *(_QWORD *)&v4[v16] = v17 + 1;
      v15 |= (unint64_t)(v18 & 0x7F) << v13;
      if ((v18 & 0x80) == 0)
        goto LABEL_13;
      v13 += 7;
      v19 = v14++ >= 9;
      if (v19)
      {
        v15 = 0;
        v20 = v4[*v8];
        goto LABEL_15;
      }
    }
    v4[*v8] = 1;
LABEL_13:
    v20 = v4[*v8];
    if (v4[*v8])
      v15 = 0;
LABEL_15:
    if (v20 || (v15 & 7) == 4)
      goto LABEL_59;
    switch((v15 >> 3))
    {
      case 1u:
        v47 = 0;
        v48 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_60;
        v22 = objc_msgSend(objc_alloc(v9[180]), "initByReadFrom:", v4);
        if (!v22)
          goto LABEL_60;
        v23 = 40;
        goto LABEL_31;
      case 2u:
        v47 = 0;
        v48 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_60;
        v22 = objc_msgSend(objc_alloc(v10[179]), "initByReadFrom:", v4);
        if (!v22)
          goto LABEL_60;
        v23 = 48;
        goto LABEL_31;
      case 3u:
        v47 = 0;
        v48 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_60;
        v22 = objc_msgSend(objc_alloc(v10[179]), "initByReadFrom:", v4);
        if (!v22)
          goto LABEL_60;
        v23 = 56;
LABEL_31:
        v24 = *(Class *)((char *)&v5->super.super.isa + v23);
        *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

        PBReaderRecallMark();
        goto LABEL_58;
      case 4u:
        v25 = 0;
        v26 = 0;
        v27 = 0;
        *((_BYTE *)&v5->super.super.isa + v11[58]) = 1;
        while (2)
        {
          v28 = *v6;
          v29 = *(_QWORD *)&v4[v28];
          if (v29 == -1 || v29 >= *(_QWORD *)&v4[*v7])
          {
            v4[*v8] = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v29);
            *(_QWORD *)&v4[v28] = v29 + 1;
            v27 |= (unint64_t)(v30 & 0x7F) << v25;
            if (v30 < 0)
            {
              v25 += 7;
              v19 = v26++ >= 9;
              if (v19)
              {
                LODWORD(v27) = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v8])
          LODWORD(v27) = 0;
LABEL_52:
        v43 = 32;
        goto LABEL_57;
      case 5u:
        v31 = 0;
        v32 = 0;
        v27 = 0;
        v5->_hasInnerType = 1;
        while (2)
        {
          v33 = *v6;
          v34 = *(_QWORD *)&v4[v33];
          if (v34 == -1 || v34 >= *(_QWORD *)&v4[*v7])
          {
            v4[*v8] = 1;
          }
          else
          {
            v35 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v34);
            *(_QWORD *)&v4[v33] = v34 + 1;
            v27 |= (unint64_t)(v35 & 0x7F) << v31;
            if (v35 < 0)
            {
              v31 += 7;
              v19 = v32++ >= 9;
              if (v19)
              {
                LODWORD(v27) = 0;
                goto LABEL_56;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v8])
          LODWORD(v27) = 0;
LABEL_56:
        v43 = 36;
LABEL_57:
        *(_DWORD *)((char *)&v5->super.super.isa + v43) = v27;
        goto LABEL_58;
      case 6u:
        v36 = v11;
        v37 = v10;
        v38 = v9;
        PBReaderReadData();
        v39 = (NSData *)objc_claimAutoreleasedReturnValue();
        if (-[NSData length](v39, "length") == 16)
        {
          raw_messageUuid = v5->_raw_messageUuid;
          v5->_raw_messageUuid = v39;

          v9 = v38;
          v10 = v37;
          v11 = v36;
LABEL_58:
          if (*(_QWORD *)&v4[*v6] >= *(_QWORD *)&v4[*v7])
            goto LABEL_59;
          continue;
        }

LABEL_60:
        v44 = 0;
LABEL_62:

        return v44;
      case 7u:
        PBReaderReadData();
        v41 = objc_claimAutoreleasedReturnValue();
        eventData = v5->_eventData;
        v5->_eventData = (NSData *)v41;

        goto LABEL_58;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          goto LABEL_60;
        goto LABEL_58;
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_logicalTimestamp)
  {
    PBDataWriterPlaceMark();
    -[BMSiriSELFProcessedEventLogicalTimestamp writeTo:](self->_logicalTimestamp, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_clusterRepresentativeId)
  {
    PBDataWriterPlaceMark();
    -[BMSiriSELFProcessedEventComponentIdentifier writeTo:](self->_clusterRepresentativeId, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_componentId)
  {
    PBDataWriterPlaceMark();
    -[BMSiriSELFProcessedEventComponentIdentifier writeTo:](self->_componentId, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_hasAnyEventType)
    PBDataWriterWriteInt32Field();
  if (self->_hasInnerType)
    PBDataWriterWriteInt32Field();
  if (self->_raw_messageUuid)
    PBDataWriterWriteDataField();
  if (self->_eventData)
    PBDataWriterWriteDataField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriSELFProcessedEvent writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriSELFProcessedEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMSiriSELFProcessedEventLogicalTimestamp *v8;
  id v9;
  BMSiriSELFProcessedEventComponentIdentifier *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  BMSiriSELFProcessedEvent *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  id *v29;
  void *v30;
  id *v31;
  id v32;
  BMSiriSELFProcessedEvent *v33;
  id v34;
  uint64_t v35;
  BMSiriSELFProcessedEventLogicalTimestamp *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  id v47;
  uint64_t v48;
  BMSiriSELFProcessedEventLogicalTimestamp *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  id *v55;
  id *v56;
  BMSiriSELFProcessedEvent *v57;
  id v58;
  BMSiriSELFProcessedEventLogicalTimestamp *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  id v63;
  void *v64;
  id *v65;
  uint64_t v66;
  id v67;
  id *v68;
  id v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  BMSiriSELFProcessedEventLogicalTimestamp *v85;
  id v86;
  id v87;
  BMSiriSELFProcessedEventComponentIdentifier *v88;
  BMSiriSELFProcessedEventComponentIdentifier *v89;
  BMSiriSELFProcessedEvent *v90;
  BMSiriSELFProcessedEvent *v91;
  BMSiriSELFProcessedEventComponentIdentifier *v92;
  id *v93;
  id v94;
  id v95;
  id v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  BMSiriSELFProcessedEventComponentIdentifier *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  _QWORD v112[3];

  v112[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("logicalTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clusterRepresentativeId"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v9;
      v95 = 0;
      v10 = -[BMSiriSELFProcessedEventComponentIdentifier initWithJSONDictionary:error:]([BMSiriSELFProcessedEventComponentIdentifier alloc], "initWithJSONDictionary:error:", v11, &v95);
      v19 = v95;
      if (v19)
      {
        v20 = v19;
        if (a4)
          *a4 = objc_retainAutorelease(v19);

        a4 = 0;
        goto LABEL_59;
      }

LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("componentId"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
            goto LABEL_59;
          v91 = self;
          v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v89 = v10;
          v48 = *MEMORY[0x1E0D025B8];
          v107 = *MEMORY[0x1E0CB2D50];
          v49 = v8;
          v50 = objc_alloc(MEMORY[0x1E0CB3940]);
          v79 = objc_opt_class();
          v51 = v50;
          v8 = v49;
          v92 = (BMSiriSELFProcessedEventComponentIdentifier *)objc_msgSend(v51, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v79, CFSTR("componentId"));
          v108 = v92;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
          v21 = (id)objc_claimAutoreleasedReturnValue();
          v52 = v47;
          v53 = v48;
          v10 = v89;
          self = v91;
          v54 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v53, 2, v21);
          v55 = a4;
          a4 = 0;
          *v55 = v54;
          goto LABEL_58;
        }
        v21 = v11;
        v94 = 0;
        v92 = -[BMSiriSELFProcessedEventComponentIdentifier initWithJSONDictionary:error:]([BMSiriSELFProcessedEventComponentIdentifier alloc], "initWithJSONDictionary:error:", v21, &v94);
        v22 = v94;
        if (v22)
        {
          v23 = v22;
          if (a4)
            *a4 = objc_retainAutorelease(v22);

          a4 = 0;
          goto LABEL_58;
        }
        v82 = v9;
        v12 = v7;
        v13 = v11;

      }
      else
      {
        v82 = v9;
        v12 = v7;
        v13 = v11;
        v92 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("anyEventType"));
      v14 = objc_claimAutoreleasedReturnValue();
      v84 = (void *)v14;
      v88 = v10;
      if (v14 && (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v21 = 0;
            v11 = v13;
            v7 = v12;
            v9 = v82;
            goto LABEL_57;
          }
          v56 = a4;
          v57 = self;
          v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v59 = v8;
          v60 = *MEMORY[0x1E0D025B8];
          v105 = *MEMORY[0x1E0CB2D50];
          v87 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("anyEventType"));
          v106 = v87;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v58;
          self = v57;
          v62 = v60;
          v8 = v59;
          a4 = 0;
          v21 = 0;
          *v56 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v62, 2, v16);
          v11 = v13;
          v7 = v12;
          v9 = v82;
LABEL_56:

          v10 = v88;
LABEL_57:

LABEL_58:
          goto LABEL_59;
        }
        v86 = v15;
      }
      else
      {
        v86 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("innerType"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = self;
      v85 = v8;
      if (v16)
      {
        objc_opt_class();
        v11 = v13;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          v7 = v12;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v9 = v82;
            if (!a4)
            {
              v87 = 0;
              v21 = v86;
              goto LABEL_56;
            }
            v63 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v64 = v16;
            v65 = a4;
            v66 = *MEMORY[0x1E0D025B8];
            v103 = *MEMORY[0x1E0CB2D50];
            v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("innerType"));
            v104 = v30;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
            v32 = (id)objc_claimAutoreleasedReturnValue();
            v67 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v66, 2, v32);
            a4 = 0;
            v87 = 0;
            *v65 = v67;
            v16 = v64;
            goto LABEL_53;
          }
          v87 = v16;
LABEL_35:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("messageUuid"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = v16;
          if (v30)
          {
            objc_opt_class();
            v9 = v82;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v31 = a4;
              v32 = 0;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  v21 = v86;
                  goto LABEL_55;
                }
                v68 = a4;
                v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v70 = *MEMORY[0x1E0D025B8];
                v99 = *MEMORY[0x1E0CB2D50];
                v32 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("messageUuid"));
                v100 = v32;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                *v68 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v70, 2, v71);
                v16 = v81;

                a4 = 0;
                goto LABEL_53;
              }
              v31 = a4;
              v32 = v30;
              v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v32);
              if (!v42)
              {
                if (a4)
                {
                  v74 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v75 = *MEMORY[0x1E0D025B8];
                  v101 = *MEMORY[0x1E0CB2D50];
                  v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("messageUuid"));
                  v102 = v76;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  *v31 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v75, 2, v77);

                }
                a4 = 0;
                v30 = v32;
                v21 = v86;
                v16 = v81;
                goto LABEL_54;
              }
              v43 = (void *)v42;

              v32 = v43;
            }
          }
          else
          {
            v31 = a4;
            v32 = 0;
            v9 = v82;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventData"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v31)
              {
                v83 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v80 = *MEMORY[0x1E0D025B8];
                v97 = *MEMORY[0x1E0CB2D50];
                v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("eventData"));
                v98 = v72;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                *v31 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v80, 2, v73);

              }
              a4 = 0;
              v45 = 0;
              goto LABEL_52;
            }
            v45 = v44;
          }
          else
          {
            v45 = 0;
          }
          a4 = -[BMSiriSELFProcessedEvent initWithLogicalTimestamp:clusterRepresentativeId:componentId:anyEventType:innerType:messageUuid:eventData:](v90, "initWithLogicalTimestamp:clusterRepresentativeId:componentId:anyEventType:innerType:messageUuid:eventData:", v85, v88, v92, v86, v87, v32, v45);
          v90 = (BMSiriSELFProcessedEvent *)a4;
LABEL_52:
          v16 = v81;

LABEL_53:
          v21 = v86;
LABEL_54:

          self = v90;
          v8 = v85;
LABEL_55:

          goto LABEL_56;
        }
        v87 = 0;
      }
      else
      {
        v87 = 0;
        v11 = v13;
      }
      v7 = v12;
      goto LABEL_35;
    }
    if (a4)
    {
      v93 = a4;
      v33 = self;
      v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v35 = *MEMORY[0x1E0D025B8];
      v109 = *MEMORY[0x1E0CB2D50];
      v36 = v8;
      v37 = objc_alloc(MEMORY[0x1E0CB3940]);
      v78 = objc_opt_class();
      v38 = v37;
      v8 = v36;
      v39 = objc_msgSend(v38, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v78, CFSTR("clusterRepresentativeId"));
      v110 = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v40 = v34;
      self = v33;
      v41 = v35;
      v10 = (BMSiriSELFProcessedEventComponentIdentifier *)v39;
      a4 = 0;
      *v93 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 2, v11);
LABEL_59:

    }
LABEL_60:

    goto LABEL_61;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    v96 = 0;
    v8 = -[BMSiriSELFProcessedEventLogicalTimestamp initWithJSONDictionary:error:]([BMSiriSELFProcessedEventLogicalTimestamp alloc], "initWithJSONDictionary:error:", v9, &v96);
    v17 = v96;
    if (v17)
    {
      v18 = v17;
      if (a4)
        *a4 = objc_retainAutorelease(v17);

      a4 = 0;
      goto LABEL_60;
    }

    goto LABEL_4;
  }
  if (a4)
  {
    v24 = self;
    v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v26 = *MEMORY[0x1E0D025B8];
    v111 = *MEMORY[0x1E0CB2D50];
    v112[0] = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("logicalTimestamp"));
    v8 = (BMSiriSELFProcessedEventLogicalTimestamp *)v112[0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, &v111, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v27 = v25;
    self = v24;
    v28 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v26, 2, v9);
    v29 = a4;
    a4 = 0;
    *v29 = v28;
    goto LABEL_60;
  }
LABEL_61:

  return (BMSiriSELFProcessedEvent *)a4;
}

- (id)jsonDictionary
{
  void *v3;
  uint64_t v4;
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
  _QWORD v29[7];
  _QWORD v30[9];

  v30[7] = *MEMORY[0x1E0C80C00];
  -[BMSiriSELFProcessedEvent logicalTimestamp](self, "logicalTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = objc_claimAutoreleasedReturnValue();

  -[BMSiriSELFProcessedEvent clusterRepresentativeId](self, "clusterRepresentativeId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = objc_claimAutoreleasedReturnValue();

  -[BMSiriSELFProcessedEvent componentId](self, "componentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jsonDictionary");
  v8 = objc_claimAutoreleasedReturnValue();

  if (-[BMSiriSELFProcessedEvent hasAnyEventType](self, "hasAnyEventType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriSELFProcessedEvent anyEventType](self, "anyEventType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (-[BMSiriSELFProcessedEvent hasInnerType](self, "hasInnerType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriSELFProcessedEvent innerType](self, "innerType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[BMSiriSELFProcessedEvent messageUuid](self, "messageUuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSiriSELFProcessedEvent eventData](self, "eventData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = CFSTR("logicalTimestamp");
  v15 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v15;
  v30[0] = v15;
  v29[1] = CFSTR("clusterRepresentativeId");
  v16 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v4;
  v24 = (void *)v16;
  v30[1] = v16;
  v29[2] = CFSTR("componentId");
  v17 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v6;
  v30[2] = v17;
  v29[3] = CFSTR("anyEventType");
  v18 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v8;
  v30[3] = v18;
  v29[4] = CFSTR("innerType");
  v19 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[4] = v19;
  v29[5] = CFSTR("messageUuid");
  v20 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[5] = v20;
  v29[6] = CFSTR("eventData");
  v21 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[6] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v12)
      goto LABEL_23;
LABEL_32:

    if (v10)
      goto LABEL_24;
    goto LABEL_33;
  }

  if (!v12)
    goto LABEL_32;
LABEL_23:
  if (v10)
    goto LABEL_24;
LABEL_33:

LABEL_24:
  if (!v9)

  if (!v26)
  if (!v27)
  {

    if (v28)
      goto LABEL_30;
LABEL_35:

    goto LABEL_30;
  }
  if (!v28)
    goto LABEL_35;
LABEL_30:

  return v22;
}

- (NSUUID)messageUuid
{
  NSData *raw_messageUuid;
  void *v3;

  raw_messageUuid = self->_raw_messageUuid;
  if (raw_messageUuid)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_messageUuid, 3);
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
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriSELFProcessedEvent logicalTimestamp](self, "logicalTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logicalTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriSELFProcessedEvent logicalTimestamp](self, "logicalTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logicalTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_27;
    }
    -[BMSiriSELFProcessedEvent clusterRepresentativeId](self, "clusterRepresentativeId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clusterRepresentativeId");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriSELFProcessedEvent clusterRepresentativeId](self, "clusterRepresentativeId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clusterRepresentativeId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_27;
    }
    -[BMSiriSELFProcessedEvent componentId](self, "componentId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentId");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSiriSELFProcessedEvent componentId](self, "componentId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "componentId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_27;
    }
    if (-[BMSiriSELFProcessedEvent hasAnyEventType](self, "hasAnyEventType")
      || objc_msgSend(v5, "hasAnyEventType"))
    {
      if (!-[BMSiriSELFProcessedEvent hasAnyEventType](self, "hasAnyEventType"))
        goto LABEL_27;
      if (!objc_msgSend(v5, "hasAnyEventType"))
        goto LABEL_27;
      v25 = -[BMSiriSELFProcessedEvent anyEventType](self, "anyEventType");
      if (v25 != objc_msgSend(v5, "anyEventType"))
        goto LABEL_27;
    }
    if (-[BMSiriSELFProcessedEvent hasInnerType](self, "hasInnerType")
      || objc_msgSend(v5, "hasInnerType"))
    {
      if (!-[BMSiriSELFProcessedEvent hasInnerType](self, "hasInnerType"))
        goto LABEL_27;
      if (!objc_msgSend(v5, "hasInnerType"))
        goto LABEL_27;
      v26 = -[BMSiriSELFProcessedEvent innerType](self, "innerType");
      if (v26 != objc_msgSend(v5, "innerType"))
        goto LABEL_27;
    }
    -[BMSiriSELFProcessedEvent messageUuid](self, "messageUuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageUuid");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v27 == (void *)v28)
    {

    }
    else
    {
      v29 = (void *)v28;
      -[BMSiriSELFProcessedEvent messageUuid](self, "messageUuid");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "messageUuid");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if (!v32)
      {
LABEL_27:
        v12 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    -[BMSiriSELFProcessedEvent eventData](self, "eventData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventData");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34 == v35)
    {
      v12 = 1;
    }
    else
    {
      -[BMSiriSELFProcessedEvent eventData](self, "eventData");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventData");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v36, "isEqual:", v37);

    }
    goto LABEL_28;
  }
  v12 = 0;
LABEL_29:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMSiriSELFProcessedEventLogicalTimestamp)logicalTimestamp
{
  return self->_logicalTimestamp;
}

- (BMSiriSELFProcessedEventComponentIdentifier)clusterRepresentativeId
{
  return self->_clusterRepresentativeId;
}

- (BMSiriSELFProcessedEventComponentIdentifier)componentId
{
  return self->_componentId;
}

- (int)anyEventType
{
  return self->_anyEventType;
}

- (BOOL)hasAnyEventType
{
  return self->_hasAnyEventType;
}

- (void)setHasAnyEventType:(BOOL)a3
{
  self->_hasAnyEventType = a3;
}

- (int)innerType
{
  return self->_innerType;
}

- (BOOL)hasInnerType
{
  return self->_hasInnerType;
}

- (void)setHasInnerType:(BOOL)a3
{
  self->_hasInnerType = a3;
}

- (NSData)eventData
{
  return self->_eventData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_componentId, 0);
  objc_storeStrong((id *)&self->_clusterRepresentativeId, 0);
  objc_storeStrong((id *)&self->_logicalTimestamp, 0);
  objc_storeStrong((id *)&self->_raw_messageUuid, 0);
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

    v4 = -[BMSiriSELFProcessedEvent initByReadFrom:]([BMSiriSELFProcessedEvent alloc], "initByReadFrom:", v7);
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
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("logicalTimestamp_json"), 5, 1, &__block_literal_global_21786);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("clusterRepresentativeId_json"), 5, 1, &__block_literal_global_174);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("componentId_json"), 5, 1, &__block_literal_global_175_21787);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("anyEventType"), 0, 0, 4, 2, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("innerType"), 0, 0, 5, 2, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("messageUuid"), 6, 0, 6, 14, 3);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventData"), 4, 0, 7, 14, 0);
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
  return &unk_1E5F1BC28;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("logicalTimestamp"), 1, 14, objc_opt_class());
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clusterRepresentativeId"), 2, 14, objc_opt_class(), v2);
  v11[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("componentId"), 3, 14, objc_opt_class());
  v11[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("anyEventType"), 4, 2, 0);
  v11[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("innerType"), 5, 2, 0);
  v11[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("messageUuid"), 6, 14, 0);
  v11[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventData"), 7, 14, 0);
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __35__BMSiriSELFProcessedEvent_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __35__BMSiriSELFProcessedEvent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clusterRepresentativeId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __35__BMSiriSELFProcessedEvent_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logicalTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
