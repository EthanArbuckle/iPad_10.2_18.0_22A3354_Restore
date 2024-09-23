@implementation SGDuplicateKey

- (SGDuplicateKey)initWithEntityKey:(id)a3 entityType:(int64_t)a4 parentKey:(id)a5
{
  id v10;
  id v11;
  SGDuplicateKey *v12;
  SGDuplicateKey *v13;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDuplicateKey.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entityKey"));

  }
  if ((objc_msgSend((id)objc_opt_class(), "isSupportedEntityType:", a4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    SGEntityTypeDescription();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDuplicateKey.m"), 213, CFSTR("%@ not supported by %@"), v17, objc_opt_class());

  }
  v18.receiver = self;
  v18.super_class = (Class)SGDuplicateKey;
  v12 = -[SGDuplicateKey init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entityKey, a3);
    v13->_entityType = a4;
    objc_storeStrong((id *)&v13->_parentKey, a5);
  }

  return v13;
}

- (SGDuplicateKey)initWithSerialized:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  SGRawKey *v8;
  uint64_t v9;
  void *v10;
  SGRawKey *v11;
  void *v12;
  SGDuplicateKey *v13;
  void *v15;
  void *v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDuplicateKey.m"), 247, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serialized"));

  }
  SGDelimitedStringsDeserialize();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 3)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (SGRawKey *)objc_claimAutoreleasedReturnValue();
    v9 = -[SGRawKey integerValue](v8, "integerValue");
    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[SGDuplicateKey initWithSerializedEntityKey:entityType:serializedParentKey:](self, "initWithSerializedEntityKey:entityType:serializedParentKey:", v7, v9, v10);

LABEL_7:
    v13 = self;
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "count") == 2)
  {
    v11 = [SGRawKey alloc];
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SGRawKey initWithSerialized:](v11, "initWithSerialized:", v7);
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:](self, "initWithEntityKey:entityType:parentKey:", v8, objc_msgSend(v12, "integerValue"), 0);

    goto LABEL_7;
  }
  if (+[SGDuplicateKey serializationPassesBasicScrutiny:](SGDuplicateKey, "serializationPassesBasicScrutiny:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDuplicateKey.m"), 257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![SGDuplicateKey serializationPassesBasicScrutiny:serialized]"));

  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDuplicateKey.m"), 259, CFSTR("Invalid serialization"));
  v13 = 0;
LABEL_11:

  return v13;
}

- (SGDuplicateKey)initWithSerializedEntityKey:(id)a3 entityType:(int64_t)a4 serializedParentKey:(id)a5
{
  id v8;
  id v9;
  SGRawKey *v10;
  SGDuplicateKey *v11;

  v8 = a3;
  if (a5)
  {
    v9 = a5;
    a5 = -[SGDuplicateKey initWithSerialized:]([SGDuplicateKey alloc], "initWithSerialized:", v9);

  }
  v10 = -[SGRawKey initWithSerialized:]([SGRawKey alloc], "initWithSerialized:", v8);
  v11 = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:](self, "initWithEntityKey:entityType:parentKey:", v10, a4, a5);

  return v11;
}

- (SGDuplicateKey)initWithMessageIdHeaderValues:(id)a3 accountIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  SGEmailKey *v9;
  void *v10;
  SGEmailKey *v11;
  SGDuplicateKey *v12;
  NSObject *v13;
  uint8_t v15[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v7 && v8)
  {
    v9 = [SGEmailKey alloc];
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SGEmailKey initWithSource:messageId:](v9, "initWithSource:messageId:", v7, v10);

    self = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:](self, "initWithEntityKey:entityType:parentKey:", v11, 5, 0);
    v12 = self;
  }
  else
  {
    if (objc_msgSend(v6, "count"))
    {
      sgLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_error_impl(&dword_1C3607000, v13, OS_LOG_TYPE_ERROR, "Email Searchable Item is malformed - no account identifier", v15, 2u);
      }

    }
    v12 = 0;
  }

  return v12;
}

