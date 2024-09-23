@implementation CRKMutableURLResources

- (void)setDirectory:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKURLResources resources](self, "resources");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BDBCC60]);

}

- (void)setDocumentIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKURLResources resources](self, "resources");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BDBCBF8]);

}

- (void)setLastModificationDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKURLResources resources](self, "resources");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BDBCBE0]);

}

- (void)setSize:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKURLResources resources](self, "resources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDBCC48]);

}

@end
