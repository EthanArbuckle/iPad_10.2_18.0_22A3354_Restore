@implementation NSUbiquitousKeyValueStore

+ (id)additionalStoreWithIdentifier:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithBundleIdentifier:storeIdentifier:additionalStore:", 0, a3, 1);
}

NSUbiquitousKeyValueStore *__41__NSUbiquitousKeyValueStore_defaultStore__block_invoke()
{
  NSUbiquitousKeyValueStore *result;

  result = objc_alloc_init(NSUbiquitousKeyValueStore);
  qword_1ECD0A830 = (uint64_t)result;
  return result;
}

- (NSUbiquitousKeyValueStore)initWithStoreIdentifier:(id)a3 type:(int64_t)a4
{
  NSUbiquitousKeyValueStore *v6;
  uint64_t v7;
  NSNotificationCenter *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSUbiquitousKeyValueStore;
  v6 = -[NSUbiquitousKeyValueStore init](&v10, sel_init);
  if (!v6)
    return v6;
  if (qword_1ECD0A840 != -1)
    dispatch_once(&qword_1ECD0A840, &__block_literal_global_6_0);
  if (!qword_1ECD0A838)
  {

    return 0;
  }
  if (!objc_msgSend((id)qword_1ECD0A838, "instancesRespondToSelector:", sel_initWithStoreIdentifier_type_))
  {
    NSLog((NSString *)CFSTR("Unable to find initializer for SYDClientToDaemonConnection"));
    if (!v6->_source)
      return v6;
LABEL_12:
    v8 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v8, "addObserver:selector:name:object:", v6, sel__sourceDidChangePassthroughNotification_, objc_msgSend((id)qword_1ECD0A838, "SYDUbiquitousKeyValueStoreDidChangeExternallyNotification"), v6->_source);
    return v6;
  }
  if ((unint64_t)(a4 - 1) >= 3)
    a4 = 0;
  v7 = objc_msgSend(objc_alloc((Class)qword_1ECD0A838), "initWithStoreIdentifier:type:", a3, a4);
  v6->_source = (SYDClientToDaemonConnection *)v7;
  if (v7)
    goto LABEL_12;
  return v6;
}

- (NSUbiquitousKeyValueStore)initWithBundleIdentifier:(id)a3 storeIdentifier:(id)a4 additionalStore:(BOOL)a5
{
  return -[NSUbiquitousKeyValueStore initWithStoreIdentifier:type:](self, "initWithStoreIdentifier:type:", a4, 0, a5);
}

- (NSUbiquitousKeyValueStore)init
{
  return -[NSUbiquitousKeyValueStore initWithBundleIdentifier:](self, "initWithBundleIdentifier:", 0);
}

- (NSUbiquitousKeyValueStore)initWithBundleIdentifier:(id)a3
{
  return -[NSUbiquitousKeyValueStore initWithBundleIdentifier:storeIdentifier:](self, "initWithBundleIdentifier:storeIdentifier:", a3, 0);
}

- (NSUbiquitousKeyValueStore)initWithBundleIdentifier:(id)a3 storeIdentifier:(id)a4
{
  return -[NSUbiquitousKeyValueStore initWithBundleIdentifier:storeIdentifier:additionalStore:](self, "initWithBundleIdentifier:storeIdentifier:additionalStore:", a3, a4, 0);
}

void __58__NSUbiquitousKeyValueStore_initWithStoreIdentifier_type___block_invoke()
{
  char *v0;

  if (dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/SyncedDefaults.framework/SyncedDefaults"), "fileSystemRepresentation"), 256))
  {
    qword_1ECD0A838 = (uint64_t)objc_lookUpClass("SYDClientToDaemonConnection");
  }
  else
  {
    v0 = dlerror();
    NSLog((NSString *)CFSTR("NSUbiquitousKeyValueStore is unavailable: %s."), v0);
  }
}

- (BOOL)synchronize
{
  return -[SYDClientToDaemonConnection synchronize](self->_source, "synchronize") != 0;
}

+ (NSUbiquitousKeyValueStore)defaultStore
{
  if (_MergedGlobals_151 != -1)
    dispatch_once(&_MergedGlobals_151, &__block_literal_global_82);
  return (NSUbiquitousKeyValueStore *)qword_1ECD0A830;
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)-[SYDClientToDaemonConnection dictionaryRepresentation](self->_source, "dictionaryRepresentation");
}

