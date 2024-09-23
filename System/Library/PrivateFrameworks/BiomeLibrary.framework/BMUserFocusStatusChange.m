@implementation BMUserFocusStatusChange

- (BMUserFocusStatusChange)initWithIdsHandle:(id)a3 statusChangeType:(id)a4 idsHandles:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMUserFocusStatusChange *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMUserFocusStatusChange;
  v12 = -[BMEventBase init](&v14, sel_init);
  if (v12)
  {
    v12->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v12->_idsHandle, a3);
    objc_storeStrong((id *)&v12->_statusChangeType, a4);
    objc_storeStrong((id *)&v12->_idsHandles, a5);
  }

  return v12;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMUserFocusStatusChange idsHandle](self, "idsHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUserFocusStatusChange statusChangeType](self, "statusChangeType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUserFocusStatusChange idsHandles](self, "idsHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMUserFocusStatusChange with idsHandle: %@, statusChangeType: %@, idsHandles: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMUserFocusStatusChange *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  int v18;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSArray *idsHandles;
  int v27;
  BMUserFocusStatusChange *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BMUserFocusStatusChange;
  v5 = -[BMEventBase init](&v30, sel_init);
  if (!v5)
    goto LABEL_32;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (v4[*v9])
        goto LABEL_30;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = *v7;
        v15 = *(_QWORD *)&v4[v14];
        if (v15 == -1 || v15 >= *(_QWORD *)&v4[*v8])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v15 + 1;
        v13 |= (unint64_t)(v16 & 0x7F) << v11;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v11 += 7;
        if (v12++ >= 9)
        {
          v13 = 0;
          v18 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v18 = v4[*v9];
      if (v4[*v9])
        v13 = 0;
LABEL_15:
      if (v18 || (v13 & 7) == 4)
        goto LABEL_30;
      v20 = v13 >> 3;
      if ((v13 >> 3) == 3)
        break;
      if ((_DWORD)v20 == 2)
      {
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 32;
LABEL_26:
        v24 = *(Class *)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;
LABEL_27:

        goto LABEL_29;
      }
      if ((_DWORD)v20 == 1)
      {
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 24;
        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
LABEL_34:

        goto LABEL_31;
      }
LABEL_29:
      if (*(_QWORD *)&v4[*v7] >= *(_QWORD *)&v4[*v8])
        goto LABEL_30;
    }
    PBReaderReadString();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_34;
    v24 = (void *)v23;
    objc_msgSend(v6, "addObject:", v23);
    goto LABEL_27;
  }
LABEL_30:
  v25 = objc_msgSend(v6, "copy");
  idsHandles = v5->_idsHandles;
  v5->_idsHandles = (NSArray *)v25;

  v27 = v4[*v9];
  if (v27)
LABEL_31:
    v28 = 0;
  else
LABEL_32:
    v28 = v5;

  return v28;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_idsHandle)
    PBDataWriterWriteStringField();
  if (self->_statusChangeType)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_idsHandles;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMUserFocusStatusChange writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMUserFocusStatusChange)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void **v26;
  uint64_t *v27;
  void *v28;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  id *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  id *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  BMUserFocusStatusChange *v45;
  id v46;
  id v47;
  id *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;
  void *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("idsHandle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!p_isa)
      {
        v8 = 0;
        goto LABEL_36;
      }
      v30 = v7;
      v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v32 = *MEMORY[0x1E0D025B8];
      v63 = *MEMORY[0x1E0CB2D50];
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("idsHandle"));
      v64[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v31;
      v7 = v30;
      v34 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v32, 2, v9);
      v8 = 0;
      v35 = p_isa;
      p_isa = 0;
      *v35 = v34;
      goto LABEL_35;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("statusChangeType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = p_isa;
  v49 = v7;
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v47 = v8;
    v10 = 0;
LABEL_7:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("idsHandles"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (v13)
    {
      v44 = v9;
      v45 = self;

      v11 = 0;
LABEL_12:
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v11 = v11;
      v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      if (!v15)
        goto LABEL_21;
      v16 = v15;
      v17 = *(_QWORD *)v51;
LABEL_14:
      v18 = v6;
      v19 = v10;
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v51 != v17)
          objc_enumerationMutation(v11);
        v21 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v20);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v10 = v19;
          v6 = v18;
          v9 = v44;
          if (v48)
          {
            v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v23 = *MEMORY[0x1E0D025B8];
            v54 = *MEMORY[0x1E0CB2D50];
            v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("idsHandles"));
            v55 = v24;
            v25 = (void *)MEMORY[0x1E0C99D80];
            v26 = &v55;
            v27 = &v54;
LABEL_30:
            objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *v48 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 2, v28);

          }
          goto LABEL_31;
        }
        objc_msgSend(v14, "addObject:", v21);
        if (v16 == ++v20)
        {
          v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
          v10 = v19;
          v6 = v18;
          if (v16)
            goto LABEL_14;
LABEL_21:

          v8 = v47;
          self = -[BMUserFocusStatusChange initWithIdsHandle:statusChangeType:idsHandles:](v45, "initWithIdsHandle:statusChangeType:idsHandles:", v47, v10, v14);
          p_isa = (id *)&self->super.super.isa;
          v9 = v44;
LABEL_33:

          goto LABEL_34;
        }
      }
      v10 = v19;
      v6 = v18;
      v9 = v44;
      if (v48)
      {
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = *MEMORY[0x1E0D025B8];
        v56 = *MEMORY[0x1E0CB2D50];
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("idsHandles"));
        v57 = v24;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = &v57;
        v27 = &v56;
        goto LABEL_30;
      }
