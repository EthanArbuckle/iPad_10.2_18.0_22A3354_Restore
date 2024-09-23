@implementation BMSiriRemembersFieldFieldValue

- (BMSiriRemembersFieldFieldValue)initWithValueSequence:(id)a3 valueDictionary:(id)a4 value:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMSiriRemembersFieldFieldValue *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMSiriRemembersFieldFieldValue;
  v12 = -[BMEventBase init](&v14, sel_init);
  if (v12)
  {
    v12->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v12->_valueSequence, a3);
    objc_storeStrong((id *)&v12->_valueDictionary, a4);
    objc_storeStrong((id *)&v12->_value, a5);
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
  -[BMSiriRemembersFieldFieldValue valueSequence](self, "valueSequence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersFieldFieldValue valueDictionary](self, "valueDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersFieldFieldValue value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriRemembersFieldFieldValue with valueSequence: %@, valueDictionary: %@, value: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriRemembersFieldFieldValue *v5;
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
  uint64_t v16;
  unint64_t v17;
  char v18;
  int v20;
  unint64_t v22;
  id v23;
  void *v24;
  void *v25;
  BMSiriRemembersFieldFieldValueBasicValue *v26;
  BMSiriRemembersFieldFieldValueBasicValue *value;
  id v28;
  uint64_t v29;
  NSArray *valueSequence;
  uint64_t v31;
  NSArray *valueDictionary;
  int v33;
  BMSiriRemembersFieldFieldValue *v34;
  objc_super v36;
  uint64_t v37;
  uint64_t v38;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMSiriRemembersFieldFieldValue;
  v5 = -[BMEventBase init](&v36, sel_init);
  if (!v5)
    goto LABEL_35;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (int *)MEMORY[0x1E0D82BF0];
  v9 = (int *)MEMORY[0x1E0D82BD8];
  v10 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v11 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v10])
        break;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      while (1)
      {
        v15 = *v8;
        v16 = *(_QWORD *)&v4[v15];
        v17 = v16 + 1;
        if (v16 == -1 || v17 > *(_QWORD *)&v4[*v9])
          break;
        v18 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v16);
        *(_QWORD *)&v4[v15] = v17;
        v14 |= (unint64_t)(v18 & 0x7F) << v12;
        if ((v18 & 0x80) == 0)
          goto LABEL_13;
        v12 += 7;
        if (v13++ >= 9)
        {
          v14 = 0;
          v20 = v4[*v10];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      v20 = v4[*v10];
      if (v4[*v10])
        v14 = 0;
LABEL_15:
      if (v20 || (v14 & 7) == 4)
        break;
      v22 = v14 >> 3;
      if ((v14 >> 3) == 3)
      {
        v37 = 0;
        v38 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (v26 = -[BMSiriRemembersFieldFieldValueBasicValue initByReadFrom:]([BMSiriRemembersFieldFieldValueBasicValue alloc], "initByReadFrom:", v4)) == 0)
        {
LABEL_36:

          goto LABEL_37;
        }
        value = v5->_value;
        v5->_value = v26;

        PBReaderRecallMark();
      }
      else
      {
        if ((_DWORD)v22 == 2)
        {
          v37 = 0;
          v38 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_36;
          v28 = -[BMSiriRemembersFieldFieldValueNamedValue initByReadFrom:]([BMSiriRemembersFieldFieldValueNamedValue alloc], "initByReadFrom:", v4);
          if (!v28)
            goto LABEL_36;
          v24 = v28;
          v25 = v7;
          goto LABEL_31;
        }
        if ((_DWORD)v22 == 1)
        {
          v37 = 0;
          v38 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_36;
          v23 = -[BMSiriRemembersFieldFieldValueBasicValue initByReadFrom:]([BMSiriRemembersFieldFieldValueBasicValue alloc], "initByReadFrom:", v4);
          if (!v23)
            goto LABEL_36;
          v24 = v23;
          v25 = v6;
LABEL_31:
          objc_msgSend(v25, "addObject:", v24);
          PBReaderRecallMark();

          continue;
        }
        if (!PBReaderSkipValueWithTag())
          goto LABEL_36;
      }
    }
    while (*(_QWORD *)&v4[*v8] < *(_QWORD *)&v4[*v9]);
  }
  v29 = objc_msgSend(v6, "copy");
  valueSequence = v5->_valueSequence;
  v5->_valueSequence = (NSArray *)v29;

  v31 = objc_msgSend(v7, "copy");
  valueDictionary = v5->_valueDictionary;
  v5->_valueDictionary = (NSArray *)v31;

  v33 = v4[*v10];
  if (v33)
