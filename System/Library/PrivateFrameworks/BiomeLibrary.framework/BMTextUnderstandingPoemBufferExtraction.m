@implementation BMTextUnderstandingPoemBufferExtraction

- (BMTextUnderstandingPoemBufferExtraction)initWithType:(int)a3 text:(id)a4 identifier:(id)a5 confidenceScore:(id)a6 contactIdentifier:(id)a7 role:(int)a8 isCoref:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BMTextUnderstandingPoemBufferExtraction *v20;
  double v21;
  objc_super v24;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v24.receiver = self;
  v24.super_class = (Class)BMTextUnderstandingPoemBufferExtraction;
  v20 = -[BMEventBase init](&v24, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v20->_type = a3;
    objc_storeStrong((id *)&v20->_text, a4);
    objc_storeStrong((id *)&v20->_identifier, a5);
    if (v17)
    {
      v20->_hasConfidenceScore = 1;
      objc_msgSend(v17, "doubleValue");
    }
    else
    {
      v20->_hasConfidenceScore = 0;
      v21 = -1.0;
    }
    v20->_confidenceScore = v21;
    objc_storeStrong((id *)&v20->_contactIdentifier, a7);
    v20->_role = a8;
    if (v19)
    {
      v20->_hasIsCoref = 1;
      v20->_isCoref = objc_msgSend(v19, "BOOLValue");
    }
    else
    {
      v20->_hasIsCoref = 0;
      v20->_isCoref = 0;
    }
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
  BMTextUnderstandingPoemBufferExtractionExtractionTypeAsString(-[BMTextUnderstandingPoemBufferExtraction type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoemBufferExtraction text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoemBufferExtraction identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[BMTextUnderstandingPoemBufferExtraction confidenceScore](self, "confidenceScore");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoemBufferExtraction contactIdentifier](self, "contactIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BMTextUnderstandingPoemBufferExtractionRoleTypeAsString(-[BMTextUnderstandingPoemBufferExtraction role](self, "role"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMTextUnderstandingPoemBufferExtraction isCoref](self, "isCoref"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMTextUnderstandingPoemBufferExtraction with type: %@, text: %@, identifier: %@, confidenceScore: %@, contactIdentifier: %@, role: %@, isCoref: %@"), v4, v5, v6, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMTextUnderstandingPoemBufferExtraction *v5;
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
  uint64_t v29;
  unint64_t v30;
  double v31;
  void *v32;
  char v33;
  unsigned int v34;
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
  uint64_t v46;
  BMTextUnderstandingPoemBufferExtraction *v47;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)BMTextUnderstandingPoemBufferExtraction;
  v5 = -[BMEventBase init](&v49, sel_init);
  if (!v5)
    goto LABEL_72;
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
          while (1)
          {
            v23 = *v6;
            v24 = *(_QWORD *)&v4[v23];
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)&v4[*v7])
              break;
            v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
            *(_QWORD *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0)
              goto LABEL_51;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_53;
            }
          }
          v4[*v8] = 1;
LABEL_51:
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_53:
          if (v22 >= 5)
            LODWORD(v22) = 0;
          v46 = 24;
          goto LABEL_62;
        case 2u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 32;
          goto LABEL_35;
        case 3u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 40;
          goto LABEL_35;
        case 4u:
          v5->_hasConfidenceScore = 1;
          v29 = *v6;
          v30 = *(_QWORD *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(double *)(*(_QWORD *)&v4[*v9] + v30);
            *(_QWORD *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0.0;
          }
          v5->_confidenceScore = v31;
          continue;
        case 5u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 56;
LABEL_35:
          v32 = *(Class *)((char *)&v5->super.super.isa + v28);
          *(Class *)((char *)&v5->super.super.isa + v28) = (Class)v27;

          continue;
        case 6u:
          v33 = 0;
          v34 = 0;
          v22 = 0;
          while (2)
          {
            v35 = *v6;
            v36 = *(_QWORD *)&v4[v35];
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v36);
              *(_QWORD *)&v4[v35] = v37;
              v22 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                v17 = v34++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_59:
          if (v22 >= 4)
            LODWORD(v22) = 0;
          v46 = 28;
LABEL_62:
          *(_DWORD *)((char *)&v5->super.super.isa + v46) = v22;
          continue;
        case 7u:
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v5->_hasIsCoref = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_71;
          continue;
      }
      while (1)
      {
        v42 = *v6;
        v43 = *(_QWORD *)&v4[v42];
        v44 = v43 + 1;
        if (v43 == -1 || v44 > *(_QWORD *)&v4[*v7])
          break;
        v45 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v43);
        *(_QWORD *)&v4[v42] = v44;
        v41 |= (unint64_t)(v45 & 0x7F) << v39;
        if ((v45 & 0x80) == 0)
          goto LABEL_64;
        v39 += 7;
        v17 = v40++ >= 9;
        if (v17)
        {
          v41 = 0;
          goto LABEL_66;
        }
      }
      v4[*v8] = 1;
