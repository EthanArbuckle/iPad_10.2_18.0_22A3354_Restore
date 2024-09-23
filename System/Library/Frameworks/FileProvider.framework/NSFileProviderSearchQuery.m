@implementation NSFileProviderSearchQuery

- (NSSet)allowedPathExtensions
{
  NSSet *cachedExtensions;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSSet *v24;
  NSSet *allowedUTTypes;
  NSFileProviderSearchQuery *v27;
  uint64_t v28;
  NSSet *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  cachedExtensions = self->_cachedExtensions;
  if (!cachedExtensions)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0C99E20];
    v27 = self;
    -[NSFileProviderSearchQuery allowedContentTypes](self, "allowedContentTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v29 = (NSSet *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v28 = *MEMORY[0x1E0CEC400];
      do
      {
        objc_msgSend(v7, "removeObject:", v9);
        objc_msgSend(v4, "addObject:", v9);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[NSSet addObject:](v29, "addObject:", v10);
          objc_msgSend(v10, "tags");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", v28);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObjectsFromArray:", v12);

          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v31 = v10;
          objc_msgSend(v10, "_childTypes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v33 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
                objc_msgSend(v18, "identifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v4, "containsObject:", v19);

                if ((v20 & 1) == 0)
                {
                  objc_msgSend(v18, "identifier");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "addObject:", v21);

                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
            }
            while (v15);
          }

          v10 = v31;
        }

        objc_msgSend(v7, "anyObject");
        v22 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v22;
      }
      while (v22);
    }
    v23 = objc_msgSend(v30, "copy");
    v24 = v27->_cachedExtensions;
    v27->_cachedExtensions = (NSSet *)v23;

    allowedUTTypes = v27->_allowedUTTypes;
    v27->_allowedUTTypes = v29;

    cachedExtensions = v27->_cachedExtensions;
  }
  return cachedExtensions;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSSet)allowedContentTypes
{
  return self->_allowedContentTypes;
}

- (NSString)scopedToItemIdentifier
{
  return self->_scopedToItemIdentifier;
}

- (NSString)searchContainerItemIdentifier
{
  return self->_searchContainerItemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchContainerItemIdentifier, 0);
  objc_storeStrong((id *)&self->_scopedToItemIdentifier, 0);
  objc_storeStrong((id *)&self->_allowedContentTypes, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_spotlightQueryString, 0);
  objc_storeStrong((id *)&self->_allowedUTTypes, 0);
  objc_storeStrong((id *)&self->_cachedExtensions, 0);
  objc_storeStrong((id *)&self->_providerDomainID, 0);
  objc_storeStrong((id *)&self->_alternateScopeToItemIdentifier, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_scopedToItemIdentifierBundleId, 0);
  objc_storeStrong((id *)&self->_userQueryString, 0);
  objc_storeStrong((id *)&self->_scopeFragment, 0);
}

- (NSFileProviderSearchQuery)initWithSearchScope:(id)a3
{
  return -[NSFileProviderSearchQuery initWithSearchScopedToItemIdentifier:alternateItemIdentifier:providerDomainID:searchContainerItemIdentifier:](self, "initWithSearchScopedToItemIdentifier:alternateItemIdentifier:providerDomainID:searchContainerItemIdentifier:", a3, 0, 0, 0);
}

- (NSFileProviderSearchQuery)initWithSearchScopedToItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSFileProviderSearchQuery *v7;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "providerDomainID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[NSFileProviderSearchQuery initWithSearchScopedToItemIdentifier:alternateItemIdentifier:providerDomainID:searchContainerItemIdentifier:](self, "initWithSearchScopedToItemIdentifier:alternateItemIdentifier:providerDomainID:searchContainerItemIdentifier:", v5, 0, v6, 0);
  return v7;
}

