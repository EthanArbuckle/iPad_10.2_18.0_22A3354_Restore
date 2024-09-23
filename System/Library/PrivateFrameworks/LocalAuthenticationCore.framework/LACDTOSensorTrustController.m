@implementation LACDTOSensorTrustController

- (LACDTOSensorTrustController)initWithReplyQueue:(id)a3 ui:(id)a4 store:(id)a5 verifier:(id)a6 flags:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  LACDTOSensorTrustController *v16;
  LACDTOSensorTrustController *v17;
  objc_super v19;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)LACDTOSensorTrustController;
  v16 = -[LACDTOSensorTrustController init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_ui, a4);
    objc_storeStrong((id *)&v17->_store, a5);
    objc_storeStrong((id *)&v17->_verifier, a6);
    objc_storeStrong((id *)&v17->_flags, a7);
  }

  return v17;
}

- (BOOL)canProcessRequest:(id)a3
{
  return -[LACFeatureFlagsProviderDTO featureFlagDimpleKeySecureRepairEnabled](self->_flags, "featureFlagDimpleKeySecureRepairEnabled", a3);
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  LACDTOSensorTrustVerifier *verifier;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id buf;
  _QWORD v22[4];
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[LACDTOSensorTrustController canProcessRequest:](self, "canProcessRequest:", v8))
  {
    v11 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke;
    v22[3] = &unk_2510C20B8;
    v12 = v8;
    v23 = v12;
    __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke((uint64_t)v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateOptions:", v13);

    LACLogDTOSensor();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_2409DC000, v14, OS_LOG_TYPE_DEFAULT, "Sensor trust verification will start", (uint8_t *)&buf, 2u);
    }

    objc_initWeak(&buf, self);
    verifier = self->_verifier;
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_3;
    v17[3] = &unk_2510C20E0;
    objc_copyWeak(&v20, &buf);
    v19 = v10;
    v18 = v12;
    -[LACDTOSensorTrustVerifier verifySensorTrustWithCompletion:](verifier, "verifySensorTrustWithCompletion:", v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&buf);

  }
  else
  {
    +[LACEvaluationResult resultWithNext:](LACEvaluationResult, "resultWithNext:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v16);

  }
}

id __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "options");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1086);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v6);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1085);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "BOOLValue") & 1) == 0)
  {

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1062);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1062);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v7);
LABEL_8:

  }
  return v5;
}

void __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (**v16)(id, void *);
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    LACLogDTOSensor();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_3_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);

      v16 = (void (**)(id, void *))a1[5];
      +[LACEvaluationResult resultWithFailure:](LACEvaluationResult, "resultWithFailure:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2](v16, v17);

    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v5;
        _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, "Sensor trust verification did finish with result: %@", buf, 0xCu);
      }

      v18 = (void *)WeakRetained[2];
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_4;
      v19[3] = &unk_2510C1420;
      objc_copyWeak(&v22, a1 + 6);
      v21 = a1[5];
      v20 = a1[4];
      objc_msgSend(v18, "storeSensorTrustState:completion:", v5, v19);

      objc_destroyWeak(&v22);
    }
  }

}

void __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      LACLogDTOSensor();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_4_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

      v12 = *(_QWORD *)(a1 + 40);
      +[LACEvaluationResult resultWithFailure:](LACEvaluationResult, "resultWithFailure:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

    }
    else
    {
      v14 = *(_QWORD *)(a1 + 40);
      +[LACEvaluationResult resultWithNext:](LACEvaluationResult, "resultWithNext:", *(_QWORD *)(a1 + 32));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

    }
  }

}

- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  LACUserInterfacePresenting *ui;
  _QWORD v31[4];
  id v32;
  void (**v33)(id, id);
  _QWORD v34[5];
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  if (!-[LACDTOSensorTrustController canProcessRequest:](self, "canProcessRequest:", v8)
    || (objc_msgSend(v9, "error"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = -[LACDTOSensorTrustController _isHardwareTrustError:](self, "_isHardwareTrustError:", v11),
        v11,
        !v12))
  {
LABEL_11:
    v10[2](v10, v9);
    goto LABEL_12;
  }
  objc_msgSend(v8, "options");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1085);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (v16)
  {
    LACLogDTOSensor();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v18;
      _os_log_impl(&dword_2409DC000, v17, OS_LOG_TYPE_DEFAULT, "Mapping unapproved sensor error %{public}@ to success on client's request", buf, 0xCu);

    }
    +[LACEvaluationResult resultWithSuccess:](LACEvaluationResult, "resultWithSuccess:", MEMORY[0x24BDBD1B8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v19);

    goto LABEL_12;
  }
  objc_msgSend(v8, "options");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1039);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLValue");

  if (v23)
  {
    LACLogDTOSensor();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2409DC000, v24, OS_LOG_TYPE_DEFAULT, "Skipping sensor trust alert on client's request", buf, 2u);
    }

    goto LABEL_11;
  }
  v25 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __68__LACDTOSensorTrustController_postProcessRequest_result_completion___block_invoke;
  v34[3] = &unk_2510C2108;
  v26 = v8;
  v34[4] = v26;
  v27 = __68__LACDTOSensorTrustController_postProcessRequest_result_completion___block_invoke((uint64_t)v34);
  LACLogDTOSensor();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v36 = v29;
    _os_log_impl(&dword_2409DC000, v28, OS_LOG_TYPE_DEFAULT, "Sensor trust alert with id: %@ will appear.", buf, 0xCu);

  }
  ui = self->_ui;
  v31[0] = v25;
  v31[1] = 3221225472;
  v31[2] = __68__LACDTOSensorTrustController_postProcessRequest_result_completion___block_invoke_8;
  v31[3] = &unk_2510C2130;
  v33 = v10;
  v32 = v9;
  -[LACUserInterfacePresenting presentUIForIdentifier:request:completion:](ui, "presentUIForIdentifier:request:completion:", v27, v26, v31);

LABEL_12:
}

uint64_t __68__LACDTOSensorTrustController_postProcessRequest_result_completion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "payload");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("kLAEvaluationRequestPayloadKeyDTOEnvironment"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "isStrictModeEnabled"))
    v3 = 2;
  else
    v3 = 1;

  return v3;
}

void __68__LACDTOSensorTrustController_postProcessRequest_result_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LACLogDTOSensor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2409DC000, v4, OS_LOG_TYPE_DEFAULT, "Sensor trust alert did disappear (err: %@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_isHardwareTrustError:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (v3)
    v4 = +[LACError error:hasCode:subcode:](LACError, "error:hasCode:subcode:", v3, -1, 30)
      || +[LACError error:hasCode:subcode:](LACError, "error:hasCode:subcode:", v3, -1, 31);
  else
    v4 = 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_verifier, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_ui, 0);
}

void __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, a2, a3, "Sensor trust verification failed %{public}@", a5, a6, a7, a8, 2u);
}

void __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, a2, a3, "Sensor trust verification result could not be stored %{public}@", a5, a6, a7, a8, 2u);
}

@end