LABEL_64:
      if (v4[*v8])
        v41 = 0;
LABEL_66:
      v5->_isCoref = v41 != 0;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_71:
    v47 = 0;
  else
LABEL_72:
    v47 = v5;

  return v47;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_text)
    PBDataWriterWriteStringField();
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_hasConfidenceScore)
    PBDataWriterWriteDoubleField();
  if (self->_contactIdentifier)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_hasIsCoref)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMTextUnderstandingPoemBufferExtraction writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMTextUnderstandingPoemBufferExtraction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BMTextUnderstandingPoemBufferExtraction *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id *v20;
  id v21;
  BMTextUnderstandingPoemBufferExtraction *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("text"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = a4;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v11 = 0;
          v22 = 0;
          goto LABEL_56;
        }
        v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v19 = *MEMORY[0x1E0D025B8];
        v69 = *MEMORY[0x1E0CB2D50];
        v58 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("text"));
        v70 = v58;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
        v20 = a4;
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v19, 2, v12);
        v11 = 0;
        v22 = 0;
        *v20 = v21;
        goto LABEL_55;
      }
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v10;
    v52 = v7;
    v56 = v11;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v53)
        {
          v58 = 0;
          v22 = 0;
          goto LABEL_55;
        }
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v24 = *MEMORY[0x1E0D025B8];
        v67 = *MEMORY[0x1E0CB2D50];
        v55 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
        v68 = v55;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v23;
        v10 = v51;
        v26 = v24;
        v11 = v56;
        v58 = 0;
        v22 = 0;
        *v53 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v13);
LABEL_54:

        v7 = v52;
LABEL_55:

        goto LABEL_56;
      }
      v58 = v12;
    }
    else
    {
      v58 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("confidenceScore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v53)
        {
          v55 = 0;
          v22 = 0;
          goto LABEL_54;
        }
        v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = *MEMORY[0x1E0D025B8];
        v65 = *MEMORY[0x1E0CB2D50];
        v54 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("confidenceScore"));
        v66 = v54;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v27;
        v10 = v51;
        v30 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v28, 2, v14);
        v55 = 0;
        v22 = 0;
        *v53 = v30;
        goto LABEL_53;
      }
      v55 = v13;
    }
    else
    {
      v55 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contactIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v8;
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v53)
        {
          v54 = 0;
          v22 = 0;
          goto LABEL_53;
        }
        v16 = self;
        v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v32 = *MEMORY[0x1E0D025B8];
        v63 = *MEMORY[0x1E0CB2D50];
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contactIdentifier"));
        v64 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v32, 2, v15);
        v54 = 0;
        v22 = 0;
        *v53 = v33;
LABEL_52:

        self = v16;
        v8 = v50;
        v10 = v51;
