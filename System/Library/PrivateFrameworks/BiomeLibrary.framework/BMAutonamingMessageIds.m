@implementation BMAutonamingMessageIds

- (BMAutonamingMessageIds)initWithProtoVersion:(id)a3 bundleId:(id)a4 domainId:(id)a5 spotlightId:(id)a6 messageId:(id)a7 conversationId:(id)a8 isDeletion:(id)a9 containsImageAttachment:(id)a10
{
  return -[BMAutonamingMessageIds initWithProtoVersion:bundleId:domainId:spotlightId:messageId:conversationId:isDeletion:containsImageAttachment:messageTimestamp:](self, "initWithProtoVersion:bundleId:domainId:spotlightId:messageId:conversationId:isDeletion:containsImageAttachment:messageTimestamp:", a3, a4, a5, a6, a7, a8, a9, a10, 0);
}

- (BMAutonamingMessageIds)initWithProtoVersion:(id)a3 bundleId:(id)a4 domainId:(id)a5 spotlightId:(id)a6 messageId:(id)a7 conversationId:(id)a8 isDeletion:(id)a9 containsImageAttachment:(id)a10 messageTimestamp:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  BMAutonamingMessageIds *v21;
  int v22;
  double v23;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v17 = a3;
  v29 = a4;
  v28 = a5;
  v27 = a6;
  v26 = a7;
  v25 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v30.receiver = self;
  v30.super_class = (Class)BMAutonamingMessageIds;
  v21 = -[BMEventBase init](&v30, sel_init);
  if (v21)
  {
    v21->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v17)
    {
      v21->_hasProtoVersion = 1;
      v22 = objc_msgSend(v17, "intValue");
    }
    else
    {
      v21->_hasProtoVersion = 0;
      v22 = -1;
    }
    v21->_protoVersion = v22;
    objc_storeStrong((id *)&v21->_bundleId, a4);
    objc_storeStrong((id *)&v21->_domainId, a5);
    objc_storeStrong((id *)&v21->_spotlightId, a6);
    objc_storeStrong((id *)&v21->_messageId, a7);
    objc_storeStrong((id *)&v21->_conversationId, a8);
    if (v18)
    {
      v21->_hasIsDeletion = 1;
      v21->_isDeletion = objc_msgSend(v18, "BOOLValue");
    }
    else
    {
      v21->_hasIsDeletion = 0;
      v21->_isDeletion = 0;
    }
    if (v19)
    {
      v21->_hasContainsImageAttachment = 1;
      v21->_containsImageAttachment = objc_msgSend(v19, "BOOLValue");
    }
    else
    {
      v21->_hasContainsImageAttachment = 0;
      v21->_containsImageAttachment = 0;
    }
    if (v20)
    {
      v21->_hasRaw_messageTimestamp = 1;
      objc_msgSend(v20, "timeIntervalSince1970");
    }
    else
    {
      v21->_hasRaw_messageTimestamp = 0;
      v23 = -1.0;
    }
    v21->_raw_messageTimestamp = v23;
  }

  return v21;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAutonamingMessageIds protoVersion](self, "protoVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAutonamingMessageIds bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAutonamingMessageIds domainId](self, "domainId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAutonamingMessageIds spotlightId](self, "spotlightId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAutonamingMessageIds messageId](self, "messageId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAutonamingMessageIds conversationId](self, "conversationId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAutonamingMessageIds isDeletion](self, "isDeletion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAutonamingMessageIds containsImageAttachment](self, "containsImageAttachment"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAutonamingMessageIds messageTimestamp](self, "messageTimestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAutonamingMessageIds with protoVersion: %@, bundleId: %@, domainId: %@, spotlightId: %@, messageId: %@, conversationId: %@, isDeletion: %@, containsImageAttachment: %@, messageTimestamp: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAutonamingMessageIds *v5;
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
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  unint64_t v45;
  double v46;
  BOOL v47;
  uint64_t v48;
  BMAutonamingMessageIds *v49;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)BMAutonamingMessageIds;
  v5 = -[BMEventBase init](&v51, sel_init);
  if (!v5)
    goto LABEL_70;
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
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v5->_hasProtoVersion = 1;
          while (2)
          {
            v23 = *v6;
            v24 = *(_QWORD *)&v4[v23];
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
              *(_QWORD *)&v4[v23] = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                v17 = v21++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_55:
          v5->_protoVersion = v22;
          continue;
        case 2u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 48;
          goto LABEL_34;
        case 3u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 56;
          goto LABEL_34;
        case 4u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 64;
          goto LABEL_34;
        case 6u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 72;
          goto LABEL_34;
        case 7u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 80;
LABEL_34:
          v29 = *(Class *)((char *)&v5->super.super.isa + v28);
          *(Class *)((char *)&v5->super.super.isa + v28) = (Class)v27;

          continue;
        case 8u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v5->_hasIsDeletion = 1;
          while (2)
          {
            v33 = *v6;
            v34 = *(_QWORD *)&v4[v33];
            v35 = v34 + 1;
            if (v34 == -1 || v35 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v34);
              *(_QWORD *)&v4[v33] = v35;
              v32 |= (unint64_t)(v36 & 0x7F) << v30;
              if (v36 < 0)
              {
                v30 += 7;
                v17 = v31++ >= 9;
                if (v17)
                {
                  v32 = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v32 = 0;
LABEL_59:
          v47 = v32 != 0;
          v48 = 33;
          goto LABEL_64;
        case 9u:
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v5->_hasContainsImageAttachment = 1;
          break;
        case 0xAu:
          v5->_hasRaw_messageTimestamp = 1;
          v44 = *v6;
          v45 = *(_QWORD *)&v4[v44];
          if (v45 <= 0xFFFFFFFFFFFFFFF7 && v45 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v46 = *(double *)(*(_QWORD *)&v4[*v9] + v45);
            *(_QWORD *)&v4[v44] = v45 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v46 = 0.0;
          }
          v5->_raw_messageTimestamp = v46;
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_69;
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
        v39 |= (unint64_t)(v43 & 0x7F) << v37;
        if ((v43 & 0x80) == 0)
          goto LABEL_61;
        v37 += 7;
        v17 = v38++ >= 9;
        if (v17)
        {
          v39 = 0;
          goto LABEL_63;
        }
      }
      v4[*v8] = 1;
LABEL_61:
      if (v4[*v8])
        v39 = 0;
LABEL_63:
      v47 = v39 != 0;
      v48 = 35;
LABEL_64:
      *((_BYTE *)&v5->super.super.isa + v48) = v47;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_69:
    v49 = 0;
  else
LABEL_70:
    v49 = v5;

  return v49;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasProtoVersion)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_domainId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_spotlightId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_messageId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_conversationId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasIsDeletion)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasContainsImageAttachment)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasRaw_messageTimestamp)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAutonamingMessageIds writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAutonamingMessageIds)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BMAutonamingMessageIds *v17;
  id *v18;
  id v19;
  uint64_t v20;
  id *v21;
  void *v22;
  id v23;
  BMAutonamingMessageIds *v24;
  id *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  objc_class *v46;
  id v47;
  id v48;
  double v49;
  double v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  id v67;
  id v68;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  id *v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  id *v85;
  id v86;
  void *v87;
  BMAutonamingMessageIds *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  _QWORD v106[3];

  v106[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("protoVersion"));
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = self;
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v80 = a4;
      a4 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v80 = a4;
      a4 = v9;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("domainId"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v10;
      v85 = a4;
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v83 = 0;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("spotlightId"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v80)
            {
              v86 = 0;
              v24 = 0;
              v29 = v83;
              goto LABEL_76;
            }
            v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v41 = v8;
            v42 = *MEMORY[0x1E0D025B8];
            v99 = *MEMORY[0x1E0CB2D50];
            v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("spotlightId"));
            v100 = v79;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
            v43 = objc_claimAutoreleasedReturnValue();
            v44 = v40;
            a4 = v85;
            v45 = v42;
            v8 = v41;
            v81 = (void *)v43;
            v86 = 0;
            v24 = 0;
            *v80 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v45, 2);
            goto LABEL_82;
          }
          v86 = v11;
        }
        else
        {
          v86 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("messageId"));
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v81 = v12;
        if (!v12)
        {
          v74 = v7;
          v13 = v9;
          goto LABEL_27;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v74 = v7;
          v13 = v9;
          v12 = 0;
LABEL_27:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("conversationId"));
          v14 = objc_claimAutoreleasedReturnValue();
          v79 = v12;
          v76 = (void *)v14;
          if (v14 && (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v80)
              {
                v82 = 0;
                v24 = 0;
                self = v88;
                v9 = v13;
                v7 = v74;
                v55 = v76;
                goto LABEL_74;
              }
              v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v59 = *MEMORY[0x1E0D025B8];
              v95 = *MEMORY[0x1E0CB2D50];
              v78 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("conversationId"));
              v96 = v78;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = v58;
              a4 = v85;
              v82 = 0;
              v24 = 0;
              *v80 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v59, 2, v16);
              self = v88;
              v9 = v13;
              v7 = v74;
              goto LABEL_73;
            }
            v82 = v15;
          }
          else
          {
            v82 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isDeletion"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v13;
          v77 = v8;
          v73 = v11;
          if (v16)
          {
            objc_opt_class();
            v7 = v74;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v78 = 0;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v80)
                {
                  v78 = 0;
                  v24 = 0;
                  self = v88;
                  goto LABEL_73;
                }
                v61 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v62 = *MEMORY[0x1E0D025B8];
                v93 = *MEMORY[0x1E0CB2D50];
                v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isDeletion"));
                v94 = v34;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = v61;
                v8 = v77;
                v64 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v62, 2, v33);
                v78 = 0;
                v24 = 0;
                *v80 = v64;