LABEL_37:
    v34 = 0;
  else
LABEL_35:
    v34 = v5;

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_valueSequence;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
        v21 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_valueDictionary;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        v21 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v16, "writeTo:", v4, (_QWORD)v17);
        PBDataWriterRecallMark();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
    }
    while (v13);
  }

  if (self->_value)
  {
    v21 = 0;
    PBDataWriterPlaceMark();
    -[BMSiriRemembersFieldFieldValueBasicValue writeTo:](self->_value, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriRemembersFieldFieldValue writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriRemembersFieldFieldValue)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  BMSiriRemembersFieldFieldValueBasicValue *v15;
  BMSiriRemembersFieldFieldValueBasicValue *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  id *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id *v25;
  uint64_t *v26;
  void *v27;
  BMSiriRemembersFieldFieldValue *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  BMSiriRemembersFieldFieldValueBasicValue *v35;
  BMSiriRemembersFieldFieldValueNamedValue *v36;
  BMSiriRemembersFieldFieldValueNamedValue *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id *v42;
  id v43;
  uint64_t v44;
  void *v45;
  BMSiriRemembersFieldFieldValueBasicValue **v46;
  uint64_t *v47;
  void *v48;
  void *v49;
  id v51;
  uint64_t v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  id obj;
  BMSiriRemembersFieldFieldValue *v60;
  void *v62;
  void *v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  BMSiriRemembersFieldFieldValueBasicValue *v76;
  uint64_t v77;
  BMSiriRemembersFieldFieldValueBasicValue *v78;
  uint64_t v79;
  BMSiriRemembersFieldFieldValueBasicValue *v80;
  _BYTE v81[128];
  uint64_t v82;
  id v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  id v87;
  _BYTE v88[128];
  uint64_t v89;
  _QWORD v90[3];

  v90[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("valueSequence"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  v62 = v5;
  if (v8)
  {
    v60 = self;

    v6 = 0;
  }
  else
  {
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v28 = 0;
          goto LABEL_60;
        }
        v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v40 = *MEMORY[0x1E0D025B8];
        v89 = *MEMORY[0x1E0CB2D50];
        v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("valueSequence"));
        v90[0] = v63;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, &v89, 1);
        v41 = objc_claimAutoreleasedReturnValue();
        v28 = 0;
        *a4 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v40, 2, v41);
LABEL_45:
        v29 = (void *)v41;
        goto LABEL_59;
      }
    }
    v60 = self;
  }
  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v6 = v6;
  v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
  if (!v9)
    goto LABEL_16;
  v10 = v9;
  v11 = *(_QWORD *)v72;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v72 != v11)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = a4;
        if (a4)
        {
          v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v23 = *MEMORY[0x1E0D025B8];
          v86 = *MEMORY[0x1E0CB2D50];
          v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("valueSequence"));
          v87 = v14;
          v24 = (void *)MEMORY[0x1E0C99D80];
          v25 = &v87;
          v26 = &v86;
          goto LABEL_22;
        }
