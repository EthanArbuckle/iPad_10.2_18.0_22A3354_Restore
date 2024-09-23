@implementation PanicAndCrashHistoryInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  char v8;

  v4 = a3;
  v5 = -[PanicAndCrashHistoryInputs _applylogLineTypes:](self, "_applylogLineTypes:", v4);
  v8 = v5 | -[PanicAndCrashHistoryInputs _applyAppBundleFilters:](self, "_applyAppBundleFilters:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_dictionaryFromKey:defaultValue:failed:", CFSTR("logLineReturnLabels"), &__NSDictionary0__struct, &v8));

  -[PanicAndCrashHistoryInputs setResultLabelFilters:](self, "setResultLabelFilters:", v6);
  return v8 == 0;
}

- (BOOL)_applylogLineTypes:(id)a3
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromKey:types:maxLength:defaultValue:failed:validator:", CFSTR("logLineTypes"), v7, 0x7FFFFFFFFFFFFFFFLL, &off_100004418, &v25, &stru_100004198));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
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

  -[PanicAndCrashHistoryInputs setLogIds:](self, "setLogIds:", v9);
  v19 = v25;

  return v19;
}

- (BOOL)_applyAppBundleFilters:(id)a3
{
  id v4;
  NSSet *v5;
  void *v6;
  void *v7;
  id v8;
  char v10;

  v10 = 0;
  v4 = a3;
  v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSString), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromKey:types:maxLength:defaultValue:failed:validator:", CFSTR("appBundleFilter"), v6, 0x7FFFFFFFFFFFFFFFLL, &off_100004430, &v10, &stru_1000041B8));

  v8 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v7);
  -[PanicAndCrashHistoryInputs setApplicationFilters:](self, "setApplicationFilters:", v8);

  LOBYTE(self) = v10;
  return (char)self;
}

- (NSSet)logIds
{
  return self->_logIds;
}

- (void)setLogIds:(id)a3
{
  objc_storeStrong((id *)&self->_logIds, a3);
}

- (NSSet)applicationFilters
{
  return self->_applicationFilters;
}

- (void)setApplicationFilters:(id)a3
{
  objc_storeStrong((id *)&self->_applicationFilters, a3);
}

- (NSDictionary)resultLabelFilters
{
  return self->_resultLabelFilters;
}

- (void)setResultLabelFilters:(id)a3
{
  objc_storeStrong((id *)&self->_resultLabelFilters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultLabelFilters, 0);
  objc_storeStrong((id *)&self->_applicationFilters, 0);
  objc_storeStrong((id *)&self->_logIds, 0);
}

@end