- (SGDuplicateKey)initWithSearchableItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  SGDuplicateKey *v11;
  uint8_t v13[16];

  v4 = (void *)MEMORY[0x1E0D80FB0];
  v5 = a3;
  objc_msgSend(v4, "mailItemMessageIdHeaderValues:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "accountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1C3607000, v10, OS_LOG_TYPE_ERROR, "Email Searchable Item is malformed - missing message id or account identifier", v13, 2u);
    }

    v11 = 0;
  }
  else
  {
    self = -[SGDuplicateKey initWithMessageIdHeaderValues:accountIdentifier:](self, "initWithMessageIdHeaderValues:accountIdentifier:", v6, v8);
    v11 = self;
  }

  return v11;
}

- (id)serialize
{
  void *v3;
  SGDuplicateKey *parentKey;
  void *v5;
  void *v6;
  void *v8;
  char __str[16];
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)__str = 0u;
  v10 = 0u;
  snprintf(__str, 0x20uLL, "%llu", self->_entityType);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", __str, strlen(__str), 1, 0);
  parentKey = self->_parentKey;
  -[SGEntityKey serialize](self->_entityKey, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (parentKey)
  {
    -[SGDuplicateKey serialize](self->_parentKey, "serialize");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SGDelimitedStringsSerialize();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    SGDelimitedStringsSerialize();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SGDuplicateKey *v4;
  SGDuplicateKey *v5;
  BOOL v6;

  v4 = (SGDuplicateKey *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGDuplicateKey isEqualToDuplicateKey:](self, "isEqualToDuplicateKey:", v5);

  return v6;
}

- (BOOL)isEqualToDuplicateKey:(id)a3
{
  SGDuplicateKey *v4;
  SGDuplicateKey *v5;
  SGEntityKey *entityKey;
  SGEntityKey *v7;
  SGEntityKey *v8;
  SGEntityKey *v9;
  char v10;
  char v11;
  int64_t entityType;
  SGDuplicateKey *v13;
  SGDuplicateKey *v14;

  v4 = (SGDuplicateKey *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    entityKey = self->_entityKey;
    v7 = v4->_entityKey;
    if (entityKey == v7)
    {

    }
    else
    {
      v8 = v7;
      v9 = entityKey;
      v10 = -[SGEntityKey isEqual:](v9, "isEqual:", v8);

      if ((v10 & 1) == 0)
        goto LABEL_10;
    }
    entityType = self->_entityType;
    if (entityType != -[SGDuplicateKey entityType](v5, "entityType"))
    {
LABEL_10:
      v11 = 0;
      goto LABEL_13;
    }
    v13 = self->_parentKey;
    v14 = v13;
    if (v13 == v5->_parentKey)
      v11 = 1;
    else
      v11 = -[SGDuplicateKey isEqual:](v13, "isEqual:");

  }
LABEL_13:

  return v11;
}

- (unint64_t)hash
{
  int64_t entityType;
  uint64_t v4;

  entityType = self->_entityType;
  v4 = -[SGEntityKey hash](self->_entityKey, "hash") - entityType + 32 * entityType;
  return -[SGDuplicateKey hash](self->_parentKey, "hash") - v4 + 32 * v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  SGEntityTypeDescription();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGDuplicateKey entityType:%@ entityKey:%@ parentKey:%@>"), v4, self->_entityKey, self->_parentKey);

  return v5;
}

- (id)curatedEventKey
{
  SGCuratedEventKey *v4;
  void *v5;
  SGCuratedEventKey *v6;
  void *v8;

  if (!+[SGCuratedEventKey isSupportedEntityType:](SGCuratedEventKey, "isSupportedEntityType:", self->_entityType))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDuplicateKey.m"), 343, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[SGCuratedEventKey isSupportedEntityType:_entityType]"));

  }
  v4 = [SGCuratedEventKey alloc];
  -[SGEntityKey serialize](self->_entityKey, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SGCuratedEventKey initWithSerialized:](v4, "initWithSerialized:", v5);

  return v6;
}

