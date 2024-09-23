@implementation BMGenerativeExperiencesTransparencyLog

- (BMGenerativeExperiencesTransparencyLog)initWithTimestamp:(id)a3 identifier:(id)a4 prompt:(id)a5 response:(id)a6 model:(id)a7 modelVersion:(id)a8 useCase:(id)a9 errorCode:(id)a10 clientIdentifier:(id)a11 executionEnvironment:(int)a12
{
  id v18;
  id v19;
  BMGenerativeExperiencesTransparencyLog *v20;
  double v21;
  int v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v18 = a3;
  v30 = a4;
  v29 = a5;
  v28 = a6;
  v27 = a7;
  v26 = a8;
  v25 = a9;
  v19 = a10;
  v24 = a11;
  v31.receiver = self;
  v31.super_class = (Class)BMGenerativeExperiencesTransparencyLog;
  v20 = -[BMEventBase init](&v31, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v18)
    {
      v20->_hasRaw_timestamp = 1;
      objc_msgSend(v18, "timeIntervalSince1970");
    }
    else
    {
      v20->_hasRaw_timestamp = 0;
      v21 = -1.0;
    }
    v20->_raw_timestamp = v21;
    objc_storeStrong((id *)&v20->_identifier, a4);
    objc_storeStrong((id *)&v20->_prompt, a5);
    objc_storeStrong((id *)&v20->_response, a6);
    objc_storeStrong((id *)&v20->_model, a7);
    objc_storeStrong((id *)&v20->_modelVersion, a8);
    objc_storeStrong((id *)&v20->_useCase, a9);
    if (v19)
    {
      v20->_hasErrorCode = 1;
      v22 = objc_msgSend(v19, "intValue");
    }
    else
    {
      v20->_hasErrorCode = 0;
      v22 = -1;
    }
    v20->_errorCode = v22;
    objc_storeStrong((id *)&v20->_clientIdentifier, a11);
    v20->_executionEnvironment = a12;
  }

  return v20;
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

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMGenerativeExperiencesTransparencyLog timestamp](self, "timestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMGenerativeExperiencesTransparencyLog identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMGenerativeExperiencesTransparencyLog prompt](self, "prompt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMGenerativeExperiencesTransparencyLog response](self, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMGenerativeExperiencesTransparencyLog model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMGenerativeExperiencesTransparencyLog modelVersion](self, "modelVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMGenerativeExperiencesTransparencyLog useCase](self, "useCase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMGenerativeExperiencesTransparencyLog errorCode](self, "errorCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMGenerativeExperiencesTransparencyLog clientIdentifier](self, "clientIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BMGenerativeExperiencesTransparencyLogExecutionEnvironmentAsString(-[BMGenerativeExperiencesTransparencyLog executionEnvironment](self, "executionEnvironment"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("BMGenerativeExperiencesTransparencyLog with timestamp: %@, identifier: %@, prompt: %@, response: %@, model: %@, modelVersion: %@, useCase: %@, errorCode: %@, clientIdentifier: %@, executionEnvironment: %@"), v14, v3, v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMGenerativeExperiencesTransparencyLog *v5;
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
  unint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  void *v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  unsigned int v41;
  BMGenerativeExperiencesTransparencyLog *v42;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BMGenerativeExperiencesTransparencyLog;
  v5 = -[BMEventBase init](&v44, sel_init);
  if (!v5)
    goto LABEL_63;
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
          v5->_hasRaw_timestamp = 1;
          v20 = *v6;
          v21 = *(_QWORD *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(double *)(*(_QWORD *)&v4[*v9] + v21);
            *(_QWORD *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0.0;
          }
          v5->_raw_timestamp = v22;
          continue;
        case 2u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 48;
          goto LABEL_39;
        case 3u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 56;
          goto LABEL_39;
        case 4u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 64;
          goto LABEL_39;
        case 5u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 72;
          goto LABEL_39;
        case 6u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 80;
          goto LABEL_39;
        case 7u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 88;
          goto LABEL_39;
        case 8u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v5->_hasErrorCode = 1;
          while (2)
          {
            v28 = *v6;
            v29 = *(_QWORD *)&v4[v28];
            v30 = v29 + 1;
            if (v29 == -1 || v30 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v29);
              *(_QWORD *)&v4[v28] = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                v17 = v26++ >= 9;
                if (v17)
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
          v5->_errorCode = v27;
          continue;
        case 9u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 96;
LABEL_39:
          v32 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        case 0xAu:
          v33 = 0;
          v34 = 0;
          v35 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_62;
          continue;
      }
      while (1)
      {
        v36 = *v6;
        v37 = *(_QWORD *)&v4[v36];
        v38 = v37 + 1;
        if (v37 == -1 || v38 > *(_QWORD *)&v4[*v7])
          break;
        v39 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v37);
        *(_QWORD *)&v4[v36] = v38;
        v35 |= (unint64_t)(v39 & 0x7F) << v33;
        if ((v39 & 0x80) == 0)
          goto LABEL_54;
        v33 += 7;
        if (v34++ > 8)
        {
          v41 = 0;
          goto LABEL_58;
        }
      }
      v4[*v8] = 1;
LABEL_54:
      v41 = 0;
      if (v4[*v8])
        LODWORD(v35) = 0;
      if (v35 <= 4)
        v41 = dword_1AEFE26C0[v35];
LABEL_58:
      v5->_executionEnvironment = v41;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_62:
    v42 = 0;
  else
LABEL_63:
    v42 = v5;

  return v42;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasRaw_timestamp)
    PBDataWriterWriteDoubleField();
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_prompt)
    PBDataWriterWriteStringField();
  if (self->_response)
    PBDataWriterWriteStringField();
  if (self->_model)
    PBDataWriterWriteStringField();
  if (self->_modelVersion)
    PBDataWriterWriteStringField();
  if (self->_useCase)
    PBDataWriterWriteStringField();
  if (self->_hasErrorCode)
    PBDataWriterWriteInt32Field();
  if (self->_clientIdentifier)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMGenerativeExperiencesTransparencyLog writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMGenerativeExperiencesTransparencyLog)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  BMGenerativeExperiencesTransparencyLog *v33;
  void *v34;
  void *v35;
  id *v36;
  id v37;
  void *v38;
  id v39;
  id *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  BMGenerativeExperiencesTransparencyLog *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  void *v93;
  id v94;
  id *v95;
  void *v96;
  id v97;
  void *v98;
  id v99;
  id v100;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  id v113;
  uint64_t v114;
  id v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  _QWORD v121[3];

  v121[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (objc_class *)MEMORY[0x1E0C99D68];
    v9 = v6;
    v10 = [v8 alloc];
    objc_msgSend(v9, "doubleValue");
    v12 = v11;

    v13 = (id)objc_msgSend(v10, "initWithTimeIntervalSince1970:", v12);
LABEL_6:
    v7 = v13;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v7 = 0;
        v33 = 0;
        v46 = self;
        goto LABEL_94;
      }
      v71 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v72 = *MEMORY[0x1E0D025B8];
      v120 = *MEMORY[0x1E0CB2D50];
      v73 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("timestamp"));
      v121[0] = v73;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v121, &v120, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v72;
      v16 = (id)v73;
      v75 = (id)objc_msgSend(v71, "initWithDomain:code:userInfo:", v74, 2, v15);
      v7 = 0;
      v33 = 0;
      *a4 = v75;
      goto LABEL_80;
    }
    v13 = v6;
    goto LABEL_6;
  }
  v14 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(v14, "dateFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v15;
LABEL_12:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("prompt"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v99 = 0;
      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v99 = v17;
LABEL_15:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("response"));
      v18 = objc_claimAutoreleasedReturnValue();
      v98 = (void *)v18;
      v95 = a4;
      v96 = v17;
      if (!v18 || (v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v100 = 0;
LABEL_18:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("model"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = v7;
        if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v95)
            {
              v97 = 0;
              v33 = 0;
              v46 = self;
              v30 = v99;
              goto LABEL_90;
            }
            v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v89 = v6;
            v56 = v16;
            v57 = *MEMORY[0x1E0D025B8];
            v112 = *MEMORY[0x1E0CB2D50];
            v94 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("model"));
            v113 = v94;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1);
            v58 = objc_claimAutoreleasedReturnValue();
            v59 = v55;
            v7 = v93;
            v60 = v57;
            v16 = v56;
            v90 = (void *)v58;
            v97 = 0;
            v33 = 0;
            *v95 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v60, 2);
            v6 = v89;
            v46 = self;
            v30 = v99;
            goto LABEL_89;
          }
          v21 = v15;
          v97 = v20;
        }
        else
        {
          v21 = v15;
          v97 = 0;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("modelVersion"));
        v22 = objc_claimAutoreleasedReturnValue();
        v92 = v16;
        v90 = (void *)v22;
        if (v22 && (v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v95)
            {
              v94 = 0;
              v33 = 0;
              v46 = self;
              v30 = v99;
              v15 = v21;
              v17 = v96;
              goto LABEL_89;
            }
            v62 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v63 = *MEMORY[0x1E0D025B8];
            v110 = *MEMORY[0x1E0CB2D50];
            v91 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("modelVersion"));
            v111 = v91;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = 0;
            v33 = 0;
            *v95 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v63, 2);
            v46 = self;
            v30 = v99;
            v15 = v21;
            v17 = v96;