- (NSFileProviderSearchQuery)initWithSearchScopedToItemID:(id)a3 alternateItemID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  NSFileProviderSearchQuery *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileProviderSearchQuery.m"), 130, CFSTR("alternate item id defined without a main id"));

    }
    objc_msgSend(v7, "providerDomainID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "providerDomainID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if ((v12 & 1) == 0)
    {
      objc_msgSend(v7, "providerDomainID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "providerDomainID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if ((v15 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "providerDomainID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "fp_obfuscatedProviderDomainID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "providerDomainID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "fp_obfuscatedProviderDomainID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileProviderSearchQuery.m"), 134, CFSTR("domain mismatch, expected %@, got %@"), v23, v25);

      }
    }
  }
  objc_msgSend(v7, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "providerDomainID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[NSFileProviderSearchQuery initWithSearchScopedToItemIdentifier:alternateItemIdentifier:providerDomainID:searchContainerItemIdentifier:](self, "initWithSearchScopedToItemIdentifier:alternateItemIdentifier:providerDomainID:searchContainerItemIdentifier:", v16, v17, v18, 0);

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  NSFileProviderSearchQuery *v4;
  BOOL v5;

  v4 = (NSFileProviderSearchQuery *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NSFileProviderSearchQuery isEqualToFileProviderSearchQuery:](self, "isEqualToFileProviderSearchQuery:", v4);
  }

  return v5;
}

- (BOOL)isEqualToFileProviderSearchQuery:(id)a3
{
  void *v3;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  unint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;

  v5 = a3;
  v6 = -[NSFileProviderSearchQuery shouldPerformServerSearch](self, "shouldPerformServerSearch");
  if (v6 == objc_msgSend(v5, "shouldPerformServerSearch"))
  {
    v7 = -[NSFileProviderSearchQuery shouldPerformThirdPartyServerSearch](self, "shouldPerformThirdPartyServerSearch");
    if (v7 == objc_msgSend(v5, "shouldPerformThirdPartyServerSearch"))
    {
      v8 = -[NSFileProviderSearchQuery shouldPerformSemanticSearch](self, "shouldPerformSemanticSearch");
      if (v8 == objc_msgSend(v5, "shouldPerformSemanticSearch"))
      {
        v9 = -[NSFileProviderSearchQuery avoidCoreSpotlightSearch](self, "avoidCoreSpotlightSearch");
        if (v9 == objc_msgSend(v5, "avoidCoreSpotlightSearch"))
        {
          v10 = -[NSFileProviderSearchQuery trashedItemsMembership](self, "trashedItemsMembership");
          if (v10 == objc_msgSend(v5, "trashedItemsMembership"))
          {
            -[NSFileProviderSearchQuery filename](self, "filename");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "filename");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11 != v12)
            {
              -[NSFileProviderSearchQuery filename](self, "filename");
              v3 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "filename");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = v3;
              if (!objc_msgSend(v3, "isEqual:"))
              {
                v13 = 0;
                goto LABEL_44;
              }
            }
            -[NSFileProviderSearchQuery userQueryString](self, "userQueryString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "userQueryString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15 != v16)
            {
              -[NSFileProviderSearchQuery userQueryString](self, "userQueryString");
              v3 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "userQueryString");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v3, "isEqual:", v17))
              {
                v13 = 0;
LABEL_42:

LABEL_43:
                if (v11 == v12)
                {
LABEL_45:

                  goto LABEL_10;
                }
LABEL_44:

                goto LABEL_45;
              }
              v53 = v17;
            }
            -[NSFileProviderSearchQuery allowedContentTypes](self, "allowedContentTypes");
            v18 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "allowedContentTypes");
            v55 = objc_claimAutoreleasedReturnValue();
            v56 = (void *)v18;
            if (v18 != v55)
            {
              -[NSFileProviderSearchQuery allowedContentTypes](self, "allowedContentTypes");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "allowedContentTypes");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v19;
              if (!objc_msgSend(v19, "isEqual:"))
              {
                v20 = v3;
                v13 = 0;
                v21 = (void *)v55;
                v22 = v56;
LABEL_40:

LABEL_41:
                v3 = v20;
                v17 = v53;
                if (v15 == v16)
                  goto LABEL_43;
                goto LABEL_42;
              }
            }
            v49 = v15;
            -[NSFileProviderSearchQuery scopeFragment](self, "scopeFragment");
            v23 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "scopeFragment");
            v50 = objc_claimAutoreleasedReturnValue();
            v54 = (void *)v23;
            if (v23 != v50)
            {
              -[NSFileProviderSearchQuery scopeFragment](self, "scopeFragment");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "scopeFragment");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = v24;
              if (!objc_msgSend(v24, "isEqual:"))
              {
                v20 = v3;
                v13 = 0;
                v25 = (void *)v50;
LABEL_38:

LABEL_39:
                v21 = (void *)v55;
                v22 = v56;
                v15 = v49;
                if (v56 == (void *)v55)
                  goto LABEL_41;
                goto LABEL_40;
              }
            }
            -[NSFileProviderSearchQuery providerDomainID](self, "providerDomainID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "providerDomainID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26 != v27)
            {
              -[NSFileProviderSearchQuery providerDomainID](self, "providerDomainID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "providerDomainID");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = v28;
              if (!objc_msgSend(v28, "isEqual:"))
              {
                v13 = 0;
                goto LABEL_35;
              }
            }
            -[NSFileProviderSearchQuery keyboardLanguage](self, "keyboardLanguage");
            v29 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "keyboardLanguage");
            v44 = objc_claimAutoreleasedReturnValue();
            if (v29 == v44)
            {
              v39 = v27;
              v40 = v3;
            }
            else
            {
              -[NSFileProviderSearchQuery keyboardLanguage](self, "keyboardLanguage");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "keyboardLanguage");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v30;
              if (!objc_msgSend(v30, "isEqual:"))
              {
                v13 = 0;
                v36 = (void *)v29;
                v37 = (void *)v44;
                goto LABEL_33;
              }
              v39 = v27;
              v40 = v3;
            }
            v43 = v29;
            -[NSFileProviderSearchQuery scopedToItemIdentifier](self, "scopedToItemIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "scopedToItemIdentifier");
            v32 = objc_claimAutoreleasedReturnValue();
            if (v31 == (void *)v32)
            {

              v13 = 1;
            }
            else
            {
              v33 = (void *)v32;
              -[NSFileProviderSearchQuery scopedToItemIdentifier](self, "scopedToItemIdentifier");
              v38 = v26;
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "scopedToItemIdentifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v34, "isEqual:", v35);

              v26 = v38;
            }
            v36 = (void *)v29;
            v37 = (void *)v44;
            v27 = v39;
            v3 = v40;
            if (v43 == v44)
            {
LABEL_34:

              if (v26 == v27)
              {
                v20 = v3;
LABEL_37:

                v25 = (void *)v50;
                if (v54 == (void *)v50)
                  goto LABEL_39;
                goto LABEL_38;
              }
LABEL_35:
              v20 = v3;

              goto LABEL_37;
            }
LABEL_33:

            goto LABEL_34;
          }
        }
      }
    }
  }
  v13 = 0;
