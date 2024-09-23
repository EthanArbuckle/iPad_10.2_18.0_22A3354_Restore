@implementation DDScannerResult

+ (id)resultFromCoreResult:(__DDResult *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCoreResult:", a3);
}

- (DDScannerResult)initWithCoreResult:(__DDResult *)a3
{
  DDScannerResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DDScannerResult;
  v4 = -[DDScannerResult init](&v6, sel_init);
  if (!v4)
    goto LABEL_4;
  if (a3)
  {
    v4->_coreResult = (__DDResult *)CFRetain(a3);
LABEL_4:
    a3 = v4;
  }

  return (DDScannerResult *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedURL, 0);
  objc_storeStrong((id *)&self->_subResultsCache, 0);
}

- (void)dealloc
{
  __DDResult *coreResult;
  objc_super v4;

  coreResult = self->_coreResult;
  if (coreResult)
    CFRelease(coreResult);
  v4.receiver = self;
  v4.super_class = (Class)DDScannerResult;
  -[DDScannerResult dealloc](&v4, sel_dealloc);
}

- (NSString)type
{
  return &self->_coreResult->var5->isa;
}

- (__DDResult)coreResult
{
  return self->_coreResult;
}

- (DDScannerResult)init
{
  DDScannerResult *v2;
  CFTypeID v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DDScannerResult;
  v2 = -[DDScannerResult init](&v5, sel_init);
  if (v2)
  {
    v3 = DDTypeRegister(&DDResultGetTypeID_typeID);
    v2->_coreResult = (__DDResult *)DDTypeCreateInstance_(0, v3, 0x60uLL);
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  DDCrash(CFSTR("don't try to copy results"), a2, a3);
  return 0;
}

- (_NSRange)urlificationRange
{
  NSUInteger RangeForURLification;
  NSUInteger v3;
  _NSRange result;

  RangeForURLification = DDResultGetRangeForURLification((uint64_t)self->_coreResult);
  result.length = v3;
  result.location = RangeForURLification;
  return result;
}

- (int)category
{
  return DDResultGetCategory((uint64_t)self->_coreResult);
}

- (_NSRange)range
{
  __DDResult *coreResult;
  NSUInteger var0;
  NSUInteger var1;
  _NSRange result;

  coreResult = self->_coreResult;
  var0 = coreResult->var2.var0;
  var1 = coreResult->var2.var1;
  result.length = var1;
  result.location = var0;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_coreResult->var2 = ($0AC6E346AE4835514AAA8AC86D8F4844)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)cfRange
{
  __DDResult *coreResult;
  int64_t var0;
  int64_t var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  coreResult = self->_coreResult;
  var0 = coreResult->var2.var0;
  var1 = coreResult->var2.var1;
  result.var1 = var1;
  result.var0 = var0;
  return result;
}

- (int64_t)score
{
  return self->_coreResult->var3;
}

- (BOOL)typeIs:(__CFString *)a3
{
  __DDResult *coreResult;
  BOOL v4;

  coreResult = self->_coreResult;
  if (coreResult)
    v4 = a3 == 0;
  else
    v4 = 1;
  return !v4 && _typesAreEqual(coreResult->var5, a3);
}

- (void)setType:(id)a3
{
  DDResultSetType((uint64_t)self->_coreResult, a3);
}

- (NSString)value
{
  __DDResult *coreResult;
  NSString *result;

  coreResult = self->_coreResult;
  if (!coreResult)
    return 0;
  result = (NSString *)coreResult->var7;
  if (!result)
    return &coreResult->var6->isa;
  return result;
}

- (id)rawValue
{
  __DDResult *coreResult;

  coreResult = self->_coreResult;
  if (coreResult)
    return coreResult->var7;
  else
    return 0;
}

- (id)location
{
  return 0;
}

- (id)contextualData
{
  __DDResult *coreResult;

  coreResult = self->_coreResult;
  if (coreResult)
    return coreResult->var8;
  else
    return 0;
}

- (NSString)matchedString
{
  __DDResult *coreResult;

  coreResult = self->_coreResult;
  if (coreResult)
    return &coreResult->var6->isa;
  else
    return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSRange v9;
  NSRange v10;

  -[DDScannerResult type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  if (v3)
  {
    -[DDScannerResult type](self, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9.location = -[DDScannerResult range](self, "range");
    NSStringFromRange(v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<Result:%@:%@>"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.location = -[DDScannerResult range](self, "range");
    NSStringFromRange(v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<Result:%@>"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[DDScannerResult type](self, "type"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "type"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqual:", v6),
        v6,
        v5,
        v7))
  {
    v8 = -[DDScannerResult range](self, "range");
    v10 = v9;
    v12 = 0;
    if (v8 == objc_msgSend(v4, "range") && v10 == v11)
    {
      -[DDScannerResult subResults](self, "subResults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "subResults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v13, "isEqual:", v14);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)subResults
{
  NSArray *subResultsCache;
  __CFArray *var4;
  id v5;
  NSArray *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex i;
  DDScannerResult *v10;
  NSArray *v11;

  subResultsCache = self->_subResultsCache;
  if (!subResultsCache)
  {
    var4 = self->_coreResult->var4;
    v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
    if (var4)
    {
      v6 = (NSArray *)objc_msgSend(v5, "initWithCapacity:", CFArrayGetCount(var4));
      Count = CFArrayGetCount(var4);
      if (Count >= 1)
      {
        v8 = Count;
        for (i = 0; i != v8; ++i)
        {
          v10 = -[DDScannerResult initWithCoreResult:]([DDScannerResult alloc], "initWithCoreResult:", CFArrayGetValueAtIndex(var4, i));
          if (v10)
            -[NSArray addObject:](v6, "addObject:", v10);

        }
      }
    }
    else
    {
      v6 = (NSArray *)objc_msgSend(v5, "initWithCapacity:", 0);
    }
    v11 = self->_subResultsCache;
    self->_subResultsCache = v6;

    subResultsCache = self->_subResultsCache;
  }
  return subResultsCache;
}

- (void)setSubResults:(id)a3
{
  NSArray *v5;
  __CFArray *Mutable;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  if (self->_subResultsCache != v5)
    objc_storeStrong((id *)&self->_subResultsCache, a3);
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        CFArrayAppendValue(Mutable, (const void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "coreResult", (_QWORD)v12));
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  DDResultSetSubResults((uint64_t)self->_coreResult, Mutable);
  CFRelease(Mutable);

}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[DDScannerResult subResults](self, "subResults", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "type");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (double)getDuration
{
  NSObject *v2;
  uint8_t v4[16];

  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v2 = (id)DDLogHandle_error_log_handle;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_19BC07000, v2, OS_LOG_TYPE_ERROR, "Call to DDResultGetDuration is deprecated. Result will be incorrect. Please contact the DataDetectors team if you need this", v4, 2u);
  }

  return 0.0;
}

- (id)dateFromReferenceDate:(id)a3 referenceTimezone:(id)a4 timezoneRef:(id *)a5 allDayRef:(BOOL *)a6
{
  id v10;
  id v11;
  id v13;
  id v14;
  BOOL v15;

  v15 = 0;
  v13 = 0;
  v14 = 0;
  v10 = a4;
  v11 = a3;
  LODWORD(self) = DDResultCopyExtractedDateFromReferenceDate((uint64_t)-[DDScannerResult coreResult](self, "coreResult"), v11, v10, &v15, (CFDateRef *)&v14, (CFTypeRef *)&v13);

  if (!(_DWORD)self)
    goto LABEL_6;
  if (a6)
    *a6 = v15;
  if (a5)
  {
    *a5 = v13;
  }
  else
  {
LABEL_6:
    if (v13)
      CFRelease(v13);
  }
  return v14;
}

- (BOOL)extractStartDate:(id *)a3 startTimezone:(id *)a4 endDate:(id *)a5 endTimezone:(id *)a6 allDayRef:(BOOL *)a7 referenceDate:(id)a8 referenceTimezone:(id)a9
{
  id v16;
  id v17;
  int started;
  BOOL v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v23 = 0;
  v24 = 0;
  v21 = 0;
  v22 = 0;
  v20 = 0;
  v16 = a9;
  v17 = a8;
  started = DDResultCopyExtractedStartDateEndDate((uint64_t)-[DDScannerResult coreResult](self, "coreResult"), (CFDateRef *)&v24, (CFTypeRef *)&v23, (CFTypeRef *)&v22, (CFTypeRef *)&v21, &v20, v17, v16);

  if (started)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v24);
    if (a4)
      *a4 = objc_retainAutorelease(v23);
    if (a5)
      *a5 = objc_retainAutorelease(v22);
    if (a6)
      *a6 = objc_retainAutorelease(v21);
    if (a7)
      *a7 = v20;
  }
  if (v24)
    CFRelease(v24);
  if (v23)
    CFRelease(v23);
  if (v22)
    CFRelease(v22);
  if (v21)
    CFRelease(v21);
  return started != 0;
}

- (BOOL)getPhoneValue:(id *)a3 label:(id *)a4
{
  __DDResult *coreResult;
  id *v7;
  CFStringRef *v8;
  int v9;
  id v11;
  id v12;

  v11 = 0;
  v12 = 0;
  coreResult = self->_coreResult;
  if (a3)
    v7 = &v12;
  else
    v7 = 0;
  if (a4)
    v8 = (CFStringRef *)&v11;
  else
    v8 = 0;
  v9 = DDResultCopyValueLabelValue((uint64_t)coreResult, (CFTypeRef *)v7, v8, 0);
  if (v12)
    *a3 = v12;
  if (v11)
    *a4 = v11;
  return v9 != 0;
}

- (BOOL)getMailValue:(id *)a3 label:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  -[DDScannerResult valueForKeyPath:](self, "valueForKeyPath:", CFSTR("Value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "matchedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    *a3 = objc_retainAutorelease(v8);
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.value"), CFSTR("Label"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDScannerResult valueForKeyPath:](self, "valueForKeyPath:", v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v8)
    v10 = objc_msgSend(v8, "length") != 0;
  else
    v10 = 0;

  return v10;
}

- (BOOL)getIMScreenNameValue:(id *)a3 type:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  -[DDScannerResult valueForKeyPath:](self, "valueForKeyPath:", CFSTR("Value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "matchedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    *a3 = objc_retainAutorelease(v8);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.value"), CFSTR("Label"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDScannerResult valueForKeyPath:](self, "valueForKeyPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    *a4 = objc_retainAutorelease(v10);
  if (v8)
  {
    v11 = 0;
    if (objc_msgSend(v8, "length") && v10)
      v11 = objc_msgSend(v10, "length") != 0;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)getStreet:(id *)a3 city:(id *)a4 state:(id *)a5 zip:(id *)a6 country:(id *)a7
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.value"), CFSTR("Street"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDScannerResult valueForKeyPath:](self, "valueForKeyPath:", v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.value"), CFSTR("City"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDScannerResult valueForKeyPath:](self, "valueForKeyPath:", v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.value"), CFSTR("ZipCode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDScannerResult valueForKeyPath:](self, "valueForKeyPath:", v15);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.value"), CFSTR("State"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDScannerResult valueForKeyPath:](self, "valueForKeyPath:", v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.value"), CFSTR("Country"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDScannerResult valueForKeyPath:](self, "valueForKeyPath:", v17);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 1;
}

- (id)_webKitPropertyListData
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3B18];
  v5 = -[DDScannerResult range](self, "range");
  objc_msgSend(v4, "valueWithRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("AR"));

  -[DDScannerResult matchedString](self, "matchedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("MS"));

  -[DDScannerResult type](self, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("T"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_coreResult->var9 & 0xFFFFFFFFFFFBFFFFLL);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("P"));

  -[DDScannerResult subResults](self, "subResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[DDScannerResult subResults](self, "subResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("SR"));

  }
  -[DDScannerResult rawValue](self, "rawValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[DDScannerResult rawValue](self, "rawValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("V"));

  }
  -[DDScannerResult contextualData](self, "contextualData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[DDScannerResult contextualData](self, "contextualData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("C"));

  }
  if (DDResultHasContextualFloat((uint64_t)self->_coreResult))
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    *(float *)&v18 = DDResultGetContextualFloat((uint64_t)self->_coreResult);
    objc_msgSend(v17, "numberWithFloat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("CF"));

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E3C9FE98, CFSTR("VN"));
  return v3;
}

