@implementation CKDPCSMemoryCacheEntry

- (CKDPCSMemoryCacheEntry)init
{
  const char *v2;
  uint64_t v3;
  CKDPCSMemoryCacheEntry *v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKDPCSMemoryCacheEntry;
  v4 = -[CKDPCSMemoryCacheEntry init](&v7, sel_init);
  if (v4)
  {
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v2, v3);
    v4->_lastAccess = v5;
  }
  return v4;
}

- (id)CKPropertiesDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  void *v22;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], a2, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_pcsData(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_itemID(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v11, (uint64_t)CFSTR("PCSItem=%@"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v13, (uint64_t)v12);

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_lastAccess(self, v15, v16);
  objc_msgSend_stringWithFormat_(v14, v17, (uint64_t)CFSTR("lastAccess=%0.0f"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v20, (uint64_t)v19);

  objc_msgSend_componentsJoinedByString_(v3, v21, (uint64_t)CFSTR(", "));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDPCSMemoryCacheEntry *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (CKDPCSData)pcsData
{
  return self->_pcsData;
}

- (void)setPcsData:(id)a3
{
  objc_storeStrong((id *)&self->_pcsData, a3);
}

- (double)lastAccess
{
  return self->_lastAccess;
}

- (void)setLastAccess:(double)a3
{
  self->_lastAccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pcsData, 0);
}

@end
