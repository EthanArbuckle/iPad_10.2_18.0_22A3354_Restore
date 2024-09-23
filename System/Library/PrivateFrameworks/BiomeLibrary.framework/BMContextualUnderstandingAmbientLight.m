@implementation BMContextualUnderstandingAmbientLight

- (BMContextualUnderstandingAmbientLight)initWithAmbientLightColorComponent0:(id)a3 ambientLightColorComponent1:(id)a4 ambientLightColorComponent2:(id)a5
{
  id v8;
  id v9;
  id v10;
  BMContextualUnderstandingAmbientLight *v11;
  float v12;
  double v13;
  float v14;
  double v15;
  float v16;
  double v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BMContextualUnderstandingAmbientLight;
  v11 = -[BMEventBase init](&v19, sel_init);
  if (v11)
  {
    v11->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v8)
    {
      v11->_hasAmbientLightColorComponent0 = 1;
      objc_msgSend(v8, "floatValue");
      v13 = v12;
    }
    else
    {
      v11->_hasAmbientLightColorComponent0 = 0;
      v13 = -1.0;
    }
    v11->_ambientLightColorComponent0 = v13;
    if (v9)
    {
      v11->_hasAmbientLightColorComponent1 = 1;
      objc_msgSend(v9, "floatValue");
      v15 = v14;
    }
    else
    {
      v11->_hasAmbientLightColorComponent1 = 0;
      v15 = -1.0;
    }
    v11->_ambientLightColorComponent1 = v15;
    if (v10)
    {
      v11->_hasAmbientLightColorComponent2 = 1;
      objc_msgSend(v10, "floatValue");
      v17 = v16;
    }
    else
    {
      v11->_hasAmbientLightColorComponent2 = 0;
      v17 = -1.0;
    }
    v11->_ambientLightColorComponent2 = v17;
  }

  return v11;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMContextualUnderstandingAmbientLight writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasAmbientLightColorComponent0)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_hasAmbientLightColorComponent1)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_hasAmbientLightColorComponent2)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }

}

- (unsigned)dataVersion
{
  return self->_dataVersion;
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
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMContextualUnderstandingAmbientLight ambientLightColorComponent0](self, "ambientLightColorComponent0");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMContextualUnderstandingAmbientLight ambientLightColorComponent1](self, "ambientLightColorComponent1");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[BMContextualUnderstandingAmbientLight ambientLightColorComponent2](self, "ambientLightColorComponent2");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMContextualUnderstandingAmbientLight with ambientLightColorComponent0: %@, ambientLightColorComponent1: %@, ambientLightColorComponent2: %@"), v5, v7, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMContextualUnderstandingAmbientLight *v5;
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
  int v18;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  float v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  int *v28;
  BMContextualUnderstandingAmbientLight *v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMContextualUnderstandingAmbientLight;
  v5 = -[BMEventBase init](&v31, sel_init);
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
        if (v11++ >= 9)
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
        v5->_hasAmbientLightColorComponent2 = 1;
        v24 = *v6;
        v25 = *(_QWORD *)&v4[v24];
        if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(_QWORD *)&v4[*v7])
        {
          v23 = *(float *)(*(_QWORD *)&v4[*v9] + v25);
          *(_QWORD *)&v4[v24] = v25 + 4;
        }
        else
        {
          v4[*v8] = 1;
          v23 = 0.0;
        }
        v28 = &OBJC_IVAR___BMContextualUnderstandingAmbientLight__ambientLightColorComponent2;
      }
      else if ((_DWORD)v20 == 2)
      {
        v5->_hasAmbientLightColorComponent1 = 1;
        v26 = *v6;
        v27 = *(_QWORD *)&v4[v26];
        if (v27 <= 0xFFFFFFFFFFFFFFFBLL && v27 + 4 <= *(_QWORD *)&v4[*v7])
        {
          v23 = *(float *)(*(_QWORD *)&v4[*v9] + v27);
          *(_QWORD *)&v4[v26] = v27 + 4;
        }
        else
        {
          v4[*v8] = 1;
          v23 = 0.0;
        }
        v28 = &OBJC_IVAR___BMContextualUnderstandingAmbientLight__ambientLightColorComponent1;
      }
      else
      {
        if ((_DWORD)v20 != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_42;
          continue;
        }
        v5->_hasAmbientLightColorComponent0 = 1;
        v21 = *v6;
        v22 = *(_QWORD *)&v4[v21];
        if (v22 <= 0xFFFFFFFFFFFFFFFBLL && v22 + 4 <= *(_QWORD *)&v4[*v7])
        {
          v23 = *(float *)(*(_QWORD *)&v4[*v9] + v22);
          *(_QWORD *)&v4[v21] = v22 + 4;
        }
        else
        {
          v4[*v8] = 1;
          v23 = 0.0;
        }
        v28 = &OBJC_IVAR___BMContextualUnderstandingAmbientLight__ambientLightColorComponent0;
      }
      *(double *)((char *)&v5->super.super.isa + *v28) = v23;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_42:
    v29 = 0;
  else
