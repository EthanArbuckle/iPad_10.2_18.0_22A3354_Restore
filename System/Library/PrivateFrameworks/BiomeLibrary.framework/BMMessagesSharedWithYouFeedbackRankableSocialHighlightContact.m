@implementation BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact

- (BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact)initWithIsSignificant:(id)a3 handle:(id)a4 isMe:(id)a5
{
  id v8;
  id v9;
  id v10;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact;
  v11 = -[BMEventBase init](&v13, sel_init);
  if (v11)
  {
    v11->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v8)
    {
      v11->_hasIsSignificant = 1;
      v11->_isSignificant = objc_msgSend(v8, "BOOLValue");
    }
    else
    {
      v11->_hasIsSignificant = 0;
      v11->_isSignificant = 0;
    }
    objc_storeStrong((id *)&v11->_handle, a4);
    if (v10)
    {
      v11->_hasIsMe = 1;
      v11->_isMe = objc_msgSend(v10, "BOOLValue");
    }
    else
    {
      v11->_hasIsMe = 0;
      v11->_isMe = 0;
    }
  }

  return v11;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact isSignificant](self, "isSignificant"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact isMe](self, "isMe"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact with isSignificant: %@, handle: %@, isMe: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *v5;
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
  unint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  NSString *handle;
  BOOL v37;
  uint64_t v38;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact;
  v5 = -[BMEventBase init](&v41, sel_init);
  if (!v5)
    goto LABEL_51;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (v4[*v8])
        goto LABEL_49;
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
        goto LABEL_49;
      v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
        break;
      if ((_DWORD)v20 != 2)
      {
        if ((_DWORD)v20 != 1)
        {
          if (!PBReaderSkipValueWithTag())
            goto LABEL_50;
          goto LABEL_48;
        }
        v21 = 0;
        v22 = 0;
        v23 = 0;
        v5->_hasIsSignificant = 1;
        while (1)
        {
          v24 = *v6;
          v25 = *(_QWORD *)&v4[v24];
          v26 = v25 + 1;
          if (v25 == -1 || v26 > *(_QWORD *)&v4[*v7])
            break;
          v27 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v25);
          *(_QWORD *)&v4[v24] = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0)
            goto LABEL_40;
          v21 += 7;
          v17 = v22++ >= 9;
          if (v17)
          {
            v23 = 0;
            goto LABEL_42;
          }
        }
        v4[*v8] = 1;
LABEL_40:
        if (v4[*v8])
          v23 = 0;
LABEL_42:
        v37 = v23 != 0;
        v38 = 16;
        goto LABEL_47;
      }
      PBReaderReadString();
      v35 = objc_claimAutoreleasedReturnValue();
      handle = v5->_handle;
      v5->_handle = (NSString *)v35;

LABEL_48:
      if (*(_QWORD *)&v4[*v6] >= *(_QWORD *)&v4[*v7])
        goto LABEL_49;
    }
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v5->_hasIsMe = 1;
    while (1)
    {
      v31 = *v6;
      v32 = *(_QWORD *)&v4[v31];
      v33 = v32 + 1;
      if (v32 == -1 || v33 > *(_QWORD *)&v4[*v7])
        break;
      v34 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v32);
      *(_QWORD *)&v4[v31] = v33;
      v30 |= (unint64_t)(v34 & 0x7F) << v28;
      if ((v34 & 0x80) == 0)
        goto LABEL_44;
      v28 += 7;
      v17 = v29++ >= 9;
      if (v17)
      {
        v30 = 0;
        goto LABEL_46;
      }
    }
    v4[*v8] = 1;
LABEL_44:
    if (v4[*v8])
      v30 = 0;
LABEL_46:
    v37 = v30 != 0;
    v38 = 18;
LABEL_47:
    *((_BYTE *)&v5->super.super.isa + v38) = v37;
    goto LABEL_48;
  }
LABEL_49:
  if (v4[*v8])