LABEL_72:

                v10 = v87;
                self = v88;
                a4 = v85;
                v11 = v73;
LABEL_73:

                v55 = v76;
                goto LABEL_74;
              }
              v78 = v16;
            }
          }
          else
          {
            v78 = 0;
            v7 = v74;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsImageAttachment"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v80)
              {
                v34 = 0;
                v24 = 0;
                goto LABEL_72;
              }
              v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v66 = *MEMORY[0x1E0D025B8];
              v91 = *MEMORY[0x1E0CB2D50];
              v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("containsImageAttachment"));
              v92 = v36;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v66, 2, v35);
              v34 = 0;
              v24 = 0;
              *v80 = v67;
              goto LABEL_71;
            }
            v34 = v33;
          }
          else
          {
            v34 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("messageTimestamp"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v46 = (objc_class *)MEMORY[0x1E0C99D68];
              v47 = v35;
              v48 = [v46 alloc];
              objc_msgSend(v47, "doubleValue");
              v50 = v49;

              v51 = (id)objc_msgSend(v48, "initWithTimeIntervalSince1970:", v50);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v68 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
                objc_msgSend(v68, "dateFromString:", v35);
                v36 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_70;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (v80)
                {
                  v75 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v72 = *MEMORY[0x1E0D025B8];
                  v89 = *MEMORY[0x1E0CB2D50];
                  v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("messageTimestamp"));
                  v90 = v70;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  *v80 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v72, 2, v71);

                }
                v36 = 0;
                v24 = 0;
                goto LABEL_71;
              }
              v51 = v35;
            }
            v36 = v51;
          }
          else
          {
            v36 = 0;
          }
