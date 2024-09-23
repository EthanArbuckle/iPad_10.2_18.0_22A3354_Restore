@implementation CalStructuredDataArchiver

+ (NSSet)defaultPermittedClasses
{
  if (defaultPermittedClasses_onceToken != -1)
    dispatch_once(&defaultPermittedClasses_onceToken, &__block_literal_global_20);
  return (NSSet *)(id)defaultPermittedClasses_permittedClasses;
}

void __52__CalStructuredDataArchiver_defaultPermittedClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9, v10, v11);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)defaultPermittedClasses_permittedClasses;
  defaultPermittedClasses_permittedClasses = v2;

}

+ (id)unarchiveDictionaryFromData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "defaultPermittedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "unarchiveDictionaryFromData:permittedClasses:strict:error:", v6, v7, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)unarchiveDictionaryFromData:(id)a3 permittedClasses:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "unarchiveDictionaryFromData:permittedClasses:strict:error:", a3, a4, 0, a5);
}

+ (id)unarchiveDictionaryFromData:(id)a3 permittedClasses:(id)a4 strict:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  if (v9)
  {
    if (v7)
      objc_msgSend(MEMORY[0x1E0CB3710], "_strictlyUnarchivedObjectOfClasses:fromData:error:", v10, v9, a6);
    else
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v10, v9, a6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)archiveDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "defaultPermittedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "archiveDictionary:permittedClasses:strict:error:", v6, v7, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)archiveDictionary:(id)a3 permittedClasses:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "archiveDictionary:permittedClasses:strict:error:", a3, a4, 0, a5);
}

+ (id)archiveDictionary:(id)a3 permittedClasses:(id)a4 strict:(BOOL)a5 error:(id *)a6
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "CalArchivedDataWithRootObject:ofClasses:strict:error:", a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
