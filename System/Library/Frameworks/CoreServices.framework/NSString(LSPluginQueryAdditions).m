@implementation NSString(LSPluginQueryAdditions)

- (id)ls_cleanForPluginQuery
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (id)objc_msgSend(a1, "length");
  if (v2)
  {
    v3 = objc_msgSend(a1, "characterAtIndex:", 0);
    if ((_DWORD)v3 == 61)
    {
      objc_msgSend(a1, "substringFromIndex:", 1);
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = v3;
      objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v4) = objc_msgSend(v5, "characterIsMember:", v4);

      if ((_DWORD)v4)
        v2 = a1;
      else
        v2 = 0;
    }
  }
  return v2;
}

- (BOOL)ls_matchesStringForPluginQuery:()LSPluginQueryAdditions
{
  id v4;
  int v5;
  void *v6;
  BOOL v7;
  _BOOL8 v8;
  NSObject *v9;
  BOOL v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "hasPrefix:", CFSTR("?")))
  {
    if (objc_msgSend(v4, "hasPrefix:", CFSTR("<>")))
    {
      objc_msgSend(v4, "substringFromIndex:", 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[__CFString compare:options:](a1, "compare:options:", v6, 64) == 0;
    }
    else if (objc_msgSend(v4, "hasPrefix:", CFSTR("<=")))
    {
      objc_msgSend(v4, "substringFromIndex:", 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[__CFString compare:options:](a1, "compare:options:", v6, 64) == 1;
    }
    else
    {
      if (!objc_msgSend(v4, "hasPrefix:", CFSTR("=>")))
      {
        if (objc_msgSend(v4, "hasPrefix:", CFSTR("=")))
        {
          objc_msgSend(v4, "substringFromIndex:", 1);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[__CFString compare:options:](a1, "compare:options:", v6, 64) == 0;
        }
        else if (objc_msgSend(v4, "hasPrefix:", CFSTR("<")))
        {
          objc_msgSend(v4, "substringFromIndex:", 1);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[__CFString compare:options:](a1, "compare:options:", v6, 64) == -1;
        }
        else
        {
          if (!objc_msgSend(v4, "hasPrefix:", CFSTR(">")))
          {
            v8 = -[__CFString compare:options:](a1, "compare:options:", v4, 64) == 0;
            goto LABEL_20;
          }
          objc_msgSend(v4, "substringFromIndex:", 1);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[__CFString compare:options:](a1, "compare:options:", v6, 64) == 1;
        }
        v8 = v11;
        goto LABEL_19;
      }
      objc_msgSend(v4, "substringFromIndex:", 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[__CFString compare:options:](a1, "compare:options:", v6, 64) == -1;
    }
    v8 = !v7;
LABEL_19:

    goto LABEL_20;
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("?UT-CONFORMS:")))
  {
    v5 = UTTypeConformsTo(a1, (CFStringRef)objc_msgSend(v4, "substringFromIndex:", 13));
LABEL_8:
    v8 = v5 != 0;
    goto LABEL_20;
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("?UT-IS:")))
  {
    v5 = UTTypeConformsTo((CFStringRef)objc_msgSend(v4, "substringFromIndex:", 7), a1);
    goto LABEL_8;
  }
  _LSDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_182882000, v9, OS_LOG_TYPE_DEFAULT, "Unrecognized match operator %@", (uint8_t *)&v12, 0xCu);
  }

  v8 = 0;
LABEL_20:

  return v8;
}

- (uint64_t)ls_matchesForPluginQuery:()LSPluginQueryAdditions
{
  id v4;
  char v5;
  uint64_t v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (_NSIsNSString())
  {
    v5 = objc_msgSend(a1, "ls_matchesStringForPluginQuery:", v4);
    *((_BYTE *)v12 + 24) = v5;
  }
  else if (_NSIsNSArray())
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__NSString_LSPluginQueryAdditions__ls_matchesForPluginQuery___block_invoke;
    v8[3] = &unk_1E10449D8;
    v10 = &v11;
    v8[4] = a1;
    v9 = v4;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v8);

  }
  v6 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v6;
}

@end
