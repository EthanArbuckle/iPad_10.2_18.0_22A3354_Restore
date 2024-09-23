@implementation CDRecentServiceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceInfo, 0);
}

- (NSDictionary)serviceInfo
{
  return self->_serviceInfo;
}

- (id)nonPurgeableAmount
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->recentinfo.non_purgeable_amount);
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0CB38B0];
  -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "dataWithPropertyList:format:options:error:", v4, 200, 0, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", objc_msgSend(v5, "length") + 72);
  objc_msgSend(v6, "appendBytes:length:", &self->recentinfo, 72);
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  v8 = (void *)objc_msgSend(v6, "copy");

  return v8;
}

- (CDRecentServiceInfo)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CDRecentServiceInfo;
  v5 = -[CDRecentServiceInfo init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CACHE_DELETE_SERVICE_INFO"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "length") >= 0x48)
    {
      v7 = objc_retainAutorelease(v6);
      v8 = objc_msgSend(v7, "bytes");
      *(_OWORD *)(v5 + 8) = *(_OWORD *)v8;
      v10 = *(_OWORD *)(v8 + 32);
      v9 = *(_OWORD *)(v8 + 48);
      v11 = *(_QWORD *)(v8 + 64);
      *(_OWORD *)(v5 + 24) = *(_OWORD *)(v8 + 16);
      *((_QWORD *)v5 + 9) = v11;
      *(_OWORD *)(v5 + 56) = v9;
      *(_OWORD *)(v5 + 40) = v10;
      if ((unint64_t)objc_msgSend(v7, "length") >= 0x49)
      {
        v12 = objc_msgSend(v7, "length") - 72;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", objc_msgSend(objc_retainAutorelease(v7), "bytes") + 72, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v13, 0, 0, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setServiceInfo:", v14);

      }
    }

  }
  return (CDRecentServiceInfo *)v5;
}

- (void)setServiceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_serviceInfo, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CDRecentServiceInfo serialize](self, "serialize");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CACHE_DELETE_SERVICE_INFO"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CDRecentServiceInfo *v4;
  $C140E3A606D9645FEAC1A095AC7A3D5E v5;
  $C140E3A606D9645FEAC1A095AC7A3D5E v6;
  unint64_t non_purgeable_amount;
  void *v8;
  void *v9;

  v4 = objc_alloc_init(CDRecentServiceInfo);
  v4->recentinfo.urgencies[0] = self->recentinfo.urgencies[0];
  v5 = self->recentinfo.urgencies[2];
  v6 = self->recentinfo.urgencies[3];
  non_purgeable_amount = self->recentinfo.non_purgeable_amount;
  v4->recentinfo.urgencies[1] = self->recentinfo.urgencies[1];
  v4->recentinfo.non_purgeable_amount = non_purgeable_amount;
  v4->recentinfo.urgencies[3] = v6;
  v4->recentinfo.urgencies[2] = v5;
  -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[CDRecentServiceInfo setServiceInfo:](v4, "setServiceInfo:", v9);

  return v4;
}

- (BOOL)updateAmount:(id)a3 atUrgency:(int)a4 withTimestamp:(double)a5 nonPurgeableAmount:(id)a6 deductFromCurrentAmount:(BOOL)a7 info:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  int v16;
  uint64_t v17;
  BOOL v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  char *v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSDictionary *v28;
  NSDictionary *serviceInfo;
  void *v30;

  v9 = a7;
  v14 = a3;
  v15 = a6;
  -[CDRecentServiceInfo updateInfo:](self, "updateInfo:", a8);
  if ((a4 - 5) >= 0xFFFFFFFC)
    v16 = a4 - 1;
  else
    v16 = 2;
  v17 = objc_msgSend(v14, "unsignedLongLongValue");
  if (v9)
  {
    v18 = v17 != 0;
    v19 = (char *)self + 16 * v16;
    v20 = v16;
    v22 = *((_QWORD *)v19 + 2);
    v21 = v19 + 16;
    if (v22 <= objc_msgSend(v14, "unsignedLongLongValue"))
      *v21 = 0;
    else
      *v21 -= objc_msgSend(v14, "unsignedLongLongValue");
  }
  else
  {
    v23 = (char *)self + 16 * v16;
    v20 = v16;
    v25 = *((_QWORD *)v23 + 2);
    v24 = v23 + 16;
    if (v17 == v25)
    {
      v18 = 0;
    }
    else
    {
      *v24 = objc_msgSend(v14, "unsignedLongLongValue");
      v18 = 1;
    }
  }
  self->recentinfo.urgencies[v20].timestamp = a5;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self->recentinfo.non_purgeable_amount = objc_msgSend(v15, "unsignedLongLongValue");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v26, "mutableCopy");

        objc_msgSend(v27, "setObject:forKeyedSubscript:", v15, CFSTR("CACHE_DELETE_ITEMIZED_NONPURGEABLE"));
        v28 = (NSDictionary *)objc_msgSend(v27, "copy");
        serviceInfo = self->_serviceInfo;
        self->_serviceInfo = v28;

        tallyDict(v15);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        self->recentinfo.non_purgeable_amount = objc_msgSend(v30, "unsignedLongLongValue");

      }
    }
  }

  return v18;
}

