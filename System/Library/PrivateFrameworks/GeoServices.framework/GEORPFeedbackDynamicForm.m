@implementation GEORPFeedbackDynamicForm

- (GEORPFeedbackDynamicForm)init
{
  GEORPFeedbackDynamicForm *v2;
  GEORPFeedbackDynamicForm *v3;
  GEORPFeedbackDynamicForm *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackDynamicForm;
  v2 = -[GEORPFeedbackDynamicForm init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackDynamicForm)initWithData:(id)a3
{
  GEORPFeedbackDynamicForm *v3;
  GEORPFeedbackDynamicForm *v4;
  GEORPFeedbackDynamicForm *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackDynamicForm;
  v3 = -[GEORPFeedbackDynamicForm initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDynamicFormReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVersion_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasVersion
{
  -[GEORPFeedbackDynamicForm _readVersion]((uint64_t)self);
  return self->_version != 0;
}

- (NSString)version
{
  -[GEORPFeedbackDynamicForm _readVersion]((uint64_t)self);
  return self->_version;
}

- (void)setVersion:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_version, a3);
}

- (void)_readUserPaths
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDynamicFormReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserPaths_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)userPaths
{
  -[GEORPFeedbackDynamicForm _readUserPaths]((uint64_t)self);
  return self->_userPaths;
}

- (void)setUserPaths:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *userPaths;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  userPaths = self->_userPaths;
  self->_userPaths = v4;

}

- (void)clearUserPaths
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_userPaths, "removeAllObjects");
}

- (void)addUserPaths:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPFeedbackDynamicForm _readUserPaths]((uint64_t)self);
  -[GEORPFeedbackDynamicForm _addNoFlagsUserPaths:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsUserPaths:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)userPathsCount
{
  -[GEORPFeedbackDynamicForm _readUserPaths]((uint64_t)self);
  return -[NSMutableArray count](self->_userPaths, "count");
}

- (id)userPathsAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackDynamicForm _readUserPaths]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_userPaths, "objectAtIndex:", a3);
}

+ (Class)userPathsType
{
  return (Class)objc_opt_class();
}

- (void)_readFormFields
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDynamicFormReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFormFields_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)formFields
{
  -[GEORPFeedbackDynamicForm _readFormFields]((uint64_t)self);
  return self->_formFields;
}

- (void)setFormFields:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *formFields;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  formFields = self->_formFields;
  self->_formFields = v4;

}

- (void)clearFormFields
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_formFields, "removeAllObjects");
}

- (void)addFormFields:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPFeedbackDynamicForm _readFormFields]((uint64_t)self);
  -[GEORPFeedbackDynamicForm _addNoFlagsFormFields:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsFormFields:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)formFieldsCount
{
  -[GEORPFeedbackDynamicForm _readFormFields]((uint64_t)self);
  return -[NSMutableArray count](self->_formFields, "count");
}

- (id)formFieldsAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackDynamicForm _readFormFields]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_formFields, "objectAtIndex:", a3);
}

+ (Class)formFieldsType
{
  return (Class)objc_opt_class();
}

- (void)_readAbBranchId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDynamicFormReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbBranchId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAbBranchId
{
  -[GEORPFeedbackDynamicForm _readAbBranchId]((uint64_t)self);
  return self->_abBranchId != 0;
}

- (NSString)abBranchId
{
  -[GEORPFeedbackDynamicForm _readAbBranchId]((uint64_t)self);
  return self->_abBranchId;
}

- (void)setAbBranchId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  objc_storeStrong((id *)&self->_abBranchId, a3);
}

- (void)_readAbManifestVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDynamicFormReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbManifestVersion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAbManifestVersion
{
  -[GEORPFeedbackDynamicForm _readAbManifestVersion]((uint64_t)self);
  return self->_abManifestVersion != 0;
}

