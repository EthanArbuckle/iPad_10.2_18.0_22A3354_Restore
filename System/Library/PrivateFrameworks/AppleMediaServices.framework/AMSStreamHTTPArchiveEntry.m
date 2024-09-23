@implementation AMSStreamHTTPArchiveEntry

- (AMSStreamHTTPArchiveEntry)initWithEntries:(id)a3
{
  id v4;
  AMSStreamHTTPArchiveEntry *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *entries;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AMSStreamHTTPArchiveEntry;
  v5 = -[AMSStreamHTTPArchiveEntry init](&v25, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v4;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x18D78A1C4]();
          if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v12))
          {
            objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v12, 0, 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v15 = v14;
              objc_msgSend(v14, "ams_compressedData");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
                objc_msgSend(v6, "addObject:", v16);

            }
          }
          objc_autoreleasePoolPop(v13);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);
    }

    v17 = objc_msgSend(v6, "copy");
    entries = v5->_entries;
    v5->_entries = (NSArray *)v17;

    v4 = v20;
  }

  return v5;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (AMSStreamHTTPArchiveEntry)initWithHTTPArchiveTaskInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *urlString;
  AMSStreamHTTPArchiveEntry *v16;

  v4 = a3;
  objc_msgSend(v4, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "HTTPBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSStreamHTTPArchiveEntry _createEntriesForTaskMetrics:requestData:responseData:](AMSStreamHTTPArchiveEntry, "_createEntriesForTaskMetrics:requestData:responseData:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "transactionMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  urlString = self->_urlString;
  self->_urlString = v14;

  v16 = -[AMSStreamHTTPArchiveEntry initWithEntries:](self, "initWithEntries:", v8);
  return v16;
}

+ (id)_createEntriesForTaskMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v33 = a4;
  v32 = a5;
  v31 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v7, "transactionMetrics");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x18D78A1C4]();
        v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        +[AMSHTTPArchive ams_generateCommentsStringForMetrics:](AMSHTTPArchive, "ams_generateCommentsStringForMetrics:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("comment"));

        +[AMSHTTPArchive ams_generateRequestDictionaryForMetrics:requestData:](AMSHTTPArchive, "ams_generateRequestDictionaryForMetrics:requestData:", v12, v33);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("request"));

        +[AMSHTTPArchive ams_generateResponseDictionaryForMetrics:responseData:](AMSHTTPArchive, "ams_generateResponseDictionaryForMetrics:responseData:", v12, v32);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("response"));

        v18 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v12, "responseEndDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "requestStartDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSinceDate:", v20);
        objc_msgSend(v18, "numberWithDouble:", v21 * 1000.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, CFSTR("time"));

        objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSHTTPArchive ams_dateFormatterForTimeZone:](AMSHTTPArchive, "ams_dateFormatterForTimeZone:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "fetchStartDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringFromDate:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "ams_setNullableObject:forKey:", v26, CFSTR("startedDateTime"));

        v27 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(v31, "addObject:", v27);

        objc_autoreleasePoolPop(v13);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v9);
  }

  v28 = (void *)objc_msgSend(v31, "copy");
  return v28;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AMSStreamHTTPArchiveEntry urlString](self, "urlString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCodingKeyUrlString"));

  -[AMSStreamHTTPArchiveEntry entries](self, "entries");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCodingKeyEntries"));

}

- (AMSStreamHTTPArchiveEntry)initWithCoder:(id)a3
{
  id v4;
  AMSStreamHTTPArchiveEntry *v5;
  uint64_t v6;
  NSString *urlString;
  uint64_t v8;
  NSArray *entries;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSStreamHTTPArchiveEntry;
  v5 = -[AMSStreamHTTPArchiveEntry init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyUrlString"));
    v6 = objc_claimAutoreleasedReturnValue();
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyEntries"));
    v8 = objc_claimAutoreleasedReturnValue();
    entries = v5->_entries;
    v5->_entries = (NSArray *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
  objc_storeStrong((id *)&self->_entries, a3);
}

- (void)setUrlString:(id)a3
{
  objc_storeStrong((id *)&self->_urlString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