LABEL_88:

            v16 = v92;
LABEL_89:

            goto LABEL_90;
          }
          v94 = v23;
        }
        else
        {
          v94 = 0;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("useCase"));
        v24 = objc_claimAutoreleasedReturnValue();
        v15 = v21;
        v84 = (void *)v24;
        if (v24)
        {
          v25 = (void *)v24;
          objc_opt_class();
          v26 = v25;
          v17 = v96;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v91 = 0;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v95)
              {
                v91 = 0;
                v33 = 0;
                v46 = self;
                v30 = v99;
                goto LABEL_88;
              }
              v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v65 = *MEMORY[0x1E0D025B8];
              v108 = *MEMORY[0x1E0CB2D50];
              v85 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("useCase"));
              v109 = v85;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = v64;
              v7 = v93;
              v91 = 0;
              v33 = 0;
              *v95 = (id)objc_msgSend(v66, "initWithDomain:code:userInfo:", v65, 2, v34);
              goto LABEL_99;
            }
            v91 = v26;
          }
        }
        else
        {
          v91 = 0;
          v17 = v96;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("errorCode"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = v6;
        v83 = v20;
        if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v85 = 0;
          goto LABEL_45;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v85 = v34;
LABEL_45:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            v36 = v95;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v37 = v35;
                goto LABEL_53;
              }
              if (v95)
              {
                v81 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v69 = *MEMORY[0x1E0D025B8];
                v104 = *MEMORY[0x1E0CB2D50];
                v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clientIdentifier"));
                v105 = v48;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = (id)objc_msgSend(v81, "initWithDomain:code:userInfo:", v69, 2, v47);
                v37 = 0;
                v33 = 0;
                *v95 = v70;
                goto LABEL_85;
              }
              v37 = 0;
              v33 = 0;
LABEL_104:
              v6 = v86;
              goto LABEL_86;
            }
          }
          else
          {
            v36 = v95;
          }
          v37 = 0;
