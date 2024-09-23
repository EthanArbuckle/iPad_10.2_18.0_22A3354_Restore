@implementation BBBulletinRequestParameters

- (NSDate)sinceDate
{
  return self->_sinceDate;
}

- (unint64_t)maximumCount
{
  return self->_maximumCount;
}

- (unint64_t)publisherDestination
{
  return self->_publisherDestination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledSectionIDs, 0);
  objc_storeStrong((id *)&self->_sinceDate, 0);
}

- (BBBulletinRequestParameters)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BBBulletinRequestParameters *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BBPublisherDestination"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BBSinceDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BBMaximumCount"));
  v8 = (void *)MEMORY[0x24BDBCF20];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("BBEnabledSectionIDs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[BBBulletinRequestParameters initWithDestination:sinceDate:maximumCount:enabledSectionIDs:](self, "initWithDestination:sinceDate:maximumCount:enabledSectionIDs:", v5, v6, v7, v11);
  return v12;
}

+ (id)requestParametersForDestination:(unint64_t)a3 withSinceDate:(id)a4 maximumCount:(int64_t)a5 enabledSectionIDs:(id)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a6;
  v10 = a4;
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDestination:sinceDate:maximumCount:enabledSectionIDs:", a3, v10, a5, v9);

  return v11;
}

- (BBBulletinRequestParameters)initWithDestination:(unint64_t)a3 sinceDate:(id)a4 maximumCount:(int64_t)a5 enabledSectionIDs:(id)a6
{
  id v11;
  id v12;
  BBBulletinRequestParameters *v13;
  BBBulletinRequestParameters *v14;
  uint64_t v15;
  NSDate *sinceDate;
  uint64_t v17;
  NSSet *enabledSectionIDs;
  void *v20;
  objc_super v21;

  v11 = a4;
  v12 = a6;
  if (a3 != 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBDataProvider.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("IsSingleListTypeDestination(destination)"));

  }
  v21.receiver = self;
  v21.super_class = (Class)BBBulletinRequestParameters;
  v13 = -[BBBulletinRequestParameters init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_publisherDestination = a3;
    v15 = objc_msgSend(v11, "copy");
    sinceDate = v14->_sinceDate;
    v14->_sinceDate = (NSDate *)v15;

    v14->_maximumCount = a5;
    v17 = objc_msgSend(v12, "copy");
    enabledSectionIDs = v14->_enabledSectionIDs;
    v14->_enabledSectionIDs = (NSSet *)v17;

  }
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *enabledSectionIDs;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", self->_publisherDestination, CFSTR("BBPublisherDestination"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sinceDate, CFSTR("BBSinceDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maximumCount, CFSTR("BBMaximumCount"));
  enabledSectionIDs = self->_enabledSectionIDs;
  if (enabledSectionIDs)
    objc_msgSend(v5, "encodeObject:forKey:", enabledSectionIDs, CFSTR("BBEnabledSectionIDs"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDestination:sinceDate:maximumCount:enabledSectionIDs:", self->_publisherDestination, self->_sinceDate, self->_maximumCount, self->_enabledSectionIDs);
}

- (NSSet)enabledSectionIDs
{
  NSSet *enabledSectionIDs;

  enabledSectionIDs = self->_enabledSectionIDs;
  if (enabledSectionIDs)
    return enabledSectionIDs;
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = CFSTR("[Invalid destination]");
  if (self->_publisherDestination == 2)
    v5 = CFSTR("BBPublisherDestinationNotices");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; publisherDestination:%@; sinceDate:%@; maxCount:%ld; enabledSectionIDs:%@>"),
               v4,
               self,
               v5,
               self->_sinceDate,
               self->_maximumCount,
               self->_enabledSectionIDs);
}

- (void)setSinceDate:(id)a3
{
  objc_storeStrong((id *)&self->_sinceDate, a3);
}

- (void)setEnabledSectionIDs:(id)a3
{
  objc_storeStrong((id *)&self->_enabledSectionIDs, a3);
}

@end
