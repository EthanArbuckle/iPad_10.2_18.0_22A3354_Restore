@implementation CalDAVChecksumVersionsItem

- (CalDAVChecksumVersionsItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("checksum-versions"));
}

- (void)addVersionSupported:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *versionStringsSupported;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = v4;
  if (!self->_versionStringsSupported)
  {
    v5 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 1);
    versionStringsSupported = self->_versionStringsSupported;
    self->_versionStringsSupported = v5;

    v4 = v11;
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "nameSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CDVStringWithNameSpace:andName:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet addObject:](self->_versionStringsSupported, "addObject:", v10);
}

- (BOOL)supportsVersion:(id)a3
{
  NSMutableSet *versionStringsSupported;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  versionStringsSupported = self->_versionStringsSupported;
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  objc_msgSend(v5, "nameSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "CDVStringWithNameSpace:andName:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(versionStringsSupported) = -[NSMutableSet containsObject:](versionStringsSupported, "containsObject:", v8);

  return (char)versionStringsSupported;
}

- (id)copyParseRules
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x24BDBCE70]);
  v3 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 0x7FFFFFFFLL, *MEMORY[0x24BE1ADC8], CFSTR("checksum-v1"), objc_opt_class(), sel_addVersionSupported_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, CFSTR("checksum-v1"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", v4, v5, 0);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionStringsSupported, 0);
}

@end