- (id)_initWithWebKitPropertyListData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  DDScannerResult *v34;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AR"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && !strcmp((const char *)objc_msgSend(objc_retainAutorelease(v5), "objCType"), "{_NSRange=QQ}"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MS"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("T"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v9 = objc_opt_isKindOfClass();

      if ((v9 & 1) != 0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("P"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v11 = objc_opt_isKindOfClass();

        if ((v11 & 1) != 0)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VN"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_27;
          if (objc_msgSend(v12, "longValue") != 1)
            goto LABEL_27;
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SR"));
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SR"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v16 = objc_opt_isKindOfClass();

            if ((v16 & 1) == 0)
              goto LABEL_27;
          }
          v36 = v12;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SR"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v38;
            while (2)
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v38 != v20)
                  objc_enumerationMutation(v17);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  goto LABEL_30;
                }
                ++v21;
              }
              while (v19 != v21);
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
              if (v19)
                continue;
              break;
            }
          }

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("V"));
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v23 = (void *)v22;
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("V"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v25 = objc_opt_isKindOfClass();

            if ((v25 & 1) == 0)
            {
LABEL_30:
              v34 = 0;
              v12 = v36;
              goto LABEL_28;
            }
          }
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("C"));
          v26 = objc_claimAutoreleasedReturnValue();
          v12 = v36;
          if (v26)
          {
            v27 = (void *)v26;
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("C"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v29 = objc_opt_isKindOfClass();

            if ((v29 & 1) == 0)
              goto LABEL_27;
          }
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CF"));
          v30 = objc_claimAutoreleasedReturnValue();
          if (!v30
            || (v31 = (void *)v30,
                objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CF")),
                v32 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                v33 = objc_opt_isKindOfClass(),
                v32,
                v31,
                (v33 & 1) != 0))
          {
            self = (DDScannerResult *)-[DDScannerResult _initWithPlist:](self, "_initWithPlist:", v4);
            v34 = self;
          }
          else
          {
LABEL_27:
            v34 = 0;
          }
LABEL_28:

          goto LABEL_26;
        }
      }
    }
  }
  v34 = 0;