- (void)updateInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    if (!v6)
      v6 = (void *)objc_opt_new();
    -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_SIGNING_ID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_SIGNING_ID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
LABEL_7:
        -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
        v9 = objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_PROCNAME"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {

        }
        else
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_PROCNAME"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
            goto LABEL_10;
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_PROCNAME"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("CACHE_DELETE_PROCNAME"));

          v18 = (void *)objc_msgSend(v6, "copy");
          -[CDRecentServiceInfo setServiceInfo:](self, "setServiceInfo:", v18);

          CDGetLogHandle((uint64_t)"client");
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_PROCNAME"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = 138412290;
            v22 = v20;
            _os_log_impl(&dword_1A3662000, v9, OS_LOG_TYPE_DEFAULT, "CDRecentServiceInfo updated procname: %@", (uint8_t *)&v21, 0xCu);

          }
        }

LABEL_10:
        goto LABEL_11;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_SIGNING_ID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("CACHE_DELETE_SIGNING_ID"));

      v13 = (void *)objc_msgSend(v6, "copy");
      -[CDRecentServiceInfo setServiceInfo:](self, "setServiceInfo:", v13);

      CDGetLogHandle((uint64_t)"client");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_SIGNING_ID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        v22 = v15;
        _os_log_impl(&dword_1A3662000, v7, OS_LOG_TYPE_DEFAULT, "CDRecentServiceInfo updated signingID: %@", (uint8_t *)&v21, 0xCu);

      }
    }

    goto LABEL_7;
  }
LABEL_11:

}

- (BOOL)validate:(double)a3 atUrgency:(int)a4
{
  int v5;
  void *v6;
  BOOL v7;

  v5 = a4 - 1;
  if ((a4 - 5) < 0xFFFFFFFC)
    v5 = 2;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->recentinfo.urgencies[v5].timestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = validateTimestamp(v6, a3);

  return v7;
}

- (CDRecentServiceInfo)initWithAmount:(id)a3 atUrgency:(int)a4 withTimestamp:(double)a5 nonPurgeableAmount:(id)a6 info:(id)a7
{
  id v12;
  id v13;
  id v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  CDRecentServiceInfo *v21;
  char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int16 v27;
  objc_super v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v28.receiver = self;
  v28.super_class = (Class)CDRecentServiceInfo;
  v15 = -[CDRecentServiceInfo init](&v28, sel_init);
  v16 = v15;
  if (!v15)
  {
LABEL_19:
    v21 = v16;
    goto LABEL_20;
  }
  if (v12 && a4)
  {
    *(_OWORD *)(v15 + 8) = 0u;
    v17 = v15 + 8;
    *((_QWORD *)v15 + 9) = 0;
    *(_OWORD *)(v15 + 40) = 0u;
    *(_OWORD *)(v15 + 56) = 0u;
    if ((a4 - 5) >= 0xFFFFFFFC)
      v18 = a4 - 1;
    else
      v18 = 2;
    *(_OWORD *)(v15 + 24) = 0uLL;
    if (objc_msgSend(v12, "longLongValue") < 0)
      v19 = 0;
    else
      v19 = objc_msgSend(v12, "unsignedLongLongValue");
    v22 = &v17[16 * v18];
    *((_QWORD *)v22 + 1) = v19;
    *(double *)v22 = a5;
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16[9] = objc_msgSend(v13, "unsignedLongLongValue");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v29 = CFSTR("CACHE_DELETE_ITEMIZED_NONPURGEABLE");
          v30[0] = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)v16[10];
          v16[10] = v23;

          tallyDict(v13);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v16[9] = objc_msgSend(v25, "unsignedLongLongValue");

        }
      }
    }
    objc_msgSend(v16, "updateInfo:", v14);
    goto LABEL_19;
  }
  CDGetLogHandle((uint64_t)"client");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v27 = 0;
    _os_log_error_impl(&dword_1A3662000, v20, OS_LOG_TYPE_ERROR, "parameter error, must supply amount and urgency", (uint8_t *)&v27, 2u);
  }

  v21 = 0;
