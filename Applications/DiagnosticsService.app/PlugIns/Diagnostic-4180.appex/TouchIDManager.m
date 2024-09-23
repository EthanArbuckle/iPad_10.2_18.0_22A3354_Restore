@implementation TouchIDManager

+ (id)runTouchIDDiagnostic:(int)a3 options:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _UNKNOWN **v15;
  id v17;
  char v18;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TouchIDManager convertDictionary:toJSON:](TouchIDManager, "convertDictionary:toJSON:", v5, 0));

  }
  else
  {
    v7 = &__NSDictionary0__struct;
  }
  v18 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class manager](+[DASoftLinking biometricKitClass:](DASoftLinking, "biometricKitClass:", CFSTR("BiometricKit")), "manager"));
  v9 = v8;
  if (v8)
  {
    v17 = 0;
    v10 = objc_msgSend(v8, "diagnostics:withOptions:passed:withDetails:", v4, v7, &v18, &v17);
    v11 = v17;
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[TouchIDManager convertDictionary:toJSON:](TouchIDManager, "convertDictionary:toJSON:", v11, 1));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("data"));

    }
    if (v10)
    {
      v13 = DiagnosticLogHandleForCategory(3);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_100002F04(v10, v14);

      v15 = &off_100004320;
    }
    else if (v18)
    {
      v15 = &off_1000042F0;
    }
    else
    {
      v15 = &off_100004308;
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("testStatus"));

  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &__NSDictionary0__struct, CFSTR("data"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1000042D8, CFSTR("testStatus"));
  }

  return v6;
}

+ (id)convertDictionary:(id)a3 toJSON:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "mutableCopy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v12));
        objc_msgSend(v6, "removeObjectForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[TouchIDManager convertKey:toJSON:](TouchIDManager, "convertKey:toJSON:", v12, v4));
        objc_msgSend(v6, "setObject:forKey:", v13, v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)convertKey:(id)a3 toJSON:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "mutableCopy");
  v7 = objc_msgSend(v5, "characterAtIndex:", 0);

  if (v4)
  {
    if (v7 == 107)
    {
      objc_msgSend(v6, "deleteCharactersInRange:", 0, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringWithRange:", 0, 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lowercaseString"));
      objc_msgSend(v6, "replaceCharactersInRange:withString:", 0, 1, v9);

    }
  }
  else if (v7 != 107)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringWithRange:", 0, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uppercaseString"));
    objc_msgSend(v6, "replaceCharactersInRange:withString:", 0, 1, v11);

    objc_msgSend(v6, "insertString:atIndex:", CFSTR("k"), 0);
  }
  return v6;
}

@end
