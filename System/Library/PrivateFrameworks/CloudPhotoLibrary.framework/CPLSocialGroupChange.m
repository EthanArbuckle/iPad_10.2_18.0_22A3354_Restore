@implementation CPLSocialGroupChange

- (id)propertiesDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[CPLSocialGroupChange persons](self, "persons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%lu persons"), objc_msgSend(v3, "personsCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setPersons:(id)a3
{
  id v4;
  uint64_t v5;
  id *p_personsData;
  id v7;
  id v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!v4)
  {
    p_personsData = (id *)&self->_personsData;
LABEL_5:
    v8 = *p_personsData;
    *p_personsData = 0;

    goto LABEL_6;
  }
  objc_msgSend(v4, "data");
  v5 = objc_claimAutoreleasedReturnValue();
  p_personsData = (id *)&self->_personsData;
  v7 = *p_personsData;
  *p_personsData = (id)v5;

  if (!objc_msgSend(*p_personsData, "length"))
    goto LABEL_5;
LABEL_6:

}

- (CPLSocialGroupPersonList)persons
{
  CPLSocialGroupPersonList *v2;

  if (self->_personsData)
    v2 = -[CPLSocialGroupPersonList initWithData:]([CPLSocialGroupPersonList alloc], "initWithData:", self->_personsData);
  else
    v2 = 0;
  return v2;
}

- (void)setPersonData:(id)a3
{
  NSData *v4;
  NSData *personsData;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v4 = (NSData *)objc_msgSend(v6, "copy");
    personsData = self->_personsData;
    self->_personsData = v4;
  }
  else
  {
    personsData = self->_personsData;
    self->_personsData = 0;
  }

}

- (id)keyAssetScopedIdentifier
{
  NSString *keyAssetIdentifier;
  NSString *v4;
  CPLScopedIdentifier *v5;
  void *v6;
  id v7;

  keyAssetIdentifier = self->_keyAssetIdentifier;
  if (keyAssetIdentifier)
  {
    v4 = keyAssetIdentifier;
    v5 = [CPLScopedIdentifier alloc];
    -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v5, "initRelativeToScopedIdentifier:identifier:", v6, v4);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)setKeyAssetScopedIdentifier:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  objc_msgSend(v21, "scopeIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scopeIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();

  if (v5 && v7)
  {
    v8 = objc_msgSend((id)v5, "isEqual:", v7);

    if ((v8 & 1) == 0)
      goto LABEL_4;
  }
  else
  {

    if (v5 | v7)
    {
LABEL_4:
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "scopeIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "scopeIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v23 = v10;
          v24 = 2112;
          v25 = v12;
          v26 = 2112;
          v27 = v13;
          _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Invalid call to %@ with mismatched scope: %@ vs. %@", buf, 0x20u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLSocialGroupChange.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scopeIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "scopeIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 93, CFSTR("Invalid call to %@ with mismatched scope: %@ vs. %@"), v16, v18, v19);

      abort();
    }
  }
  objc_msgSend(v21, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLSocialGroupChange setKeyAssetIdentifier:](self, "setKeyAssetIdentifier:", v20);

}

- (signed)verifiedType
{
  return self->_verifiedType;
}

- (void)setVerifiedType:(signed __int16)a3
{
  self->_verifiedType = a3;
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (void)setCustomTitle:(id)a3
{
  objc_storeStrong((id *)&self->_customTitle, a3);
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (NSString)keyAssetIdentifier
{
  return self->_keyAssetIdentifier;
}

- (void)setKeyAssetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keyAssetIdentifier, a3);
}

- (NSData)personsData
{
  return self->_personsData;
}

- (void)setPersonsData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personsData, 0);
  objc_storeStrong((id *)&self->_keyAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
}

+ (id)_createTestSocialGroupWithPersons:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  CPLSocialGroupPersonList *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  CPLSocialGroupPerson *v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scopedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scopeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    CPLPrimaryScopeIdentifierForCurrentUniverse();
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  v24 = v9;
  v10 = +[CPLRecordChange newRecordInScopeWithIdentifier:](CPLSocialGroupChange, "newRecordInScopeWithIdentifier:", v9);
  objc_msgSend(v10, "setCustomTitle:", CFSTR("Test title"));
  objc_msgSend(v10, "setVerifiedType:", 1);
  objc_msgSend(v10, "setPosition:", 5);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setKeyAssetIdentifier:", v12);

  v13 = objc_alloc_init(CPLSocialGroupPersonList);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = v3;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v20 = objc_alloc_init(CPLSocialGroupPerson);
        objc_msgSend(v19, "scopedIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLSocialGroupPerson setPersonIdentifier:](v20, "setPersonIdentifier:", v22);

        -[CPLSocialGroupPersonList addPerson:](v13, "addPerson:", v20);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  objc_msgSend(v10, "setPersons:", v13);
  return v10;
}

+ (BOOL)supportsDeletion
{
  return 1;
}

+ (BOOL)supportsDirectDeletion
{
  return 1;
}

