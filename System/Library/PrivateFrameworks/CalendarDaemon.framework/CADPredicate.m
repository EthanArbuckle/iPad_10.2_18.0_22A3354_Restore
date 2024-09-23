@implementation CADPredicate

+ (void)setValidator:(Class)a3
{
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  __CADPredicateValidator = (uint64_t)a3;
  objc_sync_exit(obj);

}

- (BOOL)evaluateWithObject:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  if (__CADPredicateValidator)
    v6 = objc_msgSend((id)__CADPredicateValidator, "evaluatePredicate:withObject:", self, v4);
  else
    v6 = 0;
  objc_sync_exit(v5);

  return v6;
}

- (NSArray)defaultPropertiesToLoad
{
  return 0;
}

- (NSDictionary)relatedObjectPropertiesToLoad
{
  return 0;
}

- (NSFastEnumeration)databasesToQuery
{
  return 0;
}

- (void)beginSignpostWithHandle:(id)a3 signpostID:(unint64_t)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    -[CADPredicate predicateFormat](self, "predicateFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v10;
    _os_signpost_emit_with_name_impl(&dword_1B6A18000, v7, OS_SIGNPOST_INTERVAL_BEGIN, a4, "EKPredicateSearch", "predicateClass=%@; predicateFormat=%@",
      (uint8_t *)&v11,
      0x16u);

  }
}

+ (id)conciseCalendarList:(id)a3
{
  id v3;
  __CFString *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  int v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", (4 * objc_msgSend(v3, "count")) | 2);
    -[__CFString appendString:](v4, "appendString:", CFSTR("("));
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v19;
      v10 = *MEMORY[0x1E0D0BE78];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((v8 & 1) != 0)
            -[__CFString appendString:](v4, "appendString:", CFSTR(","));
          v13 = objc_msgSend(v12, "databaseID");
          v14 = objc_msgSend(v12, "entityID");
          if ((_DWORD)v13 == v10)
            -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("%i"), v14, v16);
          else
            -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("%i/%i"), v13, v14);
          v8 = 1;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    -[__CFString appendString:](v4, "appendString:", CFSTR(")"));
    v3 = v17;
  }
  else
  {
    v4 = CFSTR("(null)");
  }

  return v4;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
