@implementation HSSetRentalPlaybackStartDateRequest

- (HSSetRentalPlaybackStartDateRequest)initWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4
{
  uint64_t v5;
  HSSetRentalPlaybackStartDateRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  objc_super v14;

  v5 = *(_QWORD *)&a3;
  v14.receiver = self;
  v14.super_class = (Class)HSSetRentalPlaybackStartDateRequest;
  v6 = -[HSRequest initWithAction:](&v14, sel_initWithAction_, CFSTR("set-rental-playback-start-date"));
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'dmap.itemid:%u'"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSRequest setValue:forArgument:](v6, "setValue:forArgument:", v7, CFSTR("database-spec"));

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'dmap.itemid:%llu'"), a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSRequest setValue:forArgument:](v6, "setValue:forArgument:", v8, CFSTR("item-spec"));

    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%llu"), (unint64_t)v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSRequest setValue:forArgument:](v6, "setValue:forArgument:", v12, CFSTR("rental-playback-start-date"));

  }
  return v6;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDatabaseID:itemID:", *(_QWORD *)&a3, a4);
}

@end
