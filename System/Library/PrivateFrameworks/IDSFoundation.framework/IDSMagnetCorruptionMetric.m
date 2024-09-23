@implementation IDSMagnetCorruptionMetric

- (NSString)name
{
  return (NSString *)CFSTR("MagnetCorruption");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  uint64_t Corruption;
  const char *v9;
  double v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  const char *v25;
  double v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  const char *v33;
  double v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  const char *v41;
  double v42;
  void *v43;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  Corruption = objc_msgSend_correctFramesSinceLastCorruption(self, v5, v6, v7);
  objc_msgSend_numberWithUnsignedLongLong_(v4, v9, Corruption, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("correctFramesSinceLastCorruption"), v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend_correctRawBytesSinceLastCorruption(self, v13, v14, v15);
  objc_msgSend_numberWithUnsignedLongLong_(v12, v17, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    CFDictionarySetValue(v3, CFSTR("correctRawBytesSinceLastCorruption"), v19);

  v20 = (void *)MEMORY[0x1E0CB37E8];
  v24 = objc_msgSend_discardedRawBytes(self, v21, v22, v23);
  objc_msgSend_numberWithUnsignedLongLong_(v20, v25, v24, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    CFDictionarySetValue(v3, CFSTR("discardedRawBytes"), v27);

  v28 = (void *)MEMORY[0x1E0CB37E8];
  v32 = objc_msgSend_recoveryTimeInMs(self, v29, v30, v31);
  objc_msgSend_numberWithUnsignedLongLong_(v28, v33, v32, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    CFDictionarySetValue(v3, CFSTR("recoveryTimeInMs"), v35);

  v36 = (void *)MEMORY[0x1E0CB37E8];
  v40 = objc_msgSend_linkType(self, v37, v38, v39);
  objc_msgSend_numberWithUnsignedLongLong_(v36, v41, v40, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
    CFDictionarySetValue(v3, CFSTR("linkType"), v43);

  return (NSDictionary *)v3;
}

- (IDSMagnetCorruptionMetric)initWithCorrectFramesSinceLastCorruption:(unint64_t)a3 correctRawBytesSinceLastCorruption:(unint64_t)a4 discardedRawBytes:(unint64_t)a5 recoveryTimeInMs:(unint64_t)a6 linkType:(unint64_t)a7
{
  IDSMagnetCorruptionMetric *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IDSMagnetCorruptionMetric;
  result = -[IDSMagnetCorruptionMetric init](&v13, sel_init);
  if (result)
  {
    result->_correctFramesSinceLastCorruption = a3;
    result->_correctRawBytesSinceLastCorruption = a4;
    result->_discardedRawBytes = a5;
    result->_recoveryTimeInMs = a6;
    result->_linkType = a7;
  }
  return result;
}

- (unint64_t)correctFramesSinceLastCorruption
{
  return self->_correctFramesSinceLastCorruption;
}

- (unint64_t)correctRawBytesSinceLastCorruption
{
  return self->_correctRawBytesSinceLastCorruption;
}

- (unint64_t)discardedRawBytes
{
  return self->_discardedRawBytes;
}

- (unint64_t)recoveryTimeInMs
{
  return self->_recoveryTimeInMs;
}

- (unint64_t)linkType
{
  return self->_linkType;
}

@end
