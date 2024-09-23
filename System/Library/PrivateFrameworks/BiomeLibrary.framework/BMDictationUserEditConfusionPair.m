@implementation BMDictationUserEditConfusionPair

- (BMDictationUserEditConfusionPair)initWithIndex:(id)a3 recognizedTokens:(id)a4 correctedTokens:(id)a5
{
  id v8;
  id v9;
  id v10;
  BMDictationUserEditConfusionPair *v11;
  unsigned int v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMDictationUserEditConfusionPair;
  v11 = -[BMEventBase init](&v14, sel_init);
  if (v11)
  {
    v11->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v8)
    {
      v11->_hasIndex = 1;
      v12 = objc_msgSend(v8, "unsignedIntValue");
    }
    else
    {
      v12 = 0;
      v11->_hasIndex = 0;
    }
    v11->_index = v12;
    objc_storeStrong((id *)&v11->_recognizedTokens, a4);
    objc_storeStrong((id *)&v11->_correctedTokens, a5);
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDictationUserEditConfusionPair index](self, "index"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDictationUserEditConfusionPair recognizedTokens](self, "recognizedTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDictationUserEditConfusionPair correctedTokens](self, "correctedTokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMDictationUserEditConfusionPair with index: %@, recognizedTokens: %@, correctedTokens: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDictationUserEditConfusionPair *v5;
  void *v6;
  void *v7;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  char v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  int v19;
  unint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSArray *recognizedTokens;
  uint64_t v34;
  NSArray *correctedTokens;
  int v36;
  BMDictationUserEditConfusionPair *v37;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)BMDictationUserEditConfusionPair;
  v5 = -[BMEventBase init](&v39, sel_init);
  if (!v5)
    goto LABEL_43;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (int *)MEMORY[0x1E0D82BF0];
  v9 = (int *)MEMORY[0x1E0D82BD8];
  v10 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v11 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (v4[*v10])
        goto LABEL_41;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      while (1)
      {
        v15 = *v8;
        v16 = *(_QWORD *)&v4[v15];
        if (v16 == -1 || v16 >= *(_QWORD *)&v4[*v9])
          break;
        v17 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v16);
        *(_QWORD *)&v4[v15] = v16 + 1;
        v14 |= (unint64_t)(v17 & 0x7F) << v12;
        if ((v17 & 0x80) == 0)
          goto LABEL_13;
        v12 += 7;
        v18 = v13++ >= 9;
        if (v18)
        {
          v14 = 0;
          v19 = v4[*v10];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      v19 = v4[*v10];
      if (v4[*v10])
        v14 = 0;
LABEL_15:
      if (v19 || (v14 & 7) == 4)
        goto LABEL_41;
      v21 = v14 >> 3;
      if ((v14 >> 3) == 3)
        break;
      if ((_DWORD)v21 == 2)
      {
        PBReaderReadString();
        v31 = objc_claimAutoreleasedReturnValue();
        if (!v31)
          goto LABEL_45;
        v29 = (void *)v31;
        v30 = v6;
        goto LABEL_33;
      }
      if ((_DWORD)v21 == 1)
      {
        v22 = 0;
        v23 = 0;
        v24 = 0;
        v5->_hasIndex = 1;
        while (1)
        {
          v25 = *v8;
          v26 = *(_QWORD *)&v4[v25];
          if (v26 == -1 || v26 >= *(_QWORD *)&v4[*v9])
            break;
          v27 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v26);
          *(_QWORD *)&v4[v25] = v26 + 1;
          v24 |= (unint64_t)(v27 & 0x7F) << v22;
          if ((v27 & 0x80) == 0)
            goto LABEL_37;
          v22 += 7;
          v18 = v23++ >= 9;
          if (v18)
          {
            LODWORD(v24) = 0;
            goto LABEL_39;
          }
        }
        v4[*v10] = 1;
LABEL_37:
        if (v4[*v10])
          LODWORD(v24) = 0;
LABEL_39:
        v5->_index = v24;
      }
      else if (!PBReaderSkipValueWithTag())
      {
LABEL_45:

        goto LABEL_42;
      }
LABEL_40:
      if (*(_QWORD *)&v4[*v8] >= *(_QWORD *)&v4[*v9])
        goto LABEL_41;
    }
    PBReaderReadString();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
      goto LABEL_45;
    v29 = (void *)v28;
    v30 = v7;