LABEL_70:
          v24 = -[BMAutonamingMessageIds initWithProtoVersion:bundleId:domainId:spotlightId:messageId:conversationId:isDeletion:containsImageAttachment:messageTimestamp:](v88, "initWithProtoVersion:bundleId:domainId:spotlightId:messageId:conversationId:isDeletion:containsImageAttachment:messageTimestamp:", v77, v85, v83, v86, v12, v82, v78, v34, v36);
          v88 = v24;
LABEL_71:

          v8 = v77;
          goto LABEL_72;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v74 = v7;
          v13 = v9;
          v12 = v12;
          goto LABEL_27;
        }
        if (v80)
        {
          v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v53 = v8;
          v54 = *MEMORY[0x1E0D025B8];
          v97 = *MEMORY[0x1E0CB2D50];
          v82 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("messageId"));
          v98 = v82;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v52;
          a4 = v85;
          v57 = v54;
          v8 = v53;
          v79 = 0;
          v24 = 0;
          *v80 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v57, 2, v55);
          self = v88;
LABEL_74:

          v29 = v83;
LABEL_75:

          goto LABEL_76;
        }
        v79 = 0;
        v24 = 0;
LABEL_82:
        v29 = v83;
        self = v88;
        goto LABEL_75;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v83 = v10;
        goto LABEL_10;
      }
      if (v80)
      {
        v84 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v37 = v8;
        v38 = *MEMORY[0x1E0D025B8];
        v101 = *MEMORY[0x1E0CB2D50];
        v86 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("domainId"));
        v102 = v86;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        v8 = v37;
        v29 = 0;
        v24 = 0;
        *v80 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v39, 2, v11);
LABEL_76:

        goto LABEL_77;
      }
      v29 = 0;
      v24 = 0;
