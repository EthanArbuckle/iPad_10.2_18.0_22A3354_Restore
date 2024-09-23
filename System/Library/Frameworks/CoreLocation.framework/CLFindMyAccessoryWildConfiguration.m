@implementation CLFindMyAccessoryWildConfiguration

- (CLFindMyAccessoryWildConfiguration)init
{
  uint64_t v2;

  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2);
  return 0;
}

- (CLFindMyAccessoryWildConfiguration)initWithDesiredNextKeyRollDate:(id)a3 keyRollInterval:(unsigned int)a4 keysRemainingInWildPeriod:(unsigned __int16)a5 wildPeriodKeyCount:(unsigned __int16)a6
{
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CLFindMyAccessoryWildConfiguration *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLFindMyAccessoryWildConfiguration;
  v13 = -[CLFindMyAccessoryWildConfiguration init](&v15, sel_init);
  if (v13)
  {
    v13->_desiredKeyRollDate = (NSDate *)objc_msgSend_copy(a3, v10, v11, v12);
    v13->_keyRollInterval = a4;
    v13->_keysRemaining = a5;
    v13->_keyCount = a6;
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFindMyAccessoryWildConfiguration;
  -[CLFindMyAccessoryWildConfiguration dealloc](&v3, sel_dealloc);
}

- (id)encodeConfiguration
{
  uint64_t v2;
  uint64_t v3;
  NSDate *desiredKeyRollDate;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  double v10;
  unint64_t v11;
  int v12;
  int keysRemaining;
  BOOL v14;
  unsigned int v16;
  __int16 v17;
  unsigned __int16 keyCount;

  desiredKeyRollDate = self->_desiredKeyRollDate;
  v6 = objc_msgSend_date(MEMORY[0x1E0C99D68], a2, v2, v3);
  objc_msgSend_timeIntervalSinceDate_(desiredKeyRollDate, v7, v6, v8);
  if (v10 <= 0.0)
  {
    LODWORD(v11) = self->_keyRollInterval;
    v10 = v10 + (double)v11;
    keysRemaining = self->_keysRemaining;
    v14 = keysRemaining != 0;
    v12 = keysRemaining - 1;
    if (v12 == 0 || !v14)
      LOWORD(v12) = self->_keyCount;
    self->_keysRemaining = v12;
  }
  else
  {
    LOWORD(v12) = self->_keysRemaining;
  }
  v16 = (v10 * 1000.0);
  v17 = v12;
  keyCount = self->_keyCount;
  return (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v9, (uint64_t)&v16, 8);
}

- (id)description
{
  uint64_t v2;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("CLFindMyAccessoryWildConfiguration <%p> DesiredKeyRollDate:%@ KeyRollInterval:%u KeysRemaining:%hu KeyCount:%hu"), v2, self, self->_desiredKeyRollDate, self->_keyRollInterval, self->_keysRemaining, self->_keyCount);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLFindMyAccessoryWildConfiguration)initWithCoder:(id)a3
{
  CLFindMyAccessoryWildConfiguration *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLFindMyAccessoryWildConfiguration;
  v4 = -[CLFindMyAccessoryWildConfiguration init](&v14, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_desiredKeyRollDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCLFindMyAccessoryWildConfigurationRollDate"));
    v4->_keyRollInterval = objc_msgSend_decodeIntForKey_(a3, v7, (uint64_t)CFSTR("kCLFindMyAccessoryWildConfigurationKeyRollInterval"), v8);
    v4->_keysRemaining = objc_msgSend_decodeIntForKey_(a3, v9, (uint64_t)CFSTR("kCLFindMyAccessoryWildConfigurationKeysRemaining"), v10);
    v4->_keyCount = objc_msgSend_decodeIntForKey_(a3, v11, (uint64_t)CFSTR("kCLFindMyAccessoryWildConfigurationKeyCount"), v12);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  const char *v6;
  const char *v7;

  objc_msgSend_encodeInt_forKey_(a3, a2, self->_keyCount, (uint64_t)CFSTR("kCLFindMyAccessoryWildConfigurationKeyCount"));
  objc_msgSend_encodeInt_forKey_(a3, v5, self->_keysRemaining, (uint64_t)CFSTR("kCLFindMyAccessoryWildConfigurationKeysRemaining"));
  objc_msgSend_encodeInt_forKey_(a3, v6, self->_keyRollInterval, (uint64_t)CFSTR("kCLFindMyAccessoryWildConfigurationKeyRollInterval"));
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->_desiredKeyRollDate, (uint64_t)CFSTR("kCLFindMyAccessoryWildConfigurationRollDate"));
}

- (NSDate)desiredKeyRollDate
{
  return self->_desiredKeyRollDate;
}

- (unsigned)keyRollInterval
{
  return self->_keyRollInterval;
}

- (unsigned)keysRemaining
{
  return self->_keysRemaining;
}

- (unsigned)keyCount
{
  return self->_keyCount;
}

@end
