@implementation PHCloudIdentifierLookup

- (PHCloudIdentifierLookup)initWithPhotoLibrary:(id)a3
{
  id v5;
  PHCloudIdentifierLookup *v6;
  PHCloudIdentifierLookup *v7;
  uint64_t v8;
  NSDictionary *cloudIdentifierKeysByFetchType;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHCloudIdentifierLookup;
  v6 = -[PHCloudIdentifierLookup init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    objc_msgSend((id)objc_opt_class(), "cloudIdentifierKeysByFetchType");
    v8 = objc_claimAutoreleasedReturnValue();
    cloudIdentifierKeysByFetchType = v7->_cloudIdentifierKeysByFetchType;
    v7->_cloudIdentifierKeysByFetchType = (NSDictionary *)v8;

  }
  return v7;
}

- (BOOL)supportsIdentifierCode:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  +[PHPhotoLibrary fetchTypeForLocalIdentifierCode:](PHPhotoLibrary, "fetchTypeForLocalIdentifierCode:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_cloudIdentifierKeysByFetchType, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)lookupLocalIdentifiersForCloudIdentifiers:(id)a3
{
  id v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *localIdentifersByCloudIdentiferStrings;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_cloudIdentifiers, a3);
  v6 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  localIdentifersByCloudIdentiferStrings = self->_localIdentifersByCloudIdentiferStrings;
  self->_localIdentifersByCloudIdentiferStrings = v6;

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v14, "identifierCode");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v15);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v14, "identifierCode");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v17);

        }
        objc_msgSend(v14, "localCloudIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v18);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __69__PHCloudIdentifierLookup_lookupLocalIdentifiersForCloudIdentifiers___block_invoke;
  v21[3] = &unk_1E35D90A8;
  v21[4] = self;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v21);
  v19 = self->_localIdentifersByCloudIdentiferStrings;

  return v19;
}

