@implementation FPUserDefaultsWithRootUserWorkaround

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localUserDefaults, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (FPUserDefaultsWithRootUserWorkaround)initWithSuiteName:(id)a3
{
  id v4;
  FPUserDefaultsWithRootUserWorkaround *v5;
  uint64_t v6;
  void *userDefaults;
  _QWORD v9[4];
  id v10;
  FPUserDefaultsWithRootUserWorkaround *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FPUserDefaultsWithRootUserWorkaround;
  v5 = -[FPUserDefaultsWithRootUserWorkaround init](&v12, sel_init);
  if (v5)
  {
    if (getuid())
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v4);
      userDefaults = v5->_userDefaults;
      v5->_userDefaults = (NSUserDefaults *)v6;
    }
    else
    {
      +[FPUserDefaultsWithRootUserWorkaround _userDefaultsSearchList](FPUserDefaultsWithRootUserWorkaround, "_userDefaultsSearchList");
      userDefaults = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __58__FPUserDefaultsWithRootUserWorkaround_initWithSuiteName___block_invoke;
      v9[3] = &unk_1E444DC80;
      v10 = v4;
      v11 = v5;
      objc_msgSend(userDefaults, "enumerateObjectsUsingBlock:", v9);

    }
  }

  return v5;
}

- (BOOL)BOOLForKey:(id)a3
{
  NSUserDefaults *userDefaults;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  userDefaults = self->_userDefaults;
  if (userDefaults)
    return -[NSUserDefaults BOOLForKey:](userDefaults, "BOOLForKey:", a3);
  -[NSDictionary objectForKey:](self->_localUserDefaults, "objectForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("YES")) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v8 = objc_msgSend(v6, "length");
      v7 = 1;
      if (objc_msgSend(v6, "compare:options:range:", CFSTR("YES"), 1, 0, v8))
      {
        v9 = objc_msgSend(v6, "compare:options:range:", CFSTR("Y"), 1, 0, v8);
        v7 = v9 == 0;
        if (v9)
          v7 = objc_msgSend(v6, "integerValue") != 0;
      }
    }
  }
  else if (_NSIsNSNumber())
  {
    v7 = objc_msgSend(v6, "BOOLValue");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_userDefaultsSearchList
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/private/var/%@/Library/Preferences"), CFSTR("mobile"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/Users/%@/Library/Preferences"), CFSTR("mobile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/Library/Managed Preferences/%@/"), CFSTR("mobile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __58__FPUserDefaultsWithRootUserWorkaround_initWithSuiteName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a2, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathExtension:", CFSTR("plist"));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v12);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v9 + 16);
  *(_QWORD *)(v9 + 16) = v8;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
  if (v11)
  {
    *a4 = 1;
    LOBYTE(v11) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) != 0;
  }
  *a4 = v11;

}

- (id)objectForKey:(id)a3
{
  void *userDefaults;

  userDefaults = self->_userDefaults;
  if (!userDefaults)
    userDefaults = self->_localUserDefaults;
  objc_msgSend(userDefaults, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stringForKey:(id)a3
{
  NSUserDefaults *userDefaults;
  void *v5;
  uint64_t v6;

  userDefaults = self->_userDefaults;
  if (userDefaults)
  {
    -[NSUserDefaults stringForKey:](userDefaults, "stringForKey:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSDictionary objectForKey:](self->_localUserDefaults, "objectForKey:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_NSIsNSString() & 1) == 0)
    {
      if (_NSIsNSNumber())
      {
        objc_msgSend(v5, "stringValue");
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }

      v5 = (void *)v6;
    }
  }
  return v5;
}

@end
