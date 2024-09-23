@implementation LiveFSIDHelper

+ (unint64_t)rootItemID
{
  return 2;
}

+ (id)identifierForItem:(unint64_t)a3 name:(id)a4 parentID:(unint64_t)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v12 = a5;
  if (a3 == 2)
    return CFSTR("NSFileProviderRootContainerItemIdentifier");
  v6 = (void *)MEMORY[0x24BDBCE50];
  v7 = a4;
  objc_msgSend(v6, "dataWithBytes:length:", &v12, 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v8, "base64EncodedStringWithOptions:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@"), v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
