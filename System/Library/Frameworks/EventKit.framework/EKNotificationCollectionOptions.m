@implementation EKNotificationCollectionOptions

- (EKNotificationCollectionOptions)initWithExternalID:(id)a3 externalIDTag:(id)a4 inSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  EKNotificationCollectionOptions *v12;
  EKNotificationCollectionOptions *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EKNotificationCollectionOptions;
  v12 = -[EKNotificationCollectionOptions init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_externalID, a3);
    objc_storeStrong((id *)&v13->_externalIDTag, a4);
    objc_storeStrong((id *)&v13->_source, a5);
  }

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKNotificationCollectionOptions externalID](self, "externalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKNotificationCollectionOptions externalIDTag](self, "externalIDTag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKNotificationCollectionOptions source](self, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>(externalID = %@, externalIDTag = %@, source = %@)"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (EKSource)source
{
  return self->_source;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (NSString)externalIDTag
{
  return self->_externalIDTag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIDTag, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
