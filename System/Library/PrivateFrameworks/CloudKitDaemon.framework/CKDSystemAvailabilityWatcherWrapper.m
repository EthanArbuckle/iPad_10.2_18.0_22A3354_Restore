@implementation CKDSystemAvailabilityWatcherWrapper

- (CKDSystemAvailabilityWatcherWrapper)initWithDelegate:(id)a3
{
  id v4;
  CKDSystemAvailabilityWatcherWrapper *v5;
  CKDSystemAvailabilityWatcherWrapper *v6;
  uint64_t v7;
  NSString *personaID;
  const char *v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKDSystemAvailabilityWatcherWrapper;
  v5 = -[CKDSystemAvailabilityWatcherWrapper init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    CKCurrentPersonaID();
    v7 = objc_claimAutoreleasedReturnValue();
    personaID = v6->_personaID;
    v6->_personaID = (NSString *)v7;

    v6->_savedDelegateHash = objc_msgSend_hash(v4, v9, v10);
  }

  return v6;
}

- (void)postSystemAvailabilityChanged:(unint64_t)a3
{
  char *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  char v9;
  char *v10;

  objc_msgSend_delegate(self, a2, a3);
  v5 = (char *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v10 = v5;
    objc_msgSend_personaID(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CKAdoptPersonaID(v7);

    v5 = v10;
    if (v8)
    {
      v9 = objc_msgSend_systemAvailabilityChanged_(v10, v10, a3);
      v5 = v10;
      if ((v9 & 1) == 0)
      {
        objc_msgSend_setDelegate_(self, v10, 0);
        v5 = v10;
      }
    }
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  objc_msgSend_delegate(self, v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend_delegate(v4, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9 == v10;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return self->_savedDelegateHash;
}

- (id)description
{
  uint64_t v2;
  void *v3;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  const char *v11;
  void *v12;

  objc_msgSend_delegate(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v6;
  if (v3)
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v4, v11, (uint64_t)CFSTR("%@: <%@: %p>"), v8, v10, v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_stringWithFormat_(v4, v7, (uint64_t)CFSTR("%@: <Watcher deallocated>"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (CKDSystemAvailabilityWatcher)delegate
{
  return (CKDSystemAvailabilityWatcher *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)savedDelegateHash
{
  return self->_savedDelegateHash;
}

- (void)setSavedDelegateHash:(unint64_t)a3
{
  self->_savedDelegateHash = a3;
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