+ (BOOL)relatedRelationshipIsWeak
{
  return 1;
}

+ (id)equalityBlockForDirection:(unint64_t)a3
{
  if (a3 == 1)
    return &__block_literal_global_1447;
  else
    return 0;
}

uint64_t __50__CPLSocialGroupChange_equalityBlockForDirection___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, char *a5)
{
  uint64_t v5;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  _BOOL4 v11;
  CPLSocialGroupPersonList *v12;
  CPLSocialGroupPersonList *v13;
  id v14;
  CPLSocialGroupPersonList *v15;
  unint64_t v16;

  if (sel_personsData != a5)
    return 0;
  v7 = a3;
  objc_msgSend(a2, "personsData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personsData");
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = v8;
  v11 = (v10 | v9) == 0;
  if (v10 && v9)
  {
    v12 = -[CPLSocialGroupPersonList initWithData:]([CPLSocialGroupPersonList alloc], "initWithData:", v10);
    v13 = -[CPLSocialGroupPersonList initWithData:]([CPLSocialGroupPersonList alloc], "initWithData:", v9);
    v14 = v12;
    v15 = v13;
    v16 = (unint64_t)v15;
    v11 = v14 && v15 && (objc_msgSend(v14, "isEqual:", v15) & 1) != 0 || ((unint64_t)v14 | v16) == 0;

  }
  if (v11)
    v5 = 2;
  else
    v5 = 1;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", CFSTR("persons")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLSocialGroupChange;
    v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForCoding_, v4);
  }

  return v5;
}

+ (BOOL)cplShouldIgnorePropertyForEquality:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", CFSTR("persons")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLSocialGroupChange;
    v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForEquality_, v4);
  }

  return v5;
}

- (id)scopedIdentifiersForMapping
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CPLScopedIdentifier *v13;
  void *v14;
  id v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v22.receiver = self;
  v22.super_class = (Class)CPLSocialGroupChange;
  -[CPLRecordChange scopedIdentifiersForMapping](&v22, sel_scopedIdentifiersForMapping);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  -[CPLSocialGroupChange persons](self, "persons");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "persons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10), "personIdentifier");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          v13 = [CPLScopedIdentifier alloc];
          -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v13, "initRelativeToScopedIdentifier:identifier:", v14, v12);

          if (v15)
          {
            objc_msgSend(v5, "addObject:", v15);

          }
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  CPLScopedIdentifier *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  CPLScopedIdentifier *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  id v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)CPLSocialGroupChange;
  v32 = a3;
  -[CPLRecordChange translateToCloudChangeUsingIDMapping:error:](&v38, sel_translateToCloudChangeUsingIDMapping_error_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v31 = v5;
    objc_msgSend(v5, "persons");
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "persons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v35 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v12, "personIdentifier");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            v15 = [CPLScopedIdentifier alloc];
            -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v15, "initRelativeToScopedIdentifier:identifier:", v16, v14);

            if (v17)
            {
              v33 = 0;
              objc_msgSend(v32, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v17, &v33);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v18;
              if (v18)
              {
                objc_msgSend(v18, "identifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setPersonIdentifier:", v20);

              }
            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v9);
    }

    v6 = v31;
    objc_msgSend(v31, "setPersons:", v30);
    -[CPLSocialGroupChange keyAssetIdentifier](self, "keyAssetIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      v23 = [CPLScopedIdentifier alloc];
      -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v23, "initRelativeToScopedIdentifier:identifier:", v24, v22);

      if (v25)
      {
        v33 = 0;
        objc_msgSend(v32, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v25, &v33);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          objc_msgSend(v26, "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setKeyAssetIdentifier:", v28);

        }
      }
    }

  }
  return v6;
}

- (id)translateToClientChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  CPLScopedIdentifier *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  CPLScopedIdentifier *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)CPLSocialGroupChange;
  v32 = a3;
  -[CPLRecordChange translateToClientChangeUsingIDMapping:error:](&v37, sel_translateToClientChangeUsingIDMapping_error_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v31 = v5;
    objc_msgSend(v5, "persons");
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "persons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v12, "personIdentifier");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            v15 = [CPLScopedIdentifier alloc];
            -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v15, "initRelativeToScopedIdentifier:identifier:", v16, v14);

            if (v17)
            {
              objc_msgSend(v32, "localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v18;
              if (v18)
              {
                objc_msgSend(v18, "identifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setPersonIdentifier:", v20);

              }
            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v9);
    }

    v6 = v31;
    objc_msgSend(v31, "setPersons:", v30);
    -[CPLSocialGroupChange keyAssetIdentifier](self, "keyAssetIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      v23 = [CPLScopedIdentifier alloc];
      -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v23, "initRelativeToScopedIdentifier:identifier:", v24, v22);

      if (v25)
      {
        objc_msgSend(v32, "localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          objc_msgSend(v26, "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setKeyAssetIdentifier:", v28);

        }
      }
    }

  }
  return v6;
}

+ (Class)relatedRecordClass
{
  return (Class)objc_opt_class();
}

@end