LABEL_33:
    objc_msgSend(v30, "addObject:", v29);

    goto LABEL_40;
  }
LABEL_41:
  v32 = objc_msgSend(v6, "copy");
  recognizedTokens = v5->_recognizedTokens;
  v5->_recognizedTokens = (NSArray *)v32;

  v34 = objc_msgSend(v7, "copy");
  correctedTokens = v5->_correctedTokens;
  v5->_correctedTokens = (NSArray *)v34;

  v36 = v4[*v10];
  if (v36)
LABEL_42:
    v37 = 0;
  else
LABEL_43:
    v37 = v5;

  return v37;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_hasIndex)
    PBDataWriterWriteUint32Field();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_recognizedTokens;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_correctedTokens;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMDictationUserEditConfusionPair writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDictationUserEditConfusionPair)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  void *v18;
  int v19;
  id *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  BMDictationUserEditConfusionPair *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void **v43;
  uint64_t *v44;
  void *v45;
  id v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  BMDictationUserEditConfusionPair *v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  _BYTE v67[128];
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;
  void *v76;
  uint64_t v77;
  _QWORD v78[3];

  v78[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("index"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = *MEMORY[0x1E0D025B8];
        v77 = *MEMORY[0x1E0CB2D50];
        v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("index"));
        v78[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, &v77, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 0;
        v29 = 0;
        *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2, v11);
        goto LABEL_54;
      }
      v7 = 0;
      v29 = 0;
      goto LABEL_56;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("recognizedTokens"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  v52 = v6;
  v53 = self;
  if (v10)
  {
    v50 = v7;

    v8 = 0;
  }
  else
  {
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v38 = *MEMORY[0x1E0D025B8];
          v75 = *MEMORY[0x1E0CB2D50];
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("recognizedTokens"));
          v76 = v11;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          v29 = 0;
          *a4 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 2, v17);
          goto LABEL_53;
        }
        v29 = 0;
        goto LABEL_55;
      }
    }
    v50 = v7;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v8 = v8;
  v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
  v51 = v5;
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v60 != v14)
          objc_enumerationMutation(v8);
        v16 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = a4;
          if (a4)
          {
            v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v22 = *MEMORY[0x1E0D025B8];
            v72 = *MEMORY[0x1E0CB2D50];
            v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("recognizedTokens"));
            v73 = v23;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v21;
            v26 = v22;
            goto LABEL_26;
          }
LABEL_27:
          v29 = 0;
          v17 = v8;
          v7 = v50;
          v5 = v51;
          goto LABEL_53;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v20 = a4;
          if (!a4)
            goto LABEL_27;
          v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v28 = *MEMORY[0x1E0D025B8];
          v70 = *MEMORY[0x1E0CB2D50];
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("recognizedTokens"));
          v71 = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v27;
          v26 = v28;
LABEL_26:
          v5 = v51;
          *v20 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v24);

          v29 = 0;
          v17 = v8;
LABEL_51:
          v7 = v50;
          goto LABEL_52;
        }
        objc_msgSend(v11, "addObject:", v16);
      }
      v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
      v5 = v51;
    }
    while (v13);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("correctedTokens"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqual:", v18);

  if (v19)
  {

    v17 = 0;
  }
  else if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v29 = 0;
        v7 = v50;
        goto LABEL_53;
      }
      v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v48 = *MEMORY[0x1E0D025B8];
      v68 = *MEMORY[0x1E0CB2D50];
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("correctedTokens"));
      v69 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v48, 2, v49);

LABEL_50:
      v29 = 0;
      goto LABEL_51;
    }
  }
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v17 = v17;
  v32 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
  if (!v32)
    goto LABEL_41;
  v33 = v32;
  v34 = *(_QWORD *)v56;
  while (2)
  {
    for (j = 0; j != v33; ++j)
    {
      if (*(_QWORD *)v56 != v34)
        objc_enumerationMutation(v17);
      v36 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v51;
        if (a4)
        {
          v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v40 = *MEMORY[0x1E0D025B8];
          v65 = *MEMORY[0x1E0CB2D50];
          v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("correctedTokens"));
          v66 = v41;
          v42 = (void *)MEMORY[0x1E0C99D80];
          v43 = &v66;
          v44 = &v65;
LABEL_48:
          objc_msgSend(v42, "dictionaryWithObjects:forKeys:count:", v43, v44, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v40, 2, v45);

        }
LABEL_49:

        goto LABEL_50;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v5 = v51;
        if (a4)
        {
          v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v40 = *MEMORY[0x1E0D025B8];
          v63 = *MEMORY[0x1E0CB2D50];
          v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("correctedTokens"));
          v64 = v41;
          v42 = (void *)MEMORY[0x1E0C99D80];
          v43 = &v64;
          v44 = &v63;
          goto LABEL_48;
        }
        goto LABEL_49;
      }
      objc_msgSend(v23, "addObject:", v36);
    }
    v33 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
    if (v33)
      continue;
    break;
  }
