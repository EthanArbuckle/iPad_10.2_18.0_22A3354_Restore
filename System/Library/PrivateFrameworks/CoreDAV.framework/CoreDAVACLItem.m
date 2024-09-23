@implementation CoreDAVACLItem

- (CoreDAVACLItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("acl"));
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVACLItem;
  -[CoreDAVItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVACLItem accessControlEntities](self, "accessControlEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Number of access control entities: [%lu]"), objc_msgSend(v5, "count"));

  return v3;
}

+ (id)copyParseRules
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDBCE70]);
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 0x7FFFFFFFLL, CFSTR("DAV:"), CFSTR("ace"), objc_opt_class(), sel_addACE_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("ace"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, 0);

    +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v5, v10);

  }
  return v5;
}

- (void)addACE:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  -[CoreDAVACLItem accessControlEntities](self, "accessControlEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    -[CoreDAVACLItem setAccessControlEntities:](self, "setAccessControlEntities:", v6);

  }
  -[CoreDAVACLItem accessControlEntities](self, "accessControlEntities");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (id)notGrantedSubsetOfACEs:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  id v34;
  void *v35;
  void *v37;
  id v38;
  id obj;
  void *v40;
  uint64_t v41;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v55 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v9, "principal");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hashString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "principal");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "hashString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v12, v14);

        }
        objc_msgSend(v9, "grant");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "privileges");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "valueForKey:", CFSTR("hashString"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "unionSet:", v17);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v6);
  }

  +[CoreDAVACEItem privilegeItemWithNameSpace:andName:](CoreDAVACEItem, "privilegeItemWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("all"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "hashString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[CoreDAVACLItem accessControlEntities](self, "accessControlEntities");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v43)
  {
    v40 = v4;
    v41 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v51 != v41)
          objc_enumerationMutation(v38);
        v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        objc_msgSend(v20, "principal");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "hashString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v23, "count"))
        {
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          objc_msgSend(v20, "grant");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "privileges");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v47;
            while (2)
            {
              for (k = 0; k != v27; ++k)
              {
                if (*(_QWORD *)v47 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * k);
                objc_msgSend(v30, "hashString");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v31, "isEqualToString:", v18);

                if (v32)
                {
                  objc_msgSend(v23, "removeAllObjects");
                  goto LABEL_26;
                }
                objc_msgSend(v30, "hashString");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "removeObject:", v33);

              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
              if (v27)
                continue;
              break;
            }
          }
LABEL_26:

          v4 = v40;
        }

      }
      v43 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v43);
  }

  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __41__CoreDAVACLItem_notGrantedSubsetOfACEs___block_invoke;
  v44[3] = &unk_24C1DA098;
  v45 = v4;
  v34 = v4;
  objc_msgSend(obj, "objectsPassingTest:", v44);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

uint64_t __41__CoreDAVACLItem_notGrantedSubsetOfACEs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "principal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hashString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v3, "grant", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "privileges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "hashString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v7, "containsObject:", v13);

          if ((v14 & 1) != 0)
          {
            v10 = 1;
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)liveACEs
{
  void *v2;
  void *v3;

  -[CoreDAVACLItem accessControlEntities](self, "accessControlEntities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsPassingTest:", &__block_literal_global_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __26__CoreDAVACLItem_liveACEs__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "inherited");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "protectedItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  return v4;
}

- (NSMutableSet)accessControlEntities
{
  return self->_accessControlEntities;
}

- (void)setAccessControlEntities:(id)a3
{
  objc_storeStrong((id *)&self->_accessControlEntities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessControlEntities, 0);
}

@end
