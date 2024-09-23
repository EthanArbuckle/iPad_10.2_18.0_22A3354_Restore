@implementation NRUnarchivedObjectVerifier

+ (void)unarchivingVerifyObjectIsNotNil:(id)a3 name:(id)a4 owner:(id)a5
{
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  id v9;

  if (!a3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = a4;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("failure unarchiving %@"), v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v9, CFSTR("%@ is nil"), v6);
  }
}

+ (void)unarchivingVerifyObjectClasses:(id)a3 name:(id)a4 classes:(id)a5 owner:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = v13;
          goto LABEL_11;
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v15)
        continue;
      break;
    }
  }

  v18 = (void *)MEMORY[0x1E0CB3940];
  v19 = (objc_class *)objc_opt_class();
  NSStringFromClass(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("failure unarchiving %@"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0C99DA0];
  v23 = (objc_class *)objc_opt_class();
  NSStringFromClass(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "raise:format:", v21, CFSTR("%@ is class %@ expected one of %@"), v10, v24, v13);

LABEL_11:
}

@end