LABEL_10:

  return v13;
}

- (unint64_t)hash
{
  uint8x8_t v2;
  uint32x4_t v4;
  int64x2_t v5;
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  unint64_t trashedItemsMembership;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  int8x16_t v18;
  int8x16_t v20;
  int8x16_t v21;

  v2.i32[0] = *(_DWORD *)&self->_shouldPerformServerSearch;
  v4 = vmovl_u16((uint16x4_t)vceqz_s16((int16x4_t)*(_OWORD *)&vmovl_u8(v2)));
  v5.i64[0] = v4.u32[0];
  v5.i64[1] = v4.u32[1];
  v6 = (int8x16_t)vshrq_n_s64(vshlq_n_s64(v5, 0x38uLL), 0x38uLL);
  v5.i64[0] = v4.u32[2];
  v5.i64[1] = v4.u32[3];
  v7 = (int8x16_t)vdupq_n_s64(0x1FuLL);
  v8 = (int8x16_t)vdupq_n_s64(0xDuLL);
  v21 = vbslq_s8((int8x16_t)vshrq_n_s64(vshlq_n_s64(v5, 0x38uLL), 0x38uLL), v8, v7);
  v20 = vbslq_s8(v6, v8, v7);
  trashedItemsMembership = self->_trashedItemsMembership;
  v10 = -[NSString hash](self->_filename, "hash");
  v11 = -[NSString hash](self->_userQueryString, "hash");
  v12 = -[NSSet hash](self->_allowedContentTypes, "hash");
  v13 = -[NSString hash](self->_scopeFragment, "hash");
  v14 = -[NSString hash](self->_providerDomainID, "hash");
  v15 = -[NSString hash](self->_keyboardLanguage, "hash");
  v16 = -[NSString hash](self->_scopedToItemIdentifier, "hash");
  v17 = -[NSString hash](self->_alternateScopeToItemIdentifier, "hash");
  v18 = veorq_s8(v20, v21);
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v18.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL)) ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v12 ^ v11 ^ v10 ^ trashedItemsMembership;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NSFileProviderSearchQuery keyboardLanguage](self, "keyboardLanguage");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[5];
  v4[5] = v5;

  -[NSFileProviderSearchQuery scopedToItemIdentifier](self, "scopedToItemIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[15];
  v4[15] = v7;

  -[NSFileProviderSearchQuery alternateScopeToItemIdentifier](self, "alternateScopeToItemIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v4[6];
  v4[6] = v9;

  -[NSFileProviderSearchQuery searchContainerItemIdentifier](self, "searchContainerItemIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v4[16];
  v4[16] = v11;

  -[NSFileProviderSearchQuery filename](self, "filename");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilename:", v13);

  -[NSFileProviderSearchQuery userQueryString](self, "userQueryString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserQueryString:", v14);

  -[NSFileProviderSearchQuery allowedContentTypes](self, "allowedContentTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowedContentTypes:", v15);

  objc_msgSend(v4, "setShouldPerformServerSearch:", -[NSFileProviderSearchQuery shouldPerformServerSearch](self, "shouldPerformServerSearch"));
  objc_msgSend(v4, "setShouldPerformThirdPartyServerSearch:", -[NSFileProviderSearchQuery shouldPerformThirdPartyServerSearch](self, "shouldPerformThirdPartyServerSearch"));
  objc_msgSend(v4, "setShouldPerformSemanticSearch:", -[NSFileProviderSearchQuery shouldPerformSemanticSearch](self, "shouldPerformSemanticSearch"));
  objc_msgSend(v4, "setAvoidCoreSpotlightSearch:", -[NSFileProviderSearchQuery avoidCoreSpotlightSearch](self, "avoidCoreSpotlightSearch"));
  objc_msgSend(v4, "setTrashedItemsMembership:", -[NSFileProviderSearchQuery trashedItemsMembership](self, "trashedItemsMembership"));
  -[NSFileProviderSearchQuery scopeFragment](self, "scopeFragment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScopeFragment:", v16);

  -[NSFileProviderSearchQuery providerDomainID](self, "providerDomainID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProviderDomainID:", v17);

  -[NSFileProviderSearchQuery spotlightQueryString](self, "spotlightQueryString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpotlightQueryString:", v18);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileProviderSearchQuery)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSFileProviderSearchQuery *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v40;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)NSFileProviderSearchQuery;
  v5 = -[NSFileProviderSearchQuery init](&v41, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_filename"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)*((_QWORD *)v5 + 13);
  *((_QWORD *)v5 + 13) = v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userQueryString"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)*((_QWORD *)v5 + 3);
  *((_QWORD *)v5 + 3) = v8;

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v40 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_allowedContentTypes"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)*((_QWORD *)v5 + 14);
  *((_QWORD *)v5 + 14) = v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_keyboardLanguage"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v15;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_scopedToItemIdentifier"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)*((_QWORD *)v5 + 15);
  *((_QWORD *)v5 + 15) = v17;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_alternateScopeToItemIdentifier"));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)*((_QWORD *)v5 + 6);
  *((_QWORD *)v5 + 6) = v19;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_searchContainerItemIdentifier"));
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)*((_QWORD *)v5 + 16);
  *((_QWORD *)v5 + 16) = v21;

  if (*((_QWORD *)v5 + 15) && *((_QWORD *)v5 + 16))
  {
    *((_BYTE *)v5 + 8) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldPerformServerSearch"));
    *((_BYTE *)v5 + 9) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldPerformThirdPartyServerSearch"));
    *((_BYTE *)v5 + 10) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldPerformSemanticSearch"));
    *((_BYTE *)v5 + 11) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_avoidCoreSpotlightSearch"));
    *((_QWORD *)v5 + 11) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_trashedItemsMembership"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_scopeFragment"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_providerDomainID"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_spotlightQueryString"));
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v27;

