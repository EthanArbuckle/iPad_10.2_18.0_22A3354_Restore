@implementation BLDAAPItemsRequest

- (BLDAAPItemsRequest)initWithDSID:(id)a3 reason:(int64_t)a4 databaseID:(id)a5 body:(id)a6
{
  id v10;
  id v11;
  BLDAAPItemsRequest *v12;
  BLDAAPItemsRequest *v13;
  objc_super v15;

  v10 = a5;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)BLDAAPItemsRequest;
  v12 = -[BLDAAPURLRequest initWithDSID:reason:](&v15, sel_initWithDSID_reason_, a3, a4);
  v13 = v12;
  if (v12)
  {
    -[BLDAAPURLRequest setContentType:](v12, "setContentType:", 0);
    -[BLDAAPItemsRequest setBagDatabaseID:](v13, "setBagDatabaseID:", v10);
    -[BLDAAPURLRequest setBody:](v13, "setBody:", v11);
    -[BLDAAPURLRequest setDataEncoding:](v13, "setDataEncoding:", 1);
  }

  return v13;
}

- (id)createDaapURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  -[BLDAAPItemsRequest bagDatabaseID](self, "bagDatabaseID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("databases/%@/items"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("includeApplePubBooks"), CFSTR("1"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("includeItemFlavors"), CFSTR("1"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setQueryItems:", v12);

  objc_msgSend(v11, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSNumber)bagDatabaseID
{
  return self->_bagDatabaseID;
}

- (void)setBagDatabaseID:(id)a3
{
  objc_storeStrong((id *)&self->_bagDatabaseID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagDatabaseID, 0);
}

@end
