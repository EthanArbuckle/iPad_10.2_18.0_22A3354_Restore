@implementation __CFN_TaskMetrics

- (void)nextTransaction:(void *)a3 withNewRequest:
{
  const char *v5;
  _QWORD *v6;
  CFAbsoluteTime Current;
  __CFN_TransactionMetrics *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSUUID *UUID;
  int64x2_t v15;
  void *v16;
  __CFN_TransactionMetrics *v17;
  id v18;
  NSURLRequest *request;
  NSURLRequest *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSUUID *v27;
  NSUUID *v28;
  NSObject *v29;
  NSUUID *v30;
  NSUUID *v31;
  os_signpost_id_t v32;
  NSObject *v33;
  NSObject *v34;
  int v35;
  uint64_t v36;
  SEL v37;
  BOOL v38;
  id v39;
  _BYTE v40[18];
  __int16 v41;
  int v42;
  __int16 v43;
  _QWORD *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  uint64_t v48;
  _QWORD v49[2];
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  v39 = a3;
  if (!a1)
    goto LABEL_28;
  if (a2 == 2 && *(_BYTE *)(a1 + 13))
  {
    *(_BYTE *)(a1 + 13) = 0;
    goto LABEL_28;
  }
  v6 = objc_getProperty((id)a1, v5, 96, 1);
  -[__CFN_TransactionMetrics end:taskMetrics:]((uint64_t)v6, a2, (void *)a1);
  Current = CFAbsoluteTimeGetCurrent();
  v8 = [__CFN_TransactionMetrics alloc];
  v9 = (void *)objc_msgSend(v39, "copy");
  v10 = v9;
  if (!v9)
  {
    if (v6)
      v11 = (void *)v6[7];
    else
      v11 = 0;
    v10 = v11;
  }
  v12 = v10;
  if (v8)
  {
    *(_QWORD *)v40 = v8;
    *(_QWORD *)&v40[8] = __CFN_TransactionMetrics;
    v8 = (__CFN_TransactionMetrics *)objc_msgSendSuper2((objc_super *)v40, sel_init);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v13 = objc_claimAutoreleasedReturnValue();
      UUID = v8->_UUID;
      v8->_UUID = (NSUUID *)v13;

      objc_storeStrong((id *)&v8->_request, v10);
      v15 = vdupq_n_s64(0x7FF8000000000000uLL);
      *(int64x2_t *)&v8->_beginTime = v15;
      *(int64x2_t *)&v8->_cacheLookupBeginTime = v15;
      *(int64x2_t *)&v8->_requestBeginTime = v15;
      *(int64x2_t *)&v8->_responseBeginTime = v15;
      v8->_reusedAfterTime = NAN;
    }
  }

  if (!v9)
  if (v8)
  {
    v8->_beginTime = Current;
    v8->_options = *(_QWORD *)(a1 + 72);
    v8->_schedulingTier = *(_QWORD *)(a1 + 88);
    v8->_pidForHAR = *(_DWORD *)(a1 + 16);
    v16 = *(void **)(a1 + 24);
    v17 = v8;
    v18 = v16;
    if (HARLoggingEnabled(v8->_pidForHAR))
    {
      request = v17->_request;
LABEL_17:
      v20 = request;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURLRequest URL](v20, "URL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "absoluteString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("url"));

      -[NSURLRequest HTTPMethod](v20, "HTTPMethod");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("method"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSURLRequest attribution](v20, "attribution"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, CFSTR("attribution"));

      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v21, 0, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = 0;
      v50[1] = 0;
      objc_msgSend(v18, "getUUIDBytes:", v50);
      v49[0] = 0;
      v49[1] = 0;
      if (v8)
        v27 = v8->_UUID;
      else
        v27 = 0;
      v28 = v27;
      -[NSUUID getUUIDBytes:](v28, "getUUIDBytes:", v49);

      instrumentsTransactionLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (v8)
        v30 = v8->_UUID;
      else
        v30 = 0;
      v31 = v30;
      v32 = os_signpost_id_make_with_pointer(v29, v31);

      instrumentsTransactionLog();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        v35 = objc_msgSend(v26, "length");
        v36 = objc_msgSend(objc_retainAutorelease(v26), "bytes");
        *(_QWORD *)v40 = 0x1004120602;
        *(_WORD *)&v40[8] = 2098;
        *(_QWORD *)&v40[10] = v49;
        v41 = 1042;
        v42 = 16;
        v43 = 2098;
        v44 = v50;
        v45 = 1040;
        v46 = v35;
        v47 = 2082;
        v48 = v36;
        _os_signpost_emit_with_name_impl(&dword_183ECA000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v32, "Transaction", "UUID: %{public,uuid_t}.16P, Task UUID: %{public,uuid_t}.16P, Additional Info: %{public,xcode:data}.*s", v40, 0x32u);
      }

    }
  }
  else
  {
    v18 = *(id *)(a1 + 24);
    v38 = HARLoggingEnabled(0);
    request = 0;
    if (v38)
      goto LABEL_17;
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= 0x14)
    objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", 0);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  objc_setProperty_atomic((id)a1, v37, v8, 96);

LABEL_28:
}

