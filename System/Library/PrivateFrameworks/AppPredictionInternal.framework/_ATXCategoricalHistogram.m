@implementation _ATXCategoricalHistogram

- (_ATXCategoricalHistogram)init
{
  _ATXCategoricalHistogram *v2;
  uint64_t v3;
  NSDictionary *lastDates;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ATXCategoricalHistogram;
  v2 = -[_ATXCategoricalHistogram init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    lastDates = v2->_lastDates;
    v2->_lastDates = (NSDictionary *)v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_entries);
  v3.receiver = self;
  v3.super_class = (Class)_ATXCategoricalHistogram;
  -[_ATXCategoricalHistogram dealloc](&v3, sel_dealloc);
}

- (id)getLastDatesByCategoryId
{
  return self->_lastDates;
}

- (void)enumerate:(id)a3
{
  uint64_t v5;
  unint64_t v6;

  if (self->_count)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      (*((void (**)(id, _QWORD, _QWORD, double))a3 + 2))(a3, LOWORD(self->_entries[v5].var1), LOWORD(self->_entries[v5].var2), self->_entries[v5].var0);
      ++v6;
      ++v5;
    }
    while (v6 < self->_count);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_ATXCategoricalHistogram)initWithCoder:(id)a3
{
  id v5;
  _ATXCategoricalHistogram *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  $79C7EF85C67C40ADD34ABE84379EB493 *v10;
  id v11;
  uint64_t v12;
  void *lastDates;
  NSDictionary *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  NSDictionary *v18;
  void *v20;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_ATXCategoricalHistogram;
  v6 = -[_ATXCategoricalHistogram init](&v21, sel_init);
  if (!v6)
    goto LABEL_12;
  v7 = (void *)MEMORY[0x1CAA48B6C]();
  v8 = objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("count"));
  v6->_count = v8;
  v6->_capacity = v8;
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entries"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length") != 16 * v6->_capacity)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_ATXCategoricalHistogram.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entryData.length == _capacity * sizeof(bucket_t)"));

    if (!v9)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (v9)
  {
LABEL_4:
    v10 = ($79C7EF85C67C40ADD34ABE84379EB493 *)malloc_type_calloc(v6->_capacity, 0x10uLL, 0x1000040451B5BE8uLL);
    v6->_entries = v10;
    v11 = objc_retainAutorelease(v9);
    memcpy(v10, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
  }
LABEL_5:
  if (objc_msgSend(v5, "containsValueForKey:", CFSTR("lastDates")))
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastDates"));
    v12 = objc_claimAutoreleasedReturnValue();
    lastDates = v6->_lastDates;
    v6->_lastDates = (NSDictionary *)v12;
  }
  else
  {
    v14 = (NSDictionary *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    lastDates = (void *)objc_claimAutoreleasedReturnValue();
    if (v6->_count)
    {
      v15 = 0;
      v16 = 12;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)((char *)&v6->_entries->var0 + v16));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", lastDates, v17);

        ++v15;
        v16 += 16;
      }
      while (v15 < v6->_count);
    }
    v18 = v6->_lastDates;
    v6->_lastDates = v14;

  }
  objc_autoreleasePoolPop(v7);
LABEL_12:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", self->_count, CFSTR("count"));
  if (self->_entries)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", self->_entries, 16 * self->_count);
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("entries"));

  }
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastDates, CFSTR("lastDates"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDates, 0);
}

@end
