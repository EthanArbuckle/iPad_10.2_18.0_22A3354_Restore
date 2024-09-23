@implementation CHMutableTokenizedResultColumn

- (CHMutableTokenizedResultColumn)initWithTokenRows:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHMutableTokenizedResultColumn *v10;
  uint64_t v11;
  NSArray *tokenRows;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CHMutableTokenizedResultColumn;
  v10 = -[CHTokenizedResultColumn initWithTokenRows:](&v14, sel_initWithTokenRows_, MEMORY[0x1E0C9AA60]);
  if (v10)
  {
    v11 = objc_msgSend_mutableCopy(v4, v5, v6, v7, v8, v9);
    tokenRows = v10->super._tokenRows;
    v10->super._tokenRows = (NSArray *)v11;

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CHTokenizedResultColumn *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = [CHTokenizedResultColumn alloc];
  return (id)objc_msgSend_initWithTokenRows_(v4, v5, (uint64_t)self->super._tokenRows, v6, v7, v8);
}

- (void)setTokenRows:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSArray *v7;
  NSArray *tokenRows;

  if (self->super._tokenRows != a3)
  {
    v7 = (NSArray *)objc_msgSend_mutableCopy(a3, a2, (uint64_t)a3, v3, v4, v5);
    tokenRows = self->super._tokenRows;
    self->super._tokenRows = v7;

  }
}

- (int64_t)addTokenRowWithTokens:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char isKindOfClass;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v28;
  char v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;

  v4 = a3;
  if (!objc_msgSend_count(v4, v5, v6, v7, v8, v9))
  {

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_msgSend_firstObject(v4, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v25 = (void *)objc_opt_class();
    if (self)
LABEL_4:
      self = self->super._tokenRows;
  }
  else
  {
    objc_msgSend_firstObject(v4, v17, v18, v19, v20, v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v29 = objc_opt_isKindOfClass();

    if ((v29 & 1) == 0)
    {
      if (self)
      {
        objc_msgSend_addObject_(self->super._tokenRows, v30, (uint64_t)v4, v31, v32, v33);
        self = self->super._tokenRows;
      }
      else
      {
        objc_msgSend_addObject_(0, v30, (uint64_t)v4, v31, v32, v33);
      }
      v26 = objc_msgSend_count(self, v34, v35, v36, v37, v38);
      goto LABEL_13;
    }
    v25 = (void *)objc_opt_class();
    if (self)
      goto LABEL_4;
  }
  v26 = objc_msgSend_mergeTokenRow_intoUniqueRows_(v25, v22, (uint64_t)v4, (uint64_t)self, v23, v24);
LABEL_13:
  v39 = v26;

  return v39;
}

- (void)setTokenRowWithTokens:(id)a3 atIndex:(int64_t)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSArray *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSArray *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  int v36;
  int64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (self)
  {
    v12 = self->super._tokenRows;
    v18 = objc_msgSend_count(v12, v13, v14, v15, v16, v17);

    if (v18 > a4)
      goto LABEL_10;
  }
  else
  {
    v35 = objc_msgSend_count(0, v6, v7, v8, v9, v10);

    if (v35 > a4)
      goto LABEL_10;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v22 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    if (self)
    {
      v28 = self->super._tokenRows;
      v34 = objc_msgSend_count(v28, v29, v30, v31, v32, v33);
    }
    else
    {
      v28 = 0;
      v34 = objc_msgSend_count(0, v23, v24, v25, v26, v27);
    }
    v36 = 134218240;
    v37 = a4;
    v38 = 2048;
    v39 = v34;
    _os_log_impl(&dword_1BE607000, v22, OS_LOG_TYPE_FAULT, "Invalid index %ld when trying to replace a row from column with %lu rows.", (uint8_t *)&v36, 0x16u);

  }
LABEL_10:
  if (self)
    self = self->super._tokenRows;
  objc_msgSend_setObject_atIndexedSubscript_(self, v19, (uint64_t)v11, a4, v20, v21);

}

- (void)removeTokenRowAtIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CHMutableTokenizedResultColumn *v7;
  NSArray *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  int v33;
  int64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v7 = self;
  v37 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v8 = self->super._tokenRows;
    v14 = objc_msgSend_count(v8, v9, v10, v11, v12, v13);

    if (v14 > a3)
      goto LABEL_10;
  }
  else
  {
    v32 = objc_msgSend_count(0, a2, a3, v3, v4, v5);

    if (v32 > a3)
      goto LABEL_10;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v19 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    if (v7)
    {
      v25 = v7->super._tokenRows;
      v31 = objc_msgSend_count(v25, v26, v27, v28, v29, v30);
    }
    else
    {
      v25 = 0;
      v31 = objc_msgSend_count(0, v20, v21, v22, v23, v24);
    }
    v33 = 134218240;
    v34 = a3;
    v35 = 2048;
    v36 = v31;
    _os_log_impl(&dword_1BE607000, v19, OS_LOG_TYPE_FAULT, "Invalid index %ld when trying to remvove a row from column with %lu rows.", (uint8_t *)&v33, 0x16u);

  }
LABEL_10:
  if (v7)
    v7 = v7->super._tokenRows;
  objc_msgSend_removeObjectAtIndex_(v7, v15, a3, v16, v17, v18);

}

- (void)sortTokenRows
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  char isKindOfClass;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *tokenRows;
  void *v15;
  char v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  int v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend_firstObject(self->super._tokenRows, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  tokenRows = self->super._tokenRows;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend_sortUsingComparator_(tokenRows, v9, (uint64_t)&unk_1E77F1650, v11, v12, v13);
  }
  else
  {
    objc_msgSend_firstObject(tokenRows, v9, v10, v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16 = objc_opt_isKindOfClass();

    if ((v16 & 1) != 0)
    {
      objc_msgSend_sortUsingComparator_(self->super._tokenRows, v17, (uint64_t)&unk_1E77F36B8, v18, v19, v20);
    }
    else
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v21 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_firstObject(self->super._tokenRows, v22, v23, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138412290;
        v30 = (id)objc_opt_class();
        v28 = v30;
        _os_log_impl(&dword_1BE607000, v21, OS_LOG_TYPE_ERROR, "Unexpected token class (%@) encountered when sorting token rows.", (uint8_t *)&v29, 0xCu);

      }
    }
  }
}

@end
