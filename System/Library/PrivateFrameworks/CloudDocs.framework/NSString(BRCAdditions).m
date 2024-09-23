@implementation NSString(BRCAdditions)

- (uint64_t)br_libnotifyPerUserNotificationName
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("user.uid.%d.%@"), getuid(), a1);
}

- (uint64_t)br_isBoostableItemIdentifier
{
  if ((objc_msgSend(a1, "isEqualToString:", *MEMORY[0x1E0CAABA8]) & 1) != 0
    || (objc_msgSend(a1, "isEqualToString:", *MEMORY[0x1E0CAABC8]) & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(a1, "isEqualToString:", *MEMORY[0x1E0CAABE0]) ^ 1;
  }
}

- (id)br_stringByBackslashEscapingCharactersInString:()BRCAdditions
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v14;
  NSObject *v15;

  v4 = a3;
  if (objc_msgSend(v4, "length") && objc_msgSend(v4, "rangeOfString:", CFSTR("\\")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    brc_bread_crumbs((uint64_t)"-[NSString(BRCAdditions) br_stringByBackslashEscapingCharactersInString:]", 31);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[NSString(BRCAdditions) br_stringByBackslashEscapingCharactersInString:].cold.1((uint64_t)v14, v15);

  }
  v5 = a1;
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v6);
  if (v8)
  {
    v9 = v7;
    v10 = v8;
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      objc_msgSend(v11, "insertString:atIndex:", CFSTR("\\"), v9);
      if (v9 + v10 + 1 >= (unint64_t)objc_msgSend(v11, "length"))
        break;
      v9 = objc_msgSend(v11, "rangeOfCharacterFromSet:options:range:", v6, 0);
      v10 = v12;
    }
    while (v12);

  }
  else
  {
    v11 = v5;
  }

  return v11;
}

- (id)br_libnotifyPerPersonaNotificationName:()BRCAdditions
{
  void *v3;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), a1, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)objc_msgSend(a1, "copy");
  }
  return v3;
}

- (id)br_decodeIndexStringToIndexSet
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR(","));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    v22 = v2;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v7);
      objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(":"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count") == 2)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "longLongValue");

        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "longLongValue");

        v14 = v13 - v11;
        if (v13 < v11 || (v13 | v11) < 0)
        {
          brc_bread_crumbs((uint64_t)"-[NSString(BRCAdditions) br_decodeIndexStringToIndexSet]", 77);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v28 = v8;
            v29 = 2112;
            v30 = v18;
            _os_log_impl(&dword_19CBF0000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Invalid range components %@%@", buf, 0x16u);
          }
          v2 = v22;
          goto LABEL_24;
        }
        v2 = v22;
        objc_msgSend(v22, "addIndexesInRange:", v11, v14 + 1);
      }
      else
      {
        if (objc_msgSend(v9, "count") != 1)
        {
          brc_bread_crumbs((uint64_t)"-[NSString(BRCAdditions) br_decodeIndexStringToIndexSet]", 94);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v28 = v8;
            v29 = 2112;
            v30 = v18;
            v20 = "[WARNING] Invalid string range %@%@";
            goto LABEL_23;
          }
LABEL_24:

          v17 = 0;
          goto LABEL_25;
        }
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "longLongValue");

        if (v16 < 0)
        {
          brc_bread_crumbs((uint64_t)"-[NSString(BRCAdditions) br_decodeIndexStringToIndexSet]", 88);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v19 = objc_claimAutoreleasedReturnValue();
          v2 = v22;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v28 = v8;
            v29 = 2112;
            v30 = v18;
            v20 = "[WARNING] Invalid string value %@%@";
LABEL_23:
            _os_log_impl(&dword_19CBF0000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x16u);
          }
          goto LABEL_24;
        }
        v2 = v22;
        objc_msgSend(v22, "addIndex:", v16);
      }

      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  v17 = v2;
LABEL_25:

  return v17;
}

- (id)br_stringByJSONEscaping
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "br_stringByBackslashEscapingCharactersInString:", CFSTR("\\\"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("\\n"), 1, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\r"), CFSTR("\\r"), 1, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\t"), CFSTR("\\t"), 1, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\b"), CFSTR("\\b"), 1, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\f"), CFSTR("\\f"), 1, 0, objc_msgSend(v2, "length"));
  return v2;
}

- (void)br_stringByBackslashEscapingCharactersInString:()BRCAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_19CBF0000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: charactersToEscape.length == 0 || [charactersToEscape rangeOfString:@\"\\\\\"].location != NSNotFound%@", (uint8_t *)&v2, 0xCu);
}

@end
