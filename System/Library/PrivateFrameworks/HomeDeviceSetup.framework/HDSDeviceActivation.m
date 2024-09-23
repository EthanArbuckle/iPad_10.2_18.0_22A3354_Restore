@implementation HDSDeviceActivation

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__HDSDeviceActivation_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_154 != -1)
    dispatch_once(&signpostLog_onceToken_154, block);
  return (OS_os_log *)(id)signpostLog_log_153;
}

void __34__HDSDeviceActivation_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.HomeDeviceSetup.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_153;
  signpostLog_log_153 = (uint64_t)v1;

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

- (void)_mae_getActivationStateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  unint64_t v11;
  os_signpost_id_t v12;
  void *v13;
  void *v14;
  uint8_t buf[8];
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[HDSDeviceActivation signpostID](self, "signpostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "DeviceActivationStepCheckState", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  v8 = (void *)MAEGetActivationStateWithError();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE66A60]);
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = -[HDSDeviceActivation signpostID](self, "signpostID");
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v10, OS_SIGNPOST_INTERVAL_END, v12, "DeviceActivationStepCheckState", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  v16 = CFSTR("a");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9 ^ 1u);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v14);

}

- (void)performActivationStep:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    v13 = "-[HDSDeviceActivation performActivationStep:completion:]";
    LogPrintF();
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("s"), v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSDeviceActivation.m"), 321, CFSTR("missing activation step"));

  }
  switch(objc_msgSend(v8, "integerValue"))
  {
    case 0:
      -[HDSDeviceActivation _mae_getActivationStateWithCompletion:](self, "_mae_getActivationStateWithCompletion:", v7);
      break;
    case 1:
      -[HDSDeviceActivation _mae_createSessionWithCompletion:](self, "_mae_createSessionWithCompletion:", v7);
      break;
    case 2:
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("d"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSDeviceActivation _mae_createActivationWithData:completion:](self, "_mae_createActivationWithData:completion:", v10, v7);
      goto LABEL_13;
    case 3:
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("d"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("h"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSDeviceActivation _mae_activateWithData:headers:completion:](self, "_mae_activateWithData:headers:completion:", v10, v11, v7);

LABEL_13:
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSDeviceActivation.m"), 341, CFSTR("invalid activation step"));

      break;
  }

}

- (void)_mae_createSessionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__HDSDeviceActivation__mae_createSessionWithCompletion___block_invoke;
  block[3] = &unk_24FCD41B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

