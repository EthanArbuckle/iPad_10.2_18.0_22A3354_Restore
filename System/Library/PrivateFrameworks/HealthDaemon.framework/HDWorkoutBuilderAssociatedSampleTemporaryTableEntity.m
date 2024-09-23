@implementation HDWorkoutBuilderAssociatedSampleTemporaryTableEntity

+ (BOOL)withLocalTableName:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7;
  uint64_t (**v8)(id, id *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = (uint64_t (**)(id, id *))a5;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "threadDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HDWorkoutBuilderAssociatedSampleTemporaryTableEntityLocalTableKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "threadDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("HDWorkoutBuilderAssociatedSampleTemporaryTableEntityLocalTableKey"));

  v15 = v8[2](v8, a4);
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "threadDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v11, CFSTR("HDWorkoutBuilderAssociatedSampleTemporaryTableEntityLocalTableKey"));
  else
    objc_msgSend(v17, "removeObjectForKey:", CFSTR("HDWorkoutBuilderAssociatedSampleTemporaryTableEntityLocalTableKey"));

  return v15;
}

+ (id)disambiguatedDatabaseTable
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HDWorkoutBuilderAssociatedSampleTemporaryTableEntityLocalTableKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDWorkoutBuilderEntity.mm"), 1200, CFSTR("Must have set the current thread's local table name."));

  }
  return v6;
}

+ (BOOL)isTemporary
{
  return 1;
}

@end
