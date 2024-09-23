@implementation CLSBlob

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D4079EE8;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB5C0 != -1)
    dispatch_once(&qword_1ED0FB5C0, block);
  return (id)qword_1ED0FB5B8;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSBlob;
  return -[CLSObject _init](&v3, sel__init);
}

- (CLSBlob)initWithType:(int)a3 data:(id)a4
{
  id v7;
  CLSBlob *v8;
  CLSBlob *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CLSBlob;
  v8 = -[CLSObject _init](&v11, sel__init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_data, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSBlob)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSBlob *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSData *data;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLSBlob;
  v6 = -[CLSObject initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v6)
  {
    v6->_type = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("type"));
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, CFSTR("data"));
    v9 = objc_claimAutoreleasedReturnValue();
    data = v6->_data;
    v6->_data = (NSData *)v9;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSBlob;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_type, CFSTR("type"), v7.receiver, v7.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_data, CFSTR("data"));

}

- (BOOL)validateObject:(id *)a3
{
  const char *v4;
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSBlob;
  v5 = -[CLSObject validateObject:](&v7, sel_validateObject_, a3);
  if (v5)
    objc_msgSend_setAppIdentifier_(self, v4, 0);
  return v5;
}

- (void)mergeWithObject:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  const char *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  const char *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39.receiver = self;
    v39.super_class = (Class)CLSBlob;
    -[CLSObject mergeWithObject:](&v39, sel_mergeWithObject_, v4);
    v5 = (void *)objc_opt_new();
    objc_msgSend_dateLastModified(self, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v11 = (void *)v8;
      objc_msgSend_dateLastModified(v4, v9, v10);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v15 = (void *)v12;
        objc_msgSend_dateLastModified(self, v13, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dateLastModified(v4, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend_compare_(v16, v20, (uint64_t)v19);

        if (v21 == -1)
        {
          objc_msgSend_addObject_(v5, v22, (uint64_t)CFSTR("type"));
          objc_msgSend_addObject_(v5, v23, (uint64_t)CFSTR("data"));
          objc_msgSend_addObject_(v5, v24, (uint64_t)CFSTR("dateLastModified"));
        }
      }
      else
      {

      }
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v25 = v5;
    v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v35, v40, 16);
    if (v27)
    {
      v29 = v27;
      v30 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v36 != v30)
            objc_enumerationMutation(v25);
          v32 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend_valueForKey_(v4, v28, v32, (_QWORD)v35);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setValue_forKey_(self, v34, (uint64_t)v33, v32);

        }
        v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v35, v40, 16);
      }
      while (v29);
    }

  }
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  char v25;
  char isEqual;
  int v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  char v39;
  void *v40;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    objc_msgSend_objectID(self, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 || (objc_msgSend_objectID(v9, v12, v13), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_objectID(self, v12, v13);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
        goto LABEL_21;
      v4 = (void *)v15;
      objc_msgSend_objectID(v9, v16, v17);
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
        goto LABEL_20;
      v5 = (void *)v18;
      objc_msgSend_objectID(self, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectID(v9, v22, v23);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqualToString_(v21, v24, (uint64_t)v6))
      {
        isEqual = 0;
        goto LABEL_14;
      }
      v40 = v21;
      v25 = 1;
    }
    else
    {
      v25 = 0;
    }
    v27 = objc_msgSend_type(self, v12, v13);
    if (v27 == objc_msgSend_type(v9, v28, v29))
    {
      objc_msgSend_data(self, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v9, v33, v34);
      v39 = v25;
      v35 = v3;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v32, v37, (uint64_t)v36);

      v3 = v35;
      if ((v39 & 1) == 0)
        goto LABEL_15;
      v21 = v40;
LABEL_14:

LABEL_15:
      if (v14)
      {
LABEL_16:

        goto LABEL_17;
      }
LABEL_22:

      goto LABEL_16;
    }
    if ((v25 & 1) == 0)
    {
LABEL_21:
      isEqual = 0;
      if (v14)
        goto LABEL_16;
      goto LABEL_22;
    }

LABEL_20:
    goto LABEL_21;
  }
  isEqual = 0;
LABEL_17:

  return isEqual;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  NSData *data;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CLSBlob;
  -[CLSObject dictionaryRepresentation](&v16, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)v5, CFSTR("type"));

  v7 = (void *)MEMORY[0x1E0CB3940];
  data = self->_data;
  v11 = objc_msgSend_length(data, v9, v10);
  objc_msgSend_stringWithFormat_(v7, v12, (uint64_t)CFSTR("<%p> %lu bytes"), data, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, CFSTR("data"));

  return v3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
