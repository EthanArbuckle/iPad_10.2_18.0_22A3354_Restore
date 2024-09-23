@implementation NSDictionary(AVAirMessageExtensions)

- (id)airMessageCanonicalForm
{
  void *v2;
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v19;
    *(_QWORD *)&v5 = 138543362;
    v17 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8);
        objc_msgSend(v2, "objectForKeyedSubscript:", v9, v17, (_QWORD)v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (v12)
          goto LABEL_7;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "stringValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, v9);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            _avairlog();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              v23 = v9;
              _os_log_impl(&dword_1AC4B1000, v14, OS_LOG_TYPE_DEFAULT, "value for '%{public}@' is neither a string nor convertible to one", buf, 0xCu);
            }

LABEL_7:
            objc_msgSend(v2, "removeObjectForKey:", v9);
            goto LABEL_10;
          }
          if (objc_msgSend(v10, "isEqual:", &stru_1E5BB5F88))
            goto LABEL_7;
        }
LABEL_10:

        ++v8;
      }
      while (v6 != v8);
      v15 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      v6 = v15;
    }
    while (v15);
  }

  return v2;
}

@end
