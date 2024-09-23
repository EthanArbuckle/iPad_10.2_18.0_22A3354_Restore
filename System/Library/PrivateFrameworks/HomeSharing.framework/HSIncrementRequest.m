@implementation HSIncrementRequest

- (HSIncrementRequest)initWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4
{
  uint64_t v5;
  HSIncrementRequest *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v5 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)HSIncrementRequest;
  v6 = -[HSRequest initWithAction:](&v10, sel_initWithAction_, CFSTR("increment"));
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'dmap.itemid:%u'"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSRequest setValue:forArgument:](v6, "setValue:forArgument:", v7, CFSTR("database-spec"));

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'dmap.itemid:%llu'"), a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSRequest setValue:forArgument:](v6, "setValue:forArgument:", v8, CFSTR("item-spec"));

  }
  return v6;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDatabaseID:itemID:", *(_QWORD *)&a3, a4);
}

@end
