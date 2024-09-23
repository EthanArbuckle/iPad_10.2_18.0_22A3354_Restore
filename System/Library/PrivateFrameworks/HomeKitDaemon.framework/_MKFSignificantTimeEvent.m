@implementation _MKFSignificantTimeEvent

- (void)awakeFromFetch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MKFSignificantTimeEvent;
  -[_MKFSignificantTimeEvent awakeFromFetch](&v8, sel_awakeFromFetch);
  -[_MKFSignificantTimeEvent offsetSeconds](self, "offsetSeconds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[_MKFSignificantTimeEvent offset](self, "offset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return;
    v5 = (void *)MEMORY[0x24BDD16E0];
    -[_MKFSignificantTimeEvent offset](self, "offset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeDateComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithInteger:", HMDTimeOffsetFromDateComponents(v6, 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFSignificantTimeEvent setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, CFSTR("offsetSeconds"));

  }
}

- (MKFSignificantTimeEventDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFSignificantTimeEventDatabaseID alloc], "initWithMKFObject:", self);
}

- (MKFHome)home
{
  void *v2;
  void *v3;

  -[_MKFSignificantTimeEvent trigger](self, "trigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MKFHome *)v3;
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

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557BB9D8;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFSignificantTimeEvent"));
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end
