@implementation CoreDAVCurrentUserPrivilegeSetItem

- (CoreDAVCurrentUserPrivilegeSetItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("current-user-privilege-set"));
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVCurrentUserPrivilegeSetItem;
  -[CoreDAVItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVCurrentUserPrivilegeSetItem privileges](self, "privileges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Number of privileges: [%lu]"), objc_msgSend(v5, "count"));

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
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 0x7FFFFFFFLL, CFSTR("DAV:"), CFSTR("privilege"), objc_opt_class(), sel_addPrivilege_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("privilege"));
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

- (void)addPrivilege:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  -[CoreDAVCurrentUserPrivilegeSetItem privileges](self, "privileges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    -[CoreDAVCurrentUserPrivilegeSetItem setPrivileges:](self, "setPrivileges:", v6);

  }
  -[CoreDAVCurrentUserPrivilegeSetItem privileges](self, "privileges");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (BOOL)hasPrivilegeWithNameSpace:(id)a3 andName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7 || (v8 = v7, !objc_msgSend(v7, "length")))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Non-nil and non-empty 'name' required."), 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[CoreDAVCurrentUserPrivilegeSetItem privileges](self, "privileges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v26)
  {
    v10 = *(_QWORD *)v33;
    v27 = v9;
    v25 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v9);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v12, "extraChildItems");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v29;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v29 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
              objc_msgSend(v18, "name");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v8, "isEqualToString:", v19))
              {
                if (!v6)
                {

LABEL_25:
                  v22 = 1;
                  v9 = v27;
                  goto LABEL_26;
                }
                objc_msgSend(v18, "nameSpace");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v6, "isEqualToString:", v20);

                if ((v21 & 1) != 0)
                  goto LABEL_25;
              }
              else
              {

              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v15)
              continue;
            break;
          }
        }

        v9 = v27;
        v10 = v25;
      }
      v22 = 0;
      v26 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v26);
  }
  else
  {
    v22 = 0;
  }
LABEL_26:

  return v22;
}

- (NSMutableSet)privileges
{
  return self->_privileges;
}

- (void)setPrivileges:(id)a3
{
  objc_storeStrong((id *)&self->_privileges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privileges, 0);
}

@end
