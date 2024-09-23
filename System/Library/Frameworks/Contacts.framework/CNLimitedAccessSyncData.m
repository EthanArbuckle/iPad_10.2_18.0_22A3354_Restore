@implementation CNLimitedAccessSyncData

- (NSEnumerator)syncEvents
{
  void *v2;
  void *v3;

  -[CNLimitedAccessSyncData syncEventsArray](self, "syncEventsArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSEnumerator *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t currentSequenceNumber;
  id v5;

  currentSequenceNumber = self->_currentSequenceNumber;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", currentSequenceNumber, CFSTR("_currentSequenceNumber"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_fullSyncRequired, CFSTR("_fullSyncRequired"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_syncEventsArray, CFSTR("_syncEventsArray"));

}

- (CNLimitedAccessSyncData)initWithCoder:(id)a3
{
  id v4;
  CNLimitedAccessSyncData *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *syncEventsArray;
  CNLimitedAccessSyncData *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNLimitedAccessSyncData;
  v5 = -[CNLimitedAccessSyncData init](&v14, sel_init);
  if (v5)
  {
    v5->_currentSequenceNumber = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_currentSequenceNumber"));
    v5->_fullSyncRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_fullSyncRequired"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_syncEventsArray"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    syncEventsArray = v5->_syncEventsArray;
    v5->_syncEventsArray = (NSArray *)v10;

    v12 = v5;
  }

  return v5;
}

- (int64_t)currentSequenceNumber
{
  return self->_currentSequenceNumber;
}

- (void)setCurrentSequenceNumber:(int64_t)a3
{
  self->_currentSequenceNumber = a3;
}

- (BOOL)fullSyncRequired
{
  return self->_fullSyncRequired;
}

- (void)setFullSyncRequired:(BOOL)a3
{
  self->_fullSyncRequired = a3;
}

- (NSArray)syncEventsArray
{
  return self->_syncEventsArray;
}

- (void)setSyncEventsArray:(id)a3
{
  objc_storeStrong((id *)&self->_syncEventsArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncEventsArray, 0);
}

@end
