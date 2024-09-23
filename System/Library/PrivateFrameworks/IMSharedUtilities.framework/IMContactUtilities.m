@implementation IMContactUtilities

+ (id)getContactGivenNameAndBirthdayForHandleID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[IMContactStore validateAndCleanupID:](IMContactStore, "validateAndCleanupID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMContactStore sharedInstance](IMContactStore, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0C96670];
    v9 = *MEMORY[0x1E0C966D0];
    v28[0] = *MEMORY[0x1E0C96670];
    v28[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchCNContactForHandleID:withKeys:", v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v11, "areKeysAvailable:", v12);

    if ((_DWORD)v10)
    {
      objc_msgSend(v11, "givenName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v11, "givenName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v14, v9);

      }
    }
    v26 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v11, "areKeysAvailable:", v15);

    if (v16)
    {
      objc_msgSend(v11, "birthday");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTimeZone:", v19);

        v20 = objc_alloc_init(MEMORY[0x1E0C99D78]);
        objc_msgSend(v11, "birthday");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setDay:", objc_msgSend(v21, "day"));

        objc_msgSend(v11, "birthday");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setMonth:", objc_msgSend(v22, "month"));

        objc_msgSend(v11, "birthday");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setYear:", objc_msgSend(v23, "year"));

        objc_msgSend(v18, "dateFromComponents:", v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v24, v8);

      }
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
