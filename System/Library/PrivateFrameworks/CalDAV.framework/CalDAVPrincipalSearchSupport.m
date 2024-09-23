@implementation CalDAVPrincipalSearchSupport

+ (id)nameForWellKnownType:(int)a3
{
  if ((a3 - 1) > 6)
    return 0;
  else
    return *off_24C1FB520[a3 - 1];
}

+ (id)namespaceForWellKnownType:(int)a3
{
  if ((a3 - 1) > 6)
    return 0;
  else
    return **((id **)&unk_24C1FB558 + a3 - 1);
}

+ (id)namespaceAndNameForWellKnownType:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  objc_msgSend((id)objc_opt_class(), "namespaceForWellKnownType:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "nameForWellKnownType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (v5 && v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "CDVStringWithNameSpace:andName:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)propertySearchItemForWellKnownType:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  objc_msgSend((id)objc_opt_class(), "namespaceForWellKnownType:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "nameForWellKnownType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1ABB0]), "initWithSearchPropertyNameSpace:andName:", v4, v5);

  return v6;
}

+ (id)resultTypeForRecordType:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;

  v3 = a3;
  v4 = (void *)recordToResultMapping;
  if (!recordToResultMapping)
  {
    v5 = objc_alloc(MEMORY[0x24BDBCE70]);
    v6 = objc_msgSend(v5, "initWithObjectsAndKeys:", CalDAVPrincipalResultType_Person, CalDAVPrincipalRecordType_Users, CalDAVPrincipalResultType_Group, CalDAVPrincipalRecordType_Groups, CalDAVPrincipalResultType_Resource, CalDAVPrincipalRecordType_Resources, CalDAVPrincipalResultType_Room, CalDAVPrincipalRecordType_Locations, 0);
    v7 = (void *)recordToResultMapping;
    recordToResultMapping = v6;

    v4 = (void *)recordToResultMapping;
  }
  objc_msgSend(v4, "objectForKey:", v3);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = CalDAVPrincipalResultType_Unknown;
  v10 = v8;

  return v10;
}

+ (id)parserMappingsWithServerSupportSet:(id)a3 includeEmail:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BE1AB20]);
  v8 = (void *)objc_msgSend(v7, "initWithNameSpace:name:parseClass:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AEF8], objc_opt_class());
  objc_msgSend(v6, "addObject:", v8);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __80__CalDAVPrincipalSearchSupport_parserMappingsWithServerSupportSet_includeEmail___block_invoke;
  v21[3] = &unk_24C1FB500;
  v9 = v5;
  v22 = v9;
  v10 = v6;
  v23 = v10;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x20BD12C84](v21);
  v12 = objc_opt_class();
  v11[2](v11, 6, v12, 1);
  v13 = objc_opt_class();
  v11[2](v11, 5, v13, 1);
  v14 = objc_opt_class();
  v11[2](v11, 7, v14, 1);
  if (v4)
  {
    v15 = objc_opt_class();
    v11[2](v11, 4, v15, 0);
  }
  v16 = objc_opt_class();
  v11[2](v11, 3, v16, 0);
  v17 = objc_opt_class();
  v11[2](v11, 1, v17, 0);
  v18 = objc_opt_class();
  v11[2](v11, 2, v18, 0);
  v19 = v10;

  return v19;
}

void __80__CalDAVPrincipalSearchSupport_parserMappingsWithServerSupportSet_includeEmail___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  +[CalDAVPrincipalSearchSupport namespaceForWellKnownType:](CalDAVPrincipalSearchSupport, "namespaceForWellKnownType:", a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  +[CalDAVPrincipalSearchSupport nameForWellKnownType:](CalDAVPrincipalSearchSupport, "nameForWellKnownType:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a4 & 1) != 0
    || (v9 = *(void **)(a1 + 32)) == 0
    || objc_msgSend(v9, "supportsPropertyTypeWithNameSpace:andName:", v11, v8))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AB20]), "initWithNameSpace:name:parseClass:", v11, v8, a3);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

  }
}

@end
