@implementation CKDPCSSQLCacheTableGroup

+ (id)groupIdentifierForContainerID:(id)a3 accountOverrideInfo:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;

  v5 = a4;
  objc_msgSend_containerIdentifier(a3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountID(v5, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13
    || (objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v11, (uint64_t)CFSTR("%@.%@"), v8, v13),
        (v14 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_altDSID(v5, v11, v12);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15
      || (v18 = (void *)v15,
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v16, (uint64_t)CFSTR("%@.%@"), v8, v15),
          v14 = (id)objc_claimAutoreleasedReturnValue(),
          v18,
          !v14))
    {
      objc_msgSend_email(v5, v16, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v19, (uint64_t)CFSTR("%@.%@"), v8, v20);
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }

      if (v5 && !v14)
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v21, (uint64_t)CFSTR("%@.Anonymous"), v8);
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (!v14)
        v14 = v8;
    }
  }

  return v14;
}

+ (id)groupNameForContainerID:(id)a3 accountOverrideInfo:(id)a4
{
  void *v4;
  const char *v5;
  void *v6;

  objc_msgSend_groupIdentifierForContainerID_accountOverrideInfo_(a1, a2, (uint64_t)a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_groupNameWithDomain_domainIdentifier_groupName_(MEMORY[0x1E0C950F0], v5, 2, v4, CFSTR("PCSCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)rebootShouldClearData
{
  return 1;
}

- (id)createTables:(id *)a3
{
  CKDPCSSQLCacheTable *v3;
  const char *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(CKDPCSSQLCacheTable);
  v7[0] = v3;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)cacheTable
{
  return (id)objc_msgSend_tableWithName_(self, a2, (uint64_t)CFSTR("PCSCache"));
}

@end
