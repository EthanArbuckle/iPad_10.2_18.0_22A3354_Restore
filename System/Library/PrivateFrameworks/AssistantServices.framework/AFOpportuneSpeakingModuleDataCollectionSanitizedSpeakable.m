@implementation AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable

- (AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable)initWithDate:(id)a3
{
  id v5;
  AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable *v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable;
  v6 = -[AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    objc_storeStrong((id *)&v6->_date, a3);
  }

  return v6;
}

- (BOOL)isOlderThan:(id)a3
{
  return -[NSDate compare:](self->_date, "compare:", a3) == NSOrderedAscending;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