- (id)contactDetailKey
{
  SGContactDetailKey *v4;
  void *v5;
  SGContactDetailKey *v6;
  void *v8;

  if (!+[SGContactDetailKey isSupportedEntityType:](SGContactDetailKey, "isSupportedEntityType:", self->_entityType))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDuplicateKey.m"), 350, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[SGContactDetailKey isSupportedEntityType:_entityType]"));

  }
  v4 = [SGContactDetailKey alloc];
  -[SGEntityKey serialize](self->_entityKey, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SGContactDetailKey initWithSerialized:](v4, "initWithSerialized:", v5);

  return v6;
}

- (id)pseudoContactKey
{
  SGPseudoContactKey *v4;
  void *v5;
  SGPseudoContactKey *v6;
  void *v8;

  if (!+[SGPseudoContactKey isSupportedEntityType:](SGPseudoContactKey, "isSupportedEntityType:", self->_entityType))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDuplicateKey.m"), 356, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[SGPseudoContactKey isSupportedEntityType:_entityType]"));

  }
  v4 = [SGPseudoContactKey alloc];
  -[SGEntityKey serialize](self->_entityKey, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SGPseudoContactKey initWithSerialized:](v4, "initWithSerialized:", v5);

  return v6;
}

- (id)identityKey
{
  void *v4;
  void *v5;
  void *v7;

  if ((SGEntityTypeIsContact() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDuplicateKey.m"), 362, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("SGEntityTypeIsContact(_entityType)"));

  }
  -[SGDuplicateKey pseudoContactKey](self, "pseudoContactKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identityKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)messageKey
{
  void *v3;
  int64_t entityType;

  v3 = 0;
  entityType = self->_entityType;
  if (entityType > 15)
  {
    if (entityType == 16)
    {
      -[SGDuplicateKey interactionKey](self, "interactionKey");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (entityType == 18)
    {
      -[SGDuplicateKey webPageKey](self, "webPageKey");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (entityType == 5)
  {
    -[SGDuplicateKey emailKey](self, "emailKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (entityType == 13)
  {
    -[SGDuplicateKey textMessageKey](self, "textMessageKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)emailKey
{
  SGEmailKey *v4;
  void *v5;
  SGEmailKey *v6;
  void *v8;

  if (!+[SGEmailKey isSupportedEntityType:](SGEmailKey, "isSupportedEntityType:", self->_entityType))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDuplicateKey.m"), 383, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[SGEmailKey isSupportedEntityType:_entityType]"));

  }
  v4 = [SGEmailKey alloc];
  -[SGEntityKey serialize](self->_entityKey, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SGMessageKey initWithSerialized:](v4, "initWithSerialized:", v5);

  return v6;
}

- (id)textMessageKey
{
  SGTextMessageKey *v4;
  void *v5;
  SGTextMessageKey *v6;
  void *v8;

  if (!+[SGTextMessageKey isSupportedEntityType:](SGTextMessageKey, "isSupportedEntityType:", self->_entityType))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDuplicateKey.m"), 389, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[SGTextMessageKey isSupportedEntityType:_entityType]"));

  }
  v4 = [SGTextMessageKey alloc];
  -[SGEntityKey serialize](self->_entityKey, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SGMessageKey initWithSerialized:](v4, "initWithSerialized:", v5);

  return v6;
}

- (id)webPageKey
{
  SGWebPageKey *v4;
  void *v5;
  SGWebPageKey *v6;
  void *v8;

  if (!+[SGWebPageKey isSupportedEntityType:](SGWebPageKey, "isSupportedEntityType:", self->_entityType))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDuplicateKey.m"), 395, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[SGWebPageKey isSupportedEntityType:_entityType]"));

  }
  v4 = [SGWebPageKey alloc];
  -[SGEntityKey serialize](self->_entityKey, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SGMessageKey initWithSerialized:](v4, "initWithSerialized:", v5);

  return v6;
}

- (id)interactionKey
{
  SGInteractionKey *v4;
  void *v5;
  SGInteractionKey *v6;
  void *v8;

  if (!+[SGInteractionKey isSupportedEntityType:](SGInteractionKey, "isSupportedEntityType:", self->_entityType))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDuplicateKey.m"), 401, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[SGInteractionKey isSupportedEntityType:_entityType]"));

  }
  v4 = [SGInteractionKey alloc];
  -[SGEntityKey serialize](self->_entityKey, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SGMessageKey initWithSerialized:](v4, "initWithSerialized:", v5);

  return v6;
}

