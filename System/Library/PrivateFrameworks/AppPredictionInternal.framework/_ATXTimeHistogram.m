@implementation _ATXTimeHistogram

- (void)dealloc
{
  objc_super v3;

  free(self->_entries);
  v3.receiver = self;
  v3.super_class = (Class)_ATXTimeHistogram;
  -[_ATXTimeHistogram dealloc](&v3, sel_dealloc);
}

- (unsigned)pointsPerTimeInterval
{
  return self->_bucketCount;
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
      (*((void (**)(id, _QWORD, _QWORD, double))a3 + 2))(a3, LOWORD(self->_entries[v5].var1), self->_entries[v5].var2, self->_entries[v5].var0);
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

- (_ATXTimeHistogram)initWithCoder:(id)a3
{
  id v4;
  _ATXTimeHistogram *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  size_t count;
  $B0AFA044FEED82C75CE0CC5BCB2D4E64 *v10;
  id v11;
  __int16 v12;
  NSObject *v13;
  _ATXTimeHistogram *v14;
  char v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_ATXTimeHistogram;
  v5 = -[_ATXTimeHistogram init](&v17, sel_init);
  if (!v5)
  {
LABEL_15:
    v14 = v5;
    goto LABEL_16;
  }
  v6 = (void *)MEMORY[0x1CAA48B6C]();
  v5->_count = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("count"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entries"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  count = v5->_count;
  if (v8 == 16 * count)
  {
    if (v7)
    {
      v10 = ($B0AFA044FEED82C75CE0CC5BCB2D4E64 *)malloc_type_calloc(count, 0x10uLL, 0x100004099076E91uLL);
      v5->_entries = v10;
      v11 = objc_retainAutorelease(v7);
      memcpy(v10, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("bucketCount")))
      v12 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("bucketCount"));
    else
      v12 = 200;
    v5->_bucketCount = v12;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("applyFilter")))
      v15 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("applyFilter"));
    else
      v15 = 1;
    v5->_applyFilter = v15;

    objc_autoreleasePoolPop(v6);
    goto LABEL_15;
  }
  __atxlog_handle_default();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[_ATXTimeHistogram initWithCoder:].cold.1(v13);

  objc_autoreleasePoolPop(v6);
  v14 = 0;
LABEL_16:

  return v14;
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
  objc_msgSend(v5, "encodeInt32:forKey:", self->_bucketCount, CFSTR("bucketCount"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_applyFilter, CFSTR("applyFilter"));

}

- (BOOL)applyFilter
{
  return self->_applyFilter;
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "invalid input for bucket_t in initWithCoder", v1, 2u);
}

@end
