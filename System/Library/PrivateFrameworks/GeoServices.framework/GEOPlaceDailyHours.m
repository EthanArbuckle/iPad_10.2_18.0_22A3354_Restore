@implementation GEOPlaceDailyHours

+ (id)dailyHours:(id)a3 forDays:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  _QWORD *v10;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = objc_alloc_init((Class)a1);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)v9 + 3, a3);
    v10[1] = location;
    v10[2] = length;
  }

  return v10;
}

+ (id)getPlaceDailyHoursForWeekday:(int64_t)a3 placeDailyHours:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (a3 < 1)
  {
    v18 = 0;
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      v11 = a3 + 7;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "dayOfWeekRange", (_QWORD)v20);
          if ((a3 < v14 || a3 - v14 >= v15) && (v11 < v14 || v11 - v14 >= v15))
            continue;
          v18 = v13;
          goto LABEL_23;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v18 = 0;
        if (v9)
          continue;
        break;
      }
    }
    else
    {
      v18 = 0;
    }
LABEL_23:

  }
  return v18;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRange(self->_dayOfWeekRange);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p Days: %@ Hours: { "), v5, self, v6);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_openIntervals;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "endDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p Start: %@ End: %@>, "), v14, v12, v15, v16, (_QWORD)v18);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "appendString:", CFSTR(" }>"));
  return v3;
}

- (_NSRange)dayOfWeekRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_dayOfWeekRange.length;
  location = self->_dayOfWeekRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSArray)openIntervals
{
  return self->_openIntervals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openIntervals, 0);
}

@end
