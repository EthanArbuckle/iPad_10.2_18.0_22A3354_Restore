@implementation HSSetPropertyRequest

- (HSSetPropertyRequest)initWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4
{
  uint64_t v5;
  HSSetPropertyRequest *v6;
  HSSetPropertyRequest *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = *(_QWORD *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)HSSetPropertyRequest;
  v6 = -[HSRequest initWithAction:](&v11, sel_initWithAction_, CFSTR("setproperty"));
  v7 = v6;
  if (v6)
  {
    -[HSRequest setMethod:](v6, "setMethod:", 1);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'dmap.itemid:%u'"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSRequest setValue:forArgument:](v7, "setValue:forArgument:", v8, CFSTR("database-spec"));

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'dmap.itemid:%llu'"), a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSRequest setValue:forArgument:](v7, "setValue:forArgument:", v9, CFSTR("item-spec"));

  }
  return v7;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDatabaseID:itemID:", *(_QWORD *)&a3, a4);
}

@end
