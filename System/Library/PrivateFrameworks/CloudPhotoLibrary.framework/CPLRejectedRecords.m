@implementation CPLRejectedRecords

- (CPLRejectedRecords)init
{
  CPLRejectedRecords *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *records;
  NSMutableDictionary *v5;
  NSMutableDictionary *reasons;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPLRejectedRecords;
  v2 = -[CPLRejectedRecords init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    records = v2->_records;
    v2->_records = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    reasons = v2->_reasons;
    v2->_reasons = v5;

  }
  return v2;
}

- (id)objectForKeyedSubscript:(id)a3
{
  NSMutableDictionary *reasons;
  void *v4;
  void *v5;

  reasons = self->_reasons;
  objc_msgSend(a3, "scopedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](reasons, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *records;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v6, "scopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  records = self->_records;
  if (v9)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](records, "setObject:forKeyedSubscript:", v6, v7);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_reasons, "setObject:forKeyedSubscript:", v9, v7);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](records, "removeObjectForKey:", v7);
    -[NSMutableDictionary removeObjectForKey:](self->_reasons, "removeObjectForKey:", v7);
  }

}

- (id)recordWithScopedIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_records, "objectForKeyedSubscript:", a3);
}

- (void)removeRejectedRecordsWithScopedIdentifiers:(id)a3
{
  NSMutableDictionary *records;
  id v5;

  records = self->_records;
  v5 = a3;
  -[NSMutableDictionary removeObjectsForKeys:](records, "removeObjectsForKeys:", v5);
  -[NSMutableDictionary removeObjectsForKeys:](self->_reasons, "removeObjectsForKeys:", v5);

}

- (void)enumerateRecordsAndReasonsUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *records;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  records = self->_records;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__CPLRejectedRecords_enumerateRecordsAndReasonsUsingBlock___block_invoke;
  v7[3] = &unk_1E60DCEB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](records, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (BOOL)isEqual:(id)a3
{
  CPLRejectedRecords *v4;
  uint64_t v5;
  char v6;

  v4 = (CPLRejectedRecords *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && -[NSMutableDictionary isEqual:](v4->_records, "isEqual:", self->_records))
    {
      v6 = -[NSMutableDictionary isEqual:](v4->_reasons, "isEqual:", self->_reasons);
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)rejectsTheSameRecordsAs:(id)a3
{
  if (a3 == self)
    return 1;
  else
    return objc_msgSend(*((id *)a3 + 1), "isEqual:", self->_records);
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_records, "count");
}

- (id)rejectedDescriptions
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableDictionary count](self->_records, "count"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__CPLRejectedRecords_rejectedDescriptions__block_invoke;
  v6[3] = &unk_1E60DCED8;
  v4 = v3;
  v7 = v4;
  -[CPLRejectedRecords enumerateRecordsAndReasonsUsingBlock:](self, "enumerateRecordsAndReasonsUsingBlock:", v6);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_records, 0);
}

void __42__CPLRejectedRecords_rejectedDescriptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = a2;
  v8 = [v5 alloc];
  v9 = objc_opt_class();
  objc_msgSend(v7, "scopedIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v8, "initWithFormat:", CFSTR("%@ %@: '%@'"), v9, v10, v6);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);

}

void __59__CPLRejectedRecords_enumerateRecordsAndReasonsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