LABEL_31:

      p_isa = 0;
      self = v45;
      goto LABEL_32;
    }
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v44 = v9;
      v45 = self;
      goto LABEL_12;
    }
    if (p_isa)
    {
      v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v41 = p_isa;
      v42 = *MEMORY[0x1E0D025B8];
      v59 = *MEMORY[0x1E0CB2D50];
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("idsHandles"));
      v60 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *v41 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v42, 2, v43);

      p_isa = 0;
LABEL_32:
      v8 = v47;
      goto LABEL_33;
    }
    v8 = v47;
LABEL_34:

    v7 = v49;
    goto LABEL_35;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v47 = v8;
    v10 = v9;
    goto LABEL_7;
  }
  if (p_isa)
  {
    v36 = v8;
    v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v38 = *MEMORY[0x1E0D025B8];
    v61 = *MEMORY[0x1E0CB2D50];
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("statusChangeType"));
    v62 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v37;
    v8 = v36;
    v40 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v38, 2, v14);
    v10 = 0;
    p_isa = 0;
    *v48 = v40;
    goto LABEL_33;
  }
  v10 = 0;
LABEL_35:

LABEL_36:
  return (BMUserFocusStatusChange *)p_isa;
}

- (id)_idsHandlesJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BMUserFocusStatusChange idsHandles](self, "idsHandles", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
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
  -[BMUserFocusStatusChange idsHandle](self, "idsHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUserFocusStatusChange statusChangeType](self, "statusChangeType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUserFocusStatusChange _idsHandlesJSONArray](self, "_idsHandlesJSONArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("idsHandle");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("statusChangeType");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("idsHandles");
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
      goto LABEL_9;
LABEL_12:

    if (v3)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!v4)
    goto LABEL_12;
LABEL_9:
  if (!v3)
    goto LABEL_13;
LABEL_10:

  return v9;
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
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMUserFocusStatusChange idsHandle](self, "idsHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "idsHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMUserFocusStatusChange idsHandle](self, "idsHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "idsHandle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_9;
    }
    -[BMUserFocusStatusChange statusChangeType](self, "statusChangeType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusChangeType");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMUserFocusStatusChange statusChangeType](self, "statusChangeType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "statusChangeType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
      {
LABEL_9:
        v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    -[BMUserFocusStatusChange idsHandles](self, "idsHandles");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "idsHandles");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 == v20)
    {
      v12 = 1;
    }
    else
    {
      -[BMUserFocusStatusChange idsHandles](self, "idsHandles");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "idsHandles");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v21, "isEqual:", v22);

    }
    goto LABEL_15;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)idsHandle
{
  return self->_idsHandle;
}

- (NSString)statusChangeType
{
  return self->_statusChangeType;
}

- (NSArray)idsHandles
{
  return self->_idsHandles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsHandles, 0);
  objc_storeStrong((id *)&self->_statusChangeType, 0);
  objc_storeStrong((id *)&self->_idsHandle, 0);
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

    v4 = -[BMUserFocusStatusChange initByReadFrom:]([BMUserFocusStatusChange alloc], "initByReadFrom:", v7);
    v4[4] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("idsHandle"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("statusChangeType"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("idsHandles_json"), 5, 1, &__block_literal_global_55346);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1E250;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("idsHandle"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("statusChangeType"), 2, 13, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("idsHandles"), 3, 13, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __34__BMUserFocusStatusChange_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_idsHandlesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