LABEL_5:
    v29 = (NSFileProviderSearchQuery *)v5;
    goto LABEL_11;
  }
  fp_current_or_default_log();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    -[NSFileProviderSearchQuery(NSFileProviderSearch_Private) initWithCoder:].cold.2((uint64_t *)v5 + 15, (uint64_t *)v5 + 16, v30);

  fp_simulate_crash(CFSTR("can't create instance from coder, required nonnull properties missing"), v31, v32, v33, v34, v35, v36, v37, v40);
  fp_current_or_default_log();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    -[NSFileProviderSearchQuery(NSFileProviderSearch_Private) initWithCoder:].cold.1(v38);

  v29 = 0;
LABEL_11:

  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *filename;
  id v5;

  filename = self->_filename;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", filename, CFSTR("_filename"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userQueryString, CFSTR("_userQueryString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allowedContentTypes, CFSTR("_allowedContentTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyboardLanguage, CFSTR("_keyboardLanguage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scopedToItemIdentifier, CFSTR("_scopedToItemIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alternateScopeToItemIdentifier, CFSTR("_alternateScopeToItemIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_searchContainerItemIdentifier, CFSTR("_searchContainerItemIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldPerformServerSearch, CFSTR("_shouldPerformServerSearch"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldPerformThirdPartyServerSearch, CFSTR("_shouldPerformThirdPartyServerSearch"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldPerformSemanticSearch, CFSTR("_shouldPerformSemanticSearch"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_avoidCoreSpotlightSearch, CFSTR("_avoidCoreSpotlightSearch"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_trashedItemsMembership, CFSTR("_trashedItemsMembership"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scopeFragment, CFSTR("_scopeFragment"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providerDomainID, CFSTR("_providerDomainID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_spotlightQueryString, CFSTR("_spotlightQueryString"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  -[NSFileProviderSearchQuery searchContainerItemIdentifier](self, "searchContainerItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p id:%@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSFileProviderSearchQuery filename](self, "filename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSFileProviderSearchQuery filename](self, "filename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" filename:'%@'"), v8);

  }
  -[NSFileProviderSearchQuery allowedContentTypes](self, "allowedContentTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NSFileProviderSearchQuery allowedContentTypes](self, "allowedContentTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" uti(s):'%@'"), v10);

  }
  -[NSFileProviderSearchQuery keyboardLanguage](self, "keyboardLanguage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NSFileProviderSearchQuery keyboardLanguage](self, "keyboardLanguage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" kb language:'%@'"), v12);

  }
  -[NSFileProviderSearchQuery scopedToItemIdentifier](self, "scopedToItemIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier"));

  if (v14)
  {
    objc_msgSend(v6, "appendString:", CFSTR(" scope:root"));
  }
  else
  {
    -[NSFileProviderSearchQuery scopedToItemIdentifier](self, "scopedToItemIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" scope:%@"), v15);

  }
  -[NSFileProviderSearchQuery providerDomainID](self, "providerDomainID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[NSFileProviderSearchQuery providerDomainID](self, "providerDomainID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fp_obfuscatedFilename");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" provider:%@"), v18);

  }
  objc_msgSend(v6, "appendFormat:", CFSTR(" trashedItemsMembership:%ld"), self->_trashedItemsMembership);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (void)setSearchString:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Deprecated %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)setUserQueryString:(id)a3
{
  NSString *v4;
  NSString *userQueryString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  userQueryString = self->_userQueryString;
  self->_userQueryString = v4;

}