LABEL_53:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("executionEnvironment"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (v47 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v61 = v47;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (v36)
                {
                  v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v80 = *MEMORY[0x1E0D025B8];
                  v102 = *MEMORY[0x1E0CB2D50];
                  v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("executionEnvironment"));
                  v103 = v77;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  *v36 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v80, 2, v78);

                }
                v48 = 0;
                v33 = 0;
                goto LABEL_85;
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMGenerativeExperiencesTransparencyLogExecutionEnvironmentFromString(v47));
              v61 = (id)objc_claimAutoreleasedReturnValue();
            }
            v48 = v61;
          }
          else
          {
            v48 = 0;
          }
          LODWORD(v79) = objc_msgSend(v48, "intValue");
          v33 = -[BMGenerativeExperiencesTransparencyLog initWithTimestamp:identifier:prompt:response:model:modelVersion:useCase:errorCode:clientIdentifier:executionEnvironment:](self, "initWithTimestamp:identifier:prompt:response:model:modelVersion:useCase:errorCode:clientIdentifier:executionEnvironment:", v93, v92, v99, v100, v97, v94, v91, v85, v37, v79);
          self = v33;
LABEL_85:
          v6 = v86;

LABEL_86:
          v46 = self;
          v7 = v93;
          v30 = v99;
          v20 = v83;
LABEL_87:

          goto LABEL_88;
        }
        if (v95)
        {
          v67 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v68 = *MEMORY[0x1E0D025B8];
          v106 = *MEMORY[0x1E0CB2D50];
          v37 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("errorCode"));
          v107 = v37;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = 0;
          v33 = 0;
          *v95 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v68, 2, v35);
          goto LABEL_104;
        }
        v85 = 0;
        v33 = 0;
LABEL_99:
        v46 = self;
        v30 = v99;
        goto LABEL_87;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v100 = v19;
        goto LABEL_18;
      }
      if (a4)
      {
        v49 = v7;
        v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v88 = v6;
        v51 = v16;
        v52 = *MEMORY[0x1E0D025B8];
        v114 = *MEMORY[0x1E0CB2D50];
        v97 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("response"));
        v115 = v97;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v50;
        v7 = v49;
        v54 = v52;
        v16 = v51;
        v100 = 0;
        v33 = 0;
        *v95 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 2, v20);
        v6 = v88;
        v46 = self;
        v30 = v99;