- (NSArray)arrayForKey:(NSString *)aKey
{
  NSArray *result;
  NSArray *v4;

  result = -[NSUbiquitousKeyValueStore objectForKey:](self, "objectForKey:", aKey);
  if (result)
  {
    v4 = result;
    if (_NSIsNSArray())
      return v4;
    else
      return 0;
  }
  return result;
}

- (NSDictionary)dictionaryForKey:(NSString *)aKey
{
  NSDictionary *result;
  NSDictionary *v4;

  result = -[NSUbiquitousKeyValueStore objectForKey:](self, "objectForKey:", aKey);
  if (result)
  {
    v4 = result;
    if (_NSIsNSDictionary())
      return v4;
    else
      return 0;
  }
  return result;
}

- (BOOL)BOOLForKey:(NSString *)aKey
{
  id v3;
  void *v4;
  BOOL v5;
  uint64_t v7;

  v3 = -[NSUbiquitousKeyValueStore objectForKey:](self, "objectForKey:", aKey);
  if (v3)
  {
    v4 = v3;
    if (_NSIsNSString())
    {
      if ((objc_msgSend(v4, "isEqual:", CFSTR("YES")) & 1) != 0)
        return 1;
      v7 = objc_msgSend(v4, "length");
      v5 = 1;
      if (objc_msgSend(v4, "compare:options:range:", CFSTR("YES"), 1, 0, v7))
      {
        v5 = 1;
        if (objc_msgSend(v4, "compare:options:range:", CFSTR("Y"), 1, 0, v7))
          return objc_msgSend(v4, "integerValue") != 0;
      }
      return v5;
    }
    if (_NSIsNSNumber())
      return objc_msgSend(v4, "BOOLValue");
  }
  return 0;
}

- (id)objectForKey:(NSString *)aKey
{
  return (id)-[SYDClientToDaemonConnection objectForKey:](self->_source, "objectForKey:", aKey);
}

- (id)_initWithStoreIdentifier:(id)a3 usingEndToEndEncryption:(BOOL)a4
{
  return -[NSUbiquitousKeyValueStore initWithStoreIdentifier:type:](self, "initWithStoreIdentifier:type:", a3, a4);
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  -[SYDClientToDaemonConnection synchronizationWithCompletionHandler:](self->_source, "synchronizationWithCompletionHandler:", a3);
}

- (void)setObject:(id)anObject forKey:(NSString *)aKey
{
  -[SYDClientToDaemonConnection setObject:forKey:](self->_source, "setObject:forKey:", anObject, aKey);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSUbiquitousKeyValueStore;
  -[NSUbiquitousKeyValueStore dealloc](&v3, sel_dealloc);
}

- (void)removeObjectForKey:(NSString *)aKey
{
  -[SYDClientToDaemonConnection removeObjectForKey:](self->_source, "removeObjectForKey:", aKey);
}

- (void)_sourceDidChangePassthroughNotification:(id)a3
{
  -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSUbiquitousKeyValueStoreDidChangeExternallyNotification"), self, objc_msgSend(a3, "userInfo"));
}

- (unint64_t)maximumKeyCount
{
  return -[SYDClientToDaemonConnection maximumKeyCount](self->_source, "maximumKeyCount");
}

- (unint64_t)maximumKeyLength
{
  return -[SYDClientToDaemonConnection maximumKeyLength](self->_source, "maximumKeyLength");
}

- (unint64_t)maximumDataLengthPerKey
{
  return -[SYDClientToDaemonConnection maximumDataLengthPerKey](self->_source, "maximumDataLengthPerKey");
}

- (unint64_t)maximumTotalDataLength
{
  return -[SYDClientToDaemonConnection maximumTotalDataLength](self->_source, "maximumTotalDataLength");
}

- (id)_remotePreferencesSource
{
  return self->_source;
}

