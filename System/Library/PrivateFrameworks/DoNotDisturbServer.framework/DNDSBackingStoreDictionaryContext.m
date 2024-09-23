@implementation DNDSBackingStoreDictionaryContext

- (DNDSBackingStoreDictionaryContext)initWithDestination:(unint64_t)a3 partitionType:(unint64_t)a4 redactSensitiveData:(BOOL)a5 contactProvider:(id)a6 applicationIdentifierMapper:(id)a7
{
  return (DNDSBackingStoreDictionaryContext *)-[DNDSBackingStoreDictionaryContext _initWithDestination:partitionType:healingSource:currentRecord:redactSensitiveData:contactProvider:applicationIdentifierMapper:](self, "_initWithDestination:partitionType:healingSource:currentRecord:redactSensitiveData:contactProvider:applicationIdentifierMapper:", a3, a4, 0, 0, a5, a6, a7);
}

- (DNDSBackingStoreDictionaryContext)initWithDestination:(unint64_t)a3 partitionType:(unint64_t)a4 currentRecord:(id)a5 redactSensitiveData:(BOOL)a6 contactProvider:(id)a7 applicationIdentifierMapper:(id)a8
{
  return (DNDSBackingStoreDictionaryContext *)-[DNDSBackingStoreDictionaryContext _initWithDestination:partitionType:healingSource:currentRecord:redactSensitiveData:contactProvider:applicationIdentifierMapper:](self, "_initWithDestination:partitionType:healingSource:currentRecord:redactSensitiveData:contactProvider:applicationIdentifierMapper:", a3, a4, 0, a5, a6, a7, a8);
}

- (DNDSBackingStoreDictionaryContext)initWithDestination:(unint64_t)a3 partitionType:(unint64_t)a4 healingSource:(id)a5 redactSensitiveData:(BOOL)a6 contactProvider:(id)a7 applicationIdentifierMapper:(id)a8
{
  return (DNDSBackingStoreDictionaryContext *)-[DNDSBackingStoreDictionaryContext _initWithDestination:partitionType:healingSource:currentRecord:redactSensitiveData:contactProvider:applicationIdentifierMapper:](self, "_initWithDestination:partitionType:healingSource:currentRecord:redactSensitiveData:contactProvider:applicationIdentifierMapper:", a3, a4, a5, 0, a6, a7, a8);
}

- (id)_initWithDestination:(unint64_t)a3 partitionType:(unint64_t)a4 healingSource:(id)a5 currentRecord:(id)a6 redactSensitiveData:(BOOL)a7 contactProvider:(id)a8 applicationIdentifierMapper:(id)a9
{
  id v15;
  id v16;
  id v17;
  DNDSBackingStoreDictionaryContext *v18;
  DNDSBackingStoreDictionaryContext *v19;
  id v22;
  objc_super v23;

  v22 = a5;
  v15 = a6;
  v16 = a8;
  v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)DNDSBackingStoreDictionaryContext;
  v18 = -[DNDSBackingStoreDictionaryContext init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_destination = a3;
    v18->_partitionType = a4;
    objc_storeStrong((id *)&v18->_underlyingHealingSource, a5);
    objc_storeStrong((id *)&v19->_currentRecord, a6);
    v19->_redactSensitiveData = a7;
    objc_storeStrong((id *)&v19->_contactProvider, a8);
    objc_storeStrong((id *)&v19->_applicationIdentifierMapper, a9);
  }

  return v19;
}

- (id)copyWithCurrentRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)-[DNDSBackingStoreDictionaryContext mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "setCurrentRecord:", v4);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

- (DNDSContactProviding)contactProvider
{
  return self->_contactProvider;
}

- (DNDSApplicationIdentifierMapping)applicationIdentifierMapper
{
  return self->_applicationIdentifierMapper;
}

- (NSDictionary)healingSource
{
  NSFastEnumeration *underlyingHealingSource;
  NSFastEnumeration *v4;

  if (self->_underlyingHealingSource)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      return (NSDictionary *)v4;
    }
    underlyingHealingSource = self->_underlyingHealingSource;
  }
  else
  {
    underlyingHealingSource = 0;
  }
  v4 = underlyingHealingSource;
  return (NSDictionary *)v4;
}

- (NSArray)arrayHealingSource
{
  NSFastEnumeration *underlyingHealingSource;
  NSFastEnumeration *v4;

  if (self->_underlyingHealingSource)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      return (NSArray *)v4;
    }
    underlyingHealingSource = self->_underlyingHealingSource;
  }
  else
  {
    underlyingHealingSource = 0;
  }
  v4 = underlyingHealingSource;
  return (NSArray *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSBackingStoreDictionaryContext _initWithContext:]([DNDSBackingStoreDictionaryContext alloc], "_initWithContext:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSBackingStoreDictionaryContext _initWithContext:]([DNDSMutableBackingStoreDictionaryContext alloc], "_initWithContext:", self);
}

- (id)_initWithContext:(id)a3
{
  id v4;
  DNDSBackingStoreDictionaryContext *v5;
  DNDSBackingStoreDictionaryContext *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DNDSBackingStoreDictionaryContext;
  v5 = -[DNDSBackingStoreDictionaryContext init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_destination = *((_QWORD *)v4 + 1);
    v5->_partitionType = *((_QWORD *)v4 + 2);
    objc_storeStrong((id *)&v5->_underlyingHealingSource, *((id *)v4 + 3));
    objc_storeStrong((id *)&v6->_currentRecord, *((id *)v4 + 4));
    v6->_redactSensitiveData = *((_BYTE *)v4 + 40);
    objc_storeStrong((id *)&v6->_contactProvider, *((id *)v4 + 6));
    objc_storeStrong((id *)&v6->_applicationIdentifierMapper, *((id *)v4 + 7));
  }

  return v6;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (unint64_t)partitionType
{
  return self->_partitionType;
}

- (NSFastEnumeration)underlyingHealingSource
{
  return self->_underlyingHealingSource;
}

- (void)setUnderlyingHealingSource:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingHealingSource, a3);
}

- (DNDSBackingStoreRecord)currentRecord
{
  return self->_currentRecord;
}

- (void)setCurrentRecord:(id)a3
{
  objc_storeStrong((id *)&self->_currentRecord, a3);
}

- (BOOL)redactSensitiveData
{
  return self->_redactSensitiveData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifierMapper, 0);
  objc_storeStrong((id *)&self->_contactProvider, 0);
  objc_storeStrong((id *)&self->_currentRecord, 0);
  objc_storeStrong((id *)&self->_underlyingHealingSource, 0);
}

@end