- (void)setFilename:(id)a3
{
  NSString *v4;
  NSString *filename;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  filename = self->_filename;
  self->_filename = v4;

}

- (void)setContent:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Deprecated %@", (uint8_t *)&v6, 0xCu);

  }
}

- (NSString)userQueryString
{
  return self->_userQueryString;
}

- (NSString)searchString
{
  return 0;
}

- (NSString)content
{
  return 0;
}

- (void)setAllowedContentTypes:(id)a3
{
  NSSet *v4;
  NSSet *allowedContentTypes;
  NSSet *cachedExtensions;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  allowedContentTypes = self->_allowedContentTypes;
  self->_allowedContentTypes = v4;

  cachedExtensions = self->_cachedExtensions;
  self->_cachedExtensions = 0;

}

- (void)setShouldPerformServerSearch:(BOOL)a3
{
  self->_shouldPerformServerSearch = a3;
}

- (BOOL)shouldPerformServerSearch
{
  return self->_shouldPerformServerSearch;
}

- (void)setShouldPerformThirdPartyServerSearch:(BOOL)a3
{
  self->_shouldPerformThirdPartyServerSearch = a3;
}

- (BOOL)shouldPerformThirdPartyServerSearch
{
  return self->_shouldPerformThirdPartyServerSearch;
}

- (void)setShouldPerformSemanticSearch:(BOOL)a3
{
  self->_shouldPerformSemanticSearch = a3;
}

- (BOOL)shouldPerformSemanticSearch
{
  return self->_shouldPerformSemanticSearch;
}

- (void)setAvoidCoreSpotlightSearch:(BOOL)a3
{
  self->_avoidCoreSpotlightSearch = a3;
}

- (BOOL)avoidCoreSpotlightSearch
{
  return self->_avoidCoreSpotlightSearch;
}

