@implementation FPActionLocatorAccessToken

+ (id)tokenWithBlock:(id)a3
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

- (void)dealloc
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] someone forgot to call -stopAccessing", v1, 2u);
}

- (void)stopAccessing
{
  FPActionLocatorAccessToken *v2;
  void (**stopBlock)(void);
  id v4;
  FPActionLocatorAccessToken *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  stopBlock = (void (**)(void))obj->_stopBlock;
  if (stopBlock)
  {
    stopBlock[2]();
    v4 = obj->_stopBlock;
    obj->_stopBlock = 0;

    v2 = obj;
  }
  objc_sync_exit(v2);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stopBlock, 0);
}

@end