LABEL_53:

        v11 = v56;
        goto LABEL_54;
      }
      v54 = v14;
    }
    else
    {
      v54 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("role"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v16 = self;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v15;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v53)
          {
            v17 = 0;
            v22 = 0;
            goto LABEL_52;
          }
          v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v45 = *MEMORY[0x1E0D025B8];
          v61 = *MEMORY[0x1E0CB2D50];
          v41 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("role"));
          v62 = v41;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v45, 2, v40);
          v17 = 0;
          v22 = 0;
          *v53 = v46;
          goto LABEL_51;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMTextUnderstandingPoemBufferExtractionRoleTypeFromString(v15));
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v17 = v18;
    }
    else
    {
      v16 = self;
      v17 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isCoref"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v53)
        {
          v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v47 = *MEMORY[0x1E0D025B8];
          v59 = *MEMORY[0x1E0CB2D50];
          v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isCoref"));
          v60 = v43;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *v53 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v47, 2, v44);

        }
        v41 = 0;
        v22 = 0;
        goto LABEL_51;
      }
      v41 = v40;
    }
    else
    {
      v41 = 0;
    }
    v22 = -[BMTextUnderstandingPoemBufferExtraction initWithType:text:identifier:confidenceScore:contactIdentifier:role:isCoref:](v16, "initWithType:text:identifier:confidenceScore:contactIdentifier:role:isCoref:", objc_msgSend(v50, "intValue"), v56, v58, v55, v54, objc_msgSend(v17, "intValue"), v41);
    v16 = v22;
LABEL_51:

    goto LABEL_52;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
LABEL_8:
    v8 = v9;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMTextUnderstandingPoemBufferExtractionExtractionTypeFromString(v7));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a4)
  {
    v8 = 0;
    v22 = 0;
    goto LABEL_57;
  }
  v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v35 = *MEMORY[0x1E0D025B8];
  v71 = *MEMORY[0x1E0CB2D50];
  v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("type"));
  v72[0] = v36;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = v34;
  v10 = (void *)v37;
  v39 = v35;
  v11 = (id)v36;
  v8 = 0;
  v22 = 0;
  *a4 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 2, v37);
LABEL_56:

LABEL_57:
  return v22;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  double v5;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMTextUnderstandingPoemBufferExtraction type](self, "type"));
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoemBufferExtraction text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoemBufferExtraction identifier](self, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMTextUnderstandingPoemBufferExtraction hasConfidenceScore](self, "hasConfidenceScore")
    || (-[BMTextUnderstandingPoemBufferExtraction confidenceScore](self, "confidenceScore"), fabs(v5) == INFINITY))
  {
    v23 = 0;
  }
  else
  {
    -[BMTextUnderstandingPoemBufferExtraction confidenceScore](self, "confidenceScore");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMTextUnderstandingPoemBufferExtraction confidenceScore](self, "confidenceScore");
    objc_msgSend(v6, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMTextUnderstandingPoemBufferExtraction contactIdentifier](self, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMTextUnderstandingPoemBufferExtraction role](self, "role"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMTextUnderstandingPoemBufferExtraction hasIsCoref](self, "hasIsCoref"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMTextUnderstandingPoemBufferExtraction isCoref](self, "isCoref"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v24[0] = CFSTR("type");
  v10 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v10;
  v25[0] = v10;
  v24[1] = CFSTR("text");
  v11 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v11;
  v25[1] = v11;
  v24[2] = CFSTR("identifier");
  v12 = v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v12;
  v24[3] = CFSTR("confidenceScore");
  v13 = v23;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v3;
  v25[3] = v13;
  v24[4] = CFSTR("contactIdentifier");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v14;
  v24[5] = CFSTR("role");
  v15 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[5] = v15;
  v24[6] = CFSTR("isCoref");
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
      goto LABEL_24;
LABEL_32:

    if (v7)
      goto LABEL_25;
    goto LABEL_33;
  }

  if (!v8)
    goto LABEL_32;
LABEL_24:
  if (v7)
    goto LABEL_25;
LABEL_33:

LABEL_25:
  if (!v23)

  if (v22)
  {
    if (v4)
      goto LABEL_29;
LABEL_35:

    if (v21)
      goto LABEL_30;
LABEL_36:

    goto LABEL_30;
  }

  if (!v4)
    goto LABEL_35;
