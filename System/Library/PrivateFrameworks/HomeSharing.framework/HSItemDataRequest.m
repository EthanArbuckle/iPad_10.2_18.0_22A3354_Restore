@implementation HSItemDataRequest

+ (id)requestWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4 format:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDatabaseID:itemID:format:", v6, a4, v8);

  return v9;
}

- (HSItemDataRequest)initWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4 format:(id)a5
{
  void *v6;
  HSItemDataRequest *v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("databases/%u/items/%llu.%@"), *(_QWORD *)&a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HSRequest initWithAction:](self, "initWithAction:", v6);

  return v7;
}

@end
