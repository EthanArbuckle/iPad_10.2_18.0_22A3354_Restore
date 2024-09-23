@implementation CPLItemChange

+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", CFSTR("isImage")) & 1) != 0
    || (objc_msgSend(v4, "isEqual:", CFSTR("isVideo")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLItemChange;
    v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForCoding_, v4);
  }

  return v5;
}

- (CPLItemChange)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPLItemChange;
  return -[CPLItemChange init](&v3, sel_init);
}

- (id)containerDescription
{
  CPLItemChange *v2;
  void *v3;
  __CFString *v4;

  v2 = self;
  -[CPLItemChange containerRelations](self, "containerRelations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CPLRecordChange changeType](v2, "changeType");
  if (objc_msgSend(v3, "count") | v2 & 0x10)
    v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("in %lu cont."), objc_msgSend(v3, "count"));
  else
    v4 = &stru_1E60DF6B8;

  return v4;
}

- (id)propertiesForChangeType:(unint64_t)a3
{
  id v3;
  objc_super v5;

  if (a3 == 16)
  {
    if (propertiesForChangeType__onceToken_20951 != -1)
      dispatch_once(&propertiesForChangeType__onceToken_20951, &__block_literal_global_20952);
    v3 = (id)propertiesForChangeType__properties_20953;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CPLItemChange;
    -[CPLRecordChange propertiesForChangeType:](&v5, sel_propertiesForChangeType_);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)containerRelationChangesComparedToRelationEnumerator:(id)a3 error:(id *)a4
{
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  CPLItemChange *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  id v45;
  NSObject *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  id v52;
  SEL v53;
  CPLItemChange *v54;
  void *v55;
  id obj;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  const __CFString *v75;
  const __CFString *v76;
  uint8_t v77[128];
  uint8_t buf[4];
  CPLItemChange *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = -[CPLRecordChange changeType](self, "changeType");
  if (v8 && (v8 & 0x10) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v79 = self;
        _os_log_impl(&dword_1B03C2000, v51, OS_LOG_TYPE_ERROR, "Trying to calculate relation changes for %@ with no container relation change", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLItemChange.m");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v49, 51, CFSTR("Trying to calculate relation changes for %@ with no container relation change"), self);
LABEL_51:

    abort();
  }
  -[CPLItemChange containerRelations](self, "containerRelations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    v11 = v10;
    v53 = a2;
    v54 = self;
    -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
    v57 = (id)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v11);
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v55 = v9;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    if (!v14)
    {
LABEL_12:

      v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v52 = v7;
      obj = v7;
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
      if (!v22)
        goto LABEL_26;
      v23 = v22;
      v24 = *(_QWORD *)v66;
      while (1)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v66 != v24)
            objc_enumerationMutation(obj);
          v26 = *(CPLItemChange **)(*((_QWORD *)&v65 + 1) + 8 * i);
          if (!v26)
          {
            if (!_CPLSilentLogging)
            {
              __CPLGenericOSLogDomain();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v79 = 0;
                _os_log_impl(&dword_1B03C2000, v47, OS_LOG_TYPE_ERROR, "%@ provided a nil object", buf, 0xCu);
              }

            }
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLItemChange.m");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", v53, v54, v49, 74, CFSTR("%@ provided a nil object"), 0);
            goto LABEL_51;
          }
          objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "relation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "containerIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "objectForKey:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            -[CPLItemChange relation](v26, "relation");
            v30 = (id)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v30, "isEqual:", v29) & 1) == 0)
            {
              v31 = (void *)-[CPLItemChange copy](v26, "copy");
              if (!v31)
              {
                if (!_CPLSilentLogging)
                {
                  __CPLGenericOSLogDomain();
                  v50 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v79 = v26;
                    _os_log_impl(&dword_1B03C2000, v50, OS_LOG_TYPE_ERROR, "Unable to copy %@", buf, 0xCu);
                  }

                }
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLItemChange.m");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", v53, v54, v49, 87, CFSTR("Unable to copy %@"), v26);
                goto LABEL_51;
              }
              v32 = v31;
              objc_msgSend(v31, "setChangeType:", 2);
              objc_msgSend(v32, "setRelation:", v29);
              objc_msgSend(v21, "addObject:", v32);

            }
            objc_msgSend(v12, "removeObjectForKey:", v28);
          }
          else
          {
            -[CPLRecordChange scopedIdentifier](v26, "scopedIdentifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = +[CPLRecordChange newRecordWithScopedIdentifier:](CPLContainerRelationChange, "newRecordWithScopedIdentifier:", v33);

            objc_msgSend(v30, "setChangeType:", 1024);
            objc_msgSend(v21, "addObject:", v30);
          }

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
        if (!v23)
        {
LABEL_26:

          v62[0] = MEMORY[0x1E0C809B0];
          v62[1] = 3221225472;
          v62[2] = __76__CPLItemChange_containerRelationChangesComparedToRelationEnumerator_error___block_invoke;
          v62[3] = &unk_1E60DD688;
          v63 = v57;
          v34 = v21;
          v64 = v34;
          v35 = v57;
          objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v62);
          v36 = v64;
          v13 = v34;

          v37 = v63;
          v38 = v13;
          v57 = v12;
          v12 = v35;
          v7 = v52;
          goto LABEL_29;
        }
      }
    }
    v15 = v14;
    v16 = *(_QWORD *)v70;
LABEL_6:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v70 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v17);
      objc_msgSend(v18, "containerIdentifier");
      v19 = objc_claimAutoreleasedReturnValue();
      if (!v19)
        break;
      v20 = (void *)v19;
      objc_msgSend(v12, "setObject:forKey:", v18, v19);

      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
        if (!v15)
          goto LABEL_12;
        goto LABEL_6;
      }
    }
    if (a4)
    {
      v75 = CFSTR("CPLErrorResetReason");
      v76 = CFSTR("Invalid container relation");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLRecordChange scopedIdentifier](v54, "scopedIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:](CPLErrors, "cplErrorWithCode:underlyingError:userInfo:description:", 20, 0, v37, CFSTR("Client sent a relation for %@ with no container identifier: %@"), v39, v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v38 = 0;
LABEL_29:

    }
    else
    {
      v38 = 0;
    }

    v9 = v55;
  }
  else
  {
    v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v57 = v7;
    v40 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v59 != v42)
            objc_enumerationMutation(v57);
          objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * j), "scopedIdentifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = +[CPLRecordChange newRecordWithScopedIdentifier:](CPLContainerRelationChange, "newRecordWithScopedIdentifier:", v44);

          objc_msgSend(v45, "setChangeType:", 1024);
          objc_msgSend(v38, "addObject:", v45);

        }
        v41 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
      }
      while (v41);
    }
  }

  return v38;
}

- (NSArray)containerRelations
{
  return self->_containerRelations;
}

- (void)setContainerRelations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerRelations, 0);
}

void __76__CPLItemChange_containerRelationChangesComparedToRelationEnumerator_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(v5, "proposedScopedIdentifierForItemScopedIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[CPLRecordChange newRecordWithScopedIdentifier:](CPLContainerRelationChange, "newRecordWithScopedIdentifier:", v6);

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItemIdentifier:", v7);

  objc_msgSend(v8, "setRelation:", v5);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

void __41__CPLItemChange_propertiesForChangeType___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("containerRelations"), 0);
  v1 = (void *)propertiesForChangeType__properties_20953;
  propertiesForChangeType__properties_20953 = v0;

}

@end
