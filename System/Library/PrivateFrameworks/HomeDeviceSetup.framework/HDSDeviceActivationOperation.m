@implementation HDSDeviceActivationOperation

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__HDSDeviceActivationOperation_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_1 != -1)
    dispatch_once(&signpostLog_onceToken_1, block);
  return (OS_os_log *)(id)signpostLog_log_1;
}

void __43__HDSDeviceActivationOperation_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.HomeDeviceSetup.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_1;
  signpostLog_log_1 = (uint64_t)v1;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__HDSDeviceActivationOperation_activate__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __40__HDSDeviceActivationOperation_activate__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  if (gLogCategory_HDSDeviceActivation <= 40
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = mach_absolute_time();
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__HDSDeviceActivationOperation_activate__block_invoke_2;
  v4[3] = &unk_24FCD4D98;
  v4[4] = v2;
  return objc_msgSend(v2, "_checkActivationStateWithCompletion:", v4);
}

void __40__HDSDeviceActivationOperation_activate__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];

  v5 = a2;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 == (void *)*MEMORY[0x24BDD1100])
    {
      v12 = objc_msgSend(v6, "code");

      if (v12 == -6732)
      {
        v9 = *(void **)(a1 + 32);
        v10 = 3;
LABEL_9:
        v11 = v6;
        goto LABEL_10;
      }
    }
    else
    {

    }
    v9 = *(void **)(a1 + 32);
    v10 = 1;
    goto LABEL_9;
  }
  v9 = *(void **)(a1 + 32);
  if (!a3)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __40__HDSDeviceActivationOperation_activate__block_invoke_3;
    v13[3] = &unk_24FCD4D98;
    v13[4] = v9;
    objc_msgSend(v9, "_performActivationWithCompletion:", v13);
    goto LABEL_11;
  }
  v10 = 2;
  v11 = 0;
LABEL_10:
  objc_msgSend(v9, "_finishWithResult:error:", v10, v11);
LABEL_11:

}

uint64_t __40__HDSDeviceActivationOperation_activate__block_invoke_3(uint64_t a1, uint64_t a2, int a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  if (a3)
  {
    v4 = 0;
    v5 = 0;
  }
  else
  {
    v4 = 1;
    v5 = a2;
  }
  return objc_msgSend(v3, "_finishWithResult:error:", v4, v5);
}

- (void)_finishWithResult:(int64_t)a3 error:(id)a4
{
  uint64_t v6;
  double v7;
  id completionHandler;
  id v9;

  v9 = a4;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  mach_absolute_time();
  UpTicksToSecondsF();
  self->_metricTotalSeconds = v7;
  if (gLogCategory_HDSDeviceActivation <= 40
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  (*((void (**)(id, id, int64_t, uint64_t))self->_completionHandler + 2))(self->_completionHandler, v9, a3, v6);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

}

- (void)_checkActivationStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  id v8;
  SFSession *sfSession;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[HDSDeviceActivationOperation signpostID](self, "signpostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "DeviceActivationStepCheckState", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24FCE3E90, CFSTR("s"));
  sfSession = self->_sfSession;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__HDSDeviceActivationOperation__checkActivationStateWithCompletion___block_invoke;
  v11[3] = &unk_24FCD4DC0;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_dA"), &unk_24FCE3BB0, v8, v11);

}

void __68__HDSDeviceActivationOperation__checkActivationStateWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v6 = a4;
  v7 = a2;
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_END, v10, "DeviceActivationStepCheckState", (const char *)&unk_22F7B8AEE, v11, 2u);
    }
  }

  CFDictionaryGetInt64();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_performActivationWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke;
  v6[3] = &unk_24FCD4E38;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDSDeviceActivationOperation _beginActivationWithCompletion:](self, "_beginActivationWithCompletion:", v6);

}

void __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v5, 0);
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("request"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke_2;
    v10[3] = &unk_24FCD4E10;
    v8 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    objc_msgSend(v8, "_sendActivationURLRequest:retries:completion:", v7, 2, v10);

  }
}

void __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke_3;
    v7[3] = &unk_24FCD4E38;
    v5 = *(void **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v6;
    objc_msgSend(v5, "_continueActivationWithSessionData:completion:", a3, v7);

  }
}

void __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v5, 0);
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("request"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke_4;
    v10[3] = &unk_24FCD4E10;
    v8 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    objc_msgSend(v8, "_sendActivationURLRequest:retries:completion:", v7, 2, v10);

  }
}

void __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  _QWORD v7[4];
  id v8;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke_5;
    v7[3] = &unk_24FCD4DE8;
    v6 = *(void **)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v6, "_finishActivation:responseHeader:completion:", a3, a4, v7);

  }
}

uint64_t __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_beginActivationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  id v8;
  SFSession *sfSession;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[HDSDeviceActivationOperation signpostID](self, "signpostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "DeviceActivationStepCreateSession", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24FCE3EA8, CFSTR("s"));
  sfSession = self->_sfSession;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63__HDSDeviceActivationOperation__beginActivationWithCompletion___block_invoke;
  v11[3] = &unk_24FCD4DC0;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_dA"), &unk_24FCE3BD8, v8, v11);

}