LABEL_77:

      goto LABEL_78;
    }
    if (a4)
    {
      v25 = a4;
      v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v27 = v8;
      v28 = *MEMORY[0x1E0D025B8];
      v103 = *MEMORY[0x1E0CB2D50];
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleId"));
      v104 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v28;
      v8 = v27;
      v10 = (void *)v30;
      v32 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v31, 2, v30);
      a4 = 0;
      v24 = 0;
      *v25 = v32;
      goto LABEL_77;
    }
    v24 = 0;
LABEL_78:

    goto LABEL_79;
  }
  if (a4)
  {
    v17 = self;
    v18 = a4;
    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = *MEMORY[0x1E0D025B8];
    v105 = *MEMORY[0x1E0CB2D50];
    v21 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("protoVersion"));
    v106[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, &v105, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v19;
    a4 = v21;
    v23 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v20, 2, v9);
    v8 = 0;
    v24 = 0;
    *v18 = v23;
    self = v17;
    goto LABEL_78;
  }
  v8 = 0;
  v24 = 0;
LABEL_79:

  return v24;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[9];
  _QWORD v34[11];

  v34[9] = *MEMORY[0x1E0C80C00];
  if (-[BMAutonamingMessageIds hasProtoVersion](self, "hasProtoVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAutonamingMessageIds protoVersion](self, "protoVersion"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMAutonamingMessageIds bundleId](self, "bundleId");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMAutonamingMessageIds domainId](self, "domainId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAutonamingMessageIds spotlightId](self, "spotlightId");
  v6 = objc_claimAutoreleasedReturnValue();
  -[BMAutonamingMessageIds messageId](self, "messageId");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAutonamingMessageIds conversationId](self, "conversationId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMAutonamingMessageIds hasIsDeletion](self, "hasIsDeletion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAutonamingMessageIds isDeletion](self, "isDeletion"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }
  if (-[BMAutonamingMessageIds hasContainsImageAttachment](self, "hasContainsImageAttachment"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAutonamingMessageIds containsImageAttachment](self, "containsImageAttachment"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[BMAutonamingMessageIds messageTimestamp](self, "messageTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAutonamingMessageIds messageTimestamp](self, "messageTimestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    objc_msgSend(v9, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  v33[0] = CFSTR("protoVersion");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v12;
  v34[0] = v12;
  v33[1] = CFSTR("bundleId");
  v13 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v13;
  v34[1] = v13;
  v33[2] = CFSTR("domainId");
  v14 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v14;
  v34[2] = v14;
  v33[3] = CFSTR("spotlightId");
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v3;
  v24 = (void *)v15;
  v34[3] = v15;
  v33[4] = CFSTR("messageId");
  v16 = v32;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v4;
  v34[4] = v16;
  v33[5] = CFSTR("conversationId");
  v17 = v31;
  if (!v31)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[5] = v17;
  v33[6] = CFSTR("isDeletion");
  v18 = v30;
  if (!v30)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v6;
  v34[6] = v18;
  v33[7] = CFSTR("containsImageAttachment");
  v20 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[7] = v20;
  v33[8] = CFSTR("messageTimestamp");
  v21 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[8] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v7)
      goto LABEL_33;
  }
  else
  {

    if (v7)
      goto LABEL_33;
  }

LABEL_33:
  if (!v30)

  if (!v31)
  if (!v32)

  if (v19)
  {
    if (v5)
      goto LABEL_41;
  }
  else
  {

    if (v5)
    {
LABEL_41:
      if (v28)
        goto LABEL_42;
LABEL_48:

      if (v29)
        goto LABEL_43;
LABEL_49:

      goto LABEL_43;
    }
  }

  if (!v28)
    goto LABEL_48;
LABEL_42:
  if (!v29)
    goto LABEL_49;
LABEL_43:

  return v22;
}

- (NSDate)messageTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_messageTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_messageTimestamp);
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMAutonamingMessageIds hasProtoVersion](self, "hasProtoVersion")
      || objc_msgSend(v5, "hasProtoVersion"))
    {
      if (!-[BMAutonamingMessageIds hasProtoVersion](self, "hasProtoVersion"))
        goto LABEL_38;
      if (!objc_msgSend(v5, "hasProtoVersion"))
        goto LABEL_38;
      v6 = -[BMAutonamingMessageIds protoVersion](self, "protoVersion");
      if (v6 != objc_msgSend(v5, "protoVersion"))
        goto LABEL_38;
    }
    -[BMAutonamingMessageIds bundleId](self, "bundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleId");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMAutonamingMessageIds bundleId](self, "bundleId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_38;
    }
    -[BMAutonamingMessageIds domainId](self, "domainId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domainId");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMAutonamingMessageIds domainId](self, "domainId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domainId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_38;
    }
    -[BMAutonamingMessageIds spotlightId](self, "spotlightId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "spotlightId");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMAutonamingMessageIds spotlightId](self, "spotlightId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "spotlightId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_38;
    }
    -[BMAutonamingMessageIds messageId](self, "messageId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageId");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v26 == (void *)v27)
    {

    }
    else
    {
      v28 = (void *)v27;
      -[BMAutonamingMessageIds messageId](self, "messageId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "messageId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (!v31)
        goto LABEL_38;
    }
    -[BMAutonamingMessageIds conversationId](self, "conversationId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conversationId");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v32 == (void *)v33)
    {

    }
    else
    {
      v34 = (void *)v33;
      -[BMAutonamingMessageIds conversationId](self, "conversationId");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "conversationId");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "isEqual:", v36);

      if (!v37)
        goto LABEL_38;
    }
    if (!-[BMAutonamingMessageIds hasIsDeletion](self, "hasIsDeletion")
      && !objc_msgSend(v5, "hasIsDeletion")
      || -[BMAutonamingMessageIds hasIsDeletion](self, "hasIsDeletion")
      && objc_msgSend(v5, "hasIsDeletion")
      && (v38 = -[BMAutonamingMessageIds isDeletion](self, "isDeletion"),
          v38 == objc_msgSend(v5, "isDeletion")))
    {
      if (!-[BMAutonamingMessageIds hasContainsImageAttachment](self, "hasContainsImageAttachment")
        && !objc_msgSend(v5, "hasContainsImageAttachment")
        || -[BMAutonamingMessageIds hasContainsImageAttachment](self, "hasContainsImageAttachment")
        && objc_msgSend(v5, "hasContainsImageAttachment")
        && (v39 = -[BMAutonamingMessageIds containsImageAttachment](self, "containsImageAttachment"),
            v39 == objc_msgSend(v5, "containsImageAttachment")))
      {
        -[BMAutonamingMessageIds messageTimestamp](self, "messageTimestamp");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "messageTimestamp");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41 == v42)
        {
          v13 = 1;
        }
        else
        {
          -[BMAutonamingMessageIds messageTimestamp](self, "messageTimestamp");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "messageTimestamp");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v43, "isEqual:", v44);

        }
        goto LABEL_39;
      }
    }
