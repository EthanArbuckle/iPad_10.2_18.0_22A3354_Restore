@implementation AXSSWordDescriptionManager

void __52__AXSSWordDescriptionManager_zh_descriptionForWord___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "languageDialectCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForCharacter:language:", v4, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

+ (id)sharedInstance
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;

  if (sharedInstance___onceToken != -1)
    dispatch_once(&sharedInstance___onceToken, &__block_literal_global_13);
  v3 = a1;
  objc_sync_enter(v3);
  v4 = (void *)sharedInstance___sharedInstances;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = objc_alloc_init((Class)objc_opt_class());
    v8 = (void *)sharedInstance___sharedInstances;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v10);

  }
  objc_sync_exit(v3);

  return v7;
}

void __44__AXSSWordDescriptionManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  v1 = (void *)sharedInstance___sharedInstances;
  sharedInstance___sharedInstances = v0;

}

- (id)descriptionForWord:(id)a3
{
  return 0;
}

- (id)descriptionOfWord:(id)a3 forLanguage:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v5 = a3;
  v6 = (__CFString *)a4;
  if (-[__CFString hasPrefix:](v6, "hasPrefix:", CFSTR("ja")))
  {
    +[AXSSWordDescriptionManager sharedInstance](AXSSWordDescriptionManager_ja, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("ja");
  }
  else
  {
    if ((-[__CFString hasPrefix:](v6, "hasPrefix:", CFSTR("zh")) & 1) == 0
      && !-[__CFString hasPrefix:](v6, "hasPrefix:", CFSTR("yue")))
    {
      v8 = 0;
      goto LABEL_7;
    }
    +[AXSSWordDescriptionManager sharedInstance](AXSSWordDescriptionManager_zh, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = v6;
  }
  objc_msgSend(v7, "setLanguageDialectCode:", v9);
LABEL_7:
  objc_msgSend(v8, "descriptionForWord:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSManagedObjectContext)managedObjectContext
{
  NSManagedObjectContext *managedObjectContext;
  void *v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;

  managedObjectContext = self->_managedObjectContext;
  if (!managedObjectContext)
  {
    -[AXSSWordDescriptionManager persistentStoreCoordinator](self, "persistentStoreCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (NSManagedObjectContext *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 2);
      v6 = self->_managedObjectContext;
      self->_managedObjectContext = v5;

      -[NSManagedObjectContext setPersistentStoreCoordinator:](self->_managedObjectContext, "setPersistentStoreCoordinator:", v4);
    }

    managedObjectContext = self->_managedObjectContext;
  }
  return managedObjectContext;
}

- (id)languageCode
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  -[AXSSWordDescriptionManager languageDialectCode](self, "languageDialectCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR("-"));
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v2, "substringToIndex:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  return v2;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  NSPersistentStoreCoordinator *v10;
  NSPersistentStoreCoordinator *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSPersistentStoreCoordinator *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSPersistentStoreCoordinator *v21;
  void *v22;
  id v24;

  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  if (!persistentStoreCoordinator)
  {
    -[AXSSWordDescriptionManager managedObjectModel](self, "managedObjectModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSWordDescriptionManager languageCode](self, "languageCode");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4 && -[__CFString length](v5, "length"))
    {
      if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("yue")))
      {

        v6 = CFSTR("zh");
      }
      objc_msgSend(CFSTR("AXWordDescriptionsData_"), "stringByAppendingString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URLForResource:withExtension:", v7, CFSTR("sqlite"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = (NSPersistentStoreCoordinator *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v4);
        v11 = self->_persistentStoreCoordinator;
        self->_persistentStoreCoordinator = v10;

        v12 = (void *)MEMORY[0x1E0C99D80];
        v13 = *MEMORY[0x1E0CB2AC0];
        v14 = *MEMORY[0x1E0CB2AD8];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, v14, v15, *MEMORY[0x1E0C97998], 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = self->_persistentStoreCoordinator;
        v18 = *MEMORY[0x1E0C979E8];
        v24 = 0;
        -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v17, "addPersistentStoreWithType:configuration:URL:options:error:", v18, 0, v9, v16, &v24);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v24;

        if (!v19)
        {
          v21 = self->_persistentStoreCoordinator;
          self->_persistentStoreCoordinator = 0;

          objc_msgSend(v20, "localizedDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("%s: error adding persistent store '%@'"), "-[AXSSWordDescriptionManager persistentStoreCoordinator]", v22);

        }
      }

    }
    persistentStoreCoordinator = self->_persistentStoreCoordinator;
  }
  return persistentStoreCoordinator;
}

- (NSManagedObjectModel)managedObjectModel
{
  NSManagedObjectModel *managedObjectModel;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  NSManagedObjectModel *v8;
  NSManagedObjectModel *v9;

  managedObjectModel = self->_managedObjectModel;
  if (!managedObjectModel)
  {
    -[AXSSWordDescriptionManager languageCode](self, "languageCode");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v4, "length"))
    {
      if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("yue")))
      {

        v4 = CFSTR("zh");
      }
      objc_msgSend(CFSTR("AXWordDescriptionsData_"), "stringByAppendingString:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLForResource:withExtension:", v5, CFSTR("momd"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = (NSManagedObjectModel *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v7);
        v9 = self->_managedObjectModel;
        self->_managedObjectModel = v8;

      }
      else
      {
        NSLog(CFSTR("%s: failed to find managed object model in bundle"), "-[AXSSWordDescriptionManager managedObjectModel]");
      }

    }
    managedObjectModel = self->_managedObjectModel;
  }
  return managedObjectModel;
}

