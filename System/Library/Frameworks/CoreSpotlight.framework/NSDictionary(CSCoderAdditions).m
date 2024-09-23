@implementation NSDictionary(CSCoderAdditions)

- (void)encodeKeysAndValuesWithCSCoder:()CSCoderAdditions filterBlock:
{
  id v6;
  uint64_t (**v7)(id, id);
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  char isKindOfClass;
  NSObject *v16;
  NSObject *v17;
  unint64_t v18;
  unint64_t v19;
  NSObject *v20;
  unint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  NSObject *v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = a1;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v30;
    *(_QWORD *)&v10 = 138412802;
    v28 = v10;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v8);
        v14 = *(NSObject **)(*((_QWORD *)&v29 + 1) + 8 * v13);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
        {
          v16 = v14;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            logForCSLogCategoryDefault();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v14;
              _os_log_error_impl(&dword_18C42F000, v17, OS_LOG_TYPE_ERROR, "Dropping invalid key:%@", buf, 0xCu);
            }
            goto LABEL_34;
          }
          -[NSObject keyName](v14, "keyName");
          v16 = objc_claimAutoreleasedReturnValue();
        }
        v17 = v16;
        if (v7 && (v7[2](v7, v16) & 1) == 0)
        {
          logForCSLogCategoryDefault();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v17;
            _os_log_debug_impl(&dword_18C42F000, v20, OS_LOG_TYPE_DEBUG, "Dropping key:%@ since it was filtered out", buf, 0xCu);
          }
          goto LABEL_25;
        }
        if ((unint64_t)-[NSObject length](v17, "length", v28) >= 0x3E9)
        {
          v18 = -[NSObject lengthOfBytesUsingEncoding:](v17, "lengthOfBytesUsingEncoding:", 4);
          if (v18 >= 0x1000)
          {
            v19 = v18;
            logForCSLogCategoryDefault();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v21 = -[NSObject length](v17, "length");
              if (v21 >= 0x1E)
                v22 = 30;
              else
                v22 = v21;
              -[NSObject substringWithRange:](v17, "substringWithRange:", 0, v22);
              v23 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v28;
              v34 = v23;
              v35 = 2048;
              v36 = v19;
              v37 = 2048;
              v38 = 4095;
              _os_log_error_impl(&dword_18C42F000, v20, OS_LOG_TYPE_ERROR, "Dropping invalid key:\"%@\"..., lengthOfBytes:%ld/%ld", buf, 0x20u);

            }
            goto LABEL_25;
          }
        }
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v6, "encodeObject:", v14);
          objc_msgSend(v8, "objectForKeyedSubscript:", v14);
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "encodeObject:", v20);
LABEL_25:

          goto LABEL_34;
        }
        v24 = v14;
        LODWORD(v25) = -[NSObject isSearchable](v24, "isSearchable");
        if (-[NSObject isSearchableByDefault](v24, "isSearchableByDefault"))
          LODWORD(v25) = v25 | 2;
        if (-[NSObject isUnique](v24, "isUnique"))
          LODWORD(v25) = v25 | 4;
        if (-[NSObject isMultiValued](v24, "isMultiValued"))
          v25 = v25 | 8;
        else
          v25 = v25;
        -[NSObject keyName](v24, "keyName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "encodeObject:", v26);

        objc_msgSend(v6, "beginArray");
        objc_msgSend(v6, "encodeInt32:", v25);
        objc_msgSend(v8, "objectForKeyedSubscript:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "encodeObject:", v27);
        objc_msgSend(v6, "endArray");
LABEL_34:

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    }
    while (v11);
  }

}

- (void)encodeWithCSCoder:()CSCoderAdditions
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "beginDictionary");
  objc_msgSend(a1, "encodeKeysAndValuesWithCSCoder:filterBlock:", v4, 0);
  objc_msgSend(v4, "endDictionary");

}

@end
