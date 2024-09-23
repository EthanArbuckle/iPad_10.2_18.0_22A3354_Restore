@implementation CLSFocusPeopleCache

- (CLSFocusPeopleCache)initWithPhotoLibrary:(id)a3 maximumNumberOfPeople:(unint64_t)a4
{
  id v6;
  CLSFocusPeopleCache *v7;
  CLSFocusPeopleCache *v8;
  uint64_t v9;
  NSSet *personLocalIdentifiers;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLSFocusPeopleCache;
  v7 = -[CLSFocusPeopleCache init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_photoLibrary, v6);
    v8->_maximumNumberOfPeople = a4;
    -[CLSFocusPeopleCache _collectValidPersonLocalIdentifiers](v8, "_collectValidPersonLocalIdentifiers");
    v9 = objc_claimAutoreleasedReturnValue();
    personLocalIdentifiers = v8->_personLocalIdentifiers;
    v8->_personLocalIdentifiers = (NSSet *)v9;

  }
  return v8;
}

- (void)invalidate
{
  NSSet *personLocalIdentifiers;
  CLSFocusPeopleCache *obj;

  obj = self;
  objc_sync_enter(obj);
  personLocalIdentifiers = obj->_personLocalIdentifiers;
  obj->_personLocalIdentifiers = 0;

  objc_sync_exit(obj);
}

- (id)_collectValidPersonLocalIdentifiers
{
  unint64_t maximumNumberOfPeople;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  maximumNumberOfPeople = self->_maximumNumberOfPeople;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  objc_msgSend(WeakRetained, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPersonContext:", 1);
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (maximumNumberOfPeople && objc_msgSend(v5, "count") > maximumNumberOfPeople)
  {
    objc_msgSend(v6, "fetchedObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_personSortDescriptors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingDescriptors:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "subarrayWithRange:", 0, maximumNumberOfPeople);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    maximumNumberOfPeople = objc_msgSend(v6, "count");
    v10 = v6;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", maximumNumberOfPeople);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "localIdentifier", (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return v11;
}

- (NSSet)personLocalIdentifiers
{
  return self->_personLocalIdentifiers;
}

- (unint64_t)maximumNumberOfPeople
{
  return self->_maximumNumberOfPeople;
}

- (void)setMaximumNumberOfPeople:(unint64_t)a3
{
  self->_maximumNumberOfPeople = a3;
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_loadWeakRetained((id *)&self->_photoLibrary);
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_photoLibrary, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
}

+ (id)_personSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("faceCount"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("localIdentifier"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
