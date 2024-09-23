@implementation AppCrashHistoryInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  BOOL v8;
  unsigned __int8 v10;

  v4 = a3;
  if (-[AppCrashHistoryInputs _applyCrashTypesParameter:](self, "_applyCrashTypesParameter:", v4))
    v5 = 1;
  else
    v5 = -[AppCrashHistoryInputs _applyWhitelistParameter:](self, "_applyWhitelistParameter:", v4);
  v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("minCrashesToConsider"), &off_100004420, &off_100004438, &off_100004420, &v10));
  -[AppCrashHistoryInputs setMinCrashesToConsider:](self, "setMinCrashesToConsider:", objc_msgSend(v6, "intValue"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("avgCrashesToConsider"), &off_100004420, &off_100004438, &off_100004420, &v10));
  -[AppCrashHistoryInputs setAvgCrashesToConsider:](self, "setAvgCrashesToConsider:", objc_msgSend(v7, "intValue"));

  v8 = v10 == 0;
  return v8;
}

- (BOOL)_applyCrashTypesParameter:(id)a3
{
  id v4;
  uint64_t v5;
  NSSet *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  BOOL v25;
  _BYTE v26[128];

  v4 = a3;
  v25 = 0;
  v5 = objc_opt_class(NSString);
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(NSNumber), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromKey:types:maxLength:defaultValue:failed:validator:", CFSTR("crashTypes"), v7, 10, &off_100004490, &v25, &stru_1000041C8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v16 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          objc_msgSend(v9, "addObject:", v15);
        }
        else
        {
          v17 = objc_opt_class(NSNumber);
          if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));
            objc_msgSend(v9, "addObject:", v18);

          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v12);
  }

  -[AppCrashHistoryInputs setLogIds:](self, "setLogIds:", v9);
  v19 = v25;

  return v19;
}

- (BOOL)_applyWhitelistParameter:(id)a3
{
  id v4;
  NSSet *v5;
  void *v6;
  void *v7;
  void *v8;
  char v10;

  v10 = 0;
  v4 = a3;
  v5 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSString));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromKey:types:maxLength:defaultValue:failed:validator:", CFSTR("whitelistedAppNames"), v6, 10000, &__NSArray0__struct, &v10, &stru_1000041E8));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
  -[AppCrashHistoryInputs setWhitelist:](self, "setWhitelist:", v8);

  LOBYTE(self) = v10;
  return (char)self;
}

- (int)minCrashesToConsider
{
  return self->_minCrashesToConsider;
}

- (void)setMinCrashesToConsider:(int)a3
{
  self->_minCrashesToConsider = a3;
}

- (int)avgCrashesToConsider
{
  return self->_avgCrashesToConsider;
}

- (void)setAvgCrashesToConsider:(int)a3
{
  self->_avgCrashesToConsider = a3;
}

- (NSArray)logIds
{
  return self->_logIds;
}

- (void)setLogIds:(id)a3
{
  objc_storeStrong((id *)&self->_logIds, a3);
}

- (NSSet)whitelist
{
  return self->_whitelist;
}

- (void)setWhitelist:(id)a3
{
  objc_storeStrong((id *)&self->_whitelist, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelist, 0);
  objc_storeStrong((id *)&self->_logIds, 0);
}

@end
