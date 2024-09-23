@implementation CKDCancelToken

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)cancel
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(void);

  self->_isCancelled = 1;
  objc_msgSend_cancelAction(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend_cancelAction(self, v6, v7, v8);
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();

  }
}

- (id)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelAction, 0);
}

@end