- (char)initWithTask:(char *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v18;

  v3 = a2;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)__CFN_TaskMetrics;
    a1 = (char *)objc_msgSendSuper2(&v18, sel_init);
    if (a1)
    {
      objc_msgSend(v3, "_uniqueIdentifier");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)*((_QWORD *)a1 + 3);
      *((_QWORD *)a1 + 3) = v4;

      *((_QWORD *)a1 + 4) = objc_msgSend(v3, "taskIdentifier");
      v6 = v3;
      objc_opt_self();
      objc_msgSend(v6, "_effectiveConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "_timingDataOptions");
      if (+[NSURLConnection _collectsTimingData](NSURLConnection, "_collectsTimingData"))
      {
        v9 = +[NSURLConnection _timingDataOptions](NSURLConnection, "_timingDataOptions");
        v8 |= ((2
              * +[NSURLConnection _timingDataOptions](NSURLConnection, "_timingDataOptions")) & 4 | (2 * (v9 & 1))) ^ 6;
      }

      *((_QWORD *)a1 + 9) = v8;
      *((_QWORD *)a1 + 11) = 1;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)*((_QWORD *)a1 + 5);
      *((_QWORD *)a1 + 5) = v10;

      objc_msgSend(v6, "startTime");
      *((_QWORD *)a1 + 6) = v12;
      *(int64x2_t *)(a1 + 56) = vdupq_n_s64(0x7FF8000000000000uLL);
      objc_msgSend(v6, "_effectiveConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_sourceApplicationBundleIdentifier");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)*((_QWORD *)a1 + 10);
      *((_QWORD *)a1 + 10) = v14;

      objc_msgSend(v6, "_effectiveConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *((_DWORD *)a1 + 4) = objc_msgSend(v16, "_pidForHAR");

      *((_DWORD *)a1 + 2) = 0;
    }
  }

  return a1;
}

- (void)completeWithError:(uint64_t)a1
{
  const char *v3;
  id Property;
  uint64_t v5;
  int v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  _BOOL4 v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = a2;
  if (a1)
  {
    Property = objc_getProperty((id)a1, v3, 96, 1);
    if (v20)
      v5 = 1024;
    else
      v5 = 1;
    -[__CFN_TransactionMetrics end:taskMetrics:]((uint64_t)Property, v5, (void *)a1);
    *(CFAbsoluteTime *)(a1 + 64) = CFAbsoluteTimeGetCurrent();
    v6 = *(_DWORD *)(a1 + 16);
    v7 = *(id *)(a1 + 24);
    v8 = v20;
    if (HARLoggingEnabled(v6))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "domain");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("domain"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "code"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("code"));

        objc_msgSend(v8, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("localizedDescription"));

        objc_msgSend(v8, "description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("description"));

        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("error"));
      }
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v9, 0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      instrumentsTaskLog();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_signpost_id_make_with_pointer(v16, v7);

      instrumentsTaskLog();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_DWORD *)buf = 67109634;
        v22 = v20 == 0;
        v23 = 1040;
        v24 = objc_msgSend(v15, "length");
        v25 = 2082;
        v26 = objc_msgSend(objc_retainAutorelease(v15), "bytes");
        _os_signpost_emit_with_name_impl(&dword_183ECA000, v19, OS_SIGNPOST_EVENT, v17, "Task Completed", "Succeeded: %{BOOL}d, Additional Info: %{public,xcode:data}.*s", buf, 0x18u);
      }

    }
  }

}

- (void)lockTransactionMetrics:(uint64_t)a1
{
  void (**v3)(id, _QWORD);
  void (**v4)(id, _QWORD);

  v3 = a2;
  if (a1)
  {
    v4 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v4[2](v4, *(_QWORD *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    v3 = v4;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransactionMetrics, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionMetrics, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (__CFN_TaskMetrics)initWithCoder:(id)a3
{
  id v4;
  __CFN_TaskMetrics *v5;
  uint64_t v6;
  NSUUID *UUID;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableArray *transactionMetrics;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  __CFN_TransactionMetrics *currentTransactionMetrics;
  __CFN_TaskMetrics *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)__CFN_TaskMetrics;
  v5 = -[__CFN_TaskMetrics init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    v5->_identifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("identifier"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("transactionMetrics"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "mutableCopy");
    transactionMetrics = v5->_transactionMetrics;
    v5->_transactionMetrics = (NSMutableArray *)v12;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_14:
      v23 = 0;
      goto LABEL_15;
    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = v5->_transactionMetrics;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v26;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_14;
          }
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v15)
          continue;
        break;
      }
    }

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("createTime"));
    v5->_createTime = v18;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("firstResumeTime"));
    v5->_firstResumeTime = v19;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("completeTime"));
    v5->_completeTime = v20;
    v5->_options = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("options"));
    -[NSMutableArray lastObject](v5->_transactionMetrics, "lastObject");
    v21 = objc_claimAutoreleasedReturnValue();
    currentTransactionMetrics = v5->_currentTransactionMetrics;
    v5->_currentTransactionMetrics = (__CFN_TransactionMetrics *)v21;

  }
  v23 = v5;
LABEL_15:

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_UUID, CFSTR("UUID"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_identifier, CFSTR("identifier"));
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionMetrics, CFSTR("transactionMetrics"));
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("createTime"), self->_createTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("firstResumeTime"), self->_firstResumeTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("completeTime"), self->_completeTime);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_options, CFSTR("options"));

}

- (__CFN_TransactionMetrics)_daemon_currentTransactionMetrics
{
  if (self)
    self = (__CFN_TaskMetrics *)objc_getProperty(self, a2, 96, 1);
  return (__CFN_TransactionMetrics *)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSMutableArray)_daemon_transactionMetrics
{
  return self->_transactionMetrics;
}

@end