- (void)_lookupLocalIdentifiersForIdentifierCode:(id)a3 codeSpecificCloudIdentifierStrings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSMutableSet *unresolvedCloudIdentifierStrings;
  void *v11;
  id v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *resolvedCloudIdentifiersForLocalCloudIdentifiers;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  NSMutableSet *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  PHCloudIdentifierLookup *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[5];
  id v60;
  id v61;
  _BYTE v62[128];
  uint8_t v63[128];
  uint8_t buf[4];
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PHCloudIdentifierLookup _lookupCodeSpecificCloudIdentifierStrings:forIdentifierCode:](self, "_lookupCodeSpecificCloudIdentifierStrings:forIdentifierCode:", v7, v6);
  if (-[NSMutableSet count](self->_unresolvedCloudIdentifierStrings, "count"))
  {
    -[PHPhotoLibrary assetsdClient](self->_photoLibrary, "assetsdClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photoKitClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    unresolvedCloudIdentifierStrings = self->_unresolvedCloudIdentifierStrings;
    v61 = 0;
    objc_msgSend(v9, "resolveLocalIdentifiersForCloudIdentifiers:error:", unresolvedCloudIdentifierStrings, &v61);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v61;

    if (v11)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      resolvedCloudIdentifiersForLocalCloudIdentifiers = self->_resolvedCloudIdentifiersForLocalCloudIdentifiers;
      self->_resolvedCloudIdentifiersForLocalCloudIdentifiers = v13;

      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __103__PHCloudIdentifierLookup__lookupLocalIdentifiersForIdentifierCode_codeSpecificCloudIdentifierStrings___block_invoke;
      v59[3] = &unk_1E35D90D0;
      v59[4] = self;
      v15 = v7;
      v60 = v15;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v59);
      if (objc_msgSend(v15, "count"))
        -[PHCloudIdentifierLookup _lookupCodeSpecificCloudIdentifierStrings:forIdentifierCode:](self, "_lookupCodeSpecificCloudIdentifierStrings:forIdentifierCode:", v15, v6);

    }
    else
    {
      PLPhotoKitGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v65 = v12;
        _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "failed to get identifier conversion from CPL with error: %@", buf, 0xCu);
      }

    }
  }
  v44 = v7;
  v46 = v6;
  if (-[NSMutableSet count](self->_unresolvedCloudIdentifierStrings, "count"))
  {
    +[PHPhotoLibrary fetchTypeForLocalIdentifierCode:](PHPhotoLibrary, "fetchTypeForLocalIdentifierCode:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "fetchOptionsForResolvingIdentifiersInLibrary:", self->_photoLibrary);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet allObjects](self->_unresolvedCloudIdentifierStrings, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForType:withIdentifiers:local:options:](PHQuery, "queryForType:withIdentifiers:local:options:", v17, v19, 1, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "executeQuery");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v56 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v26, "uuid", v44, v46);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "localIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localIdentifersByCloudIdentiferStrings, "setObject:forKeyedSubscript:", v28, v27);

          -[NSMutableSet removeObject:](self->_unresolvedCloudIdentifierStrings, "removeObject:", v27);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      }
      while (v23);
    }

    v7 = v44;
    v6 = v46;
  }
  if (-[NSMutableSet count](self->_unresolvedCloudIdentifierStrings, "count", v44, v46))
  {
    +[PHAsset identifierCode](PHAsset, "identifierCode");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v6, "isEqualToString:", v29);

    if (v30)
    {
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableSet count](self->_unresolvedCloudIdentifierStrings, "count"));
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableSet count](self->_unresolvedCloudIdentifierStrings, "count"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v33 = self->_cloudIdentifiers;
      v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
      if (!v34)
        goto LABEL_32;
      v35 = v34;
      v36 = *(_QWORD *)v52;
      while (1)
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v52 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
          v39 = self->_unresolvedCloudIdentifierStrings;
          objc_msgSend(v38, "localCloudIdentifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSMutableSet containsObject:](v39, "containsObject:", v40))
          {
            objc_msgSend(v38, "fingerPrint");
            v41 = objc_claimAutoreleasedReturnValue();

            if (!v41)
              continue;
            objc_msgSend(v31, "addObject:", v38);
            objc_msgSend(v32, "addObject:", v41);
            v40 = (void *)v41;
          }

        }
        v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
        if (!v35)
        {
LABEL_32:

          -[PHCloudIdentifierLookup _getAssetLocalIdentifiersByFingerPrintForFingerPrints:](self, "_getAssetLocalIdentifiersByFingerPrintForFingerPrints:", v32);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __103__PHCloudIdentifierLookup__lookupLocalIdentifiersForIdentifierCode_codeSpecificCloudIdentifierStrings___block_invoke_37;
          v48[3] = &unk_1E35D90F8;
          v49 = v42;
          v50 = self;
          v43 = v42;
          objc_msgSend(v31, "enumerateObjectsUsingBlock:", v48);

          v7 = v45;
          v6 = v47;
          break;
        }
      }
    }
  }

}