LABEL_50:
    v39 = 0;
  else
LABEL_51:
    v39 = v5;

  return v39;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasIsSignificant)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_handle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasIsMe)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *v13;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isSignificant"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("handle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v13 = 0;
          goto LABEL_12;
        }
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v18 = *MEMORY[0x1E0D025B8];
        v27 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("handle"));
        v28 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v18, 2, v11);
        v13 = 0;
        v10 = 0;
        *a4 = v19;
        goto LABEL_11;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isMe"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v22 = *MEMORY[0x1E0D025B8];
          v25 = *MEMORY[0x1E0CB2D50];
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isMe"));
          v26 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v22, 2, v21);

        }
        v12 = 0;
        v13 = 0;
        goto LABEL_11;
      }
      v12 = v11;
    }
    else
    {
      v12 = 0;
    }
    self = -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact initWithIsSignificant:handle:isMe:](self, "initWithIsSignificant:handle:isMe:", v8, v10, v12);
    v13 = self;
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v13 = 0;
    v8 = 0;
    goto LABEL_13;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v16 = *MEMORY[0x1E0D025B8];
  v29 = *MEMORY[0x1E0CB2D50];
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isSignificant"));
  v30[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v9);
  v13 = 0;
  v8 = 0;
  *a4 = v17;
LABEL_12:

LABEL_13:
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
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  if (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact hasIsSignificant](self, "hasIsSignificant"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact isSignificant](self, "isSignificant"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact hasIsMe](self, "hasIsMe"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact isMe](self, "isMe"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v11[0] = CFSTR("isSignificant");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("handle");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("isMe");
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v4)
      goto LABEL_15;
LABEL_18:

    if (v3)
      goto LABEL_16;
LABEL_19:

    goto LABEL_16;
  }

  if (!v4)
    goto LABEL_18;
LABEL_15:
  if (!v3)
    goto LABEL_19;
LABEL_16:

  return v9;
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
  _BOOL4 v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact hasIsSignificant](self, "hasIsSignificant")
      || objc_msgSend(v5, "hasIsSignificant"))
    {
      if (!-[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact hasIsSignificant](self, "hasIsSignificant"))
        goto LABEL_17;
      if (!objc_msgSend(v5, "hasIsSignificant"))
        goto LABEL_17;
      v6 = -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact isSignificant](self, "isSignificant");
      if (v6 != objc_msgSend(v5, "isSignificant"))
        goto LABEL_17;
    }
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact handle](self, "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact handle](self, "handle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_17;
    }
    if (!-[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact hasIsMe](self, "hasIsMe")
      && !objc_msgSend(v5, "hasIsMe"))
    {
      LOBYTE(v13) = 1;
      goto LABEL_18;
    }
    if (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact hasIsMe](self, "hasIsMe")
      && objc_msgSend(v5, "hasIsMe"))
    {
      v14 = -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact isMe](self, "isMe");
      v13 = v14 ^ objc_msgSend(v5, "isMe") ^ 1;
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:
    LOBYTE(v13) = 0;
    goto LABEL_18;
  }
  LOBYTE(v13) = 0;
LABEL_19:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isSignificant
{
  return self->_isSignificant;
}

- (BOOL)hasIsSignificant
{
  return self->_hasIsSignificant;
}

- (void)setHasIsSignificant:(BOOL)a3
{
  self->_hasIsSignificant = a3;
}

- (NSString)handle
{
  return self->_handle;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (BOOL)hasIsMe
{
  return self->_hasIsMe;
}

- (void)setHasIsMe:(BOOL)a3
{
  self->_hasIsMe = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
}

+ (unsigned)latestDataVersion
{
  return 4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 4)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact initByReadFrom:]([BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact alloc], "initByReadFrom:", v6);
    v7[5] = 4;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isSignificant"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("handle"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isMe"), 0, 0, 3, 12, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1FA50;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isSignificant"), 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("handle"), 2, 13, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isMe"), 3, 12, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
