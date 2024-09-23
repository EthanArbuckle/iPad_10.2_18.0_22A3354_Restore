@implementation KVField

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

- (id)value
{
  const Field *v2;
  id v4;
  const char *v5;
  const Field *field;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const Field *v10;
  void *v11;

  v2 = &self->_field[-*(int *)self->_field];
  if (*(unsigned __int16 *)v2->var0 >= 7u && *(_WORD *)v2[6].var0)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    field = self->_field;
    v7 = *(int *)field->var0;
    v8 = *(unsigned __int16 *)field[-v7 + 6].var0;
    if (*(_WORD *)field[-v7 + 6].var0)
    {
      v9 = *(unsigned int *)field[v8].var0;
      v10 = &field[v8 + v9];
    }
    else
    {
      v8 = 0;
      v10 = 0;
      v9 = *(unsigned int *)field->var0;
    }
    v11 = (void *)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v4, v5, (uint64_t)&v10[4], *(unsigned int *)field[v8 + v9].var0, 4, 0);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (KVField)initWithBuffer:(id)a3 root:(const Field *)a4
{
  id v7;
  KVField *v8;
  KVField *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KVField;
  v8 = -[KVField init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_buffer, a3);
    v9->_field = a4;
  }

  return v9;
}

- (int64_t)fieldType
{
  const Field *field;
  const Field *v3;
  uint64_t v4;

  field = self->_field;
  v3 = &field[-*(int *)field->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return *(unsigned __int16 *)field[v4].var0;
  else
    return 0;
}

- (KVField)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)label
{
  const Field *v2;
  id v4;
  const char *v5;
  const Field *field;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const Field *v10;
  void *v11;

  v2 = &self->_field[-*(int *)self->_field];
  if (*(unsigned __int16 *)v2->var0 >= 9u && *(_WORD *)v2[8].var0)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    field = self->_field;
    v7 = *(int *)field->var0;
    v8 = *(unsigned __int16 *)field[-v7 + 8].var0;
    if (*(_WORD *)field[-v7 + 8].var0)
    {
      v9 = *(unsigned int *)field[v8].var0;
      v10 = &field[v8 + v9];
    }
    else
    {
      v8 = 0;
      v10 = 0;
      v9 = *(unsigned int *)field->var0;
    }
    v11 = (void *)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v4, v5, (uint64_t)&v10[4], *(unsigned int *)field[v8 + v9].var0, 4, 0);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (int64_t)localeType
{
  const Field *field;
  const Field *v3;
  uint64_t v4;

  field = self->_field;
  v3 = &field[-*(int *)field->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0)
    return field[v4].var0[0];
  else
    return 0;
}

- (NSString)description
{
  uint64_t v2;

  return (NSString *)objc_msgSend_JSONWithIndent_(self, a2, 0, v2);
}

- (id)JSONWithIndent:(unsigned __int8)a3
{
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int16 v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;

  sub_1B7103470(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B7103470(a3 + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend_appendFormat_(v7, v8, (uint64_t)CFSTR("%@{\n"), v9, v5);
  v13 = objc_msgSend_fieldType(self, v10, v11, v12);
  KVFieldTypeName(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v15, (uint64_t)CFSTR("%@\"%@\": \"%@\",\n"), v16, v6, CFSTR("fieldType"), v14);

  v20 = objc_msgSend_localeType(self, v17, v18, v19);
  if (v20)
  {
    if (v20 >= 0x2D)
      v24 = 0;
    else
      v24 = v20;
    if (v24 <= 0x2Cu)
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v21, (uint64_t)off_1E6B7AEC8[v24], 4);
    else
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v21, (uint64_t)"", 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v7, v26, (uint64_t)CFSTR("%@\"%@\": \"%@\",\n"), v27, v6, CFSTR("localeType"), v25);

  }
  objc_msgSend_label(self, v21, v22, v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v28, v29, v30, v31))
  {
    sub_1B71034E4((uint64_t)v28, v32);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v7, v36, (uint64_t)CFSTR("%@\"%@\": %@,\n"), v37, v6, CFSTR("label"), v35);

  }
  objc_msgSend_value(self, v32, v33, v34);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v38, v39, v40, v41))
  {
    sub_1B71034E4((uint64_t)v38, v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v7, v45, (uint64_t)CFSTR("%@\"%@\": %@,\n"), v46, v6, CFSTR("value"), v44);

  }
  objc_msgSend_appendFormat_(v7, v42, (uint64_t)CFSTR("%@}"), v43, v5);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  KVField *v4;
  KVField *v5;
  const char *v6;
  uint64_t v7;
  char isEqualToField;

  v4 = (KVField *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToField = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToField = objc_msgSend_isEqualToField_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    isEqualToField = 0;
  }

  return isEqualToField;
}

- (BOOL)isEqualToField:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  int v35;
  char isEqual;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v49;

  v8 = a3;
  v12 = objc_msgSend_fieldType(self, v9, v10, v11);
  if (v12 == objc_msgSend_fieldType(v8, v13, v14, v15))
  {
    v19 = objc_msgSend_localeType(self, v16, v17, v18);
    if (v19 == objc_msgSend_localeType(v8, v20, v21, v22))
    {
      objc_msgSend_value(self, v23, v24, v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29 || (objc_msgSend_value(v8, v26, v27, v28), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend_value(self, v26, v27, v28);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_value(v8, v30, v31, v32);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v3, v33, (uint64_t)v4, v34))
        {
          isEqual = 0;
          goto LABEL_15;
        }
        v35 = 1;
      }
      else
      {
        v35 = 0;
      }
      v49 = v5;
      objc_msgSend_label(self, v26, v27, v28);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40 || (objc_msgSend_label(v8, v37, v38, v39), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend_label(self, v37, v38, v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_label(v8, v42, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v41, v46, (uint64_t)v45, v47);

        if (v40)
        {

          if (v35)
          {
LABEL_14:
            v5 = v49;
LABEL_15:

            if (v29)
            {
LABEL_17:

              goto LABEL_18;
            }
LABEL_16:

            goto LABEL_17;
          }
LABEL_21:
          v5 = v49;
          if (v29)
            goto LABEL_17;
          goto LABEL_16;
        }
      }
      else
      {
        isEqual = 1;
      }

      if ((v35 & 1) != 0)
        goto LABEL_14;
      goto LABEL_21;
    }
  }
  isEqual = 0;
LABEL_18:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = objc_msgSend_fieldType(self, a2, v2, v3);
  objc_msgSend_numberWithInteger_(v5, v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_hash(v9, v10, v11, v12);
  objc_msgSend_value(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_hash(v17, v18, v19, v20);
  objc_msgSend_label(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v21 ^ v13 ^ objc_msgSend_hash(v25, v26, v27, v28);

  return v29;
}

+ (id)fieldWithBuffer:(id)a3 root:(const void *)a4
{
  id v5;
  id v6;
  const char *v7;
  void *v8;

  v5 = a3;
  v6 = objc_alloc((Class)objc_opt_class());
  v8 = (void *)objc_msgSend_initWithBuffer_root_(v6, v7, (uint64_t)v5, (uint64_t)a4);

  return v8;
}

@end
