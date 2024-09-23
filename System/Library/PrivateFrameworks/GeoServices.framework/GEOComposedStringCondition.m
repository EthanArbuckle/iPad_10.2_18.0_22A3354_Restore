@implementation GEOComposedStringCondition

- (GEOComposedStringCondition)initWithGeoCondition:(id)a3
{
  id v4;
  GEOComposedStringCondition *v5;
  uint64_t v6;
  NSDate *expirationDate;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *subConditions;
  GEOComposedStringCondition *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOComposedStringCondition;
  v5 = -[GEOComposedStringCondition init](&v15, sel_init);
  if (v5)
  {
    v5->_conditionType = objc_msgSend(v4, "type");
    if (objc_msgSend(v4, "expirationTime"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "expirationTime"));
      v6 = objc_claimAutoreleasedReturnValue();
      expirationDate = v5->_expirationDate;
      v5->_expirationDate = (NSDate *)v6;

    }
    objc_msgSend(v4, "conditions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      objc_msgSend(v4, "conditions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_geo_map:", &__block_literal_global_6);
      v11 = objc_claimAutoreleasedReturnValue();
      subConditions = v5->_subConditions;
      v5->_subConditions = (NSArray *)v11;

    }
    v13 = v5;
  }

  return v5;
}

GEOComposedStringCondition *__51__GEOComposedStringCondition_initWithGeoCondition___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GEOComposedStringCondition *v3;

  v2 = a2;
  v3 = -[GEOComposedStringCondition initWithGeoCondition:]([GEOComposedStringCondition alloc], "initWithGeoCondition:", v2);

  return v3;
}

- (BOOL)isValid
{
  char v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  void *v17;
  NSObject *v19;
  const char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[8];
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  switch(self->_conditionType)
  {
    case 0:
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        return 0;
      *(_WORD *)buf = 0;
      v19 = MEMORY[0x1E0C81028];
      v20 = "Unreachable reached: Unknown condition";
      goto LABEL_45;
    case 1:
      if (-[NSArray count](self->_subConditions, "count") > 1)
      {
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v4 = self->_subConditions;
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
        if (!v5)
          goto LABEL_38;
        v6 = v5;
        v7 = *(_QWORD *)v30;
        v3 = 1;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v30 != v7)
              objc_enumerationMutation(v4);
            if ((v3 & 1) != 0)
              v3 = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "isValid");
            else
              v3 = 0;
          }
          v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
        }
        while (v6);
        goto LABEL_42;
      }
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        return 0;
      *(_WORD *)buf = 0;
      v19 = MEMORY[0x1E0C81028];
      v20 = "Assertion failed: _subConditions.count >= 2";
      goto LABEL_45;
    case 2:
      if (-[NSArray count](self->_subConditions, "count") > 1)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v4 = self->_subConditions;
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
        if (!v9)
          goto LABEL_41;
        v10 = v9;
        v3 = 0;
        v11 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v10; ++j)
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(v4);
            if ((v3 & 1) != 0)
              v3 = 1;
            else
              v3 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "isValid");
          }
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
        }
        while (v10);
        goto LABEL_42;
      }
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        return 0;
      *(_WORD *)buf = 0;
      v19 = MEMORY[0x1E0C81028];
      v20 = "Assertion failed: _subConditions.count >= 2";
      goto LABEL_45;
    case 3:
      if (-[NSArray count](self->_subConditions, "count"))
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v4 = self->_subConditions;
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
        if (!v13)
        {
LABEL_38:
          v3 = 1;
          goto LABEL_42;
        }
        v14 = v13;
        v15 = *(_QWORD *)v22;
        while (1)
        {
          for (k = 0; k != v14; ++k)
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v4);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * k), "isValid", (_QWORD)v21) & 1) != 0)
            {
LABEL_41:
              v3 = 0;
LABEL_42:

              return v3;
            }
          }
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
          if (!v14)
            goto LABEL_38;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v19 = MEMORY[0x1E0C81028];
        v20 = "Assertion failed: _subConditions.count >= 1";
LABEL_45:
        _os_log_fault_impl(&dword_1885A9000, v19, OS_LOG_TYPE_FAULT, v20, buf, 2u);
      }
      return 0;
    case 4:
      if (self->_expirationDate)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
        -[NSArray earlierDate:](v4, "earlierDate:", self->_expirationDate);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v17, "isEqualToDate:", self->_expirationDate);

        goto LABEL_42;
      }
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        return 0;
      *(_WORD *)buf = 0;
      v19 = MEMORY[0x1E0C81028];
      v20 = "Assertion failed: _expirationDate != ((void *)0)";
      goto LABEL_45;
    default:
      return 1;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v4 + 8) = self->_conditionType;
  v5 = -[NSDate copy](self->_expirationDate, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  if (-[NSArray count](self->_subConditions, "count"))
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_subConditions, 1);
    v8 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v7;

  }
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedStringCondition)initWithCoder:(id)a3
{
  id v4;
  GEOComposedStringCondition *v5;
  uint64_t v6;
  NSDate *expirationDate;
  uint64_t v8;
  NSArray *subConditions;
  GEOComposedStringCondition *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedStringCondition;
  v5 = -[GEOComposedStringCondition init](&v12, sel_init);
  if (v5)
  {
    v5->_conditionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_conditionType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_expirationDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_subConditions"));
    v8 = objc_claimAutoreleasedReturnValue();
    subConditions = v5->_subConditions;
    v5->_subConditions = (NSArray *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t conditionType;
  id v5;

  conditionType = self->_conditionType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", conditionType, CFSTR("_conditionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("_expirationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subConditions, CFSTR("_subConditions"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  int v11;
  NSArray *subConditions;
  uint64_t v13;
  id v14;
  void *v15;
  char v16;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = v5;
    if (self->_conditionType == *((_DWORD *)v5 + 2)
      && ((v7 = (void *)v5[2], v8 = self->_expirationDate, v9 = v7, !(v8 | v9))
       || (v10 = (void *)v9, v11 = objc_msgSend((id)v8, "isEqual:", v9), v10, (id)v8, v11)))
    {
      subConditions = self->_subConditions;
      v13 = v6[3];
      v14 = subConditions;
      v15 = v14;
      if ((unint64_t)v14 | v13)
        v16 = objc_msgSend(v14, "isEqual:", v13);
      else
        v16 = 1;

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (int)conditionType
{
  return self->_conditionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subConditions, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end