- (id)pseudoEventKey
{
  SGPseudoEventKey *v4;
  void *v5;
  SGPseudoEventKey *v6;
  void *v8;

  if (!+[SGPseudoEventKey isSupportedEntityType:](SGPseudoEventKey, "isSupportedEntityType:", self->_entityType))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDuplicateKey.m"), 407, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[SGPseudoEventKey isSupportedEntityType:_entityType]"));

  }
  v4 = [SGPseudoEventKey alloc];
  -[SGEntityKey serialize](self->_entityKey, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SGPseudoEventKey initWithSerialized:](v4, "initWithSerialized:", v5);

  return v6;
}

- (id)pseudoReminderKey
{
  SGPseudoReminderKey *v4;
  void *v5;
  SGPseudoReminderKey *v6;
  void *v8;

  if (!+[SGPseudoReminderKey isSupportedEntityType:](SGPseudoReminderKey, "isSupportedEntityType:", self->_entityType))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDuplicateKey.m"), 413, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[SGPseudoReminderKey isSupportedEntityType:_entityType]"));

  }
  v4 = [SGPseudoReminderKey alloc];
  -[SGEntityKey serialize](self->_entityKey, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SGPseudoReminderKey initWithSerialized:](v4, "initWithSerialized:", v5);

  return v6;
}

- (id)deliveryKey
{
  SGDeliveryKey *v4;
  void *v5;
  SGDeliveryKey *v6;
  void *v8;

  if (!+[SGDeliveryKey isSupportedEntityType:](SGDeliveryKey, "isSupportedEntityType:", self->_entityType))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDuplicateKey.m"), 419, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[SGDeliveryKey isSupportedEntityType:_entityType]"));

  }
  v4 = [SGDeliveryKey alloc];
  -[SGEntityKey serialize](self->_entityKey, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SGDeliveryKey initWithSerialized:](v4, "initWithSerialized:", v5);

  return v6;
}

- (id)walletOrderKey
{
  SGWalletOrderKey *v4;
  void *v5;
  SGWalletOrderKey *v6;
  void *v8;

  if (!+[SGWalletOrderKey isSupportedEntityType:](SGWalletOrderKey, "isSupportedEntityType:", self->_entityType))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDuplicateKey.m"), 425, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[SGWalletOrderKey isSupportedEntityType:_entityType]"));

  }
  v4 = [SGWalletOrderKey alloc];
  -[SGEntityKey serialize](self->_entityKey, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SGWalletOrderKey initWithSerialized:](v4, "initWithSerialized:", v5);

  return v6;
}

- (id)walletPassKey
{
  SGWalletPassKey *v4;
  void *v5;
  SGWalletPassKey *v6;
  void *v8;

  if (!+[SGWalletPassKey isSupportedEntityType:](SGWalletPassKey, "isSupportedEntityType:", self->_entityType))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDuplicateKey.m"), 431, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[SGWalletPassKey isSupportedEntityType:_entityType]"));

  }
  v4 = [SGWalletPassKey alloc];
  -[SGEntityKey serialize](self->_entityKey, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SGWalletPassKey initWithSerialized:](v4, "initWithSerialized:", v5);

  return v6;
}

