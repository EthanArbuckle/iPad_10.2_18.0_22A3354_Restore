@implementation CHTokenizedResultColumn

- (CHTokenizedResultColumn)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (CHTokenizedResultColumn *)objc_msgSend_initWithTokenRows_(self, a2, MEMORY[0x1E0C9AA60], v2, v3, v4);
}

- (CHTokenizedResultColumn)initWithTokenRows:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHTokenizedResultColumn *v10;
  uint64_t v11;
  NSArray *tokenRows;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CHTokenizedResultColumn;
  v10 = -[CHTokenizedResultColumn init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v4, v5, v6, v7, v8, v9);
    tokenRows = v10->_tokenRows;
    v10->_tokenRows = (NSArray *)v11;

  }
  return v10;
}

- (CHTokenizedResultColumn)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CHTokenizedResultColumn *v23;
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend_setWithObjects_(v4, v10, v6, v11, v12, v13, v7, v8, v9, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v5, v15, (uint64_t)v14, (uint64_t)CFSTR("tokenRows"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v23 = (CHTokenizedResultColumn *)objc_msgSend_initWithTokenRows_(self, v19, (uint64_t)v18, v20, v21, v22);
  }
  else
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v24 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = (id)objc_opt_class();
      v25 = v28;
      _os_log_impl(&dword_1BE607000, v24, OS_LOG_TYPE_ERROR, "%@ decoding failed. Result token rows are required to be nonnull when constructing a request", buf, 0xCu);

    }
    v23 = 0;
  }

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_tokenRows, (uint64_t)CFSTR("tokenRows"), v3, v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CHMutableTokenizedResultColumn *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = [CHMutableTokenizedResultColumn alloc];
  return (id)objc_msgSend_initWithTokenRows_(v4, v5, (uint64_t)self->_tokenRows, v6, v7, v8);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  objc_super v31;
  _QWORD v32[5];

  objc_msgSend_tokenRows(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = sub_1BE6CC230;
  v32[3] = &unk_1E77F3628;
  v32[4] = self;
  objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v7, v8, (uint64_t)CFSTR("\n"), (uint64_t)v32, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v31.receiver = self;
  v31.super_class = (Class)CHTokenizedResultColumn;
  -[CHTokenizedResultColumn description](&v31, sel_description);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenRows(self, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_count(v18, v19, v20, v21, v22, v23);
  objc_msgSend_stringByAppendingFormat_(v12, v25, (uint64_t)CFSTR(" rows: %ld {\n%@\n}"), v26, v27, v28, v24, v11);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (int64_t)indexOfEquivalentTokenRow:(id)a3 tokenRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  NSArray *tokenRows;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  NSUInteger v19;
  NSUInteger v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0x7FFFFFFFFFFFFFFFLL;
  tokenRows = self->_tokenRows;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BE6CC4EC;
  v16[3] = &unk_1E77F3650;
  v19 = location;
  v20 = length;
  v9 = v7;
  v17 = v9;
  v18 = &v21;
  objc_msgSend_enumerateObjectsUsingBlock_(tokenRows, v10, (uint64_t)v16, v11, v12, v13);
  v14 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v14;
}

- (BOOL)containsStartingTokenEquivalentToToken:(id)a3
{
  id v4;
  NSArray *tokenRows;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  tokenRows = self->_tokenRows;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1BE6CC6A0;
  v12[3] = &unk_1E77F3678;
  v6 = v4;
  v13 = v6;
  v14 = &v15;
  objc_msgSend_enumerateObjectsUsingBlock_(tokenRows, v7, (uint64_t)v12, v8, v9, v10);
  LOBYTE(tokenRows) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)tokenRows;
}

- (NSIndexSet)strokeIndexes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend_indexSet(MEMORY[0x1E0CB3788], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(self->_tokenRows, v8, v9, v10, v11, v12))
  {
    objc_msgSend_firstObject(self->_tokenRows, v13, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v36, (uint64_t)v40, 16, v20);
    if (v21)
    {
      v27 = v21;
      v28 = *(_QWORD *)v37;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v37 != v28)
            objc_enumerationMutation(v18);
          objc_msgSend_strokeIndexes(*(void **)(*((_QWORD *)&v36 + 1) + 8 * v29), v22, v23, v24, v25, v26);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addIndexes_(v7, v31, (uint64_t)v30, v32, v33, v34);

          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v22, (uint64_t)&v36, (uint64_t)v40, 16, v26);
      }
      while (v27);
    }

  }
  return (NSIndexSet *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CHTokenizedResultColumn *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CHTokenizedResultColumn *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (CHTokenizedResultColumn *)v4;
    v11 = v5;
    if (self)
    {
      if (self == v5)
      {
        LOBYTE(self) = 1;
      }
      else
      {
        self = (CHTokenizedResultColumn *)self->_tokenRows;
        objc_msgSend_tokenRows(v5, v6, v7, v8, v9, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(self) = objc_msgSend_isEqualToArray_(self, v13, (uint64_t)v12, v14, v15, v16);

      }
    }

    return (char)self;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return objc_msgSend_hash(self->_tokenRows, a2, v2, v3, v4, v5);
}

- (NSArray)textTokenRows
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char isKindOfClass;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  int v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend_firstObject(self->_tokenRows, a2, v2, v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v7, v8, v9, v10, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
LABEL_7:

    return self->_tokenRows;
  }
  v19 = (void *)v13;
  objc_msgSend_firstObject(self->_tokenRows, v14, v15, v16, v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v20, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v7 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend_firstObject(self->_tokenRows, v28, v29, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v33, v34, v35, v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138412290;
      v43 = (id)objc_opt_class();
      v40 = v43;
      _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_FAULT, "Invalid class (%@) in text token rows.", (uint8_t *)&v42, 0xCu);

    }
    goto LABEL_7;
  }
  return self->_tokenRows;
}

- (NSArray)mathTokenRows
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char isKindOfClass;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  int v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend_firstObject(self->_tokenRows, a2, v2, v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v7, v8, v9, v10, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
LABEL_7:

    return self->_tokenRows;
  }
  v19 = (void *)v13;
  objc_msgSend_firstObject(self->_tokenRows, v14, v15, v16, v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v20, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v7 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend_firstObject(self->_tokenRows, v28, v29, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v33, v34, v35, v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138412290;
      v43 = (id)objc_opt_class();
      v40 = v43;
      _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_FAULT, "Invalid class (%@) in text token rows.", (uint8_t *)&v42, 0xCu);

    }
    goto LABEL_7;
  }
  return self->_tokenRows;
}

- (NSArray)tokenRows
{
  return self->_tokenRows;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenRows, 0);
}

@end