- (NSString)abManifestVersion
{
  -[GEORPFeedbackDynamicForm _readAbManifestVersion]((uint64_t)self);
  return self->_abManifestVersion;
}

- (void)setAbManifestVersion:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_abManifestVersion, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackDynamicForm;
  -[GEORPFeedbackDynamicForm description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackDynamicForm dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackDynamicForm _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("version"));

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend((id)a1, "userPaths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("userPaths");
    else
      v7 = CFSTR("user_paths");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = *(id *)(a1 + 32);
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
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation", (_QWORD)v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15, (_QWORD)v22);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }

    if (a2)
      v16 = CFSTR("formFields");
    else
      v16 = CFSTR("form_fields");
    objc_msgSend(v4, "setObject:forKey:", v8, v16, (_QWORD)v22);

  }
  objc_msgSend((id)a1, "abBranchId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (a2)
      v18 = CFSTR("abBranchId");
    else
      v18 = CFSTR("ab_branch_id");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);
  }

  objc_msgSend((id)a1, "abManifestVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (a2)
      v20 = CFSTR("abManifestVersion");
    else
      v20 = CFSTR("ab_manifest_version");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackDynamicForm _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeedbackDynamicForm)initWithDictionary:(id)a3
{
  return (GEORPFeedbackDynamicForm *)-[GEORPFeedbackDynamicForm _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  GEORPFeedbackFormField *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setVersion:", v7);

      }
      if (a3)
        v8 = CFSTR("userPaths");
      else
        v8 = CFSTR("user_paths");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v36 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v42 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v16 = (void *)objc_msgSend(v15, "copy");
                objc_msgSend(a1, "addUserPaths:", v16);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
          }
          while (v12);
        }

        v5 = v36;
      }

      if (a3)
        v17 = CFSTR("formFields");
      else
        v17 = CFSTR("form_fields");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v35 = v18;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v38;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v38 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v25 = [GEORPFeedbackFormField alloc];
                if ((a3 & 1) != 0)
                  v26 = -[GEORPFeedbackFormField initWithJSON:](v25, "initWithJSON:", v24);
                else
                  v26 = -[GEORPFeedbackFormField initWithDictionary:](v25, "initWithDictionary:", v24);
                v27 = (void *)v26;
                objc_msgSend(a1, "addFormFields:", v26, v35);

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          }
          while (v21);
        }

        v18 = v35;
        v5 = v36;
      }

      if (a3)
        v28 = CFSTR("abBranchId");
      else
        v28 = CFSTR("ab_branch_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28, v35);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = (void *)objc_msgSend(v29, "copy");
        objc_msgSend(a1, "setAbBranchId:", v30);

      }
      if (a3)
        v31 = CFSTR("abManifestVersion");
      else
        v31 = CFSTR("ab_manifest_version");
      objc_msgSend(v5, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = (void *)objc_msgSend(v32, "copy");
        objc_msgSend(a1, "setAbManifestVersion:", v33);

      }
    }
  }

  return a1;
}