LABEL_90:

        goto LABEL_91;
      }
      v100 = 0;
      v33 = 0;
      v46 = self;
      v30 = v99;
LABEL_91:

      goto LABEL_92;
    }
    if (a4)
    {
      v38 = v7;
      v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v87 = v6;
      v40 = a4;
      v41 = v16;
      v42 = *MEMORY[0x1E0D025B8];
      v116 = *MEMORY[0x1E0CB2D50];
      v100 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("prompt"));
      v117 = v100;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v39;
      v7 = v38;
      v45 = v42;
      v16 = v41;
      v98 = (void *)v43;
      v30 = 0;
      v33 = 0;
      *v40 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v45, 2);
      v6 = v87;
      v46 = self;
      goto LABEL_91;
    }
    v30 = 0;
    v33 = 0;
LABEL_74:
    v46 = self;
LABEL_92:

    goto LABEL_93;
  }
  if (a4)
  {
    v27 = v7;
    v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v29 = *MEMORY[0x1E0D025B8];
    v118 = *MEMORY[0x1E0CB2D50];
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
    v119 = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v28;
    v7 = v27;
    v32 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v29, 2, v17);
    v16 = 0;
    v33 = 0;
    *a4 = v32;
    goto LABEL_74;
  }
  v16 = 0;
  v33 = 0;
LABEL_80:
  v46 = self;
LABEL_93:

LABEL_94:
  return v33;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[10];
  _QWORD v42[12];

  v42[10] = *MEMORY[0x1E0C80C00];
  -[BMGenerativeExperiencesTransparencyLog timestamp](self, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMGenerativeExperiencesTransparencyLog timestamp](self, "timestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMGenerativeExperiencesTransparencyLog identifier](self, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  -[BMGenerativeExperiencesTransparencyLog prompt](self, "prompt");
  v8 = objc_claimAutoreleasedReturnValue();
  -[BMGenerativeExperiencesTransparencyLog response](self, "response");
  v9 = objc_claimAutoreleasedReturnValue();
  -[BMGenerativeExperiencesTransparencyLog model](self, "model");
  v10 = objc_claimAutoreleasedReturnValue();
  -[BMGenerativeExperiencesTransparencyLog modelVersion](self, "modelVersion");
  v11 = objc_claimAutoreleasedReturnValue();
  -[BMGenerativeExperiencesTransparencyLog useCase](self, "useCase");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)v11;
  if (-[BMGenerativeExperiencesTransparencyLog hasErrorCode](self, "hasErrorCode"))
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    v13 = -[BMGenerativeExperiencesTransparencyLog errorCode](self, "errorCode");
    v14 = v12;
    v11 = (uint64_t)v38;
    objc_msgSend(v14, "numberWithInt:", v13);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = 0;
  }
  -[BMGenerativeExperiencesTransparencyLog clientIdentifier](self, "clientIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMGenerativeExperiencesTransparencyLog executionEnvironment](self, "executionEnvironment"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = CFSTR("timestamp");
  v17 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v17;
  v42[0] = v17;
  v41[1] = CFSTR("identifier");
  v18 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v18;
  v42[1] = v18;
  v41[2] = CFSTR("prompt");
  v19 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v19;
  v42[2] = v19;
  v41[3] = CFSTR("response");
  v20 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v6;
  v30 = (void *)v20;
  v42[3] = v20;
  v41[4] = CFSTR("model");
  v21 = (void *)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v7;
  v42[4] = v21;
  v41[5] = CFSTR("modelVersion");
  v22 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v8;
  v42[5] = v22;
  v41[6] = CFSTR("useCase");
  v23 = v40;
  if (!v40)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v9;
  v42[6] = v23;
  v41[7] = CFSTR("errorCode");
  v25 = v39;
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v10;
  v42[7] = v25;
  v41[8] = CFSTR("clientIdentifier");
  v27 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42[8] = v27;
  v41[9] = CFSTR("executionEnvironment");
  v28 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42[9] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 10);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (v15)
      goto LABEL_29;
  }
  else
  {

    if (v15)
      goto LABEL_29;
  }