void __56__HDSDeviceActivation__mae_createSessionWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  os_signpost_id_t v4;
  char v5;
  id v6;
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  os_signpost_id_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[8];
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "DeviceActivationStepCreateSession", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  v23 = 0;
  v24 = 0;
  v5 = MAECreateSessionRequestWithError();
  v6 = 0;
  v7 = 0;
  if ((v5 & 1) != 0)
  {
    v8 = (objc_class *)MEMORY[0x24BDD1618];
    v9 = v6;
    v10 = (void *)objc_msgSend([v8 alloc], "initRequiringSecureCoding:", 1);
    objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("request"));

    objc_msgSend(v10, "finishEncoding");
    objc_msgSend(v10, "encodedData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = CFSTR("r");
    v27[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (gLogCategory_HDSDeviceActivation <= 40
      && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v12 = 0;
  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v15 = v14;
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v13, OS_SIGNPOST_INTERVAL_END, v15, "DeviceActivationStepCreateSession", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__HDSDeviceActivation__mae_createSessionWithCompletion___block_invoke_163;
  block[3] = &unk_24FCD4E88;
  v16 = *(id *)(a1 + 40);
  v21 = v12;
  v22 = v16;
  v20 = v7;
  v17 = v12;
  v18 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __56__HDSDeviceActivation__mae_createSessionWithCompletion___block_invoke_163(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_mae_createActivationWithData:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dispatch_get_global_queue(25, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__HDSDeviceActivation__mae_createActivationWithData_completion___block_invoke;
  block[3] = &unk_24FCD4EB0;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

void __64__HDSDeviceActivation__mae_createActivationWithData_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  os_signpost_id_t v4;
  char v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  objc_class *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  os_signpost_id_t v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD block[4];
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t buf[16];
  const __CFString *v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "DeviceActivationStepCreateActivation", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  v47 = 0;
  v48 = 0;
  v5 = MAECreateActivationRequestWithError();
  v6 = 0;
  v7 = 0;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "valueForHTTPHeaderField:", CFSTR("User-Agent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("HDSDeviceActivation.m"), 395, CFSTR("missing user-agent header"));

    }
    objc_msgSend(*(id *)(a1 + 32), "_setupUserAgent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(" %@"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forHTTPHeaderField:", v10, CFSTR("User-Agent"));
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forHTTPHeaderField:", v12, CFSTR("Accept-Language"));

    if (IsAppleInternalBuild())
    {
      objc_msgSend(v6, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "absoluteString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "hasSuffix:", CFSTR("/deviceActivation"));

      if (v15)
      {
        v37 = v10;
        v38 = v9;
        objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "dictionaryForKey:", CFSTR("CustomActivationHeaders"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v44 != v21)
                objc_enumerationMutation(v18);
              v23 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
              objc_msgSend(v18, "objectForKeyedSubscript:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setValue:forHTTPHeaderField:", v24, v23);

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          }
          while (v20);
        }

        v10 = v37;
        v9 = v38;
      }
    }
    v25 = (objc_class *)MEMORY[0x24BDD1618];
    v26 = v6;
    v27 = (void *)objc_msgSend([v25 alloc], "initRequiringSecureCoding:", 1);
    objc_msgSend(v27, "encodeObject:forKey:", v26, CFSTR("request"));

    objc_msgSend(v27, "finishEncoding");
    objc_msgSend(v27, "encodedData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = CFSTR("r");
    v51 = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (gLogCategory_HDSDeviceActivation <= 40
      && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v29 = 0;
  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v32 = v31;
    if (os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v30, OS_SIGNPOST_INTERVAL_END, v32, "DeviceActivationStepCreateActivation", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__HDSDeviceActivation__mae_createActivationWithData_completion___block_invoke_179;
  block[3] = &unk_24FCD4E88;
  v33 = *(id *)(a1 + 48);
  v41 = v29;
  v42 = v33;
  v40 = v7;
  v34 = v29;
  v35 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __64__HDSDeviceActivation__mae_createActivationWithData_completion___block_invoke_179(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_mae_activateWithData:(id)a3 headers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  HDSDeviceActivation *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__HDSDeviceActivation__mae_activateWithData_headers_completion___block_invoke;
  block[3] = &unk_24FCD4ED8;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, block);

}

void __64__HDSDeviceActivation__mae_activateWithData_headers_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  os_signpost_id_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  os_signpost_id_t v13;
  uint8_t buf[8];
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v17 = *MEMORY[0x24BE66A68];
    v18[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "DeviceActivationStepActivate", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  v7 = MAEActivateDeviceWithError();
  v8 = 0;
  v15 = CFSTR("a");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v11, OS_SIGNPOST_INTERVAL_END, v13, "DeviceActivationStepActivate", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (id)_setupUserAgent
{
  if (_setupUserAgent_onceToken != -1)
    dispatch_once(&_setupUserAgent_onceToken, &__block_literal_global_5);
  return (id)_setupUserAgent___userAgent;
}

void __38__HDSDeviceActivation__setupUserAgent__block_invoke()
{
  __CFString *v0;
  __CFString *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;

  v5 = (__CFString *)MGCopyAnswer();
  v0 = (__CFString *)MGCopyAnswer();
  v1 = (__CFString *)MGCopyAnswer();
  if (!-[__CFString length](v5, "length"))
  {

    v5 = CFSTR("1.0");
  }
  if (!-[__CFString length](v0, "length"))
  {

    v0 = CFSTR("1A001a");
  }
  if (!-[__CFString length](v1, "length"))
  {

    v1 = &stru_24FCD5B38;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("iOS %@ %@ %@ Setup Assistant"), v5, v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)_setupUserAgent___userAgent;
  _setupUserAgent___userAgent = v3;

  if (gLogCategory_HDSDeviceActivation <= 40
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

@end