- (GEORPFeedbackDynamicForm)initWithJSON:(id)a3
{
  return (GEORPFeedbackDynamicForm *)-[GEORPFeedbackDynamicForm _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_123_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_124_0;
    GEORPFeedbackDynamicFormReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPFeedbackDynamicFormCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackDynamicFormIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackDynamicFormReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PBDataReader *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3F) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v15);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPFeedbackDynamicForm readAll:](self, "readAll:", 0);
    if (self->_version)
      PBDataWriterWriteStringField();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_userPaths;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_formFields;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

    if (self->_abBranchId)
      PBDataWriterWriteStringField();
    if (self->_abManifestVersion)
      PBDataWriterWriteStringField();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEORPFeedbackDynamicForm _readFormFields]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_formFields;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id *v12;
  id *v13;

  v13 = (id *)a3;
  -[GEORPFeedbackDynamicForm readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 14) = self->_readerMarkPos;
  *((_DWORD *)v13 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_version)
    objc_msgSend(v13, "setVersion:");
  if (-[GEORPFeedbackDynamicForm userPathsCount](self, "userPathsCount"))
  {
    objc_msgSend(v13, "clearUserPaths");
    v4 = -[GEORPFeedbackDynamicForm userPathsCount](self, "userPathsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPFeedbackDynamicForm userPathsAtIndex:](self, "userPathsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addUserPaths:", v7);

      }
    }
  }
  if (-[GEORPFeedbackDynamicForm formFieldsCount](self, "formFieldsCount"))
  {
    objc_msgSend(v13, "clearFormFields");
    v8 = -[GEORPFeedbackDynamicForm formFieldsCount](self, "formFieldsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEORPFeedbackDynamicForm formFieldsAtIndex:](self, "formFieldsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addFormFields:", v11);

      }
    }
  }
  if (self->_abBranchId)
    objc_msgSend(v13, "setAbBranchId:");
  v12 = v13;
  if (self->_abManifestVersion)
  {
    objc_msgSend(v13, "setAbManifestVersion:");
    v12 = v13;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPFeedbackDynamicFormReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPFeedbackDynamicForm readAll:](self, "readAll:", 0);
  v8 = -[NSString copyWithZone:](self->_version, "copyWithZone:", a3);
  v9 = (void *)v5[6];
  v5[6] = v8;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = self->_userPaths;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v30;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v13), "copyWithZone:", a3);
        objc_msgSend(v5, "addUserPaths:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v11);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = self->_formFields;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend(v5, "addFormFields:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v16);
  }

  v20 = -[NSString copyWithZone:](self->_abBranchId, "copyWithZone:", a3);
  v21 = (void *)v5[2];
  v5[2] = v20;

  v22 = -[NSString copyWithZone:](self->_abManifestVersion, "copyWithZone:", a3);
  v23 = (void *)v5[3];
  v5[3] = v22;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *version;
  NSMutableArray *userPaths;
  NSMutableArray *formFields;
  NSString *abBranchId;
  NSString *abManifestVersion;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPFeedbackDynamicForm readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         version = self->_version,
         !((unint64_t)version | v4[6]))
     || -[NSString isEqual:](version, "isEqual:"))
    && ((userPaths = self->_userPaths, !((unint64_t)userPaths | v4[5]))
     || -[NSMutableArray isEqual:](userPaths, "isEqual:"))
    && ((formFields = self->_formFields, !((unint64_t)formFields | v4[4]))
     || -[NSMutableArray isEqual:](formFields, "isEqual:"))
    && ((abBranchId = self->_abBranchId, !((unint64_t)abBranchId | v4[2]))
     || -[NSString isEqual:](abBranchId, "isEqual:")))
  {
    abManifestVersion = self->_abManifestVersion;
    if ((unint64_t)abManifestVersion | v4[3])
      v10 = -[NSString isEqual:](abManifestVersion, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  -[GEORPFeedbackDynamicForm readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_version, "hash");
  v4 = -[NSMutableArray hash](self->_userPaths, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_formFields, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_abBranchId, "hash");
  return v6 ^ -[NSString hash](self->_abManifestVersion, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[6])
    -[GEORPFeedbackDynamicForm setVersion:](self, "setVersion:");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v4[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[GEORPFeedbackDynamicForm addUserPaths:](self, "addUserPaths:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v4[4];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[GEORPFeedbackDynamicForm addFormFields:](self, "addFormFields:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if (v4[2])
    -[GEORPFeedbackDynamicForm setAbBranchId:](self, "setAbBranchId:");
  if (v4[3])
    -[GEORPFeedbackDynamicForm setAbManifestVersion:](self, "setAbManifestVersion:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_userPaths, 0);
  objc_storeStrong((id *)&self->_formFields, 0);
  objc_storeStrong((id *)&self->_abManifestVersion, 0);
  objc_storeStrong((id *)&self->_abBranchId, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
