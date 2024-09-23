@implementation MBBackgroundRestoreInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MBBackgroundRestoreInfo *v4;

  v4 = objc_alloc_init(MBBackgroundRestoreInfo);
  -[MBBackgroundRestoreInfo setBytesRemaining:](v4, "setBytesRemaining:", self->_bytesRemaining);
  -[MBBackgroundRestoreInfo setDataClassesRemaining:](v4, "setDataClassesRemaining:", self->_dataClassesRemaining);
  -[MBBackgroundRestoreInfo setFailedDomains:](v4, "setFailedDomains:", self->_failedDomains);
  return v4;
}

- (MBBackgroundRestoreInfo)initWithCoder:(id)a3
{
  MBBackgroundRestoreInfo *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MBBackgroundRestoreInfo;
  v4 = -[MBBackgroundRestoreInfo init](&v8, sel_init);
  if (v4)
  {
    v4->_bytesRemaining = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("bytesRemaining"));
    v4->_dataClassesRemaining = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("dataClassesRemaining"));
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v4->_failedDomains = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("failedDomains"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_bytesRemaining, CFSTR("bytesRemaining"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_dataClassesRemaining, CFSTR("dataClassesRemaining"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_failedDomains, CFSTR("failedDomains"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBBackgroundRestoreInfo;
  -[MBBackgroundRestoreInfo dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bytesRemaining:%llu, dataClassesRemaining:0x%x, failedDomains:%@"), self->_bytesRemaining, self->_dataClassesRemaining, self->_failedDomains);
}

- (int)dataClassesRemaining
{
  return self->_dataClassesRemaining;
}

- (void)setDataClassesRemaining:(int)a3
{
  self->_dataClassesRemaining = a3;
}

- (unint64_t)bytesRemaining
{
  return self->_bytesRemaining;
}

- (void)setBytesRemaining:(unint64_t)a3
{
  self->_bytesRemaining = a3;
}

- (NSArray)failedDomains
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFailedDomains:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)recentATCErrors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRecentATCErrors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)perClassItemsRemaining
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPerClassItemsRemaining:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)airTrafficDidFinishRestore
{
  return self->_airTrafficDidFinishRestore;
}

- (void)setAirTrafficDidFinishRestore:(BOOL)a3
{
  self->_airTrafficDidFinishRestore = a3;
}

- (BOOL)appDataDidFinishRestore
{
  return self->_appDataDidFinishRestore;
}

- (void)setAppDataDidFinishRestore:(BOOL)a3
{
  self->_appDataDidFinishRestore = a3;
}

@end