LABEL_43:
    v29 = v5;

  return v29;
}

- (BMContextualUnderstandingAmbientLight)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  BMContextualUnderstandingAmbientLight *v13;
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ambientLightColorComponent0"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ambientLightColorComponent1"));
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
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("ambientLightColorComponent1"));
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ambientLightColorComponent2"));
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
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("ambientLightColorComponent2"));
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
    self = -[BMContextualUnderstandingAmbientLight initWithAmbientLightColorComponent0:ambientLightColorComponent1:ambientLightColorComponent2:](self, "initWithAmbientLightColorComponent0:ambientLightColorComponent1:ambientLightColorComponent2:", v8, v10, v12);
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
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("ambientLightColorComponent0"));
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
  double v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  if (!-[BMContextualUnderstandingAmbientLight hasAmbientLightColorComponent0](self, "hasAmbientLightColorComponent0")
    || (-[BMContextualUnderstandingAmbientLight ambientLightColorComponent0](self, "ambientLightColorComponent0"),
        fabs(v3) == INFINITY))
  {
    v5 = 0;
  }
  else
  {
    -[BMContextualUnderstandingAmbientLight ambientLightColorComponent0](self, "ambientLightColorComponent0");
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMContextualUnderstandingAmbientLight ambientLightColorComponent0](self, "ambientLightColorComponent0");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMContextualUnderstandingAmbientLight hasAmbientLightColorComponent1](self, "hasAmbientLightColorComponent1")
    || (-[BMContextualUnderstandingAmbientLight ambientLightColorComponent1](self, "ambientLightColorComponent1"),
        fabs(v6) == INFINITY))
  {
    v8 = 0;
  }
  else
  {
    -[BMContextualUnderstandingAmbientLight ambientLightColorComponent1](self, "ambientLightColorComponent1");
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMContextualUnderstandingAmbientLight ambientLightColorComponent1](self, "ambientLightColorComponent1");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMContextualUnderstandingAmbientLight hasAmbientLightColorComponent2](self, "hasAmbientLightColorComponent2")
    || (-[BMContextualUnderstandingAmbientLight ambientLightColorComponent2](self, "ambientLightColorComponent2"),
        fabs(v9) == INFINITY))
  {
    v11 = 0;
  }
  else
  {
    -[BMContextualUnderstandingAmbientLight ambientLightColorComponent2](self, "ambientLightColorComponent2");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[BMContextualUnderstandingAmbientLight ambientLightColorComponent2](self, "ambientLightColorComponent2");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = CFSTR("ambientLightColorComponent0");
  v12 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[0] = v12;
  v17[1] = CFSTR("ambientLightColorComponent1");
  v13 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = v13;
  v17[2] = CFSTR("ambientLightColorComponent2");
  v14 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v8)
      goto LABEL_21;
LABEL_24:

    if (v5)
      goto LABEL_22;
LABEL_25:

    goto LABEL_22;
  }

  if (!v8)
    goto LABEL_24;
LABEL_21:
  if (!v5)
    goto LABEL_25;
