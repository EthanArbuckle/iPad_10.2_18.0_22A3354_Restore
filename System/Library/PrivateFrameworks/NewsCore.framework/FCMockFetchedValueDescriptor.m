@implementation FCMockFetchedValueDescriptor

- (FCMockFetchedValueDescriptor)init
{
  return -[FCMockFetchedValueDescriptor initWithInputManagers:](self, "initWithInputManagers:", MEMORY[0x1E0C9AA60]);
}

- (FCMockFetchedValueDescriptor)initWithInputManagers:(id)a3
{
  id v4;
  FCMockFetchedValueDescriptor *v5;
  uint64_t v6;
  NSArray *myInputManagers;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "inputManagers");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCMockFetchedValueDescriptor initWithInputManagers:]";
    v13 = 2080;
    v14 = "FCMockFetchedValueDescriptor.m";
    v15 = 1024;
    v16 = 30;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10.receiver = self;
  v10.super_class = (Class)FCMockFetchedValueDescriptor;
  v5 = -[FCFetchedValueDescriptor init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    myInputManagers = v5->_myInputManagers;
    v5->_myInputManagers = (NSArray *)v6;

  }
  return v5;
}

- (void)markDirty
{
  id v3;

  -[FCFetchedValueDescriptor observer](self, "observer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchedValueDescriptorValueIsDirty:", self);

}

- (void)fetchValueWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  void (**v8)(id, id, void *);
  void *v9;
  void (**v10)(void);
  void *v11;
  id v12;

  v8 = (void (**)(id, id, void *))a5;
  -[FCMockFetchedValueDescriptor willFetchBlock](self, "willFetchBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[FCMockFetchedValueDescriptor willFetchBlock](self, "willFetchBlock");
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v10[2]();

  }
  -[FCMockFetchedValueDescriptor setWillFetchCount:](self, "setWillFetchCount:", -[FCMockFetchedValueDescriptor willFetchCount](self, "willFetchCount") + 1);
  -[FCMockFetchedValueDescriptor fetchValue](self, "fetchValue");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[FCMockFetchedValueDescriptor fetchError](self, "fetchError");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCMockFetchedValueDescriptor setLastFetchCachePolicy:](self, "setLastFetchCachePolicy:", a3);
  -[FCMockFetchedValueDescriptor setLastFetchQualityOfService:](self, "setLastFetchQualityOfService:", a4);
  v8[2](v8, v12, v11);

}

- (BOOL)isValue:(id)a3 equalToValue:(id)a4
{
  id v6;
  id v7;
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD);
  char v9;

  v6 = a4;
  v7 = a3;
  -[FCMockFetchedValueDescriptor valueEqualityTest](self, "valueEqualityTest");
  v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v9 = ((uint64_t (**)(_QWORD, id, id))v8)[2](v8, v7, v6);

  return v9;
}

- (id)willFetchBlock
{
  return self->_willFetchBlock;
}

- (void)setWillFetchBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NFCopying)fetchValue
{
  return self->_fetchValue;
}

- (void)setFetchValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (void)setFetchError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NFCopying)fastCachedValue
{
  return self->_fastCachedValue;
}

- (void)setFastCachedValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)valueEqualityTest
{
  return self->_valueEqualityTest;
}

- (void)setValueEqualityTest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)willFetchCount
{
  return self->_willFetchCount;
}

- (void)setWillFetchCount:(unint64_t)a3
{
  self->_willFetchCount = a3;
}

- (int64_t)lastFetchQualityOfService
{
  return self->_lastFetchQualityOfService;
}

- (void)setLastFetchQualityOfService:(int64_t)a3
{
  self->_lastFetchQualityOfService = a3;
}

- (unint64_t)lastFetchCachePolicy
{
  return self->_lastFetchCachePolicy;
}

- (void)setLastFetchCachePolicy:(unint64_t)a3
{
  self->_lastFetchCachePolicy = a3;
}

- (NSArray)myInputManagers
{
  return self->_myInputManagers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myInputManagers, 0);
  objc_storeStrong(&self->_valueEqualityTest, 0);
  objc_storeStrong((id *)&self->_fastCachedValue, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_fetchValue, 0);
  objc_storeStrong(&self->_willFetchBlock, 0);
}

@end