- (NSString)languageDialectCode
{
  return self->languageDialectCode;
}

- (void)setLanguageDialectCode:(id)a3
{
  objc_storeStrong((id *)&self->languageDialectCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->languageDialectCode, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

void __52__AXSSWordDescriptionManager_ja_descriptionForWord___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t i;
  id v36;
  _OWORD v37[2];
  _QWORD v38[5];

  v38[4] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (GetHiraganaSet___onceToken != -1)
    dispatch_once(&GetHiraganaSet___onceToken, &__block_literal_global_16);
  v38[0] = GetHiraganaSet___hiraganaSet;
  if (GetKatakanaSet___onceToken != -1)
    dispatch_once(&GetKatakanaSet___onceToken, &__block_literal_global_43);
  v38[1] = GetKatakanaSet___katakanaSet;
  if (GetHalfWidthLatinSet___onceToken != -1)
    dispatch_once(&GetHalfWidthLatinSet___onceToken, &__block_literal_global_46);
  v38[2] = GetHalfWidthLatinSet___halfWidthLatinSet;
  if (GetFullWidthLatinSet___onceToken != -1)
    dispatch_once(&GetFullWidthLatinSet___onceToken, &__block_literal_global_49_0);
  v38[3] = GetFullWidthLatinSet___fullWidthLatinSet;
  v37[0] = xmmword_1E5F99CF0;
  v37[1] = *(_OWORD *)off_1E5F99D00;
  if ((objc_msgSend(v7, "_isOnlyIdeographs") & 1) != 0)
    goto LABEL_36;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "length")
    || (v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), v8 > 3))
  {
LABEL_23:
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "length"))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      if (v13 <= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), *((_QWORD *)v37 + v13), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);

      }
    }
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = 0;

    v17 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
    while (!objc_msgSend(v7, "_contentsExclusivelyInCharacterSet:", v38[v17]))
    {
      if (++v17 == 4)
        goto LABEL_31;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v17;
LABEL_31:
    v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    if (v18 <= 3)
    {
      v19 = (void *)MEMORY[0x1E0CB37A0];
      objc_msgSend(*(id *)(a1 + 32), "_convertString:ifNeededForHiragana:", v7, v18 == 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithString:", v12);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;

      goto LABEL_33;
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
LABEL_36:
    v23 = 0;
    goto LABEL_37;
  }
  v9 = v38[v8];
  v10 = v7;
  if ((objc_msgSend(v10, "_contentsExclusivelyInCharacterSet:", v9) & 1) == 0)
  {
    if (GetHiraganaSet___onceToken != -1)
      dispatch_once(&GetHiraganaSet___onceToken, &__block_literal_global_16);
    if (GetHiraganaSet___hiraganaSet != v9)
    {
      if (GetKatakanaSet___onceToken != -1)
        dispatch_once(&GetKatakanaSet___onceToken, &__block_literal_global_43);
      if (GetKatakanaSet___katakanaSet != v9)
        goto LABEL_22;
    }
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("ー")) & 1) == 0
      && (objc_msgSend(v10, "isEqualToString:", CFSTR("・")) & 1) == 0)
    {
LABEL_22:

      goto LABEL_23;
    }
  }

  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "_convertString:ifNeededForHiragana:", v10, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) == 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendString:", v12);
LABEL_33:

  if (a3 + a4 != objc_msgSend(*(id *)(a1 + 48), "length"))
    goto LABEL_46;
  v23 = 1;
LABEL_37:
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "length"))
  {
    v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    if (v24 <= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), *((_QWORD *)v37 + v24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v25);

    }
  }
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = 0;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  if ((v23 & 1) == 0)
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("Entry"));
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("character == %@"), v7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setPredicate:", v29);

    v30 = *(void **)(a1 + 56);
    v36 = 0;
    objc_msgSend(v30, "executeFetchRequest:error:", v28, &v36);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v36;
    if (objc_msgSend(v31, "count"))
    {
      objc_msgSend(v31, "objectAtIndex:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "valueForKey:", CFSTR("exemplar"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "length"))
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v34);

    }
  }
LABEL_46:
  for (i = 24; i != -8; i -= 8)

}

@end