LABEL_29:
  if (!v21)
    goto LABEL_36;
LABEL_30:

  return v17;
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
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  _BOOL4 v30;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMTextUnderstandingPoemBufferExtraction type](self, "type");
    if (v6 == objc_msgSend(v5, "type"))
    {
      -[BMTextUnderstandingPoemBufferExtraction text](self, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "text");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[BMTextUnderstandingPoemBufferExtraction text](self, "text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "text");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_27;
      }
      -[BMTextUnderstandingPoemBufferExtraction identifier](self, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[BMTextUnderstandingPoemBufferExtraction identifier](self, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_27;
      }
      if (-[BMTextUnderstandingPoemBufferExtraction hasConfidenceScore](self, "hasConfidenceScore")
        || objc_msgSend(v5, "hasConfidenceScore"))
      {
        if (!-[BMTextUnderstandingPoemBufferExtraction hasConfidenceScore](self, "hasConfidenceScore"))
          goto LABEL_27;
        if (!objc_msgSend(v5, "hasConfidenceScore"))
          goto LABEL_27;
        -[BMTextUnderstandingPoemBufferExtraction confidenceScore](self, "confidenceScore");
        v21 = v20;
        objc_msgSend(v5, "confidenceScore");
        if (v21 != v22)
          goto LABEL_27;
      }
      -[BMTextUnderstandingPoemBufferExtraction contactIdentifier](self, "contactIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contactIdentifier");
      v24 = objc_claimAutoreleasedReturnValue();
      if (v23 == (void *)v24)
      {

      }
      else
      {
        v25 = (void *)v24;
        -[BMTextUnderstandingPoemBufferExtraction contactIdentifier](self, "contactIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "contactIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "isEqual:", v27);

        if (!v28)
          goto LABEL_27;
      }
      v29 = -[BMTextUnderstandingPoemBufferExtraction role](self, "role");
      if (v29 == objc_msgSend(v5, "role"))
      {
        if (!-[BMTextUnderstandingPoemBufferExtraction hasIsCoref](self, "hasIsCoref")
          && !objc_msgSend(v5, "hasIsCoref"))
        {
          LOBYTE(v13) = 1;
          goto LABEL_28;
        }
        if (-[BMTextUnderstandingPoemBufferExtraction hasIsCoref](self, "hasIsCoref")
          && objc_msgSend(v5, "hasIsCoref"))
        {
          v30 = -[BMTextUnderstandingPoemBufferExtraction isCoref](self, "isCoref");
          v13 = v30 ^ objc_msgSend(v5, "isCoref") ^ 1;
LABEL_28:

          goto LABEL_29;
        }
      }
    }
LABEL_27:
    LOBYTE(v13) = 0;
    goto LABEL_28;
  }
  LOBYTE(v13) = 0;
LABEL_29:

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

- (NSString)text
{
  return self->_text;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

- (BOOL)hasConfidenceScore
{
  return self->_hasConfidenceScore;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  self->_hasConfidenceScore = a3;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (int)role
{
  return self->_role;
}

- (BOOL)isCoref
{
  return self->_isCoref;
}

- (BOOL)hasIsCoref
{
  return self->_hasIsCoref;
}

- (void)setHasIsCoref:(BOOL)a3
{
  self->_hasIsCoref = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
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

    v4 = -[BMTextUnderstandingPoemBufferExtraction initByReadFrom:]([BMTextUnderstandingPoemBufferExtraction alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("type"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("text"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("confidenceScore"), 1, 0, 4, 0, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contactIdentifier"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("role"), 0, 0, 6, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isCoref"), 0, 0, 7, 12, 0);
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
  return &unk_1E5F1BF70;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("type"), 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("text"), 2, 13, 0, v2);
  v11[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 3, 13, 0);
  v11[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("confidenceScore"), 4, 0, 0);
  v11[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contactIdentifier"), 5, 13, 0);
  v11[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("role"), 6, 4, 0);
  v11[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isCoref"), 7, 12, 0);
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
