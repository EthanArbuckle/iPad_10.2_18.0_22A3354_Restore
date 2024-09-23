@implementation GDSoftware

- (id)description
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_entityIdentifier(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleIdentifiers(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsJoinedByString_(v8, v9, (uint64_t)CFSTR("|"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v11, (uint64_t)CFSTR("<GDSoftware id:%@ bs:%@>"), v5, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (GDEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (GDSoftware)initWithTriplesIterator:(id)a3
{
  id v4;
  GDSoftware *v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  GDEntityIdentifier *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  GDEntityIdentifier *entityIdentifier;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSArray *bundleIdentifiers;
  GDSoftware *v35;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)GDSoftware;
  v5 = -[GDSoftware init](&v42, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v37 = v4;
    v7 = v4;
    v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v38, v43, 16);
    if (v9)
    {
      v12 = v9;
      v13 = *(_QWORD *)v39;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v39 != v13)
            objc_enumerationMutation(v7);
          v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v14);
          if (!v5->_entityIdentifier)
          {
            v16 = [GDEntityIdentifier alloc];
            objc_msgSend_subject(v15, v17, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend_initWithString_(v16, v20, (uint64_t)v19);
            entityIdentifier = v5->_entityIdentifier;
            v5->_entityIdentifier = (GDEntityIdentifier *)v21;

          }
          objc_msgSend_predicate(v15, v10, v11);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqual_(v23, v24, (uint64_t)CFSTR("nm_bundleID")))
          {
            objc_msgSend_object(v15, v25, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v6, v28, (uint64_t)v27);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v38, v43, 16);
      }
      while (v12);
    }

    if (!v5->_entityIdentifier || !objc_msgSend_count(v6, v29, v30))
    {

      v35 = 0;
      v4 = v37;
      goto LABEL_18;
    }
    v33 = objc_msgSend_copy(v6, v31, v32);
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSArray *)v33;

    v4 = v37;
  }
  v35 = v5;
LABEL_18:

  return v35;
}

+ (unint64_t)triplesColumnsRequiredForRendering
{
  return 31;
}

@end
