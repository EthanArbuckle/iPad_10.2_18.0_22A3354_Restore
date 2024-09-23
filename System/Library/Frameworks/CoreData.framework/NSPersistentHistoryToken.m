@implementation NSPersistentHistoryToken

uint64_t __48___NSPersistentHistoryToken_compareToken_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __48___NSPersistentHistoryToken_compareToken_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __33___NSPersistentHistoryToken_hash__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "unsignedIntegerValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPersistentHistoryToken)initWithTransactionNumber:(id)a3 andStoreID:(id)a4
{
  NSPersistentHistoryToken *v6;

  v6 = -[NSPersistentHistoryToken init](self, "init");
  if (v6)

  return (NSPersistentHistoryToken *)-[_NSPersistentHistoryToken initWithTransactionNumber:andStoreID:]([_NSPersistentHistoryToken alloc], "initWithTransactionNumber:andStoreID:", a3, a4);
}

- (NSPersistentHistoryToken)initWithDictionary:(id)a3
{
  NSPersistentHistoryToken *v4;

  v4 = -[NSPersistentHistoryToken init](self, "init");
  if (v4)

  return (NSPersistentHistoryToken *)-[_NSPersistentHistoryToken initWithDictionary:]([_NSPersistentHistoryToken alloc], "initWithDictionary:", a3);
}

- (NSPersistentHistoryToken)initWithCoder:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (id)storeTokens
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (id)MEMORY[0x1E0C9AA70];
}

@end
