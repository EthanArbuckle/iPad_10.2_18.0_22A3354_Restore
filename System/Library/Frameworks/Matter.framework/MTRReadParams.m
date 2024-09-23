@implementation MTRReadParams

- (MTRReadParams)init
{
  MTRReadParams *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTRReadParams;
  result = -[MTRReadParams init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_filterByFabric = 257;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  uint64_t shouldFilterByFabric;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t shouldAssumeUnknownAttributesReportable;
  const char *v16;

  v4 = objc_alloc_init(MTRReadParams);
  shouldFilterByFabric = objc_msgSend_shouldFilterByFabric(self, v5, v6);
  objc_msgSend_setFilterByFabric_(v4, v8, shouldFilterByFabric);
  objc_msgSend_minEventNumber(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMinEventNumber_(v4, v12, (uint64_t)v11);

  shouldAssumeUnknownAttributesReportable = objc_msgSend_shouldAssumeUnknownAttributesReportable(self, v13, v14);
  objc_msgSend_setAssumeUnknownAttributesReportable_(v4, v16, shouldAssumeUnknownAttributesReportable);
  return v4;
}

- (void)toReadPrepareParams:(void *)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  *((_BYTE *)a3 + 113) = objc_msgSend_shouldFilterByFabric(self, a2, (uint64_t)a3);
  objc_msgSend_minEventNumber(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_minEventNumber(self, v8, v9);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_unsignedLongLongValue(v13, v10, v11);
    *((_BYTE *)a3 + 88) = 1;
    *((_QWORD *)a3 + 12) = v12;

  }
}

- (BOOL)shouldFilterByFabric
{
  return self->_filterByFabric;
}

- (void)setFilterByFabric:(BOOL)filterByFabric
{
  self->_filterByFabric = filterByFabric;
}

- (NSNumber)minEventNumber
{
  return self->_minEventNumber;
}

- (void)setMinEventNumber:(NSNumber *)minEventNumber
{
  objc_setProperty_nonatomic_copy(self, a2, minEventNumber, 16);
}

- (BOOL)shouldAssumeUnknownAttributesReportable
{
  return self->_assumeUnknownAttributesReportable;
}

- (void)setAssumeUnknownAttributesReportable:(BOOL)a3
{
  self->_assumeUnknownAttributesReportable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minEventNumber, 0);
}

- (void)setFabricFiltered:(NSNumber *)fabricFiltered
{
  NSNumber *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSNumber *v9;

  v4 = fabricFiltered;
  v9 = v4;
  if (v4)
  {
    v7 = objc_msgSend_BOOLValue(v4, v5, v6);
    objc_msgSend_setFilterByFabric_(self, v8, v7);
  }
  else
  {
    objc_msgSend_setFilterByFabric_(self, v5, 1);
  }

}

- (NSNumber)fabricFiltered
{
  uint64_t v2;
  void *v3;
  uint64_t shouldFilterByFabric;
  const char *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  shouldFilterByFabric = objc_msgSend_shouldFilterByFabric(self, a2, v2);
  return (NSNumber *)objc_msgSend_numberWithBool_(v3, v5, shouldFilterByFabric);
}

@end