- (void)setKeyboardLanguage:(id)a3
{
  NSString *v4;
  NSString *keyboardLanguage;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  keyboardLanguage = self->_keyboardLanguage;
  self->_keyboardLanguage = v4;

}

- (NSString)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (void)setAlternateScopeToItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_alternateScopeToItemIdentifier, a3);
}

- (NSString)alternateScopeToItemIdentifier
{
  return self->_alternateScopeToItemIdentifier;
}

- (void)setSearchContainerItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_searchContainerItemIdentifier, a3);
}

- (void)setTrashedItemsMembership:(unint64_t)a3
{
  self->_trashedItemsMembership = a3;
}

- (unint64_t)trashedItemsMembership
{
  return self->_trashedItemsMembership;
}

- (void)setIncludesTrashedItems:(BOOL)a3
{
  -[NSFileProviderSearchQuery setTrashedItemsMembership:](self, "setTrashedItemsMembership:", !a3);
}

- (BOOL)includesTrashedItems
{
  return -[NSFileProviderSearchQuery trashedItemsMembership](self, "trashedItemsMembership") == 0;
}

- (id)toSpotlightQueryString
{
  return FPSpotlightQueryStringForSearchQuery(self, 1);
}

- (id)toSpotlightServerQueryString
{
  return FPSpotlightQueryStringForSearchQuery(self, 0);
}

- (NSString)scopeFragment
{
  return self->_scopeFragment;
}

- (void)setScopeFragment:(id)a3
{
  NSString *v4;
  NSString *scopeFragment;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  scopeFragment = self->_scopeFragment;
  self->_scopeFragment = v4;

}

- (NSString)providerDomainID
{
  return self->_providerDomainID;
}

- (void)setProviderDomainID:(id)a3
{
  NSString *v4;
  NSString *providerDomainID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  providerDomainID = self->_providerDomainID;
  self->_providerDomainID = v4;

}

- (NSString)spotlightQueryString
{
  return self->_spotlightQueryString;
}

- (void)setSpotlightQueryString:(id)a3
{
  NSString *v4;
  NSString *spotlightQueryString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  spotlightQueryString = self->_spotlightQueryString;
  self->_spotlightQueryString = v4;

}

- (id)filenamePredicate
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  SEL v14;

  -[NSFileProviderSearchQuery filename](self, "filename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[NSFileProviderSearchQuery keyboardLanguage](self, "keyboardLanguage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    FPSpotlightQueryStringForFilename(v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3880];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__NSFileProviderSearchQuery_Predicates__filenamePredicate__block_invoke;
    v12[3] = &unk_1E444E688;
    v13 = v7;
    v14 = a2;
    v12[4] = self;
    v9 = v7;
    objc_msgSend(v8, "predicateWithBlock:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

uint64_t __58__NSFileProviderSearchQuery_Predicates__filenamePredicate__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("NSFileProviderSearchQuery.m"), 488, CFSTR("Unexpected kind of evaluated object."));

    }
  }
  v7 = (void *)MEMORY[0x1A1B00664]();
  v8 = a1[5];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v9 = get_MDCreateSimpleQueryEvaluatorSymbolLoc_ptr;
  v20 = get_MDCreateSimpleQueryEvaluatorSymbolLoc_ptr;
  if (!get_MDCreateSimpleQueryEvaluatorSymbolLoc_ptr)
  {
    v10 = (void *)MobileSpotlightIndexLibrary();
    v9 = dlsym(v10, "_MDCreateSimpleQueryEvaluator");
    v18[3] = (uint64_t)v9;
    get_MDCreateSimpleQueryEvaluatorSymbolLoc_ptr = v9;
  }
  _Block_object_dispose(&v17, 8);
  if (!v9)
    __58__NSFileProviderSearchQuery_Predicates__filenamePredicate__block_invoke_cold_1();
  v11 = ((uint64_t (*)(uint64_t, const void *(*)(uint64_t, void *, uint64_t)))v9)(v8, _FPItemAttributeValueFunction);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v12 = get_MDSimpleQueryObjectMatchesSymbolLoc_ptr;
  v20 = get_MDSimpleQueryObjectMatchesSymbolLoc_ptr;
  if (!get_MDSimpleQueryObjectMatchesSymbolLoc_ptr)
  {
    v13 = (void *)MobileSpotlightIndexLibrary();
    v12 = dlsym(v13, "_MDSimpleQueryObjectMatches");
    v18[3] = (uint64_t)v12;
    get_MDSimpleQueryObjectMatchesSymbolLoc_ptr = v12;
  }
  _Block_object_dispose(&v17, 8);
  if (!v12)
    __58__NSFileProviderSearchQuery_Predicates__filenamePredicate__block_invoke_cold_2();
  v14 = ((uint64_t (*)(uint64_t, id))v12)(v11, v5);
  objc_autoreleasePoolPop(v7);

  return v14;
}