void __63__HDSDeviceActivationOperation__beginActivationWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  void *v11;
  uint8_t v12[16];

  v6 = a4;
  v7 = a2;
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_END, v10, "DeviceActivationStepCreateSession", (const char *)&unk_22F7B8AEE, v12, 2u);
    }
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("r"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_continueActivationWithSessionData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  id v11;
  SFSession *sfSession;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = -[HDSDeviceActivationOperation signpostID](self, "signpostID");
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "DeviceActivationStepCreateActivation", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_24FCE3EC0, CFSTR("s"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, CFSTR("d"));
  sfSession = self->_sfSession;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __78__HDSDeviceActivationOperation__continueActivationWithSessionData_completion___block_invoke;
  v14[3] = &unk_24FCD4DC0;
  v14[4] = self;
  v15 = v7;
  v13 = v7;
  -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_dA"), &unk_24FCE3C00, v11, v14);

}

void __78__HDSDeviceActivationOperation__continueActivationWithSessionData_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  void *v11;
  uint8_t v12[16];

  v6 = a4;
  v7 = a2;
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_END, v10, "DeviceActivationStepCreateActivation", (const char *)&unk_22F7B8AEE, v12, 2u);
    }
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("r"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_finishActivation:(id)a3 responseHeader:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  unint64_t v12;
  os_signpost_id_t v13;
  id v14;
  SFSession *sfSession;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = -[HDSDeviceActivationOperation signpostID](self, "signpostID");
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "DeviceActivationStepActivate", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_24FCE3ED8, CFSTR("s"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, CFSTR("d"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, CFSTR("h"));
  sfSession = self->_sfSession;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __76__HDSDeviceActivationOperation__finishActivation_responseHeader_completion___block_invoke;
  v17[3] = &unk_24FCD4DC0;
  v17[4] = self;
  v18 = v10;
  v16 = v10;
  -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_dA"), &unk_24FCE3C28, v14, v17);

}

void __76__HDSDeviceActivationOperation__finishActivation_responseHeader_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v6 = a4;
  v7 = a2;
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_END, v10, "DeviceActivationStepActivate", (const char *)&unk_22F7B8AEE, v11, 2u);
    }
  }

  CFDictionaryGetInt64();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_sendActivationURLRequest:(id)a3 retries:(int)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  unint64_t v11;
  os_signpost_id_t v12;
  void *v13;
  void *v14;
  CFAbsoluteTime Current;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22[2];
  int v23;
  id buf[2];

  v8 = a3;
  v9 = a5;
  if (gLogCategory_HDSDeviceActivation <= 40
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = -[HDSDeviceActivationOperation signpostID](self, "signpostID");
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v10))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "DeviceActivationServerRequest", (const char *)&unk_22F7B8AEE, (uint8_t *)buf, 2u);
    }
  }

  objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTimeoutIntervalForResource:", 30.0);
  objc_msgSend(v13, "setWaitsForConnectivity:", 1);
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  objc_initWeak(buf, self);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __77__HDSDeviceActivationOperation__sendActivationURLRequest_retries_completion___block_invoke;
  v19[3] = &unk_24FCD4E60;
  v19[4] = self;
  v23 = a4;
  objc_copyWeak(v22, buf);
  v16 = v8;
  v20 = v16;
  v17 = v9;
  v21 = v17;
  v22[1] = *(id *)&Current;
  objc_msgSend(v14, "dataTaskWithRequest:completionHandler:", v16, v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resume");

  objc_destroyWeak(v22);
  objc_destroyWeak(buf);

}

void __77__HDSDeviceActivationOperation__sendActivationURLRequest_retries_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  os_signpost_id_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id WeakRetained;
  uint64_t v26;
  double v27;
  uint8_t buf[8];
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;
  v12 = objc_msgSend(v11, "statusCode");
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v15 = v14;
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v13, OS_SIGNPOST_INTERVAL_END, v15, "DeviceActivationServerRequest", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  if (!v9 && v12 == 200)
  {
    if (gLogCategory_HDSDeviceActivation <= 40
      && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
    {
      v16 = *(_QWORD *)(a1 + 40);
      v27 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
      v26 = v16;
      LogPrintF();
    }
    v21 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v11, "allHeaderFields", v26, *(_QWORD *)&v27);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id, id))(v21 + 16))(v21, 0, v7, v17);
    goto LABEL_34;
  }
  v17 = v9;
  objc_msgSend(v17, "domain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BDD1308]);

  if (v19
    && (v20 = objc_msgSend(v17, "code"), (unint64_t)(v20 + 1005) <= 4)
    && ((1 << (v20 - 19)) & 0x13) != 0)
  {

    if (*(int *)(a1 + 72) >= 1)
    {
      if (gLogCategory_HDSDeviceActivation <= 40
        && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(WeakRetained, "_sendActivationURLRequest:retries:completion:", *(_QWORD *)(a1 + 40), (*(_DWORD *)(a1 + 72) - 1), *(_QWORD *)(a1 + 48));

      goto LABEL_34;
    }
  }
  else
  {

  }
  if (v9)
  {
    if (gLogCategory_HDSDeviceActivation <= 90
      && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_HDSDeviceActivation <= 90
      && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
    {
      v26 = v12;
      LogPrintF();
    }
    v22 = (void *)MEMORY[0x24BDD1540];
    v29 = CFSTR("sc");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12, v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.soundboard.activation"), 0, v24);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(_QWORD, id, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v17, 0, 0);
LABEL_34:

}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
  objc_storeStrong((id *)&self->_sfSession, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)metricTotalSeconds
{
  return self->_metricTotalSeconds;
}

- (void)setMetricTotalSeconds:(double)a3
{
  self->_metricTotalSeconds = a3;
}

- (unint64_t)startTicks
{
  return self->_startTicks;
}

- (void)setStartTicks:(unint64_t)a3
{
  self->_startTicks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
}

@end
