@implementation BDSBookWidgetInfoSource

+ (id)sharedServiceProxy
{
  if (qword_253F3C720 != -1)
    dispatch_once(&qword_253F3C720, &unk_24F08A678);
  return (id)qword_253F3C6F0;
}

- (BDSBookWidgetInfoSource)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BDSBookWidgetInfoSource *v6;
  uint64_t v7;
  BDSServiceProtocol *serviceProxy;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BDSBookWidgetInfoSource;
  v6 = -[BDSBookWidgetInfoSource init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend_sharedServiceProxy(BDSBookWidgetInfoSource, v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    serviceProxy = v6->_serviceProxy;
    v6->_serviceProxy = (BDSServiceProtocol *)v7;

  }
  return v6;
}

- (void)getBookWidgetInfoWithLimit:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint8_t v15[16];

  v6 = a4;
  BDSServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_227D4F000, v7, OS_LOG_TYPE_DEFAULT, "BDSBookWidgetInfoSource getBookWidgetDataWithLimit calling remote.", v15, 2u);
  }

  objc_msgSend_serviceProxy(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getBookWidgetInfoWithLimit_completion_(v12, v13, a3, (uint64_t)v6, v14);

}

- (BDSServiceProtocol)serviceProxy
{
  return self->_serviceProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end
