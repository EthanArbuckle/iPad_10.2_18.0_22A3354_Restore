@implementation _MKFTimerTrigger

- (void)awakeFromFetch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_MKFTimerTrigger;
  -[_MKFTimerTrigger awakeFromFetch](&v13, sel_awakeFromFetch);
  -[_MKFTimerTrigger recurrenceDays](self, "recurrenceDays");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[_MKFTimerTrigger recurrences](self, "recurrences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_5;
    v5 = (void *)MEMORY[0x24BDD16E0];
    -[_MKFTimerTrigger recurrences](self, "recurrences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeArrayOfDateComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithUnsignedInteger:", HMDaysOfTheWeekFromDateComponents());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFTimerTrigger setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, CFSTR("recurrenceDays"));

  }
LABEL_5:
  -[_MKFTimerTrigger significantEventOffsetSeconds](self, "significantEventOffsetSeconds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[_MKFTimerTrigger significantEventOffset](self, "significantEventOffset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      return;
    v10 = (void *)MEMORY[0x24BDD16E0];
    -[_MKFTimerTrigger significantEventOffset](self, "significantEventOffset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "decodeDateComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithInteger:", HMDTimeOffsetFromDateComponents(v11, 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFTimerTrigger setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v12, CFSTR("significantEventOffsetSeconds"));

  }
}

- (MKFTimerTriggerDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFTimerTriggerDatabaseID alloc], "initWithMKFObject:", self);
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_119366 != -1)
    dispatch_once(&homeRelation__hmf_once_t0_119366, &__block_literal_global_119367);
  return (NSPredicate *)(id)homeRelation__hmf_once_v1_119368;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_25582D570;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFTimerTrigger"));
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end
