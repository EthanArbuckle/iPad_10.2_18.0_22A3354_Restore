@implementation BDSBookWidgetDataSource

+ (id)sharedServiceProxy
{
  if (qword_253F3C718 != -1)
    dispatch_once(&qword_253F3C718, &unk_24F08A5A0);
  return (id)qword_253F3C6E8;
}

- (void)getBookWidgetDataWithLimit:(int64_t)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint8_t v35[16];
  uint8_t v36[16];
  uint8_t buf[16];

  v5 = a4;
  BDSWidgetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227D4F000, v6, OS_LOG_TYPE_DEFAULT, "BDSBookWidgetDataSource getBookWidgetDataWithLimit reading file.", buf, 2u);
  }

  objc_msgSend_sharedInstance(BDSBookWidgetDataFile, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_load(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  BDSWidgetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_227D4F000, v17, OS_LOG_TYPE_DEFAULT, "BDSBookWidgetDataSource getBookWidgetDataWithLimit - Using saved data", v35, 2u);
    }

    v23 = objc_msgSend_count(v16, v19, v20, v21, v22);
    if (v23 >= a3)
      objc_msgSend_subarrayWithRange_(v16, v24, 0, a3, v25);
    else
      objc_msgSend_subarrayWithRange_(v16, v24, 0, v23, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = _Block_copy(v5);
    v28 = v27;
    if (v27)
      (*((void (**)(void *, void *, _QWORD))v27 + 2))(v27, v26, 0);

  }
  else
  {
    if (v18)
    {
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_227D4F000, v17, OS_LOG_TYPE_DEFAULT, "BDSBookWidgetDataSource getBookWidgetDataWithLimit - Cannot load saved data, calling remote.", v36, 2u);
    }

    objc_msgSend_sharedServiceProxy(BDSBookWidgetDataSource, v29, v30, v31, v32);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getBookWidgetDataWithLimit_completion_(v26, v33, a3, (uint64_t)v5, v34);
  }

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