- (NSString)stringForKey:(NSString *)aKey
{
  NSString *v3;

  v3 = -[NSUbiquitousKeyValueStore objectForKey:](self, "objectForKey:", aKey);
  if (v3 && (_NSIsNSString() & 1) == 0)
  {
    if (_NSIsNSNumber())
      return (NSString *)-[NSString stringValue](v3, "stringValue");
    return 0;
  }
  return v3;
}

- (void)setString:(NSString *)aString forKey:(NSString *)aKey
{
  void *v8;

  if (aString && (-[NSString isNSString](aString, "isNSString") & 1) == 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: expected value should be an %s."), _NSMethodExceptionProem((objc_class *)self, a2), "NSString"), 0);
    objc_exception_throw(v8);
  }
  -[NSUbiquitousKeyValueStore setObject:forKey:](self, "setObject:forKey:", aString, aKey);
}

- (void)setArray:(NSArray *)anArray forKey:(NSString *)aKey
{
  void *v8;

  if (anArray && (-[NSArray isNSArray](anArray, "isNSArray") & 1) == 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: expected value should be an %s."), _NSMethodExceptionProem((objc_class *)self, a2), "NSArray"), 0);
    objc_exception_throw(v8);
  }
  -[NSUbiquitousKeyValueStore setObject:forKey:](self, "setObject:forKey:", anArray, aKey);
}

- (void)setDictionary:(NSDictionary *)aDictionary forKey:(NSString *)aKey
{
  void *v8;

  if (aDictionary && (-[NSDictionary isNSDictionary](aDictionary, "isNSDictionary") & 1) == 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: expected value should be an %s."), _NSMethodExceptionProem((objc_class *)self, a2), "NSDictionary"), 0);
    objc_exception_throw(v8);
  }
  -[NSUbiquitousKeyValueStore setObject:forKey:](self, "setObject:forKey:", aDictionary, aKey);
}

- (NSData)dataForKey:(NSString *)aKey
{
  NSData *result;
  NSData *v4;

  result = -[NSUbiquitousKeyValueStore objectForKey:](self, "objectForKey:", aKey);
  if (result)
  {
    v4 = result;
    if (_NSIsNSData())
      return v4;
    else
      return 0;
  }
  return result;
}

- (void)setData:(NSData *)aData forKey:(NSString *)aKey
{
  void *v8;

  if (aData && (-[NSData isNSData](aData, "isNSData") & 1) == 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: expected value should be an %s."), _NSMethodExceptionProem((objc_class *)self, a2), "NSData"), 0);
    objc_exception_throw(v8);
  }
  -[NSUbiquitousKeyValueStore setObject:forKey:](self, "setObject:forKey:", aData, aKey);
}

- (uint64_t)longLongForKey:(NSString *)aKey
{
  uint64_t result;
  void *v4;
  unint64_t v5;
  uint64_t v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  result = -[NSUbiquitousKeyValueStore objectForKey:](self, "objectForKey:", aKey);
  v6[0] = 0;
  if (result)
  {
    v4 = (void *)result;
    if (_NSIsNSString())
    {
      v5 = 0;
      if (_NSScanLongLongFromString(v4, +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"), v6, &v5))return v6[0];
      else
        return 0;
    }
    else if (_NSIsNSNumber())
    {
      return objc_msgSend(v4, "longLongValue");
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)setLongLong:(uint64_t)value forKey:(NSString *)aKey
{
  -[NSUbiquitousKeyValueStore setObject:forKey:](self, "setObject:forKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", value), aKey);
}

- (double)doubleForKey:(NSString *)aKey
{
  id v3;
  void *v4;
  double result;

  v3 = -[NSUbiquitousKeyValueStore objectForKey:](self, "objectForKey:", aKey);
  if (!v3)
    return 0.0;
  v4 = v3;
  if ((_NSIsNSString() & 1) == 0 && !_NSIsNSNumber())
    return 0.0;
  objc_msgSend(v4, "doubleValue");
  return result;
}

- (void)setDouble:(double)value forKey:(NSString *)aKey
{
  -[NSUbiquitousKeyValueStore setObject:forKey:](self, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", value), aKey);
}

- (void)setBool:(BOOL)value forKey:(NSString *)aKey
{
  -[NSUbiquitousKeyValueStore setObject:forKey:](self, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", value), aKey);
}

@end