LABEL_26:

  return v34;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  id v20;

  v20 = a3;
  v4 = (void *)MEMORY[0x1E0CB3B18];
  v5 = -[DDScannerResult range](self, "range");
  objc_msgSend(v4, "valueWithRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v7, CFSTR("AR"));

  -[DDScannerResult matchedString](self, "matchedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v8, CFSTR("MS"));

  -[DDScannerResult type](self, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v9, CFSTR("T"));

  objc_msgSend(v20, "encodeInteger:forKey:", self->_coreResult->var9 & 0xFFFFFFFFFFFBFFFFLL, CFSTR("P"));
  -[DDScannerResult subResults](self, "subResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DDScannerResult subResults](self, "subResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v20, "encodeObject:forKey:", v12, CFSTR("SR"));

  }
  -[DDScannerResult rawValue](self, "rawValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[DDScannerResult rawValue](self, "rawValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v14, CFSTR("V"));

  }
  -[DDScannerResult contextualData](self, "contextualData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[DDScannerResult contextualData](self, "contextualData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v20, "encodeObject:forKey:", v17, CFSTR("C"));

  }
  if (DDResultHasContextualFloat((uint64_t)self->_coreResult))
  {
    *(float *)&v18 = DDResultGetContextualFloat((uint64_t)self->_coreResult);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v19, CFSTR("CF"));

  }
  objc_msgSend(v20, "encodeInteger:forKey:", 1, CFSTR("VN"));

}

