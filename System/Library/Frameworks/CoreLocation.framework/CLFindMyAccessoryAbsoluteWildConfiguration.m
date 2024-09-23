@implementation CLFindMyAccessoryAbsoluteWildConfiguration

- (CLFindMyAccessoryAbsoluteWildConfiguration)init
{
  uint64_t v2;

  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2);
  return 0;
}

- (CLFindMyAccessoryAbsoluteWildConfiguration)initWithDesiredNextKeyRollDate:(id)a3 nextWildIndex:(unsigned int)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CLFindMyAccessoryAbsoluteWildConfiguration *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLFindMyAccessoryAbsoluteWildConfiguration;
  v9 = -[CLFindMyAccessoryAbsoluteWildConfiguration init](&v11, sel_init);
  if (v9)
  {
    v9->_desiredKeyRollDate = (NSDate *)objc_msgSend_copy(a3, v6, v7, v8);
    v9->_nextWildIndex = a4;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFindMyAccessoryAbsoluteWildConfiguration;
  -[CLFindMyAccessoryAbsoluteWildConfiguration dealloc](&v3, sel_dealloc);
}

- (id)encodeConfiguration
{
  uint64_t v2;
  uint64_t v3;
  NSDate *desiredKeyRollDate;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  double v9;
  unsigned int nextWildIndex;
  const char *v11;
  _DWORD v13[2];

  desiredKeyRollDate = self->_desiredKeyRollDate;
  v6 = objc_msgSend_date(MEMORY[0x1E0C99D68], a2, v2, v3);
  objc_msgSend_timeIntervalSinceDate_(desiredKeyRollDate, v7, v6, v8);
  nextWildIndex = self->_nextWildIndex;
  v13[0] = (v9 * 1000.0);
  v13[1] = nextWildIndex;
  return (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v11, (uint64_t)v13, 8);
}

- (id)description
{
  uint64_t v2;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("CLFindMyAccessoryAbsoluteWildConfiguration <%p> DesiredKeyRollDate:%@ NextWildKeyIndex: %u"), v2, self, self->_desiredKeyRollDate, self->_nextWildIndex);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLFindMyAccessoryAbsoluteWildConfiguration)initWithCoder:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = objc_opt_class();
  v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCLFindMyAccessoryWildConfigurationRollDate"));
  v10 = objc_msgSend_decodeIntForKey_(a3, v8, (uint64_t)CFSTR("kCLFindMyAccessoryWildConfigurationNextWildKeyIndex"), v9);
  return (CLFindMyAccessoryAbsoluteWildConfiguration *)MEMORY[0x1E0DE7D20](self, sel_initWithDesiredNextKeyRollDate_nextWildIndex_, v7, v10);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_desiredKeyRollDate, (uint64_t)CFSTR("kCLFindMyAccessoryWildConfigurationRollDate"));
  objc_msgSend_encodeInt_forKey_(a3, v5, self->_nextWildIndex, (uint64_t)CFSTR("kCLFindMyAccessoryWildConfigurationNextWildKeyIndex"));
}

- (NSDate)desiredKeyRollDate
{
  return self->_desiredKeyRollDate;
}

- (unsigned)nextWildIndex
{
  return self->_nextWildIndex;
}

@end