- (void)_lookupCodeSpecificCloudIdentifierStrings:(id)a3 forIdentifierCode:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableSet *unresolvedCloudIdentifierStrings;
  void *v15;
  NSMutableSet *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[PHPhotoLibrary fetchTypeForLocalIdentifierCode:](PHPhotoLibrary, "fetchTypeForLocalIdentifierCode:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9
    || (-[NSDictionary objectForKeyedSubscript:](self->_cloudIdentifierKeysByFetchType, "objectForKeyedSubscript:", v9),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHCloudIdentifierLookup.m"), 167, CFSTR("Unsupported identifier code: %@"), v8);

    v10 = 0;
  }
  v31 = v8;
  objc_msgSend((id)objc_opt_class(), "fetchOptionsForResolvingIdentifiersInLibrary:", self->_photoLibrary);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v9;
  +[PHQuery queryForType:withIdentifiers:identifierKeyPath:options:](PHQuery, "queryForType:withIdentifiers:identifierKeyPath:options:", v9, v7, v10);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "executeQuery");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  if (v13 != objc_msgSend(v7, "count"))
  {
    unresolvedCloudIdentifierStrings = self->_unresolvedCloudIdentifierStrings;
    if (unresolvedCloudIdentifierStrings)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet unionSet:](unresolvedCloudIdentifierStrings, "unionSet:", v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v7);
      v16 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v15 = self->_unresolvedCloudIdentifierStrings;
      self->_unresolvedCloudIdentifierStrings = v16;
    }

  }
  v32 = v7;
  objc_msgSend(v7, "removeAllObjects");
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v17 = v12;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v22, "valueForKeyPath:", v10);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet removeObject:](self->_unresolvedCloudIdentifierStrings, "removeObject:", v23);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_resolvedCloudIdentifiersForLocalCloudIdentifiers, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
        {
          v26 = v24;

          v23 = v26;
        }
        objc_msgSend(v22, "localIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localIdentifersByCloudIdentiferStrings, "setObject:forKeyedSubscript:", v27, v23);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v19);
  }

}

- (id)_getAssetLocalIdentifiersByFingerPrintForFingerPrints:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  __CFString *v10;
  id v11;
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[PHPhotoLibrary managedObjectContext](self->_photoLibrary, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __81__PHCloudIdentifierLookup__getAssetLocalIdentifiersByFingerPrintForFingerPrints___block_invoke;
    v9[3] = &unk_1E35DE750;
    v10 = CFSTR("additionalAttributes.originalStableHash");
    v11 = v4;
    v12 = v6;
    v13 = v5;
    v7 = v6;
    objc_msgSend(v7, "performBlockAndWait:", v9);

  }
  return v5;
}

- (id)lookupCloudIdentifiersForLocalIdentifiers:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *cloudIdentifiersByLocalIdentifiers;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  NSMutableDictionary *v16;
  PHCloudIdentifierLookup *v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  cloudIdentifiersByLocalIdentifiers = self->_cloudIdentifiersByLocalIdentifiers;
  v18 = self;
  self->_cloudIdentifiersByLocalIdentifiers = v5;

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        +[PHObject identifierCodeFromLocalIdentifier:](PHObject, "identifierCodeFromLocalIdentifier:", v13, v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v14);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v14);
          }
          objc_msgSend(v15, "addObject:", v13);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __69__PHCloudIdentifierLookup_lookupCloudIdentifiersForLocalIdentifiers___block_invoke;
  v19[3] = &unk_1E35D90A8;
  v19[4] = v18;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v19);
  v16 = v18->_cloudIdentifiersByLocalIdentifiers;

  return v16;
}

- (void)_lookupCloudIdentifiersForIdentifierCode:(id)a3 codeSpecificLocalIdentifiers:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  PHCloudIdentifier *v30;
  const __CFString *v31;
  PHCloudIdentifier *v32;
  NSMutableDictionary *cloudIdentifiersByLocalIdentifiers;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  PHCloudIdentifierLookup *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[PHPhotoLibrary fetchTypeForLocalIdentifierCode:](PHPhotoLibrary, "fetchTypeForLocalIdentifierCode:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_cloudIdentifierKeysByFetchType, "objectForKeyedSubscript:", v9);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v42)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHCloudIdentifierLookup.m"), 259, CFSTR("Unsupported identifier code: %@"), v7);

  }
  objc_msgSend((id)objc_opt_class(), "fetchOptionsForResolvingIdentifiersInLibrary:", self->_photoLibrary);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withIdentifiers:local:options:](PHQuery, "queryForType:withIdentifiers:local:options:", v9, v8, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "executeQuery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAsset identifierCode](PHAsset, "identifierCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v7;
  v12 = objc_msgSend(v7, "isEqualToString:", v11);

  v38 = (void *)v9;
  v39 = v8;
  v41 = self;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v49 != v17)
            objc_enumerationMutation(v14);
          +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v16);
    }

    -[PHCloudIdentifierLookup _fingerPrintsForAssetUUIDs:](v41, "_fingerPrintsForAssetUUIDs:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v10;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v45 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v25, "valueForKeyPath:", v42);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v26, "length"))
        {
          objc_msgSend(v25, "uuid");
          v27 = objc_claimAutoreleasedReturnValue();

          v26 = (void *)v27;
        }
        objc_msgSend(v25, "uuid");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v28);
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v30 = [PHCloudIdentifier alloc];
        if (v29)
          v31 = v29;
        else
          v31 = &stru_1E35DFFF8;
        v32 = -[PHCloudIdentifier initWithLocalCloudIdentifier:identifierCode:fingerPrint:](v30, "initWithLocalCloudIdentifier:identifierCode:fingerPrint:", v26, v43, v31);
        cloudIdentifiersByLocalIdentifiers = v41->_cloudIdentifiersByLocalIdentifiers;
        objc_msgSend(v25, "localIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](cloudIdentifiersByLocalIdentifiers, "setObject:forKeyedSubscript:", v32, v34);

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v22);
  }

}

