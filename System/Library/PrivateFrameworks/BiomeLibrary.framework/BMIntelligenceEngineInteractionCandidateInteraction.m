@implementation BMIntelligenceEngineInteractionCandidateInteraction

- (BMIntelligenceEngineInteractionCandidateInteraction)initWithCandidateId:(id)a3 userAlignment:(int)a4
{
  id v7;
  BMIntelligenceEngineInteractionCandidateInteraction *v8;
  objc_super v10;

  v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BMIntelligenceEngineInteractionCandidateInteraction;
  v8 = -[BMEventBase init](&v10, sel_init);
  if (v8)
  {
    v8->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v8->_candidateId, a3);
    v8->_userAlignment = a4;
  }

  return v8;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMIntelligenceEngineInteractionCandidateInteraction candidateId](self, "candidateId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMIntelligenceEngineInteractionUserAlignmentAsString(-[BMIntelligenceEngineInteractionCandidateInteraction userAlignment](self, "userAlignment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMIntelligenceEngineInteractionCandidateInteraction with candidateId: %@, userAlignment: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMIntelligenceEngineInteractionCandidateInteraction *v5;
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
  BMIntelligenceEngineInteractionCandidateID *v27;
  BMIntelligenceEngineInteractionCandidateID *candidateId;
  BMIntelligenceEngineInteractionCandidateInteraction *v29;
  objc_super v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMIntelligenceEngineInteractionCandidateInteraction;
  v5 = -[BMEventBase init](&v31, sel_init);
  if (!v5)
    goto LABEL_42;
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
      if ((v12 >> 3) == 1)
      {
        v32 = 0;
        v33 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_41;
        v27 = -[BMIntelligenceEngineInteractionCandidateID initByReadFrom:]([BMIntelligenceEngineInteractionCandidateID alloc], "initByReadFrom:", v4);
        if (!v27)
          goto LABEL_41;
        candidateId = v5->_candidateId;
        v5->_candidateId = v27;

        PBReaderRecallMark();
      }
      else if ((v12 >> 3) == 2)
      {
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
            goto LABEL_34;
          v20 += 7;
          v17 = v21++ >= 9;
          if (v17)
          {
            LODWORD(v22) = 0;
            goto LABEL_36;
          }
        }
        v4[*v8] = 1;
LABEL_34:
        if (v4[*v8])
          LODWORD(v22) = 0;
LABEL_36:
        if (v22 >= 8)
          LODWORD(v22) = 0;
        v5->_userAlignment = v22;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_41;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_41:
    v29 = 0;
  else
LABEL_42:
    v29 = v5;

  return v29;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_candidateId)
  {
    PBDataWriterPlaceMark();
    -[BMIntelligenceEngineInteractionCandidateID writeTo:](self->_candidateId, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMIntelligenceEngineInteractionCandidateInteraction writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMIntelligenceEngineInteractionCandidateInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMIntelligenceEngineInteractionCandidateID *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  BMIntelligenceEngineInteractionCandidateInteraction *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("candidateId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v7;
    v23 = 0;
    v8 = -[BMIntelligenceEngineInteractionCandidateID initWithJSONDictionary:error:]([BMIntelligenceEngineInteractionCandidateID alloc], "initWithJSONDictionary:error:", v10, &v23);
    v11 = v23;
    if (v11)
    {
      v12 = v11;
      if (a4)
        *a4 = objc_retainAutorelease(v11);

      v13 = 0;
      goto LABEL_21;
    }

LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userAlignment"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v20 = *MEMORY[0x1E0D025B8];
            v24 = *MEMORY[0x1E0CB2D50];
            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("userAlignment"));
            v25 = v21;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v22);

          }
          v10 = 0;
          v13 = 0;
          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMIntelligenceEngineInteractionUserAlignmentFromString(v9));
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v14;
    }
    else
    {
      v10 = 0;
    }
    self = -[BMIntelligenceEngineInteractionCandidateInteraction initWithCandidateId:userAlignment:](self, "initWithCandidateId:userAlignment:", v8, objc_msgSend(v10, "intValue"));
    v13 = self;
LABEL_20:

    goto LABEL_21;
  }
  if (!a4)
  {
    v13 = 0;
    goto LABEL_22;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v16 = *MEMORY[0x1E0D025B8];
  v26 = *MEMORY[0x1E0CB2D50];
  v8 = (BMIntelligenceEngineInteractionCandidateID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("candidateId"));
  v27[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v10);
  v13 = 0;
  *a4 = v17;
LABEL_21:

LABEL_22:
  return v13;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[BMIntelligenceEngineInteractionCandidateInteraction candidateId](self, "candidateId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMIntelligenceEngineInteractionCandidateInteraction userAlignment](self, "userAlignment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("candidateId");
  v6 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("userAlignment");
  v11[0] = v6;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

    if (v4)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v4)
    goto LABEL_9;
LABEL_7:

  return v8;
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
  int v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMIntelligenceEngineInteractionCandidateInteraction candidateId](self, "candidateId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidateId");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMIntelligenceEngineInteractionCandidateInteraction candidateId](self, "candidateId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "candidateId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        v12 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    v13 = -[BMIntelligenceEngineInteractionCandidateInteraction userAlignment](self, "userAlignment");
    v12 = v13 == objc_msgSend(v5, "userAlignment");
    goto LABEL_8;
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMIntelligenceEngineInteractionCandidateID)candidateId
{
  return self->_candidateId;
}

- (int)userAlignment
{
  return self->_userAlignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateId, 0);
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

    v4 = -[BMIntelligenceEngineInteractionCandidateInteraction initByReadFrom:]([BMIntelligenceEngineInteractionCandidateInteraction alloc], "initByReadFrom:", v7);
    v4[4] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("candidateId_json"), 5, 1, &__block_literal_global_160_26538);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userAlignment"), 0, 0, 2, 4, 0);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C0A8;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("candidateId"), 1, 14, objc_opt_class());
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userAlignment"), 2, 4, 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __62__BMIntelligenceEngineInteractionCandidateInteraction_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidateId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
