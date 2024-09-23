@implementation RTLocationOfInterestEnumerationOptions

- (RTLocationOfInterestEnumerationOptions)init
{
  return -[RTLocationOfInterestEnumerationOptions initWithAscending:batchSize:dateInterval:wrappedVisit:](self, "initWithAscending:batchSize:dateInterval:wrappedVisit:", 1, 0, 0, 0);
}

- (RTLocationOfInterestEnumerationOptions)initWithAscending:(BOOL)a3 batchSize:(unint64_t)a4 dateInterval:(id)a5 wrappedVisit:(BOOL)a6
{
  id v10;
  RTLocationOfInterestEnumerationOptions *v11;
  RTLocationOfInterestEnumerationOptions *v12;
  objc_super v14;

  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RTLocationOfInterestEnumerationOptions;
  v11 = -[RTLocationOfInterestEnumerationOptions init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_ascending = a3;
    -[RTLocationOfInterestEnumerationOptions setDateInterval:](v11, "setDateInterval:", v10);
    v12->_batchSize = a4;
    v12->_wrappedVisit = a6;
  }

  return v12;
}

- (void)setDateInterval:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a3;
  v9 = v6;
  if (!v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v7, "initWithStartDate:endDate:", v3, v4);
  }
  objc_storeStrong((id *)&self->_dateInterval, v6);
  v8 = v9;
  if (!v9)
  {

    v8 = 0;
  }

}

- (Class)enumeratedType
{
  return (Class)objc_opt_class();
}

- (id)processingBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__RTLocationOfInterestEnumerationOptions_processingBlock__block_invoke;
  v3[3] = &unk_1E4FB1410;
  v3[4] = self;
  return (id)MEMORY[0x1A85B6C24](v3, a2);
}

id __57__RTLocationOfInterestEnumerationOptions_processingBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "pruneVisitsWithDateInterval:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  RTLocationOfInterestEnumerationOptions *v4;
  RTLocationOfInterestEnumerationOptions *v5;
  int v6;
  int v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  _BOOL4 v14;
  BOOL v15;

  v4 = (RTLocationOfInterestEnumerationOptions *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[RTLocationOfInterestEnumerationOptions ascending](self, "ascending");
      v7 = -[RTLocationOfInterestEnumerationOptions ascending](v5, "ascending");
      v8 = -[RTLocationOfInterestEnumerationOptions batchSize](self, "batchSize");
      v9 = -[RTLocationOfInterestEnumerationOptions batchSize](v5, "batchSize");
      -[RTLocationOfInterestEnumerationOptions dateInterval](self, "dateInterval");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationOfInterestEnumerationOptions dateInterval](v5, "dateInterval");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToDateInterval:", v11);

      v13 = -[RTLocationOfInterestEnumerationOptions wrappedVisit](self, "wrappedVisit");
      v14 = v12 & (v13 ^ -[RTLocationOfInterestEnumerationOptions wrappedVisit](v5, "wrappedVisit") ^ 1);
      if (v8 != v9)
        LOBYTE(v14) = 0;
      v15 = v6 == v7 && v14;

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ascending);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_batchSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[NSDateInterval hash](self->_dateInterval, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_wrappedVisit);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAscending:batchSize:dateInterval:wrappedVisit:", self->_ascending, self->_batchSize, self->_dateInterval, self->_wrappedVisit);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 ascending;
  id v5;

  ascending = self->_ascending;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", ascending, CFSTR("ascending"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_batchSize, CFSTR("batchSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_wrappedVisit, CFSTR("wrappedVisit"));

}

- (RTLocationOfInterestEnumerationOptions)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  RTLocationOfInterestEnumerationOptions *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ascending"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("batchSize"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wrappedVisit"));

  v9 = -[RTLocationOfInterestEnumerationOptions initWithAscending:batchSize:dateInterval:wrappedVisit:](self, "initWithAscending:batchSize:dateInterval:wrappedVisit:", v5, v6, v7, v8);
  return v9;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (BOOL)wrappedVisit
{
  return self->_wrappedVisit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