- (NSData)compositeHash
{
  void *v2;
  void *v3;

  -[SGDuplicateKey serialize](self, "serialize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SGSha256BytesForString(v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)bundleId
{
  void *v2;
  int64_t entityType;
  id *v4;
  id v5;
  SGInteractionKey *v8;
  void *v9;
  SGInteractionKey *v10;

  v2 = 0;
  entityType = self->_entityType;
  if (entityType > 15)
  {
    if (entityType == 16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[SGEntityKey bundleId](self->_entityKey, "bundleId");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [SGInteractionKey alloc];
        -[SGEntityKey serialize](self->_entityKey, "serialize");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[SGMessageKey initWithSerialized:](v8, "initWithSerialized:", v9);

        -[SGInteractionKey bundleId](v10, "bundleId");
        v2 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v2 = 0;
      }
    }
    else if (entityType == 18)
    {
      v4 = (id *)MEMORY[0x1E0D19A60];
      goto LABEL_9;
    }
  }
  else
  {
    if (entityType == 5)
    {
      v4 = (id *)MEMORY[0x1E0D19A28];
      goto LABEL_9;
    }
    if (entityType == 13)
    {
      v4 = (id *)MEMORY[0x1E0D19A38];
LABEL_9:
      v5 = *v4;
LABEL_10:
      v2 = v5;
    }
  }
  return v2;
}

- (int64_t)entityType
{
  return self->_entityType;
}

- (SGEntityKey)entityKey
{
  return self->_entityKey;
}

- (SGDuplicateKey)parentKey
{
  return self->_parentKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentKey, 0);
  objc_storeStrong((id *)&self->_entityKey, 0);
}

+ (id)duplicateKeyForMessage:(id)a3 fromSource:(id)a4
{
  id v6;
  id v7;
  char isKindOfClass;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(v7, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((isKindOfClass & 1) != 0)
    objc_msgSend(a1, "duplicateKeyForTextMessageWithSource:uniqueIdentifier:", v6, v9);
  else
    objc_msgSend(a1, "duplicateKeyForEmailWithSource:messageId:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)duplicateKeyForEmailWithSource:(id)a3 messageId:(id)a4
{
  id v5;
  id v6;
  SGEmailKey *v7;
  SGDuplicateKey *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[SGEmailKey initWithSource:messageId:]([SGEmailKey alloc], "initWithSource:messageId:", v6, v5);

  v8 = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:]([SGDuplicateKey alloc], "initWithEntityKey:entityType:parentKey:", v7, 5, 0);
  return v8;
}

+ (id)duplicateKeyForTextMessageWithSource:(id)a3 uniqueIdentifier:(id)a4
{
  id v5;
  id v6;
  SGTextMessageKey *v7;
  SGDuplicateKey *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[SGMessageKey initWithSource:uniqueIdentifier:]([SGTextMessageKey alloc], "initWithSource:uniqueIdentifier:", v6, v5);

  v8 = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:]([SGDuplicateKey alloc], "initWithEntityKey:entityType:parentKey:", v7, 13, 0);
  return v8;
}

+ (id)duplicateKeyForInteractionWithBundleId:(id)a3 personHandle:(id)a4
{
  id v5;
  id v6;
  SGInteractionKey *v7;
  SGDuplicateKey *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[SGInteractionKey initWithBundleId:personHandle:]([SGInteractionKey alloc], "initWithBundleId:personHandle:", v6, v5);

  v8 = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:]([SGDuplicateKey alloc], "initWithEntityKey:entityType:parentKey:", v7, 16, 0);
  return v8;
}

+ (id)duplicateKeyForInteraction:(id)a3 fromBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGDuplicateKey.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interaction"));

  }
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGDuplicateKey.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier.length > 0"));

  }
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDuplicateKey duplicateKeyForInteractionIdentifier:fromBundleIdentifier:](SGDuplicateKey, "duplicateKeyForInteractionIdentifier:fromBundleIdentifier:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)duplicateKeyForInteractionIdentifier:(id)a3 fromBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  SGInteractionKey *v9;
  SGDuplicateKey *v10;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGDuplicateKey.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interactionIdentifier"));

  }
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGDuplicateKey.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier.length > 0"));

  }
  v9 = -[SGInteractionKey initWithSource:uniqueIdentifier:]([SGInteractionKey alloc], "initWithSource:uniqueIdentifier:", v8, v7);
  v10 = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:]([SGDuplicateKey alloc], "initWithEntityKey:entityType:parentKey:", v9, 16, 0);

  return v10;
}