- (id)_computeFingerprintsForAssetsWithObjectIDsByUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary assetsdClient](self->_photoLibrary, "assetsdClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PLPhotoKitGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v18 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_INFO, "Generating fingerprints on demand for %ld assets", buf, 0xCu);
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__PHCloudIdentifierLookup__computeFingerprintsForAssetsWithObjectIDsByUUID___block_invoke;
  v14[3] = &unk_1E35D9170;
  v15 = v7;
  v9 = v5;
  v16 = v9;
  v10 = v7;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v14);
  v11 = v16;
  v12 = v9;

  return v12;
}

- (id)_fingerPrintsForAssetUUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  __CFString *v15;
  id v16;
  id v17;
  id v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPhotoLibrary managedObjectContext](self->_photoLibrary, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__PHCloudIdentifierLookup__fingerPrintsForAssetUUIDs___block_invoke;
    v13[3] = &unk_1E35DEB10;
    v14 = v4;
    v15 = CFSTR("additionalAttributes.originalStableHash");
    v16 = v7;
    v8 = v5;
    v17 = v8;
    v9 = v6;
    v18 = v9;
    v10 = v7;
    objc_msgSend(v10, "performBlockAndWait:", v13);
    if (objc_msgSend(v9, "count"))
    {
      -[PHCloudIdentifierLookup _computeFingerprintsForAssetsWithObjectIDsByUUID:](self, "_computeFingerprintsForAssetsWithObjectIDsByUUID:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
        objc_msgSend(v8, "addEntriesFromDictionary:", v11);

    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudIdentifiersByLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_resolvedCloudIdentifiersForLocalCloudIdentifiers, 0);
  objc_storeStrong((id *)&self->_unresolvedCloudIdentifierStrings, 0);
  objc_storeStrong((id *)&self->_localIdentifersByCloudIdentiferStrings, 0);
  objc_storeStrong((id *)&self->_cloudIdentifiers, 0);
  objc_storeStrong((id *)&self->_cloudIdentifierKeysByFetchType, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __54__PHCloudIdentifierLookup__fingerPrintsForAssetUUIDs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[4];
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PHAsset managedEntityName](PHAsset, "managedEntityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("uuid"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  +[PHObject identifierPropertiesToFetch](PHAsset, "identifierPropertiesToFetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPropertiesToFetch:", v7);
  objc_msgSend(v4, "setResultType:", 2);
  v8 = *(void **)(a1 + 48);
  v17 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v4, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;
  if (v9)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__PHCloudIdentifierLookup__fingerPrintsForAssetUUIDs___block_invoke_2;
    v13[3] = &unk_1E35D9198;
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 56);
    v16 = *(id *)(a1 + 64);
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

    v11 = v14;
  }
  else
  {
    PLPhotoKitGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v19 = v12;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch identifier information for cloud identifier fingerprints: %{public}@", buf, 0xCu);
    }
  }

}