LABEL_41:

  v7 = v50;
  v29 = -[BMDictationUserEditConfusionPair initWithIndex:recognizedTokens:correctedTokens:](v53, "initWithIndex:recognizedTokens:correctedTokens:", v50, v11, v23);
  v53 = v29;
  v5 = v51;
LABEL_52:

LABEL_53:
  v6 = v52;
  self = v53;
LABEL_54:

LABEL_55:
LABEL_56:

  return v29;
}

- (id)_recognizedTokensJSONArray
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
  -[BMDictationUserEditConfusionPair recognizedTokens](self, "recognizedTokens", 0);
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

- (id)_correctedTokensJSONArray
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
  -[BMDictationUserEditConfusionPair correctedTokens](self, "correctedTokens", 0);
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
  if (-[BMDictationUserEditConfusionPair hasIndex](self, "hasIndex"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDictationUserEditConfusionPair index](self, "index"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMDictationUserEditConfusionPair _recognizedTokensJSONArray](self, "_recognizedTokensJSONArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDictationUserEditConfusionPair _correctedTokensJSONArray](self, "_correctedTokensJSONArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("index");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("recognizedTokens");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("correctedTokens");
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
      goto LABEL_12;
LABEL_15:

    if (v3)
      goto LABEL_13;
LABEL_16:

    goto LABEL_13;
  }

  if (!v4)
    goto LABEL_15;
LABEL_12:
  if (!v3)
    goto LABEL_16;
LABEL_13:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMDictationUserEditConfusionPair hasIndex](self, "hasIndex") || objc_msgSend(v5, "hasIndex"))
    {
      if (!-[BMDictationUserEditConfusionPair hasIndex](self, "hasIndex"))
        goto LABEL_9;
      if (!objc_msgSend(v5, "hasIndex"))
        goto LABEL_9;
      v6 = -[BMDictationUserEditConfusionPair index](self, "index");
      if (v6 != objc_msgSend(v5, "index"))
        goto LABEL_9;
    }
    -[BMDictationUserEditConfusionPair recognizedTokens](self, "recognizedTokens");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recognizedTokens");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMDictationUserEditConfusionPair recognizedTokens](self, "recognizedTokens");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recognizedTokens");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
      {
LABEL_9:
        v13 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    -[BMDictationUserEditConfusionPair correctedTokens](self, "correctedTokens");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "correctedTokens");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 == v15)
    {
      v13 = 1;
    }
    else
    {
      -[BMDictationUserEditConfusionPair correctedTokens](self, "correctedTokens");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "correctedTokens");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v16, "isEqual:", v17);

    }
    goto LABEL_16;
  }
  v13 = 0;
LABEL_17:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (unsigned)index
{
  return self->_index;
}

- (BOOL)hasIndex
{
  return self->_hasIndex;
}

- (void)setHasIndex:(BOOL)a3
{
  self->_hasIndex = a3;
}

- (NSArray)recognizedTokens
{
  return self->_recognizedTokens;
}

- (NSArray)correctedTokens
{
  return self->_correctedTokens;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctedTokens, 0);
  objc_storeStrong((id *)&self->_recognizedTokens, 0);
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

    v4 = -[BMDictationUserEditConfusionPair initByReadFrom:]([BMDictationUserEditConfusionPair alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("index"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("recognizedTokens_json"), 5, 1, &__block_literal_global_156);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("correctedTokens_json"), 5, 1, &__block_literal_global_157_72085);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1FA20;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("index"), 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("recognizedTokens"), 2, 13, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("correctedTokens"), 3, 13, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __43__BMDictationUserEditConfusionPair_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_correctedTokensJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __43__BMDictationUserEditConfusionPair_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_recognizedTokensJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
