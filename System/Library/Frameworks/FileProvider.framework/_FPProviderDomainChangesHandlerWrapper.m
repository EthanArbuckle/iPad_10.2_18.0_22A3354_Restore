@implementation _FPProviderDomainChangesHandlerWrapper

+ (id)wrapperWithHandler:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  v5 = MEMORY[0x1A1B00850](v3);

  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (void)callHandlerWithProvidersByID:(id)a3 error:(id)a4
{
  id v6;
  _FPProviderDomainChangesHandlerWrapper *v7;
  void (**handler)(id, id, id);
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  handler = (void (**)(id, id, id))v7->_handler;
  if (handler)
  {
    v9 = v10;
    if (v6)
      v9 = 0;
    handler[2](handler, v9, v6);
  }
  objc_sync_exit(v7);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

- (void)setUnregistered:(BOOL)a3
{
  void *v5;
  id handler;
  _FPProviderDomainChangesHandlerWrapper *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, obj, CFSTR("FPProviderDomainChangesReceiver.m"), 60, CFSTR("trying to re-register an handler"));

  }
  handler = obj->_handler;
  obj->_handler = 0;

  objc_sync_exit(obj);
}

- (BOOL)isUnregistered
{
  return self->_handler == 0;
}

@end
