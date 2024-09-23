@implementation IDSGFTMetricsAnonymizer

- (IDSGFTMetricsAnonymizer)init
{
  IDSGFTMetricsAnonymizer *v2;
  IDSGFTMetricsAnonymizer *v3;
  CFMutableDictionaryRef Mutable;
  NSMutableDictionary *assignedIDs;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IDSGFTMetricsAnonymizer;
  v2 = -[IDSGFTMetricsAnonymizer init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    if (!v2->_assignedIDs)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      assignedIDs = v3->_assignedIDs;
      v3->_assignedIDs = (NSMutableDictionary *)Mutable;

    }
    v3->_nextAnonymizedID = 0;
  }
  return v3;
}

- (id)anonymizeID:(id)a3
{
  __CFString *v4;
  const char *v5;
  double v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  __CFString *v13;
  const char *v14;
  double v15;

  v4 = (__CFString *)a3;
  v7 = v4;
  if (CFSTR("IDSGFTMetricsWildcard") == v4)
  {
    v13 = v4;
    v7 = v13;
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(self->_assignedIDs, v5, (uint64_t)v4, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v12 = (void *)v8;
    }
    else
    {
      if (!v7)
      {
        objc_msgSend_null(MEMORY[0x1E0C99E38], v9, v10, v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v9, self->_nextAnonymizedID, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(self->_assignedIDs, v14, (uint64_t)v12, v15, v7);
      ++self->_nextAnonymizedID;
    }
    v13 = v12;

  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assignedIDs, 0);
}

@end
