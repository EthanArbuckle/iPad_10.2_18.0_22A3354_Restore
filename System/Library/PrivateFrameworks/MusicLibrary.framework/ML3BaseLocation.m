@implementation ML3BaseLocation

+ (id)newWithDictionary:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v6, "objectForKey:", CFSTR("ROWID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("path"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = ML3BaseLocationIDFromMediaRelativePathInLibrary(v10, v7);
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v13, CFSTR("ROWID"));

      }
    }

  }
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___ML3BaseLocation;
  v14 = objc_msgSendSuper2(&v16, sel_newWithDictionary_inLibrary_, v8, v7);

  return v14;
}

+ (id)databaseTable
{
  return CFSTR("base_location");
}

+ (BOOL)insertionChangesLibraryContents
{
  return 0;
}

- (void)enumerateOrphanedAssetsUsingBlock:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *context;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  context = (void *)MEMORY[0x1AF43CC0C]();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("ROWID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3ComparisonPredicate predicateWithProperty:equalToValue:](ML3ComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("base_location_id"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3Entity queryWithLibrary:predicate:](ML3Track, "queryWithLibrary:predicate:", WeakRetained, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("item_extra.location"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __53__ML3BaseLocation_enumerateOrphanedAssetsUsingBlock___block_invoke;
  v38[3] = &unk_1E5B62770;
  v30 = v8;
  v39 = v30;
  v28 = v7;
  objc_msgSend(v7, "enumeratePersistentIDsAndProperties:usingBlock:", v9, v38);

  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("path"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)v10;
  objc_msgSend(v11, "enumeratorAtPath:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    v17 = *MEMORY[0x1E0CB2B18];
    v18 = *MEMORY[0x1E0CB2B28];
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        v20 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v19);
        objc_msgSend(v13, "fileAttributes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", v18);

        if (v23)
          objc_msgSend(v30, "removeObject:", v20);
        ++v19;
      }
      while (v15 != v19);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v15);
  }

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __53__ML3BaseLocation_enumerateOrphanedAssetsUsingBlock___block_invoke_2;
  v31[3] = &unk_1E5B62798;
  v24 = v27;
  v32 = v26;
  v33 = v24;
  v25 = v26;
  objc_msgSend(v30, "enumerateObjectsUsingBlock:", v31);

  objc_autoreleasePoolPop(context);
}

uint64_t __53__ML3BaseLocation_enumerateOrphanedAssetsUsingBlock___block_invoke(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (*a3)
    return objc_msgSend(*(id *)(result + 32), "addObject:");
  return result;
}

uint64_t __53__ML3BaseLocation_enumerateOrphanedAssetsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
