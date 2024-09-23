@implementation LSApplicationIdentityEnumerator

- (LSApplicationIdentityEnumerator)initWithAppEnumerationOptions:(unint64_t)a3
{
  _LSDServiceDomain *v5;
  uint64_t v6;
  _QWORD *v7;
  _LSApplicationRecordEnumerator *v8;
  void *v9;
  void *v10;
  void *v11;
  _LSDServiceDomain *v12;
  uint64_t v13;
  id v14;
  void *v15;
  LSApplicationIdentityEnumerator *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;
  void **CurrentContext;
  id v25;
  char v26;
  id v27;

  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)self);
  v25 = 0;
  v26 = 0;
  v27 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v5 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v6 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v5, 0);

  v23.receiver = self;
  v23.super_class = (Class)LSApplicationIdentityEnumerator;
  v7 = -[LSEnumerator _initWithContext:](&v23, sel__initWithContext_, v6);
  if (v7)
  {
    if (v6)
    {
      v8 = -[_LSApplicationRecordEnumerator initWithContext:volumeURL:options:]([_LSApplicationRecordEnumerator alloc], "initWithContext:volumeURL:options:", v6, 0, a3);
      v9 = (void *)v7[5];
      v7[5] = v8;

      v10 = (void *)v7[7];
      v7[7] = 0;

      objc_initWeak(&location, v7);
      v11 = (void *)v7[5];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __65__LSApplicationIdentityEnumerator_initWithAppEnumerationOptions___block_invoke;
      v20[3] = &unk_1E103FC00;
      objc_copyWeak(&v21, &location);
      objc_msgSend(v11, "setErrorHandler:", v20);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
    else
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v12 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v13 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v12, 0);

      if (v13)
        v14 = 0;
      else
        v14 = v27;
      v15 = (void *)v7[4];
      v7[4] = v14;

    }
  }
  v16 = v7;
  if (CurrentContext && v26)
    _LSContextDestroy(CurrentContext);
  v17 = v25;
  CurrentContext = 0;
  v25 = 0;

  v26 = 0;
  v18 = v27;
  v27 = 0;

  return v16;
}

void __65__LSApplicationIdentityEnumerator_initWithAppEnumerationOptions___block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 *WeakRetained;
  unsigned __int8 *v4;
  id v5;

  v5 = a2;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    _LSEnumeratorFireErrorHandler(WeakRetained, v5);

}

- (id)nextObject
{
  NSError *ctxError;
  NSEnumerator *currentRecordIdentitiesEnumerator;
  void *v5;
  LSApplicationRecord *NextObject;
  LSApplicationRecord *currentRecord;
  void *v8;
  NSEnumerator *v9;
  NSEnumerator *v10;
  uint64_t (**v11)(_QWORD, _QWORD);
  char v12;

  ctxError = self->_ctxError;
  if (ctxError)
  {
    _LSEnumeratorFireErrorHandler((unsigned __int8 *)self, ctxError);
  }
  else
  {
    do
    {
      currentRecordIdentitiesEnumerator = self->_currentRecordIdentitiesEnumerator;
      if (!currentRecordIdentitiesEnumerator
        || (-[NSEnumerator nextObject](currentRecordIdentitiesEnumerator, "nextObject"),
            (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        NextObject = (LSApplicationRecord *)_LSDBEnumeratorGetNextObject((uint64_t)self->_recordEnumerator);
        currentRecord = self->_currentRecord;
        self->_currentRecord = NextObject;

        -[LSApplicationRecord identities](self->_currentRecord, "identities");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectEnumerator");
        v9 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
        v10 = self->_currentRecordIdentitiesEnumerator;
        self->_currentRecordIdentitiesEnumerator = v9;

        -[NSEnumerator nextObject](self->_currentRecordIdentitiesEnumerator, "nextObject");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v5)
          continue;
      }
      -[LSEnumerator filter](self, "filter");
      v11 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v12 = ((uint64_t (**)(_QWORD, void *))v11)[2](v11, v5);

      if ((v12 & 1) != 0)
        return v5;

    }
    while (self->_currentRecord);
  }
  v5 = 0;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRecordIdentitiesEnumerator, 0);
  objc_storeStrong((id *)&self->_currentRecord, 0);
  objc_storeStrong((id *)&self->_recordEnumerator, 0);
  objc_storeStrong((id *)&self->_ctxError, 0);
}

@end
