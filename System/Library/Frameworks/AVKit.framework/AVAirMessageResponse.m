@implementation AVAirMessageResponse

- (AVAirMessageResponse)initWithStatus:(int64_t)a3 localizedDescription:(id)a4
{
  id v6;
  AVAirMessageResponse *v7;
  AVAirMessageResponse *v8;
  uint64_t v9;
  NSString *localizedDescription;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVAirMessageResponse;
  v7 = -[AVAirMessageResponse init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_status = a3;
    v9 = objc_msgSend(v6, "copy");
    localizedDescription = v8->_localizedDescription;
    v8->_localizedDescription = (NSString *)v9;

  }
  return v8;
}

- (id)headersForContentLength:(int64_t)a3 compression:(id)a4
{
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("length");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = (__CFString *)a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("none");
  if (v7)
    v11 = v7;
  v20[0] = v9;
  v20[1] = v11;
  v19[1] = CFSTR("compression");
  v19[2] = CFSTR("response-status");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AVAirMessageResponse status](self, "status"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v13;
  v19[3] = CFSTR("response-description");
  -[AVAirMessageResponse localizedDescription](self, "localizedDescription");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = &stru_1E5BB5F88;
  if (v14)
    v16 = (const __CFString *)v14;
  v20[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AVAirMessageResponse status](self, "status");
  -[AVAirMessageResponse localizedDescription](self, "localizedDescription");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_1E5BB5F88;
  if (v7)
    v9 = (const __CFString *)v7;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ status %ld; \"%@\"), v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)bodyData
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AVAirMessageResponse status](self, "status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("description");
  v18[0] = v3;
  -[AVAirMessageResponse localizedDescription](self, "localizedDescription");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E5BB5F88;
  if (v4)
    v6 = (const __CFString *)v4;
  v18[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 4, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (!v8)
  {
    _avairlog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[AVAirMessageResponse bodyData]";
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, "%s failed to serialize response body: %{public}@", buf, 0x16u);
    }

  }
  return v8;
}

- (id)messageDataRepresentation
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[AVAirMessageResponse bodyData](self, "bodyData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAirMessageResponse headersForContentLength:compression:](self, "headersForContentLength:compression:", objc_msgSend(v19, "length"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", CFSTR("AVKitAirResponse/1"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@:%@"), v10, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("\n\n"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "dataUsingEncoding:", 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  if (objc_msgSend(v19, "length"))
    objc_msgSend(v17, "appendData:", v19);

  return v17;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
}

+ (id)messageWithVersion:(id)a3 headers:(id)a4 bodyData:(id)a5
{
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  AVAirMessageResponse *v13;
  int v15;
  const char *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  _avairlog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "+[AVAirMessageResponse messageWithVersion:headers:bodyData:]";
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s response received: %{public}@", (uint8_t *)&v15, 0x16u);
  }

  if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("AVKitAirResponse/1")) & 1) != 0)
  {
    -[__CFString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("response-status"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = -[NSObject integerValue](v9, "integerValue");
      -[__CFString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("response-description"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = -[AVAirMessageResponse initWithStatus:localizedDescription:]([AVAirMessageResponse alloc], "initWithStatus:localizedDescription:", v11, v12);
    }
    else
    {
      _avairlog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315394;
        v16 = "+[AVAirMessageResponse messageWithVersion:headers:bodyData:]";
        v17 = 2114;
        v18 = CFSTR("response-status");
        _os_log_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_DEFAULT, "%s response is invalid: the %{public}@ header is missing", (uint8_t *)&v15, 0x16u);
      }
      v13 = 0;
    }

  }
  else
  {
    _avairlog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315650;
      v16 = "+[AVAirMessageResponse messageWithVersion:headers:bodyData:]";
      v17 = 2114;
      v18 = v6;
      v19 = 2114;
      v20 = CFSTR("AVKitAirResponse/1");
      _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, "%s response version seems incorrect; have '%{public}@' but expecting '%{public}@'",
        (uint8_t *)&v15,
        0x20u);
    }
    v13 = 0;
  }

  return v13;
}

+ (id)responseWithParts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isIncomplete"))
  {
    objc_msgSend(v4, "rawBodyData");

  }
  objc_msgSend(v4, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueHeaders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawBodyData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "messageWithVersion:headers:bodyData:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
