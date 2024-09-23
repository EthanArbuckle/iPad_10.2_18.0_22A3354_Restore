@implementation SGDeliveryKey

- (SGDeliveryKey)initWithProvider:(unint64_t)a3 trackingNumber:(id)a4
{
  id v8;
  SGDeliveryKey *v9;
  SGDeliveryKey *v10;
  void *v11;
  NSString *trackingNumber;
  void *v13;
  uint64_t v14;
  NSString *externalIdentifier;
  void *v17;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDeliveryKey.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("trackingNumber"));

  }
  v18.receiver = self;
  v18.super_class = (Class)SGDeliveryKey;
  v9 = -[SGDeliveryKey init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_provider = a3;
    objc_storeStrong((id *)&v9->_trackingNumber, a4);
    objc_msgSend((id)objc_opt_class(), "stringForProvider:", v10->_provider);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    trackingNumber = v10->_trackingNumber;
    v19[0] = v11;
    v19[1] = trackingNumber;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SGDelimitedStringsSerializeArray();
    v14 = objc_claimAutoreleasedReturnValue();
    externalIdentifier = v10->_externalIdentifier;
    v10->_externalIdentifier = (NSString *)v14;

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  SGDeliveryKey *v4;
  SGDeliveryKey *v5;
  BOOL v6;

  v4 = (SGDeliveryKey *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGDeliveryKey isEqualToDeliveryKey:](self, "isEqualToDeliveryKey:", v5);

  return v6;
}

- (BOOL)isEqualToDeliveryKey:(id)a3
{
  SGDeliveryKey *v4;
  NSString *v5;
  NSString *v6;
  char v7;

  v4 = (SGDeliveryKey *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    v5 = self->_externalIdentifier;
    v6 = v5;
    if (v5 == v4->_externalIdentifier)
      v7 = 1;
    else
      v7 = -[NSString isEqual:](v5, "isEqual:");

  }
  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_externalIdentifier, "hash");
}

- (id)serialize
{
  return self->_externalIdentifier;
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[SGDeliveryKey externalIdentifier: %@]"), self->_externalIdentifier);
}

- (SGDeliveryKey)initWithSerialized:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  SGDeliveryKey *v7;

  SGDelimitedStringsDeserialize();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SGDeliveryKey initWithProvider:trackingNumber:](self, "initWithProvider:trackingNumber:", objc_msgSend((id)objc_opt_class(), "providerForString:", v5), v6);

  return v7;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (unint64_t)provider
{
  return self->_provider;
}

- (NSString)trackingNumber
{
  return self->_trackingNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingNumber, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  return a3 == 24;
}

@end