void __54__PHCloudIdentifierLookup__fingerPrintsForAssetUUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v3, v4);
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("objectID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v5, v4);

  }
}

void __76__PHCloudIdentifierLookup__computeFingerprintsForAssetsWithObjectIDsByUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__PHCloudIdentifierLookup__computeFingerprintsForAssetsWithObjectIDsByUUID___block_invoke_2;
  v8[3] = &unk_1E35D9148;
  v6 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "computeFingerPrintsOfAsset:synchronously:completionHandler:", a3, 1, v8);

}

void __76__PHCloudIdentifierLookup__computeFingerprintsForAssetsWithObjectIDsByUUID___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, *(_QWORD *)(a1 + 40));
  }
  else
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "Failed to generate fingerprint for asset %{public}@: %@", (uint8_t *)&v9, 0x16u);
    }

  }
}

void __69__PHCloudIdentifierLookup_lookupCloudIdentifiersForLocalIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "supportsIdentifierCode:", v7))
  {
    v6 = (void *)MEMORY[0x19AEBEADC]();
    objc_msgSend(*(id *)(a1 + 32), "_lookupCloudIdentifiersForIdentifierCode:codeSpecificLocalIdentifiers:", v7, v5);
    objc_autoreleasePoolPop(v6);
  }

}

void __81__PHCloudIdentifierLookup__getAssetLocalIdentifiersByFingerPrintForFingerPrints___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[4];
  NSObject *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PHAsset managedEntityName](PHAsset, "managedEntityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  +[PHObject identifierPropertiesToFetch](PHAsset, "identifierPropertiesToFetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPropertiesToFetch:", v7);
  objc_msgSend(v4, "setResultType:", 2);
  v8 = *(void **)(a1 + 48);
  v16 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v4, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  if (v9)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __81__PHCloudIdentifierLookup__getAssetLocalIdentifiersByFingerPrintForFingerPrints___block_invoke_2;
    v13[3] = &unk_1E35D9120;
    v14 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 56);
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

    v11 = v14;
  }
  else
  {
    PLPhotoKitGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch identifier information for cloud identifier fingerprints: %{public}@", buf, 0xCu);
    }
  }

}

void __81__PHCloudIdentifierLookup__getAssetLocalIdentifiersByFingerPrintForFingerPrints___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHObject localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "addObject:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v10);

  }
}

void __103__PHCloudIdentifierLookup__lookupLocalIdentifiersForIdentifierCode_codeSpecificCloudIdentifierStrings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", v5))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", v5, v6);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", v5);
  }
  else
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "PHCloudIdentifier cloud->local translation received unexpected result from assetsd: cloudIdentifier = %@, localIdentifier = %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

void __103__PHCloudIdentifierLookup__lookupLocalIdentifiersForIdentifierCode_codeSpecificCloudIdentifierStrings___block_invoke_37(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "fingerPrint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v7, "localCloudIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObject:", v5);
    if (objc_msgSend(v4, "count") == 1)
    {
      objc_msgSend(v4, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setObject:forKeyedSubscript:", v6, v5);

    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setObject:forKeyedSubscript:", v4, v5);
    }

  }
}

void __69__PHCloudIdentifierLookup_lookupLocalIdentifiersForCloudIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "supportsIdentifierCode:", v7))
  {
    v6 = (void *)MEMORY[0x19AEBEADC]();
    objc_msgSend(*(id *)(a1 + 32), "_lookupLocalIdentifiersForIdentifierCode:codeSpecificCloudIdentifierStrings:", v7, v5);
    objc_autoreleasePoolPop(v6);
  }

}

+ (id)cloudIdentifierKeysByFetchType
{
  return &unk_1E3657860;
}

+ (id)fetchOptionsForResolvingIdentifiersInLibrary:(id)a3
{
  void *v3;

  +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsExclusivePredicate:", 1);
  return v3;
}

@end