LABEL_22:

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMContextualUnderstandingAmbientLight hasAmbientLightColorComponent0](self, "hasAmbientLightColorComponent0")
      || objc_msgSend(v5, "hasAmbientLightColorComponent0"))
    {
      if (!-[BMContextualUnderstandingAmbientLight hasAmbientLightColorComponent0](self, "hasAmbientLightColorComponent0"))goto LABEL_18;
      if (!objc_msgSend(v5, "hasAmbientLightColorComponent0"))
        goto LABEL_18;
      -[BMContextualUnderstandingAmbientLight ambientLightColorComponent0](self, "ambientLightColorComponent0");
      v7 = v6;
      objc_msgSend(v5, "ambientLightColorComponent0");
      if (v7 != v8)
        goto LABEL_18;
    }
    if (-[BMContextualUnderstandingAmbientLight hasAmbientLightColorComponent1](self, "hasAmbientLightColorComponent1")
      || objc_msgSend(v5, "hasAmbientLightColorComponent1"))
    {
      if (!-[BMContextualUnderstandingAmbientLight hasAmbientLightColorComponent1](self, "hasAmbientLightColorComponent1"))goto LABEL_18;
      if (!objc_msgSend(v5, "hasAmbientLightColorComponent1"))
        goto LABEL_18;
      -[BMContextualUnderstandingAmbientLight ambientLightColorComponent1](self, "ambientLightColorComponent1");
      v10 = v9;
      objc_msgSend(v5, "ambientLightColorComponent1");
      if (v10 != v11)
        goto LABEL_18;
    }
    if (!-[BMContextualUnderstandingAmbientLight hasAmbientLightColorComponent2](self, "hasAmbientLightColorComponent2")&& !objc_msgSend(v5, "hasAmbientLightColorComponent2"))
    {
      v15 = 1;
      goto LABEL_19;
    }
    if (-[BMContextualUnderstandingAmbientLight hasAmbientLightColorComponent2](self, "hasAmbientLightColorComponent2")
      && objc_msgSend(v5, "hasAmbientLightColorComponent2"))
    {
      -[BMContextualUnderstandingAmbientLight ambientLightColorComponent2](self, "ambientLightColorComponent2");
      v13 = v12;
      objc_msgSend(v5, "ambientLightColorComponent2");
      v15 = v13 == v14;
    }
    else
    {
LABEL_18:
      v15 = 0;
    }
LABEL_19:

    goto LABEL_20;
  }
  v15 = 0;
LABEL_20:

  return v15;
}

- (double)ambientLightColorComponent0
{
  return self->_ambientLightColorComponent0;
}

- (BOOL)hasAmbientLightColorComponent0
{
  return self->_hasAmbientLightColorComponent0;
}

- (void)setHasAmbientLightColorComponent0:(BOOL)a3
{
  self->_hasAmbientLightColorComponent0 = a3;
}

- (double)ambientLightColorComponent1
{
  return self->_ambientLightColorComponent1;
}

- (BOOL)hasAmbientLightColorComponent1
{
  return self->_hasAmbientLightColorComponent1;
}

- (void)setHasAmbientLightColorComponent1:(BOOL)a3
{
  self->_hasAmbientLightColorComponent1 = a3;
}

- (double)ambientLightColorComponent2
{
  return self->_ambientLightColorComponent2;
}

- (BOOL)hasAmbientLightColorComponent2
{
  return self->_hasAmbientLightColorComponent2;
}

- (void)setHasAmbientLightColorComponent2:(BOOL)a3
{
  self->_hasAmbientLightColorComponent2 = a3;
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

    v4 = -[BMContextualUnderstandingAmbientLight initByReadFrom:]([BMContextualUnderstandingAmbientLight alloc], "initByReadFrom:", v7);
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
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("ambientLightColorComponent0"), 1, 0, 1, 1, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("ambientLightColorComponent1"), 1, 0, 2, 1, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("ambientLightColorComponent2"), 1, 0, 3, 1, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1AD40;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ambientLightColorComponent0"), 1, 1, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ambientLightColorComponent1"), 2, 1, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ambientLightColorComponent2"), 3, 1, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
