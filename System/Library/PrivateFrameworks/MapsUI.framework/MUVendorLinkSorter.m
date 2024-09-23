@implementation MUVendorLinkSorter

- (MUVendorLinkSorter)initWithViewModels:(id)a3
{
  id v5;
  MUVendorLinkSorter *v6;
  MUVendorLinkSorter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUVendorLinkSorter;
  v6 = -[MUVendorLinkSorter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewModels, a3);

  return v7;
}

- (id)sortedViewModelsForParameters:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  id obj;
  id v27;
  uint64_t v28;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  objc_msgSend(v25, "preferredOrdering");
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(obj, "count"))
  {
    objc_msgSend(v25, "preferredOrdering");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v3;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    if (v4)
    {
      v28 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v44 != v28)
            objc_enumerationMutation(obj);
          v6 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v7 = self->_viewModels;
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
          if (v8)
          {
            v9 = *(_QWORD *)v40;
            while (2)
            {
              for (j = 0; j != v8; ++j)
              {
                if (*(_QWORD *)v40 != v9)
                  objc_enumerationMutation(v7);
                v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
                objc_msgSend(v11, "partnerId");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v12, "isEqualToString:", v6);

                if (v13)
                {
                  objc_msgSend(v27, "addObject:", v11);
                  goto LABEL_17;
                }
              }
              v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
              if (v8)
                continue;
              break;
            }
          }
LABEL_17:

        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      }
      while (v4);
    }

    v14 = (void *)objc_msgSend(v27, "copy");
  }
  else
  {
    v27 = (id)-[NSArray mutableCopy](self->_viewModels, "mutableCopy");
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__4;
    v37 = __Block_byref_object_dispose__4;
    v38 = 0;
    objc_msgSend(v25, "winningAdamId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length") == 0;

    if (!v16)
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __52__MUVendorLinkSorter_sortedViewModelsForParameters___block_invoke;
      v30[3] = &unk_1E2E02E38;
      v17 = v25;
      v31 = v17;
      v32 = &v33;
      v18 = objc_msgSend(v27, "indexOfObjectPassingTest:", v30);
      if (v18 >= objc_msgSend(v27, "count"))
      {
        if (qword_1ED01B5E8 != -1)
          dispatch_once(&qword_1ED01B5E8, &__block_literal_global_36);
        v19 = (id)_MergedGlobals_124;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v17, "winningAdamId");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v48 = v20;
          _os_log_impl(&dword_191DB8000, v19, OS_LOG_TYPE_ERROR, "Could not remove winning adam id @%@", buf, 0xCu);

        }
      }
      else
      {
        objc_msgSend(v27, "removeObjectAtIndex:", v18);
      }

    }
    if (objc_msgSend(v25, "sortAlphabetically"))
    {
      v21 = (void *)objc_msgSend(v27, "copy");
      -[MUVendorLinkSorter _sortViewModelsAlphabetically:](self, "_sortViewModelsAlphabetically:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = (void *)objc_msgSend(v27, "copy");
    }
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_viewModels, "count"));
    objc_msgSend(v23, "_mapsui_addObjectIfNotNil:", v34[5]);
    objc_msgSend(v23, "addObjectsFromArray:", v22);
    v14 = (void *)objc_msgSend(v23, "copy");

    _Block_object_dispose(&v33, 8);
  }

  return v14;
}

uint64_t __52__MUVendorLinkSorter_sortedViewModelsForParameters___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v7 = a2;
  objc_msgSend(v7, "appAdamId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "winningAdamId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((_DWORD)v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

  return v10;
}

- (id)_sortViewModelsAlphabetically:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_23);
}

uint64_t __52__MUVendorLinkSorter__sortViewModelsAlphabetically___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "providerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "providerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCompare:", v6);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModels, 0);
}

@end
