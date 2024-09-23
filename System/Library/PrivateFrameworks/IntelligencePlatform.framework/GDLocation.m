@implementation GDLocation

- (id)description
{
  uint64_t v2;
  void *v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  __CFString *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_entityIdentifier(self, a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_names(self, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend_names(self, v9, v10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v3, v12, (uint64_t)CFSTR("|"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = &stru_1E5DDB0B8;
  }
  objc_msgSend_addresses(self, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_count(v14, v15, v16);
  objc_msgSend_addresses(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v20;
  if (v17 == 1)
  {
    objc_msgSend_firstObject(v20, v21, v22);
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v28 = (void *)v24;
    objc_msgSend_stringWithFormat_(v5, v25, (uint64_t)CFSTR("<GDLocation id:%@ n:%@ a:%@>"), v6, v13, v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (objc_msgSend_count(v20, v21, v22))
  {
    objc_msgSend_addresses(self, v26, v27);
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend_stringWithFormat_(v5, v26, (uint64_t)CFSTR("<GDLocation id:%@ n:%@ a:%@>"), v6, v13, &stru_1E5DDB0B8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  if (v11)
  {

  }
  return v29;
}

- (GDEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSArray)addresses
{
  return self->_addresses;
}

- (NSArray)names
{
  return self->_names;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (GDLocation)initWithTriplesIterator:(id)a3
{
  id v4;
  GDLocation *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  GDEntityIdentifier *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  GDEntityIdentifier *entityIdentifier;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  int isEqual;
  GDLocationAddress *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  NSArray *names;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSArray *addresses;
  GDLocation *v52;
  id v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  objc_super v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)GDLocation;
  v5 = -[GDLocation init](&v61, sel_init);
  if (v5)
  {
    v55 = (void *)objc_opt_new();
    v56 = (void *)objc_opt_new();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v54 = v4;
    v6 = v4;
    v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v57, v62, 16);
    if (v8)
    {
      v11 = v8;
      v12 = *(_QWORD *)v58;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v58 != v12)
            objc_enumerationMutation(v6);
          v14 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v13);
          if (!v5->_entityIdentifier)
          {
            v15 = [GDEntityIdentifier alloc];
            objc_msgSend_subject(v14, v16, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend_initWithString_(v15, v19, (uint64_t)v18);
            entityIdentifier = v5->_entityIdentifier;
            v5->_entityIdentifier = (GDEntityIdentifier *)v20;

          }
          objc_msgSend_predicate(v14, v9, v10);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqual_(v22, v23, (uint64_t)CFSTR("PS33")))
          {
            objc_msgSend_object(v14, v24, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v56, v27, (uint64_t)v26);
LABEL_11:

            goto LABEL_17;
          }
          if (objc_msgSend_isEqual_(v22, v24, (uint64_t)CFSTR("PS317")))
          {
            objc_msgSend_relationshipPredicate(v14, v28, v29);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend_isEqual_(v26, v30, (uint64_t)CFSTR("PS1")))
              goto LABEL_11;
            objc_msgSend_object(v14, v31, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            isEqual = objc_msgSend_isEqual_(v33, v34, (uint64_t)CFSTR("CS97"));

            if (isEqual)
            {
              v36 = [GDLocationAddress alloc];
              objc_msgSend_relationshipIdIterator(v6, v37, v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = (void *)objc_msgSend_initWithRelationshipIdTriplesIterator_(v36, v40, (uint64_t)v39);

              if (v26)
                objc_msgSend_addObject_(v55, v41, (uint64_t)v26);
              goto LABEL_11;
            }
          }
LABEL_17:

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v57, v62, 16);
      }
      while (v11);
    }

    if (!v5->_entityIdentifier || !objc_msgSend_count(v56, v42, v43) && !objc_msgSend_count(v55, v44, v45))
    {

      v52 = 0;
      v4 = v54;
      goto LABEL_25;
    }
    v46 = objc_msgSend_copy(v56, v44, v45);
    names = v5->_names;
    v5->_names = (NSArray *)v46;

    v50 = objc_msgSend_copy(v55, v48, v49);
    addresses = v5->_addresses;
    v5->_addresses = (NSArray *)v50;

    v4 = v54;
  }
  v52 = v5;
LABEL_25:

  return v52;
}

+ (unint64_t)triplesColumnsRequiredForRendering
{
  return 31;
}

@end