+ (id)duplicateKeyForPseudoContactWithIdentity:(id)a3 parentKey:(id)a4
{
  id v5;
  id v6;
  SGPseudoContactKey *v7;
  SGDuplicateKey *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[SGPseudoContactKey initWithIdentityKey:]([SGPseudoContactKey alloc], "initWithIdentityKey:", v6);

  v8 = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:]([SGDuplicateKey alloc], "initWithEntityKey:entityType:parentKey:", v7, 4, v5);
  return v8;
}

+ (id)duplicateKeyForCuratedEventWithExternalID:(id)a3
{
  id v3;
  SGDuplicateKey *v4;
  SGCuratedEventKey *v5;
  SGDuplicateKey *v6;

  v3 = a3;
  v4 = [SGDuplicateKey alloc];
  v5 = -[SGCuratedEventKey initWithExternalId:]([SGCuratedEventKey alloc], "initWithExternalId:", v3);

  v6 = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:](v4, "initWithEntityKey:entityType:parentKey:", v5, 1, 0);
  return v6;
}

+ (id)duplicateKeyForPseudoEventWithGroupId:(id)a3 parentKey:(id)a4
{
  id v5;
  id v6;
  SGDuplicateKey *v7;
  SGPseudoEventKey *v8;
  SGDuplicateKey *v9;

  v5 = a4;
  v6 = a3;
  v7 = [SGDuplicateKey alloc];
  v8 = -[SGPseudoEventKey initWithGloballyUniqueId:]([SGPseudoEventKey alloc], "initWithGloballyUniqueId:", v6);

  v9 = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:](v7, "initWithEntityKey:entityType:parentKey:", v8, 2, v5);
  return v9;
}

+ (id)duplicateKeyForPseudoReminderWithGroupId:(id)a3 withCreationTime:(SGUnixTimestamp_)a4 parentKey:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SGDuplicateKey *v15;
  SGPseudoReminderKey *v16;
  SGDuplicateKey *v17;

  v7 = (objc_class *)MEMORY[0x1E0C99D68];
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithTimeIntervalSince1970:", a4.secondsFromUnixEpoch);
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996D8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLocale:", v12);

  objc_msgSend(v11, "components:fromDate:", 8196, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%ld_%ld"), v9, objc_msgSend(v13, "weekOfYear"), objc_msgSend(v13, "year"));

  v15 = [SGDuplicateKey alloc];
  v16 = -[SGPseudoReminderKey initWithGroupId:]([SGPseudoReminderKey alloc], "initWithGroupId:", v14);
  v17 = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:](v15, "initWithEntityKey:entityType:parentKey:", v16, 22, v8);

  return v17;
}

+ (id)duplicateKeyForDeliveryWithProviderString:(id)a3 trackingNumber:(id)a4 parentKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  SGDuplicateKey *v10;
  SGDeliveryKey *v11;
  uint64_t v12;
  SGDeliveryKey *v13;
  SGDuplicateKey *v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [SGDuplicateKey alloc];
  v11 = [SGDeliveryKey alloc];
  v12 = objc_msgSend((id)objc_opt_class(), "providerForString:", v9);

  v13 = -[SGDeliveryKey initWithProvider:trackingNumber:](v11, "initWithProvider:trackingNumber:", v12, v8);
  v14 = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:](v10, "initWithEntityKey:entityType:parentKey:", v13, 24, v7);

  return v14;
}

+ (id)duplicateKeyForWalletPassIdentifier:(id)a3 parentKey:(id)a4
{
  id v5;
  id v6;
  SGDuplicateKey *v7;
  SGWalletPassKey *v8;
  SGDuplicateKey *v9;

  v5 = a4;
  v6 = a3;
  v7 = [SGDuplicateKey alloc];
  v8 = -[SGWalletPassKey initWithIdentifier:]([SGWalletPassKey alloc], "initWithIdentifier:", v6);

  v9 = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:](v7, "initWithEntityKey:entityType:parentKey:", v8, 26, v5);
  return v9;
}

