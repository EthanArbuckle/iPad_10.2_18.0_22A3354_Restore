@implementation IDSFeatureToggler

- (IDSFeatureToggler)initWithService:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  IDSFeatureToggler *v10;
  id *p_isa;
  IDSFeatureToggler *v12;
  NSObject *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)IDSFeatureToggler;
    v10 = -[IDSFeatureToggler init](&v15, sel_init);
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_service, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v12 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "FeatureToggler");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      sub_1907FBCE8();

    v12 = 0;
  }

  return v12;
}

- (void)retrieveFeatureToggleStateForOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  void (**v17)(_QWORD, _QWORD);
  _QWORD v18[5];
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1907D1AF4;
    v18[3] = &unk_1E2C64E60;
    v18[4] = self;
    v19 = v7;
    v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x19400FE1C](v18);
    if (v6
      && (objc_msgSend(v6, "featureID"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
    {
      v15[0] = v9;
      v15[1] = 3221225472;
      v15[2] = sub_1907D1BAC;
      v15[3] = &unk_1E2C61EE8;
      v15[4] = self;
      v17 = v10;
      v16 = v6;
      +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", v15);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "FeatureToggler");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1907FBD4C();

      +[IDSFeatureToggleRetrievalResult resultWithError:](IDSFeatureToggleRetrievalResult, "resultWithError:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v10)[2](v10, v13);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "FeatureToggler");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907FBD20();

  }
}

- (void)updateFeatureToggleStateWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  void (**v17)(_QWORD, _QWORD);
  _QWORD v18[5];
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1907D1F4C;
    v18[3] = &unk_1E2C64E88;
    v18[4] = self;
    v19 = v7;
    v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x19400FE1C](v18);
    if (v6
      && (objc_msgSend(v6, "featureID"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
    {
      if (objc_msgSend(v6, "state") == 1 || objc_msgSend(v6, "state") == 2)
      {
        v15[0] = v9;
        v15[1] = 3221225472;
        v15[2] = sub_1907D2004;
        v15[3] = &unk_1E2C61EE8;
        v15[4] = self;
        v17 = v10;
        v16 = v6;
        +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", v15);

LABEL_10:
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0D34D40], "FeatureToggler");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1907FBE3C(v6, v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "FeatureToggler");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1907FBE10();
    }

    +[IDSFeatureToggleUpdateResult resultWithError:](IDSFeatureToggleUpdateResult, "resultWithError:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v13);

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0D34D40], "FeatureToggler");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_1907FBDE4();

LABEL_14:
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