LABEL_29:
  if (!v39)

  if (!v40)
  if (!v38)

  if (!v26)
  if (v24)
  {
    if (v35)
      goto LABEL_39;
  }
  else
  {

    if (v35)
    {
LABEL_39:
      if (v36)
        goto LABEL_40;
LABEL_46:

      if (v37)
        goto LABEL_41;
LABEL_47:

      goto LABEL_41;
    }
  }

  if (!v36)
    goto LABEL_46;
LABEL_40:
  if (!v37)
    goto LABEL_47;
LABEL_41:

  return v34;
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
  int v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  int v57;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMGenerativeExperiencesTransparencyLog timestamp](self, "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMGenerativeExperiencesTransparencyLog timestamp](self, "timestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_38;
    }
    -[BMGenerativeExperiencesTransparencyLog identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMGenerativeExperiencesTransparencyLog identifier](self, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_38;
    }
    -[BMGenerativeExperiencesTransparencyLog prompt](self, "prompt");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prompt");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMGenerativeExperiencesTransparencyLog prompt](self, "prompt");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "prompt");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_38;
    }
    -[BMGenerativeExperiencesTransparencyLog response](self, "response");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "response");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMGenerativeExperiencesTransparencyLog response](self, "response");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "response");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_38;
    }
    -[BMGenerativeExperiencesTransparencyLog model](self, "model");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "model");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMGenerativeExperiencesTransparencyLog model](self, "model");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "model");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_38;
    }
    -[BMGenerativeExperiencesTransparencyLog modelVersion](self, "modelVersion");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modelVersion");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMGenerativeExperiencesTransparencyLog modelVersion](self, "modelVersion");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "modelVersion");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_38;
    }
    -[BMGenerativeExperiencesTransparencyLog useCase](self, "useCase");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "useCase");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMGenerativeExperiencesTransparencyLog useCase](self, "useCase");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "useCase");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_38;
    }
    if (-[BMGenerativeExperiencesTransparencyLog hasErrorCode](self, "hasErrorCode")
      || objc_msgSend(v5, "hasErrorCode"))
    {
      if (!-[BMGenerativeExperiencesTransparencyLog hasErrorCode](self, "hasErrorCode"))
        goto LABEL_38;
      if (!objc_msgSend(v5, "hasErrorCode"))
        goto LABEL_38;
      v49 = -[BMGenerativeExperiencesTransparencyLog errorCode](self, "errorCode");
      if (v49 != objc_msgSend(v5, "errorCode"))
        goto LABEL_38;
    }
    -[BMGenerativeExperiencesTransparencyLog clientIdentifier](self, "clientIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientIdentifier");
    v51 = objc_claimAutoreleasedReturnValue();
    if (v50 == (void *)v51)
    {

    }
    else
    {
      v52 = (void *)v51;
      -[BMGenerativeExperiencesTransparencyLog clientIdentifier](self, "clientIdentifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientIdentifier");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v53, "isEqual:", v54);

      if (!v55)
      {
LABEL_38:
        v12 = 0;
LABEL_39:

        goto LABEL_40;
      }
    }
    v57 = -[BMGenerativeExperiencesTransparencyLog executionEnvironment](self, "executionEnvironment");
    v12 = v57 == objc_msgSend(v5, "executionEnvironment");
    goto LABEL_39;
  }
  v12 = 0;
LABEL_40:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (NSString)response
{
  return self->_response;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (NSString)useCase
{
  return self->_useCase;
}

- (int)errorCode
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

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (int)executionEnvironment
{
  return self->_executionEnvironment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
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

    v4 = -[BMGenerativeExperiencesTransparencyLog initByReadFrom:]([BMGenerativeExperiencesTransparencyLog alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timestamp"), 3, 0, 1, 0, 2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("prompt"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("response"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("model"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("modelVersion"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("useCase"), 2, 0, 7, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("errorCode"), 0, 0, 8, 2, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientIdentifier"), 2, 0, 9, 13, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("executionEnvironment"), 0, 0, 10, 4, 0);
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
  return &unk_1E5F1C360;
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
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timestamp"), 1, 0, 0);
  v14[0] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 2, 13, 0);
  v14[1] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("prompt"), 3, 13, 0);
  v14[2] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("response"), 4, 13, 0);
  v14[3] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("model"), 5, 13, 0);
  v14[4] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("modelVersion"), 6, 13, 0);
  v14[5] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("useCase"), 7, 13, 0);
  v14[6] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("errorCode"), 8, 2, 0);
  v14[7] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientIdentifier"), 9, 13, 0);
  v14[8] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("executionEnvironment"), 10, 4, 0);
  v14[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
