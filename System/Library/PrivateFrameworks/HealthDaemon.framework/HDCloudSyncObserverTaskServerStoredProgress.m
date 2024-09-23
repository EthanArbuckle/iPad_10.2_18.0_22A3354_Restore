@implementation HDCloudSyncObserverTaskServerStoredProgress

- (HDCloudSyncObserverTaskServerStoredProgress)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDCloudSyncObserverTaskServerStoredProgress)initWithProgress:(id)a3
{
  id v5;
  HDCloudSyncObserverTaskServerStoredProgress *v6;
  HDCloudSyncObserverTaskServerStoredProgress *v7;
  id invalidationBlock;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDCloudSyncObserverTaskServerStoredProgress;
  v6 = -[HDCloudSyncObserverTaskServerStoredProgress init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_progress, a3);
    invalidationBlock = v7->_invalidationBlock;
    v7->_invalidationBlock = 0;

  }
  return v7;
}

- (void)invalidate
{
  void *v3;
  void (**v4)(void);

  -[HDCloudSyncObserverTaskServerStoredProgress invalidationBlock](self, "invalidationBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HDCloudSyncObserverTaskServerStoredProgress invalidationBlock](self, "invalidationBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (id)invalidationBlock
{
  return self->_invalidationBlock;
}

- (void)setInvalidationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
