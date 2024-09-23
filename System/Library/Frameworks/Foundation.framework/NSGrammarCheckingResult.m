@implementation NSGrammarCheckingResult

- (NSGrammarCheckingResult)initWithRange:(_NSRange)a3 details:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  NSGrammarCheckingResult *v7;
  NSGrammarCheckingResult *v8;
  objc_super v10;
  uint64_t v11;

  length = a3.length;
  location = a3.location;
  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSGrammarCheckingResult;
  v7 = -[NSGrammarCheckingResult init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_range.location = location;
    v7->_range.length = length;
    v7->_details = (NSArray *)objc_msgSend(a4, "copy");
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSGrammarCheckingResult;
  -[NSGrammarCheckingResult dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __CFString *v13;
  int v14;
  NSNumber *v15;
  NSNumber *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  NSGrammarCheckingResult *v22;
  id v23;
  id obj;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[128];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = -[NSGrammarCheckingResult grammarDetails](self, "grammarDetails");
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v22 = self;
    v23 = a3;
    v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v5;
    v27 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    if (v27)
    {
      v25 = *(_QWORD *)v36;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v36 != v25)
            objc_enumerationMutation(obj);
          v28 = v6;
          v7 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v6);
          v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v31;
            do
            {
              for (i = 0; i != v10; ++i)
              {
                if (*(_QWORD *)v31 != v11)
                  objc_enumerationMutation(v7);
                v13 = *(__CFString **)(*((_QWORD *)&v30 + 1) + 8 * i);
                v14 = -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("NSGrammarRange"));
                v15 = (NSNumber *)objc_msgSend(v7, "objectForKey:", v13);
                v16 = v15;
                if (v14)
                {
                  v17 = -[NSValue rangeValue](v15, "rangeValue");
                  v19 = v18;
                  objc_msgSend(v8, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v17), CFSTR("NSGrammarRangeLocation"));
                  v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v19);
                  v20 = v8;
                  v21 = CFSTR("NSGrammarRangeLength");
                }
                else
                {
                  v20 = v8;
                  v21 = v13;
                }
                objc_msgSend(v20, "setObject:forKey:", v16, v21);
              }
              v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
            }
            while (v10);
          }
          objc_msgSend(v26, "addObject:", v8);

          v6 = v28 + 1;
        }
        while (v28 + 1 != v27);
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
      }
      while (v27);
    }
    -[NSTextCheckingResult encodeRangeWithCoder:](v22, "encodeRangeWithCoder:", v23);
    objc_msgSend(v23, "encodeObject:forKey:", v26, CFSTR("NSModifiedGrammarDetails"));

  }
  else
  {
    -[NSTextCheckingResult encodeRangeWithCoder:](self, "encodeRangeWithCoder:", a3);
    objc_msgSend(a3, "encodeObject:", v5);
  }
}

- (NSGrammarCheckingResult)initWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  __CFString *v24;
  NSValue *v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  NSString *v33;
  uint64_t v34;
  id obj;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE v40[128];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v6 = -[NSTextCheckingResult decodeRangeWithCoder:](self, "decodeRangeWithCoder:", a3);
    v8 = v7;
    v9 = objc_msgSend(a3, "containsValueForKey:", CFSTR("NSModifiedGrammarDetails"));
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    if (v9)
    {
      v15 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v14, CFSTR("NSModifiedGrammarDetails"));
      v16 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      obj = v15;
      v38 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
      if (!v38)
        return -[NSGrammarCheckingResult initWithRange:details:](self, "initWithRange:details:", v6, v8, v16);
      v34 = v8;
      v36 = *(_QWORD *)v47;
      v37 = (void *)v16;
      while (1)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v47 != v36)
            objc_enumerationMutation(obj);
          v39 = v17;
          v18 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v17);
          v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v42;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v42 != v22)
                  objc_enumerationMutation(v18);
                v24 = *(__CFString **)(*((_QWORD *)&v41 + 1) + 8 * i);
                if (-[__CFString isEqualToString:](v24, "isEqualToString:", CFSTR("NSGrammarRangeLocation")))
                {
                  v25 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", objc_msgSend((id)objc_msgSend(v18, "objectForKey:", CFSTR("NSGrammarRangeLocation")), "unsignedIntegerValue"), objc_msgSend((id)objc_msgSend(v18, "objectForKey:", CFSTR("NSGrammarRangeLength")), "unsignedIntegerValue"));
                  v26 = v19;
                  v27 = CFSTR("NSGrammarRange");
                }
                else
                {
                  if ((-[__CFString isEqualToString:](v24, "isEqualToString:", CFSTR("NSGrammarRangeLength")) & 1) != 0)
                    continue;
                  v25 = (NSValue *)objc_msgSend(v18, "objectForKey:", v24);
                  v26 = v19;
                  v27 = v24;
                }
                objc_msgSend(v26, "setObject:forKey:", v25, v27);
              }
              v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
            }
            while (v21);
          }
          v16 = (uint64_t)v37;
          objc_msgSend(v37, "addObject:", v19);

          v17 = v39 + 1;
        }
        while (v39 + 1 != v38);
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
        if (!v38)
        {
          v8 = v34;
          return -[NSGrammarCheckingResult initWithRange:details:](self, "initWithRange:details:", v6, v8, v16);
        }
      }
    }
    v30 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v14, CFSTR("NSGrammarDetails"));
  }
  else
  {
    v28 = objc_msgSend(a3, "versionForClassName:", CFSTR("NSTextCheckingResult"));
    if (v28 != 1)
    {
      v32 = v28;
      v33 = _NSFullMethodName((objc_class *)self, a2);
      NSLog((NSString *)CFSTR("%@: class version %ld cannot read instances archived with version %ld"), v33, 1, v32);
      -[NSGrammarCheckingResult dealloc](self, "dealloc");
      return 0;
    }
    v6 = -[NSTextCheckingResult decodeRangeWithCoder:](self, "decodeRangeWithCoder:", a3);
    v8 = v29;
    v30 = objc_msgSend(a3, "decodeObject");
  }
  v16 = v30;
  return -[NSGrammarCheckingResult initWithRange:details:](self, "initWithRange:details:", v6, v8, v16);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)resultType
{
  return 4;
}

- (_NSRange)range
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

- (id)resultByAdjustingRangesWithOffset:(int64_t)a3
{
  unint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v11;
  NSString *v12;
  void *v13;
  NSRange v14;

  v6 = -[NSGrammarCheckingResult range](self, "range");
  v8 = v7;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 < 0 && v6 < -a3)
    {
      v11 = v6;
      v12 = _NSFullMethodName((objc_class *)self, a2);
      v14.location = v11;
      v14.length = v8;
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %ld invalid offset for range %@"), v12, a3, NSStringFromRange(v14)), 0);
      objc_exception_throw(v13);
    }
    v9 = v6 + a3;
  }
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:details:", v9, v7, -[NSGrammarCheckingResult grammarDetails](self, "grammarDetails"));
}

- (BOOL)_adjustRangesWithOffset:(int64_t)a3
{
  NSUInteger location;
  _NSRange *p_range;
  NSString *v7;
  void *v8;

  location = self->_range.location;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 < 0 && location < -a3)
    {
      p_range = &self->_range;
      v7 = _NSFullMethodName((objc_class *)self, a2);
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %ld invalid offset for range %@"), v7, a3, NSStringFromRange(*p_range)), 0);
      objc_exception_throw(v8);
    }
    self->_range.location = location + a3;
  }
  return 1;
}

- (id)grammarDetails
{
  return self->_details;
}

@end
