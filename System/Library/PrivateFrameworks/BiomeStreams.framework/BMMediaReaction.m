@implementation BMMediaReaction

- (BMMediaReaction)initWithAbsoluteTimestamp:(double)a3 mediaUUID:(id)a4 type:(int)a5
{
  id v9;
  BMMediaReaction *v10;
  BMMediaReaction *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BMMediaReaction;
  v10 = -[BMEventBase init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_hasAbsoluteTimestamp = 1;
    v10->_absoluteTimestamp = a3;
    objc_storeStrong((id *)&v10->_mediaUUID, a4);
    v11->_hasType = 1;
    v11->_type = a5;
  }

  return v11;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMediaReaction absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaReaction mediaUUID](self, "mediaUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BMMediaReaction type](self, "type");
  if (v7 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E2648D20[(int)v7];
  }
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMediaReaction with absoluteTimestamp: %@, mediaUUID: %@, type: %@"), v5, v6, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMediaReaction *v5;
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
  uint64_t v21;
  unint64_t v22;
  double v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  NSString *mediaUUID;
  BMMediaReaction *v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMMediaReaction;
  v5 = -[BMEventBase init](&v35, sel_init);
  if (!v5)
    goto LABEL_44;
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
      v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        v5->_hasType = 1;
        while (1)
        {
          v27 = *v6;
          v28 = *(_QWORD *)&v4[v27];
          v29 = v28 + 1;
          if (v28 == -1 || v29 > *(_QWORD *)&v4[*v7])
            break;
          v30 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v28);
          *(_QWORD *)&v4[v27] = v29;
          v26 |= (unint64_t)(v30 & 0x7F) << v24;
          if ((v30 & 0x80) == 0)
            goto LABEL_36;
          v24 += 7;
          v17 = v25++ >= 9;
          if (v17)
          {
            LODWORD(v26) = 0;
            goto LABEL_38;
          }
        }
        v4[*v8] = 1;
LABEL_36:
        if (v4[*v8])
          LODWORD(v26) = 0;
LABEL_38:
        v5->_type = v26;
      }
      else if ((_DWORD)v20 == 2)
      {
        PBReaderReadString();
        v31 = objc_claimAutoreleasedReturnValue();
        mediaUUID = v5->_mediaUUID;
        v5->_mediaUUID = (NSString *)v31;

      }
      else if ((_DWORD)v20 == 1)
      {
        v5->_hasAbsoluteTimestamp = 1;
        v21 = *v6;
        v22 = *(_QWORD *)&v4[v21];
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)&v4[*v7])
        {
          v23 = *(double *)(*(_QWORD *)&v4[*v9] + v22);
          *(_QWORD *)&v4[v21] = v22 + 8;
        }
        else
        {
          v4[*v8] = 1;
          v23 = 0.0;
        }
        v5->_absoluteTimestamp = v23;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_43;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_43:
    v33 = 0;
  else
LABEL_44:
    v33 = v5;

  return v33;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasAbsoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_mediaUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasType)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v4;
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

    v4 = -[BMMediaReaction initByReadFrom:]([BMMediaReaction alloc], "initByReadFrom:", v7);
  }
  return v4;
}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMediaReaction writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  int v16;
  BOOL v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMMediaReaction hasAbsoluteTimestamp](self, "hasAbsoluteTimestamp")
      || objc_msgSend(v5, "hasAbsoluteTimestamp"))
    {
      if (-[BMMediaReaction hasAbsoluteTimestamp](self, "hasAbsoluteTimestamp")
        && objc_msgSend(v5, "hasAbsoluteTimestamp"))
      {
        -[BMMediaReaction absoluteTimestamp](self, "absoluteTimestamp");
        v7 = v6;
        objc_msgSend(v5, "absoluteTimestamp");
        v9 = v7 == v8;
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v9 = 1;
    }
    -[BMMediaReaction mediaUUID](self, "mediaUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == v12)
    {
      v15 = 1;
    }
    else
    {
      -[BMMediaReaction mediaUUID](self, "mediaUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mediaUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

    }
    if (-[BMMediaReaction hasType](self, "hasType") || objc_msgSend(v5, "hasType"))
    {
      if (-[BMMediaReaction hasType](self, "hasType") && objc_msgSend(v5, "hasType"))
      {
        v16 = -[BMMediaReaction type](self, "type");
        v17 = v16 == objc_msgSend(v5, "type");
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      v17 = 1;
    }
    v10 = v9 & v15 & v17;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasAbsoluteTimestamp
{
  return self->_hasAbsoluteTimestamp;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  self->_hasAbsoluteTimestamp = a3;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)mediaUUID
{
  return self->_mediaUUID;
}

- (BOOL)hasType
{
  return self->_hasType;
}

- (void)setHasType:(BOOL)a3
{
  self->_hasType = a3;
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaUUID, 0);
}

@end