LABEL_46:
        v28 = 0;
        v29 = v6;
        self = v60;
        v5 = v62;
        goto LABEL_59;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v21 = a4;
        if (!a4)
          goto LABEL_46;
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = *MEMORY[0x1E0D025B8];
        v84 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("valueSequence"));
        v85 = v14;
        v24 = (void *)MEMORY[0x1E0C99D80];
        v25 = &v85;
        v26 = &v84;
LABEL_22:
        objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", v25, v26, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        *v21 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 2, v27);
        v29 = v6;
LABEL_23:
        self = v60;
        v5 = v62;
        goto LABEL_58;
      }
      v14 = v13;
      v15 = [BMSiriRemembersFieldFieldValueBasicValue alloc];
      v70 = 0;
      v16 = -[BMSiriRemembersFieldFieldValueBasicValue initWithJSONDictionary:error:](v15, "initWithJSONDictionary:error:", v14, &v70);
      v17 = v70;
      if (v17)
      {
        v27 = v17;
        v5 = v62;
        if (a4)
          *a4 = objc_retainAutorelease(v17);

        v28 = 0;
        v29 = v6;
        self = v60;
        goto LABEL_58;
      }
      objc_msgSend(v63, "addObject:", v16);

    }
    v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
  }
  while (v10);
LABEL_16:

  v5 = v62;
  objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("valueDictionary"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqual:", v19);

  if (v20)
  {

    v18 = 0;
    goto LABEL_29;
  }
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v41 = (uint64_t)v18;
      self = v60;
      if (a4)
      {
        v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v52 = *MEMORY[0x1E0D025B8];
        v82 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("valueDictionary"));
        v83 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        *a4 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v52, 2, v27);
        v29 = (void *)v41;
        goto LABEL_58;
      }
      v28 = 0;
      goto LABEL_45;
    }
  }
LABEL_29:
  v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v18, "count"));
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v18;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
  if (!v30)
    goto LABEL_39;
  v31 = v30;
  v32 = *(_QWORD *)v67;
  while (2)
  {
    v33 = 0;
    while (2)
    {
      if (*(_QWORD *)v67 != v32)
        objc_enumerationMutation(obj);
      v34 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v33);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = a4;
        if (a4)
        {
          v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v44 = *MEMORY[0x1E0D025B8];
          v79 = *MEMORY[0x1E0CB2D50];
          v35 = (BMSiriRemembersFieldFieldValueBasicValue *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("valueDictionary"));
          v80 = v35;
          v45 = (void *)MEMORY[0x1E0C99D80];
          v46 = &v80;
          v47 = &v79;
LABEL_52:
          objc_msgSend(v45, "dictionaryWithObjects:forKeys:count:", v46, v47, 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *v42 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v48);

LABEL_56:
          v28 = 0;
          v29 = obj;
          self = v60;
          v27 = obj;
          v5 = v62;
          goto LABEL_57;
        }
LABEL_63:
        v28 = 0;
        v29 = obj;
        v27 = obj;
        goto LABEL_23;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v42 = a4;
        if (a4)
        {
          v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v44 = *MEMORY[0x1E0D025B8];
          v77 = *MEMORY[0x1E0CB2D50];
          v35 = (BMSiriRemembersFieldFieldValueBasicValue *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("valueDictionary"));
          v78 = v35;
          v45 = (void *)MEMORY[0x1E0C99D80];
          v46 = &v78;
          v47 = &v77;
          goto LABEL_52;
        }
        goto LABEL_63;
      }
      v35 = v34;
      v36 = [BMSiriRemembersFieldFieldValueNamedValue alloc];
      v65 = 0;
      v37 = -[BMSiriRemembersFieldFieldValueNamedValue initWithJSONDictionary:error:](v36, "initWithJSONDictionary:error:", v35, &v65);
      v38 = v65;
      if (v38)
      {
        v49 = v38;
        if (a4)
          *a4 = objc_retainAutorelease(v38);

        goto LABEL_56;
      }
      objc_msgSend(v14, "addObject:", v37);

      if (v31 != ++v33)
        continue;
      break;
    }
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
    v5 = v62;
    if (v31)
      continue;
    break;
  }