LABEL_38:
    v13 = 0;
LABEL_39:

    goto LABEL_40;
  }
  v13 = 0;
LABEL_40:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)protoVersion
{
  return self->_protoVersion;
}

- (BOOL)hasProtoVersion
{
  return self->_hasProtoVersion;
}

- (void)setHasProtoVersion:(BOOL)a3
{
  self->_hasProtoVersion = a3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)domainId
{
  return self->_domainId;
}

- (NSString)spotlightId
{
  return self->_spotlightId;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (BOOL)isDeletion
{
  return self->_isDeletion;
}

- (BOOL)hasIsDeletion
{
  return self->_hasIsDeletion;
}

- (void)setHasIsDeletion:(BOOL)a3
{
  self->_hasIsDeletion = a3;
}

- (BOOL)containsImageAttachment
{
  return self->_containsImageAttachment;
}

- (BOOL)hasContainsImageAttachment
{
  return self->_hasContainsImageAttachment;
}

- (void)setHasContainsImageAttachment:(BOOL)a3
{
  self->_hasContainsImageAttachment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_spotlightId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
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

    v4 = -[BMAutonamingMessageIds initByReadFrom:]([BMAutonamingMessageIds alloc], "initByReadFrom:", v7);
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
  void *v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("protoVersion"), 0, 0, 1, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleId"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("domainId"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("spotlightId"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("messageId"), 2, 0, 6, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("conversationId"), 2, 0, 7, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isDeletion"), 0, 0, 8, 12, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("containsImageAttachment"), 0, 0, 9, 12, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("messageTimestamp"), 3, 0, 10, 0, 2);
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
  return &unk_1E5F1F1E0;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("protoVersion"), 1, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleId"), 2, 13, 0, v2);
  v13[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("domainId"), 3, 13, 0);
  v13[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("spotlightId"), 4, 13, 0);
  v13[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("messageId"), 6, 13, 0);
  v13[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("conversationId"), 7, 13, 0);
  v13[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isDeletion"), 8, 12, 0);
  v13[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("containsImageAttachment"), 9, 12, 0);
  v13[7] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("messageTimestamp"), 10, 0, 0);
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