+ (id)duplicateKeyForNaturalLanguageEventWithStartDate:(id)a3 endDate:(id)a4 title:(id)a5 participants:(id)a6 parentKey:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  SGDuplicateKey *v28;
  SGPseudoEventKey *v29;
  SGDuplicateKey *v30;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v32 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v17 = v16;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("self"), 1);
  v33[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedArrayUsingDescriptors:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = &stru_1E7DB83A8;
  objc_msgSend(v20, "_pas_componentsJoinedByString:", &stru_1E7DB83A8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[SGSimpleMailMessage subjectByCleaningPrefixesInSubject:](SGSimpleMailMessage, "subjectByCleaningPrefixesInSubject:", v12);
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  -[__CFString stringByAppendingString:](v21, "stringByAppendingString:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  SGSha256BytesForString(v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "base64EncodedStringWithOptions:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "substringToIndex:", 10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%li/%@"), (uint64_t)(round(v17 / 1209600.0) * 1209600.0), v26);
  v28 = [SGDuplicateKey alloc];
  v29 = -[SGPseudoEventKey initWithGloballyUniqueId:]([SGPseudoEventKey alloc], "initWithGloballyUniqueId:", v27);
  v30 = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:](v28, "initWithEntityKey:entityType:parentKey:", v29, 2, v14);

  objc_autoreleasePoolPop(v15);
  return v30;
}

+ (id)duplicateKeyForWalletOrderIdentifier:(id)a3 parentKey:(id)a4
{
  id v5;
  id v6;
  SGDuplicateKey *v7;
  SGWalletOrderKey *v8;
  SGDuplicateKey *v9;

  v5 = a4;
  v6 = a3;
  v7 = [SGDuplicateKey alloc];
  v8 = -[SGWalletOrderKey initWithIdentifier:]([SGWalletOrderKey alloc], "initWithIdentifier:", v6);

  v9 = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:](v7, "initWithEntityKey:entityType:parentKey:", v8, 25, v5);
  return v9;
}

+ (id)duplicateKeyForSearchableItem:(id)a3
{
  id v3;
  SGDuplicateKey *v4;

  v3 = a3;
  v4 = -[SGDuplicateKey initWithSearchableItem:]([SGDuplicateKey alloc], "initWithSearchableItem:", v3);

  return v4;
}

+ (id)duplicateKeyForSchemaOrg
{
  SGDuplicateKey *v2;
  void *v3;
  SGDuplicateKey *v4;

  v2 = [SGDuplicateKey alloc];
  v3 = (void *)objc_opt_new();
  v4 = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:](v2, "initWithEntityKey:entityType:parentKey:", v3, 17, 0);

  return v4;
}

+ (id)duplicateKeyForWebPageFromSource:(id)a3
{
  id v3;
  SGWebPageKey *v4;
  void *v5;
  void *v6;
  SGWebPageKey *v7;
  SGDuplicateKey *v8;

  v3 = a3;
  v4 = [SGWebPageKey alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SGMessageKey initWithSource:uniqueIdentifier:](v4, "initWithSource:uniqueIdentifier:", v3, v6);

  v8 = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:]([SGDuplicateKey alloc], "initWithEntityKey:entityType:parentKey:", v7, 18, 0);
  return v8;
}

+ (BOOL)serializationPassesBasicScrutiny:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;

  if (a3)
  {
    SGDelimitedStringsDeserialize();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    if (v5 == 2)
      goto LABEL_5;
    if (v5 != 3)
    {
      LOBYTE(v7) = 0;
      goto LABEL_8;
    }
    objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(a1, "serializationPassesBasicScrutiny:", v6);

    if (v7)
LABEL_5:
      LOBYTE(v7) = 1;
LABEL_8:

    return v7;
  }
  LOBYTE(v7) = 0;
  return v7;
}

@end