LABEL_39:
  v29 = obj;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v35 = 0;
    self = v60;
    goto LABEL_42;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v53 = v27;
    v64 = 0;
    v35 = -[BMSiriRemembersFieldFieldValueBasicValue initWithJSONDictionary:error:]([BMSiriRemembersFieldFieldValueBasicValue alloc], "initWithJSONDictionary:error:", v53, &v64);
    v54 = v64;
    self = v60;
    if (v54)
    {
      v55 = v54;
      if (a4)
        *a4 = objc_retainAutorelease(v54);

      v28 = 0;
      v27 = v53;
      v29 = obj;
    }
    else
    {

      v29 = obj;
LABEL_42:
      self = -[BMSiriRemembersFieldFieldValue initWithValueSequence:valueDictionary:value:](self, "initWithValueSequence:valueDictionary:value:", v63, v14, v35);
      v28 = self;
    }
LABEL_57:

  }
  else
  {
    if (a4)
    {
      v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v57 = *MEMORY[0x1E0D025B8];
      v75 = *MEMORY[0x1E0CB2D50];
      v35 = (BMSiriRemembersFieldFieldValueBasicValue *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("value"));
      v76 = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v57, 2, v58);

      v28 = 0;
      v29 = obj;
      self = v60;
      goto LABEL_57;
    }
    v28 = 0;
    v29 = obj;
    self = v60;
  }
LABEL_58:

LABEL_59:
LABEL_60:

  return v28;
}

- (id)_valueSequenceJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMSiriRemembersFieldFieldValue valueSequence](self, "valueSequence", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_valueDictionaryJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMSiriRemembersFieldFieldValue valueDictionary](self, "valueDictionary", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  -[BMSiriRemembersFieldFieldValue _valueSequenceJSONArray](self, "_valueSequenceJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersFieldFieldValue _valueDictionaryJSONArray](self, "_valueDictionaryJSONArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersFieldFieldValue value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = CFSTR("valueSequence");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v7;
  v12[1] = CFSTR("valueDictionary");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v8;
  v12[2] = CFSTR("value");
  v9 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
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

  return v10;
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
    -[BMSiriRemembersFieldFieldValue valueSequence](self, "valueSequence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueSequence");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriRemembersFieldFieldValue valueSequence](self, "valueSequence");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "valueSequence");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_9;
    }
    -[BMSiriRemembersFieldFieldValue valueDictionary](self, "valueDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueDictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriRemembersFieldFieldValue valueDictionary](self, "valueDictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "valueDictionary");
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
    -[BMSiriRemembersFieldFieldValue value](self, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 == v20)
    {
      v12 = 1;
    }
    else
    {
      -[BMSiriRemembersFieldFieldValue value](self, "value");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
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

- (NSArray)valueSequence
{
  return self->_valueSequence;
}

- (NSArray)valueDictionary
{
  return self->_valueDictionary;
}

- (BMSiriRemembersFieldFieldValueBasicValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_valueDictionary, 0);
  objc_storeStrong((id *)&self->_valueSequence, 0);
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

    v4 = -[BMSiriRemembersFieldFieldValue initByReadFrom:]([BMSiriRemembersFieldFieldValue alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("valueSequence_json"), 5, 1, &__block_literal_global_182);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("valueDictionary_json"), 5, 1, &__block_literal_global_183);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("value_json"), 5, 1, &__block_literal_global_184);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B790;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("valueSequence"), 1, 14, objc_opt_class());
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("valueDictionary"), 2, 14, objc_opt_class(), v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("value"), 3, 14, objc_opt_class());
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __41__BMSiriRemembersFieldFieldValue_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __41__BMSiriRemembersFieldFieldValue_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_valueDictionaryJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __41__BMSiriRemembersFieldFieldValue_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_valueSequenceJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
