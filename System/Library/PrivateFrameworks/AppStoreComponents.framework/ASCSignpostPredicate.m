@implementation ASCSignpostPredicate

- (ASCSignpostPredicate)initWithTags:(id)a3 dateRanges:(id)a4
{
  id v6;
  id v7;
  ASCSignpostPredicate *v8;
  uint64_t v9;
  NSSet *tags;
  uint64_t v11;
  NSArray *dateRanges;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v14.receiver = self;
  v14.super_class = (Class)ASCSignpostPredicate;
  v8 = -[ASCSignpostPredicate init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    tags = v8->_tags;
    v8->_tags = (NSSet *)v9;

    v11 = objc_msgSend(v7, "copy");
    dateRanges = v8->_dateRanges;
    v8->_dateRanges = (NSArray *)v11;

  }
  return v8;
}

- (ASCSignpostPredicate)initWithSpans:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ASCSignpostPredicate *v15;
  ASCSignpostPredicate *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v17 = self;
  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "dateRange", v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v11, "primaryTag"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

          objc_msgSend(v11, "supplementaryTags");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "unionSet:", v14);

          objc_msgSend(v5, "addObject:", v12);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          -[ASCSignpostPredicate initWithSpans:].cold.1(buf, (uint64_t)v11, &v23);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

  v15 = -[ASCSignpostPredicate initWithTags:dateRanges:](v17, "initWithTags:dateRanges:", v4, v5);
  return v15;
}

- (ASCSignpostPredicate)init
{
  void *v3;
  ASCSignpostPredicate *v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASCSignpostPredicate initWithTags:dateRanges:](self, "initWithTags:dateRanges:", v3, MEMORY[0x1E0C9AA60]);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCSignpostPredicate)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  ASCSignpostPredicate *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("tags"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0C99E60]);
    v10 = objc_opt_class();
    v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("dateRanges"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      self = -[ASCSignpostPredicate initWithTags:dateRanges:](self, "initWithTags:dateRanges:", v8, v12);
      v13 = self;
    }
    else
    {
      v22 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v22)
        -[ASCSignpostPredicate initWithCoder:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);
      v13 = 0;
    }

  }
  else
  {
    v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v14)
      -[ASCSignpostPredicate initWithCoder:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ASCSignpostPredicate tags](self, "tags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tags"));

  -[ASCSignpostPredicate dateRanges](self, "dateRanges");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("dateRanges"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCSignpostPredicate tags](self, "tags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCSignpostPredicate dateRanges](self, "dateRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    -[ASCSignpostPredicate tags](self, "tags");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tags");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (objc_msgSend(v8, "isEqual:", v9))
        goto LABEL_10;
    }
    else if (v8 == (void *)v9)
    {
LABEL_10:
      -[ASCSignpostPredicate dateRanges](self, "dateRanges");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateRanges");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v11 && v12)
        v14 = objc_msgSend(v11, "isEqual:", v12);
      else
        v14 = v11 == (void *)v12;

      goto LABEL_18;
    }
    v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v14 = 0;
LABEL_19:

  return v14;
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCSignpostPredicate tags](self, "tags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("tags"));

  -[ASCSignpostPredicate dateRanges](self, "dateRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("dateRanges"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEmpty
{
  void *v3;
  void *v4;
  BOOL v5;

  -[ASCSignpostPredicate tags](self, "tags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[ASCSignpostPredicate dateRanges](self, "dateRanges");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") == 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)predicateByAddingTag:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  -[ASCSignpostPredicate tags](self, "tags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc((Class)objc_opt_class());
  -[ASCSignpostPredicate dateRanges](self, "dateRanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithTags:dateRanges:", v7, v9);

  return v10;
}

- (id)predicateByAddingDateRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[ASCSignpostPredicate dateRanges](self, "dateRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc((Class)objc_opt_class());
  -[ASCSignpostPredicate tags](self, "tags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTags:dateRanges:", v8, v6);

  return v9;
}

- (NSSet)tags
{
  return self->_tags;
}

- (NSArray)dateRanges
{
  return self->_dateRanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRanges, 0);
  objc_storeStrong((id *)&self->_tags, 0);
}

- (void)initWithSpans:(_QWORD *)a3 .cold.1(uint8_t *buf, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Discarding span without valid range range %@", buf, 0xCu);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCSignpostPredicate because tags was missing", a5, a6, a7, a8, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCSignpostPredicate because dateRanges was missing", a5, a6, a7, a8, 0);
}

@end