- (id)allowedContentTypesPredicate
{
  id v4;
  NSSet *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  NSSet *v13;
  id v14;
  SEL v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = -[NSFileProviderSearchQuery allowedPathExtensions](self, "allowedPathExtensions");
  v5 = self->_allowedUTTypes;
  if (-[NSSet count](v5, "count"))
  {
    v6 = *MEMORY[0x1E0CEC668];
    v16[0] = *MEMORY[0x1E0CEC678];
    v16[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3880];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__NSFileProviderSearchQuery_Predicates__allowedContentTypesPredicate__block_invoke;
    v12[3] = &unk_1E444E6B0;
    v15 = a2;
    v12[4] = self;
    v13 = v5;
    v14 = v7;
    v9 = v7;
    objc_msgSend(v8, "predicateWithBlock:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

uint64_t __69__NSFileProviderSearchQuery_Predicates__allowedContentTypesPredicate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("NSFileProviderSearchQuery.m"), 517, CFSTR("Unexpected kind of evaluated object."));

    }
  }
  objc_msgSend(v3, "contentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = *(id *)(a1 + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 48), "containsObject:", v10, (_QWORD)v14);
        if ((objc_msgSend(v4, "conformsToType:", v10) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_14:

  return v11;
}

- (id)predicate
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SEL v24;
  unint64_t v25;

  -[NSFileProviderSearchQuery filenamePredicate](self, "filenamePredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSFileProviderSearchQuery allowedContentTypesPredicate](self, "allowedContentTypesPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSFileProviderSearchQuery scopedToItemIdentifier](self, "scopedToItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSFileProviderSearchQuery trashedItemsMembership](self, "trashedItemsMembership");
  -[NSFileProviderSearchQuery scopeFragment](self, "scopeFragment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSFileProviderSearchQuery providerDomainID](self, "providerDomainID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3880];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __50__NSFileProviderSearchQuery_Predicates__predicate__block_invoke;
  v18[3] = &unk_1E444E6D8;
  v18[4] = self;
  v19 = v4;
  v20 = v5;
  v21 = v6;
  v24 = a2;
  v25 = v7;
  v22 = v8;
  v23 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v6;
  v14 = v5;
  v15 = v4;
  objc_msgSend(v10, "predicateWithBlock:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __50__NSFileProviderSearchQuery_Predicates__predicate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("NSFileProviderSearchQuery.m"), 547, CFSTR("Unexpected kind of evaluated object."));

    }
  }
  if (objc_msgSend(*(id *)(a1 + 40), "evaluateWithObject:", v3))
    v4 = objc_msgSend(*(id *)(a1 + 48), "evaluateWithObject:", v3);
  else
    v4 = 0;
  v5 = *(void **)(a1 + 56);
  if (v5)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier")) & 1) == 0)
    {
      v6 = *(void **)(a1 + 56);
      if (v6)
      {
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier")) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("NSFileProviderSearchQuery.m"), 559, CFSTR("scopedToItemIdentifier is not supported in the NSFileProviderSearchQuery predicate."));

        }
      }
    }
  }
  v7 = *(_QWORD *)(a1 + 88);
  if (v7 == 2)
  {
    if (v4)
      v4 = objc_msgSend(v3, "isTrashed");
  }
  else if (v7 == 1 && v4)
  {
    v4 = objc_msgSend(v3, "isTrashed") ^ 1;
  }
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("NSFileProviderSearchQuery.m"), 579, CFSTR("scopeFragment is not supported in the NSFileProviderSearchQuery predicate."));

  }
  if (v4)
  {
    if (*(_QWORD *)(a1 + 72))
    {
      objc_msgSend(v3, "providerDomainID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 72));

    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)newSearchContainerItemIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("NSFileProviderSearchContainerItemIdentifier"), "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSFileProviderSearchQuery)initWithSpotlightQueryString:(id)a3 searchScope:(id)a4 searchContainerItemIdentifier:(id)a5
{
  id v9;
  __CFString *v10;
  id v11;
  NSFileProviderSearchQuery *v12;
  NSFileProviderSearchQuery *v13;
  __CFString *v14;
  NSString *v15;
  NSString *searchContainerItemIdentifier;

  v9 = a3;
  v10 = (__CFString *)a4;
  v11 = a5;
  v12 = -[NSFileProviderSearchQuery init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_spotlightQueryString, a3);
    if (v10)
      v14 = v10;
    else
      v14 = CFSTR("NSFileProviderRootContainerItemIdentifier");
    objc_storeStrong((id *)&v13->_scopedToItemIdentifier, v14);
    if (v11)
      v15 = (NSString *)v11;
    else
      v15 = (NSString *)objc_msgSend((id)objc_opt_class(), "newSearchContainerItemIdentifier");
    searchContainerItemIdentifier = v13->_searchContainerItemIdentifier;
    v13->_searchContainerItemIdentifier = v15;

  }
  return v13;
}

- (NSFileProviderSearchQuery)initWithSearchScopedToItemIdentifier:(id)a3 alternateItemIdentifier:(id)a4 providerDomainID:(id)a5 searchContainerItemIdentifier:(id)a6
{
  __CFString *v10;
  id v11;
  id v12;
  id v13;
  NSFileProviderSearchQuery *v14;
  NSFileProviderSearchQuery *v15;
  __CFString *v16;
  NSString *v17;
  NSString *searchContainerItemIdentifier;

  v10 = (__CFString *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[NSFileProviderSearchQuery init](self, "init");
  v15 = v14;
  if (v14)
  {
    if (v10)
      v16 = v10;
    else
      v16 = CFSTR("NSFileProviderRootContainerItemIdentifier");
    objc_storeStrong((id *)&v14->_scopedToItemIdentifier, v16);
    objc_storeStrong((id *)&v15->_alternateScopeToItemIdentifier, a4);
    if (v13)
      v17 = (NSString *)v13;
    else
      v17 = (NSString *)objc_msgSend((id)objc_opt_class(), "newSearchContainerItemIdentifier");
    searchContainerItemIdentifier = v15->_searchContainerItemIdentifier;
    v15->_searchContainerItemIdentifier = v17;

    objc_storeStrong((id *)&v15->_providerDomainID, a5);
  }

  return v15;
}

- (NSArray)csQueryScopes
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSFileProviderSearchQuery *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *bundleIdentifier;
  void *v16;
  void *v17;
  void *v19;
  id v20;

  -[NSFileProviderSearchQuery scopedToItemIdentifier](self, "scopedToItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier")) & 1) == 0)
  {
    -[NSFileProviderSearchQuery providerDomainID](self, "providerDomainID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileProviderSearchQuery.m"), 634, CFSTR("If a scopedToItemIdentifier is set, providerDomainID must be set as well"));

    }
    -[NSFileProviderSearchQuery alternateScopeToItemIdentifier](self, "alternateScopeToItemIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier")) & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      if (!self->_bundleIdentifier)
      {
        v20 = 0;
        +[FPProviderDomain providerDomainWithID:cachePolicy:error:](FPProviderDomain, "providerDomainWithID:cachePolicy:error:", v7, 1, &v20);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v20;
        v11 = self;
        objc_sync_enter(v11);
        objc_msgSend(v9, "topLevelBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          objc_msgSend(v7, "fp_toProviderID");
          v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        bundleIdentifier = self->_bundleIdentifier;
        self->_bundleIdentifier = v14;

        objc_sync_exit(v11);
      }
      v6 = (void *)objc_opt_new();
      FPScopedToIdentifierFragment(self->_bundleIdentifier, v7, v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v16);

      if (v8)
      {
        FPScopedToIdentifierFragment(self->_bundleIdentifier, v7, v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v17);

      }
    }

  }
  else
  {
    v6 = 0;
  }

  return (NSArray *)v6;
}

void __58__NSFileProviderSearchQuery_Predicates__filenamePredicate__block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MDSimpleQueryEvaluator *__MDCreateSimpleQueryEvaluator(CFStringRef, MDSimpleQueryEvaluatorGetValueFunction)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("NSFileProviderSearchQuery.m"), 28, CFSTR("%s"), dlerror());

  __break(1u);
}

void __58__NSFileProviderSearchQuery_Predicates__filenamePredicate__block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL __MDSimpleQueryObjectMatches(MDSimpleQueryEvaluator *, void *)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("NSFileProviderSearchQuery.m"), 29, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
