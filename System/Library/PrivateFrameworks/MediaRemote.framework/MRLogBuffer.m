@implementation MRLogBuffer

+ (id)bufferWithCapacity:(int64_t)a3 category:(id)a4 loggingPrefix:(id)a5
{
  id v7;
  id v8;
  MRLogBuffer *v9;

  v7 = a5;
  v8 = a4;
  v9 = -[MRLogBuffer initWithCapacity:category:prefix:]([MRLogBuffer alloc], "initWithCapacity:category:prefix:", a3, v8, v7);

  return v9;
}

- (MRLogBuffer)initWithCapacity:(int64_t)a3 category:(id)a4 prefix:(id)a5
{
  id v9;
  id v10;
  MRLogBuffer *v11;
  MRLogBuffer *v12;
  uint64_t v13;
  NSString *prefix;
  uint64_t v15;
  NSArray *history;
  NSDateFormatter *v17;
  NSDateFormatter *dateFormatter;
  void *v19;
  objc_super v21;

  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MRLogBuffer;
  v11 = -[MRLogBuffer init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    v11->_capacity = a3;
    objc_storeStrong((id *)&v11->_category, a4);
    v13 = objc_msgSend(v10, "copy");
    prefix = v12->_prefix;
    v12->_prefix = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    v15 = objc_claimAutoreleasedReturnValue();
    history = v12->_history;
    v12->_history = (NSArray *)v15;

    v17 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v12->_dateFormatter;
    v12->_dateFormatter = v17;

    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v12->_dateFormatter, "setLocale:", v19);

    -[NSDateFormatter setDateFormat:](v12->_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
  }

  return v12;
}

- (id)description
{
  void *v3;
  os_unfair_lock_s *p_lock;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_history;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "appendString:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        objc_msgSend(v3, "appendString:", CFSTR("\n"));
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (NSArray)history
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSArray copy](self->_history, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)log:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[MRLogBuffer log:withType:capture:](self, "log:withType:capture:", v6, 0, 1);
}

- (void)logInterpolatedString:(id)a3
{
  -[MRLogBuffer log:withType:capture:](self, "log:withType:capture:", a3, 0, 1);
}

- (void)logErrorWithInterpolatedString:(id)a3
{
  -[MRLogBuffer log:withType:capture:](self, "log:withType:capture:", a3, 16, 1);
}

- (void)logInfo:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[MRLogBuffer log:withType:capture:](self, "log:withType:capture:", v6, 1, 1);
}

- (void)logDebug:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[MRLogBuffer log:withType:capture:](self, "log:withType:capture:", v6, 2, 1);
}

- (void)logError:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[MRLogBuffer log:withType:capture:](self, "log:withType:capture:", v6, 16, 1);
}

- (void)logFault:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[MRLogBuffer log:withType:capture:](self, "log:withType:capture:", v6, 17, 1);
}

- (void)logWithoutCapture:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[MRLogBuffer log:withType:capture:](self, "log:withType:capture:", v6, 0, 0);
}

- (void)logInfoWithoutCapture:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[MRLogBuffer log:withType:capture:](self, "log:withType:capture:", v6, 1, 0);
}

- (void)logDebugWithoutCapture:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[MRLogBuffer log:withType:capture:](self, "log:withType:capture:", v6, 2, 0);
}

- (void)logErrorWithoutCapture:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[MRLogBuffer log:withType:capture:](self, "log:withType:capture:", v6, 16, 0);
}

- (void)logFaultWithoutCapture:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[MRLogBuffer log:withType:capture:](self, "log:withType:capture:", v6, 17, 0);
}

- (void)log:(id)a3 withType:(unsigned __int8)a4 capture:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  NSArray *v14;
  void *v15;
  NSDateFormatter *dateFormatter;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[MRLogBuffer prefix](self, "prefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  -[MRLogBuffer category](self, "category");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, (os_log_type_t)a4);
  if (v10)
  {
    if (v12)
    {
      -[MRLogBuffer prefix](self, "prefix");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v13;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_193827000, v11, (os_log_type_t)a4, "%@ %@", buf, 0x16u);

    }
  }
  else if (v12)
  {
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl(&dword_193827000, v11, (os_log_type_t)a4, "%@", buf, 0xCu);
  }

  if (v5 && -[MRLogBuffer capacity](self, "capacity") >= 1)
  {
    os_unfair_lock_lock(&self->_lock);
    v14 = self->_history;
    v15 = (void *)MEMORY[0x1E0CB3940];
    dateFormatter = self->_dateFormatter;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ %@"), v18, v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v14, "addObject:", v19);

    v20 = -[NSArray count](v14, "count");
    if (v20 > -[MRLogBuffer capacity](self, "capacity"))
      -[NSArray removeObjectAtIndex:](v14, "removeObjectAtIndex:", 0);
    os_unfair_lock_unlock(&self->_lock);

  }
}

- (void)setHistory:(id)a3
{
  objc_storeStrong((id *)&self->_history, a3);
}

- (int64_t)capacity
{
  return self->_capacity;
}

- (OS_os_log)category
{
  return self->_category;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_history, 0);
}

@end