- (DDScannerResult)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  DDScannerResult *v25;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithCapacity:", 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AR"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("AR"));

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MS"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("MS"));

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("T"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("T"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("P")));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("P"));

  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v13, CFSTR("SR"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("SR"));

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("V"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("V"));

  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v19, CFSTR("C"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("C"));

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CF"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("CF"));

  v22 = (void *)MEMORY[0x1E0CB37E8];
  v23 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("VN"));

  objc_msgSend(v22, "numberWithInteger:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("VN"));

  v25 = -[DDScannerResult _initWithPlist:](self, "_initWithPlist:", v6);
  return v25;
}

- (id)_initWithPlist:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)DDScannerResult;
  v5 = -[DDScannerResult init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VN"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "longValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AR"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "rangeValue");
    v11 = v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("T"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v5 + 1) = DDResultCreate(v12, v9 << 32, (unint64_t)(v9 + v11) << 32);

    v13 = *((_QWORD *)v5 + 1);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MS"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    DDResultSetMatchedString(v13, v14);

    v15 = *((_QWORD *)v5 + 1);
    *(_QWORD *)(v15 + 32) = v9;
    *(_QWORD *)(v15 + 40) = v11;
    if (v7)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("P"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*((_QWORD *)v5 + 1) + 96) = objc_msgSend(v16, "integerValue") & 0xFFFFFFFFFFFBFFFFLL;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CF"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = *((_QWORD *)v5 + 1);
      objc_msgSend(v17, "floatValue");
      if (v19)
      {
        *(_DWORD *)(v19 + 108) = v20;
        *(_BYTE *)(v19 + 104) = 1;
      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("V"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      DDResultSetValue(*((_QWORD *)v5 + 1), v21);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("C"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      DDResultSetContextualData(*((_QWORD *)v5 + 1), v22);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SR"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      objc_msgSend(v5, "setSubResults:", v23);

  }
  return v5;
}

- (void)offsetRangeBy:(int64_t)a3
{
  int64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = a3;
    v5 = -[DDScannerResult range](self, "range");
    v6 = v5;
    v8 = v7;
    v14 = 0u;
    v15 = 0u;
    if (v5 + v3 < 0 != __OFADD__(v5, v3))
      v3 = -v5;
    v16 = 0uLL;
    v17 = 0uLL;
    -[DDScannerResult subResults](self, "subResults", (_QWORD)v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "offsetRangeBy:", v3);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

    -[DDScannerResult setRange:](self, "setRange:", v3 + v6, v8);
  }
}

- (NSURL)url
{
  __CFString *v3;
  NSURL *v4;
  NSURL *cachedURL;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSURL *v18;
  NSURL *v19;
  void *v20;
  void *v21;
  void *v22;
  NSURL *v23;
  NSURL *v24;

  if (!self->_hasCachedURL)
  {
    v3 = (__CFString *)DDResultCopyExtractedURLWithOptions((uint64_t)self->_coreResult, 1);
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
      v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
      cachedURL = self->_cachedURL;
      self->_cachedURL = v4;

      if (!self->_cachedURL)
      {
        v6 = -[__CFString rangeOfString:](v3, "rangeOfString:", CFSTR("://"));
        if (v6 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v8 = v6 + v7;
          if (v6 + v7 < (unint64_t)-[__CFString length](v3, "length"))
          {
            v9 = -[__CFString rangeOfString:options:range:](v3, "rangeOfString:options:range:", CFSTR("/"), 0, v8, -[__CFString length](v3, "length") - v8);
            v11 = v9 + v10;
            if (v9 + v10 < (unint64_t)-[__CFString length](v3, "length"))
            {
              -[__CFString substringToIndex:](v3, "substringToIndex:", v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[__CFString substringFromIndex:](v3, "substringFromIndex:", v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3500], "URLFragmentAllowedCharacterSet");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "stringByAddingPercentEncodingWithAllowedCharacters:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              v16 = (void *)MEMORY[0x1E0C99E98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v12, v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "URLWithString:", v17);
              v18 = (NSURL *)objc_claimAutoreleasedReturnValue();
              v19 = self->_cachedURL;
              self->_cachedURL = v18;

            }
          }
        }
        if (!self->_cachedURL)
        {
          v20 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(MEMORY[0x1E0CB3500], "URLFragmentAllowedCharacterSet");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAddingPercentEncodingWithAllowedCharacters:](v3, "stringByAddingPercentEncodingWithAllowedCharacters:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "URLWithString:", v22);
          v23 = (NSURL *)objc_claimAutoreleasedReturnValue();
          v24 = self->_cachedURL;
          self->_cachedURL = v23;

        }
      }
    }
    self->_hasCachedURL = 1;

  }
  return self->_cachedURL;
}