LABEL_20:

  return v21;
}

+ (id)CDRecentServiceInfo:(id)a3 atUrgency:(int)a4 withTimestamp:(double)a5 nonPurgeableAmount:(id)a6 info:(id)a7
{
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  CDRecentServiceInfo *v14;

  v9 = *(_QWORD *)&a4;
  v11 = a7;
  v12 = a6;
  v13 = a3;
  v14 = -[CDRecentServiceInfo initWithAmount:atUrgency:withTimestamp:nonPurgeableAmount:info:]([CDRecentServiceInfo alloc], "initWithAmount:atUrgency:withTimestamp:nonPurgeableAmount:info:", v13, v9, v12, v11, a5);

  return v14;
}

- (id)amountAtUrgency:(int)a3 checkTimestamp:(BOOL)a4
{
  int v4;
  $8403044BF4D4EBAB187FDB7627DBD7F9 *p_recentinfo;
  double *p_timestamp;
  int v7;
  $C140E3A606D9645FEAC1A095AC7A3D5E *v8;
  unint64_t v9;
  unint64_t *p_amount;
  unint64_t amount;
  _BOOL4 v13;
  void *v14;

  if ((a3 - 5) >= 0xFFFFFFFC)
    v4 = a3 - 1;
  else
    v4 = 2;
  p_recentinfo = &self->recentinfo;
  p_timestamp = &self->recentinfo.urgencies[v4].timestamp;
  if (*p_timestamp == 0.0)
    goto LABEL_15;
  v7 = v4;
  v8 = &p_recentinfo->urgencies[v4];
  amount = v8->amount;
  p_amount = &v8->amount;
  v9 = amount;
  if (*p_timestamp == 1.0 && v9 == 0)
    goto LABEL_15;
  v13 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 >= 2
    && v13
    && v14
    && *p_timestamp < p_recentinfo->urgencies[v7 - 1].timestamp
    && *p_amount < p_recentinfo->urgencies[v7 - 1].amount)
  {

LABEL_15:
    v14 = 0;
  }
  return v14;
}

- (BOOL)isEmpty
{
  unint64_t v3;
  $C140E3A606D9645FEAC1A095AC7A3D5E *v4;
  unint64_t v5;
  double timestamp;

  if (self->recentinfo.urgencies[0].timestamp > 0.0)
    return 0;
  v3 = 0;
  v4 = &self->recentinfo.urgencies[1];
  do
  {
    v5 = v3;
    if (v3 == 3)
      break;
    timestamp = v4->timestamp;
    ++v4;
    ++v3;
  }
  while (timestamp <= 0.0);
  return v5 > 2;
}

- (void)invalidate
{
  uint64_t i;

  for (i = 0; i != 4; ++i)
    self->recentinfo.urgencies[i].timestamp = 1.0;
}

- (void)log
{
  uint64_t v2;
  unint64_t *p_amount;
  NSObject *v4;
  unint64_t v5;
  void *v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  unint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v2 = 0;
  v13 = *MEMORY[0x1E0C80C00];
  p_amount = &self->recentinfo.urgencies[0].amount;
  do
  {
    CDGetLogHandle((uint64_t)"client");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *p_amount;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *((double *)p_amount - 1));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      v8 = v2;
      v9 = 2048;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEFAULT, "     urgency %d, amount : %llu, timestamp: %@", buf, 0x1Cu);

    }
    ++v2;
    p_amount += 2;
  }
  while (v2 != 4);
}

- (id)description
{
  void *v2;
  void *v4;
  unint64_t *p_amount;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  p_amount = &self->recentinfo.urgencies[0].amount;
  v6 = -4;
  do
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = *p_amount;
    v9 = (unint64_t)*((double *)p_amount - 1);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v2;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v7, "stringWithFormat:", CFSTR("u:%d : %llu : %@"), v6 + 5, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

    if (v9)
    p_amount += 2;
  }
  while (!__CFADD__(v6++, 1));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1E0CB3940];
        -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ : %@"), v17, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v21);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

@end