- (BOOL)getMoneyAmount:(double *)a3 currency:(id *)a4
{
  int v6;
  uint64_t v8;
  id v9;

  v8 = 0;
  v9 = 0;
  v6 = DDResultCurrencyExtraction((uint64_t)self->_coreResult, (double *)&v8, (unint64_t)&v9);
  if (v6)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v9);
    if (a3)
      *(_QWORD *)a3 = v8;
  }
  return v6 != 0;
}

- (BOOL)getPhysicalUnitValue:(double *)a3 unit:(id *)a4
{
  int v6;
  uint64_t v8;
  id v9;

  v8 = 0;
  v9 = 0;
  v6 = DDResultPhysicalUnitExtraction((uint64_t)self->_coreResult, (double *)&v8, (unint64_t)&v9);
  if (v6)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v9);
    if (a3)
      *(_QWORD *)a3 = v8;
  }
  return v6 != 0;
}

- (BOOL)getTrackingNumber:(id *)a3 carrier:(id *)a4
{
  __DDResult *coreResult;
  _BOOL4 v7;
  const __CFArray *var4;
  id *ValueAtIndex;
  id *v10;
  id v11;
  void *v12;

  coreResult = self->_coreResult;
  if (!coreResult)
    goto LABEL_9;
  v7 = _typesAreEqual(coreResult->var5, CFSTR("TrackingNumber"));
  if (!v7)
    return v7;
  var4 = coreResult->var4;
  if (CFArrayGetCount(var4) != 1)
  {
LABEL_9:
    LOBYTE(v7) = 0;
    return v7;
  }
  ValueAtIndex = (id *)CFArrayGetValueAtIndex(var4, 0);
  v10 = ValueAtIndex;
  if (a4)
    *a4 = objc_retainAutorelease(ValueAtIndex[8]);
  if (a3)
  {
    if (v10)
      v11 = v10[9];
    else
      v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  LOBYTE(v7) = 1;
  return v7;
}

- (BOOL)getFlightNumber:(id *)a3 airline:(id *)a4
{
  __DDResult *coreResult;
  _BOOL4 v7;
  const __CFString **SubresultWithType;
  const __CFString **v9;
  const __CFString **v10;
  const __CFString **v11;

  coreResult = self->_coreResult;
  if (coreResult)
  {
    v7 = _typesAreEqual(coreResult->var5, CFSTR("FlightInformation"));
    if (v7)
    {
      if (a4)
      {
        SubresultWithType = DDResultGetSubresultWithType((uint64_t)coreResult, CFSTR("AirlineCode"));
        if (SubresultWithType)
        {
          v9 = SubresultWithType;
          SubresultWithType = (const __CFString **)SubresultWithType[10];
          if (!SubresultWithType)
            SubresultWithType = (const __CFString **)v9[9];
        }
        objc_msgSend(SubresultWithType, "uppercaseString");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a3)
      {
        v10 = DDResultGetSubresultWithType((uint64_t)coreResult, CFSTR("FlightNumber"));
        if (v10)
        {
          v11 = v10;
          v10 = (const __CFString **)v10[10];
          if (!v10)
            v10 = (const __CFString **)v11[9];
        }
        objc_msgSend(v10, "uppercaseString");
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

+ (id)resultsFromCoreResults:(__CFArray *)a3
{
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  if (!a3)
    return MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", CFArrayGetCount(a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__DDScannerResult_resultsFromCoreResults___block_invoke;
  v7[3] = &unk_1E3C96040;
  v5 = v4;
  v8 = v5;
  -[__CFArray enumerateObjectsUsingBlock:](a3, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

+ (__CFArray)coreResultsFromResults:(id)a3
{
  id v3;
  uint64_t v4;
  const void **v5;
  CFArrayRef v6;
  __CFArray *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v13 = objc_msgSend(v3, "count");
  v4 = v11[3];
  if (v4 <= 0)
  {
    v6 = CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
  }
  else
  {
    v5 = (const void **)malloc_type_malloc(8 * v4, 0x80040B8603338uLL);
    v11[3] = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__DDScannerResult_coreResultsFromResults___block_invoke;
    v9[3] = &unk_1E3C96068;
    v9[4] = &v10;
    v9[5] = v5;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
    v6 = CFArrayCreate(0, v5, v11[3], MEMORY[0x1E0C9B378]);
    free(v5);
  }
  v7 = (__CFArray *)CFAutorelease(v6);
  _Block_object_dispose(&v10, 8);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shouldUrlifyBlockForTypes:(unint64_t)a3
{
  void *v3;
  void *v4;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__DDScannerResult_shouldUrlifyBlockForTypes___block_invoke;
  aBlock[3] = &__block_descriptor_40_e206_B32__0____DDResult____CFRuntimeBase_QAQ____DDQueryRange____DDQueryOffset_b16b16b32____DDQueryOffset_b16b16b32_____qq_q____CFArray_____CFString_____CFString__v____CFDictionary_qCf_8__NSDate_16__NSTimeZone_24l;
  aBlock[4] = a3;
  v3 = _Block_copy(aBlock);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (id)filterResults:(id)a3 forTypes:(unint64_t)a4 referenceDate:(id)a5 referenceTimeZone:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  unsigned int (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(v10, "count");
  if (v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v13);
    objc_msgSend(a1, "shouldUrlifyBlockForTypes:", a4);
    v15 = (unsigned int (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = v10;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (((unsigned int (**)(_QWORD, uint64_t, id, id))v15)[2](v15, objc_msgSend(v21, "coreResult", (_QWORD)v23), v11, v12))
          {
            objc_msgSend(v14, "addObject:", v21);
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v18);
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

+ (id)resultFromText:(id)a3 personName:(id)a4 jobTitle:(id)a5 department:(id)a6 company:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD *ContactNameComponentInText;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  NSUInteger v20;
  void *v21;
  NSUInteger v22;
  _QWORD *v23;
  _OWORD *v24;
  void *value;
  void *v27;
  __int128 v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v11, "length")
    && (v28 = xmmword_19BC3FC90,
        ContactNameComponentInText = createContactNameComponentInText(v11, v12, CFSTR("NLPContactName"), (NSRange *)&v28), v17 = createContactNameComponentInText(v11, v13, CFSTR("JobTitle"), (NSRange *)&v28), v18 = createContactNameComponentInText(v11, v14, CFSTR("DepartmentName"), (NSRange *)&v28), v19 = createContactNameComponentInText(v11, v15, CFSTR("CompanyName"), (NSRange *)&v28), v20 = v28, (_QWORD)v28 != 0x7FFFFFFFFFFFFFFFLL))
  {
    value = v18;
    v27 = v19;
    v22 = *((_QWORD *)&v28 + 1);
    v23 = DDResultCreate(CFSTR("Contact"), ((_QWORD)v28 << 32) | 0x10000, ((unint64_t)(DWORD2(v28) + v28) << 32) | 0x10000);
    DDResultSetMatchedString((uint64_t)v23, (CFTypeRef)objc_msgSend(v11, "substringWithRange:", v20, v22));
    v23[4] = v20;
    v23[5] = v22;
    if (ContactNameComponentInText)
    {
      v24 = DDResultCreate(CFSTR("ContactName"), ContactNameComponentInText[2], ContactNameComponentInText[3]);
      DDResultSetMatchedString((uint64_t)v24, (CFTypeRef)ContactNameComponentInText[9]);
      v24[2] = *((_OWORD *)ContactNameComponentInText + 2);
      DDResultAddSubresult((uint64_t)v24, ContactNameComponentInText);
      CFRelease(ContactNameComponentInText);
      DDResultAddSubresult((uint64_t)v23, v24);
      CFRelease(v24);
    }
    if (v17)
    {
      DDResultAddSubresult((uint64_t)v23, v17);
      CFRelease(v17);
    }
    if (value)
    {
      DDResultAddSubresult((uint64_t)v23, value);
      CFRelease(value);
    }
    if (v27)
    {
      DDResultAddSubresult((uint64_t)v23, v27);
      CFRelease(v27);
    }
    +[DDScannerResult resultFromCoreResult:](DDScannerResult, "resultFromCoreResult:", v23, value);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v23);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

uint64_t __45__DDScannerResult_shouldUrlifyBlockForTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  const __CFTimeZone *v8;
  int Category;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  Class v14;
  Class v15;

  v7 = a3;
  v8 = a4;
  Category = DDResultGetCategory(a2);
  v10 = *(const __CFString **)(a2 + 64);
  if (CFStringCompare(CFSTR("SignatureBlock"), v10, 0) == kCFCompareEqualTo)
    goto LABEL_6;
  if ((*(_BYTE *)(a2 + 96) & 1) != 0)
  {
    v12 = *(_QWORD *)(a1 + 32);
    if ((v12 & 4) != 0 && Category == 3)
      goto LABEL_6;
    if ((v12 & 0x10) != 0)
    {
      if (CFStringCompare(CFSTR("TrackingNumber"), v10, 0) == kCFCompareEqualTo)
        goto LABEL_6;
      v12 = *(_QWORD *)(a1 + 32);
    }
    if ((v12 & 0x20) != 0)
    {
      if (CFStringCompare(CFSTR("FlightInformation"), v10, 0) == kCFCompareEqualTo)
        goto LABEL_6;
      v12 = *(_QWORD *)(a1 + 32);
    }
    if ((v12 & 0x40) != 0)
    {
      if (CFStringCompare(CFSTR("Parsec"), v10, 0) == kCFCompareEqualTo)
        goto LABEL_6;
      v12 = *(_QWORD *)(a1 + 32);
    }
    if ((v12 & 0x20000) != 0)
    {
      if (CFStringCompare(CFSTR("GameCenter"), v10, 0) == kCFCompareEqualTo)
        goto LABEL_6;
      v12 = *(_QWORD *)(a1 + 32);
    }
    if ((v12 & 1) != 0 && Category == 2)
      goto LABEL_6;
    if ((v12 & 2) != 0)
    {
      if ((_DDResultIsURL((uint64_t)v10) & 1) != 0)
        goto LABEL_6;
      v12 = *(_QWORD *)(a1 + 32);
    }
    if ((v12 & 8) != 0 && Category == 4)
    {
      if (!DDResultIsPastDate(a2, v7, v8))
        goto LABEL_6;
      v12 = *(_QWORD *)(a1 + 32);
    }
    if ((v12 & 0x40000) != 0)
    {
      if (_typesAreEqual(*(CFStringRef *)(a2 + 64), CFSTR("AuthCode")))
        goto LABEL_6;
      v12 = *(_QWORD *)(a1 + 32);
    }
    if ((v12 & 0x80000) != 0)
    {
      if (_typesAreEqual(*(CFStringRef *)(a2 + 64), CFSTR("ContactName")))
        goto LABEL_6;
      v12 = *(_QWORD *)(a1 + 32);
    }
    if ((v12 & 0x100000) == 0)
      goto LABEL_38;
    if (!_typesAreEqual(*(CFStringRef *)(a2 + 64), CFSTR("CompanyName")))
    {
      v12 = *(_QWORD *)(a1 + 32);
LABEL_38:
      if ((v12 & 0x80) != 0)
      {
        if (_typesAreEqual(*(CFStringRef *)(a2 + 64), CFSTR("Money")))
          goto LABEL_43;
        v12 = *(_QWORD *)(a1 + 32);
      }
      if ((v12 & 0x100) == 0 || !_typesAreEqual(*(CFStringRef *)(a2 + 64), CFSTR("PhysicalAmount")))
        goto LABEL_3;
LABEL_43:
      v14 = NSClassFromString(CFSTR("DDConversionAction"));
      if (v14)
      {
        v15 = v14;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v11 = -[objc_class actionAvailableForResult:](v15, "actionAvailableForResult:", a2);
          goto LABEL_7;
        }
      }
      goto LABEL_3;
    }
LABEL_6:
    v11 = 1;
    goto LABEL_7;
  }
LABEL_3:
  v11 = 0;
LABEL_7:

  return v11;
}

uint64_t __42__DDScannerResult_coreResultsFromResults___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "coreResult");
  if (result)
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))++) = result;
  return result;
}

void __42__DDScannerResult_resultsFromCoreResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  DDScannerResult *v4;
  DDScannerResult *v5;

  v3 = a2;
  v5 = -[DDScannerResult initWithCoreResult:]([DDScannerResult alloc], "initWithCoreResult:", v3);

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

@end
