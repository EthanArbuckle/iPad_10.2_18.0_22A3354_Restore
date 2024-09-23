@implementation CDPDBackupInfoRecoveryFlowController

- (void)beginRecoveryWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__CDPDBackupInfoRecoveryFlowController_beginRecoveryWithCompletion___block_invoke;
  v6[3] = &unk_24C81C898;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CDPDRecoveryFlowController beginRecovery:](self, "beginRecovery:", v6);

}

void __68__CDPDBackupInfoRecoveryFlowController_beginRecoveryWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6
    || objc_msgSend(v5, "userDidCancel")
    && (_CDPStateError(), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __68__CDPDBackupInfoRecoveryFlowController_beginRecoveryWithCompletion___block_invoke_cold_3((uint64_t)v7, v8);

    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v7);
  }
  else
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __68__CDPDBackupInfoRecoveryFlowController_beginRecoveryWithCompletion___block_invoke_cold_2(v5);

    objc_msgSend(*(id *)(a1 + 32), "resultParser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v11, "resultsDictionaryFromRecoveryResult:error:", v5, &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;

    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __68__CDPDBackupInfoRecoveryFlowController_beginRecoveryWithCompletion___block_invoke_cold_1(v12);

    v15 = *(_QWORD *)(a1 + 40);
    if (v15)
      (*(void (**)(uint64_t, void *, id))(v15 + 16))(v15, v12, v13);

    v7 = 0;
  }

}

- (void)setRecoveryRecords:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;

  objc_storeStrong((id *)&self->_recoveryRecords, a3);
  v5 = a3;
  -[CDPDBackupInfoRecoveryFlowController errorProvider](self, "errorProvider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "prevailingLocalSecretType");

  objc_msgSend(v7, "setPrevailingSecret:", v6);
}

- (void)retrieveInflatedDevices:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  CDPDBackupInfoRecoveryFlowController *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __64__CDPDBackupInfoRecoveryFlowController_retrieveInflatedDevices___block_invoke;
  v5[3] = &unk_24C81C928;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)CDPDBackupInfoRecoveryFlowController;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[CDPDRecoveryFlowController retrieveInflatedDevices:](&v4, sel_retrieveInflatedDevices_, v5);

}

void __64__CDPDBackupInfoRecoveryFlowController_retrieveInflatedDevices___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void (*v25)(void);
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;

  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD1758];
  v9 = a3;
  objc_msgSend(v8, "predicateWithBlock:", &__block_literal_global_3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "errorProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "verficationFailedErrorwithUnderlyingError:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "errorProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "supportsErrorPresentation");

    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "uiProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "recoveryContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "context");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __64__CDPDBackupInfoRecoveryFlowController_retrieveInflatedDevices___block_invoke_3;
      v39[3] = &unk_24C81C900;
      v41 = *(id *)(a1 + 40);
      v40 = v13;
      objc_msgSend(v16, "cdpContext:showError:withCompletion:", v18, v40, v39);

      v19 = v41;
LABEL_4:

LABEL_11:
      goto LABEL_12;
    }
    v25 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_10;
  }
  if (a2 && objc_msgSend(v11, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_recoveryListFromDevices:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", &unk_24C836698);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      objc_msgSend(*(id *)(a1 + 32), "errorProvider");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "errorProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "cooldownErrorWithUnderlyingError:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __64__CDPDBackupInfoRecoveryFlowController_retrieveInflatedDevices___block_invoke_15;
      v37[3] = &unk_24C81C0D0;
      v38 = *(id *)(a1 + 40);
      objc_msgSend(v22, "handleSoftLimitError:completion:", v24, v37);

      v19 = v38;
      goto LABEL_4;
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", &unk_24C8366B0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copy");
    objc_msgSend(*(id *)(a1 + 32), "setRecoveryRecords:", v31);

    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "errorProvider");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "errorProvider");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "globalHardLimitError");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __64__CDPDBackupInfoRecoveryFlowController_retrieveInflatedDevices___block_invoke_18;
      v35[3] = &unk_24C81C0D0;
      v36 = *(id *)(a1 + 40);
      objc_msgSend(v32, "handleHardLimitError:completion:", v34, v35);

      v19 = v36;
      goto LABEL_4;
    }
    v25 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_10:
    v25();
    goto LABEL_11;
  }
  v26 = *(_QWORD *)(a1 + 40);
  if (v26)
  {
    objc_msgSend(*(id *)(a1 + 32), "errorProvider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPStateError();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "recordNotFoundErrorWithUnderlyingError:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v26 + 16))(v26, 0, 0, v29);

  }
LABEL_12:

}

BOOL __64__CDPDBackupInfoRecoveryFlowController_retrieveInflatedDevices___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  objc_msgSend(v2, "machineID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 1;
  else
    v4 = objc_msgSend(v2, "recoveryStatus") != 0;

  return v4;
}

uint64_t __64__CDPDBackupInfoRecoveryFlowController_retrieveInflatedDevices___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, 0, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __64__CDPDBackupInfoRecoveryFlowController_retrieveInflatedDevices___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__CDPDBackupInfoRecoveryFlowController_retrieveInflatedDevices___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_recoveryListFromDevices:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v13[0] = &unk_24C8366B0;
  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = &unk_24C836698;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v13[2] = &unk_24C8366C8;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__CDPDBackupInfoRecoveryFlowController__recoveryListFromDevices___block_invoke;
  v11[3] = &unk_24C81C950;
  v9 = v8;
  v12 = v9;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);

  return v9;
}

void __65__CDPDBackupInfoRecoveryFlowController__recoveryListFromDevices___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "recoveryStatus"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (BOOL)secretValidator:(id)a3 shouldContinueValidationAfterError:(id)a4
{
  return objc_msgSend(a4, "isCoolDownError", a3) ^ 1;
}

- (void)secretValidator:(id)a3 didFailRecoveryWithErrors:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSArray *recoveryRecords;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSUInteger v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;

  v7 = a4;
  v8 = a5;
  -[CDPDBackupInfoRecoveryFlowController _updateRecordRecoveryStatusForRecordDictionary:](self, "_updateRecordRecoveryStatusForRecordDictionary:", v7);
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDBackupInfoRecoveryFlowController _recoveryListFromDevices:](self, "_recoveryListFromDevices:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", &unk_24C836698);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    -[CDPDBackupInfoRecoveryFlowController errorProvider](self, "errorProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDBackupInfoRecoveryFlowController errorProvider](self, "errorProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cooldownErrorWithUnderlyingError:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke;
    v46[3] = &unk_24C81C0D0;
    v47 = v8;
    objc_msgSend(v13, "handleSoftLimitError:completion:", v15, v46);

    v16 = v47;
  }
  else
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", &unk_24C8366C8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x24BDAC760];
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke_2;
      v44[3] = &unk_24C81C950;
      v19 = v17;
      v45 = v19;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v44);
      recoveryRecords = self->_recoveryRecords;
      v21 = (void *)MEMORY[0x24BDD1758];
      v42[0] = v18;
      v42[1] = 3221225472;
      v42[2] = __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke_3;
      v42[3] = &unk_24C81C058;
      v22 = v19;
      v43 = v22;
      objc_msgSend(v21, "predicateWithBlock:", v42);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray filteredArrayUsingPredicate:](recoveryRecords, "filteredArrayUsingPredicate:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPDBackupInfoRecoveryFlowController setRecoveryRecords:](self, "setRecoveryRecords:", v24);

      v25 = -[NSArray count](self->_recoveryRecords, "count");
      -[CDPDBackupInfoRecoveryFlowController errorProvider](self, "errorProvider");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        objc_msgSend(v16, "firstObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "hardLimitErrorForRecord:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        -[CDPDBackupInfoRecoveryFlowController errorProvider](self, "errorProvider");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v27) = objc_msgSend(v29, "supportsErrorPresentation");

        if ((_DWORD)v27)
        {
          -[CDPDRecoveryFlowController uiProvider](self, "uiProvider");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "context");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v37[0] = v18;
          v37[1] = 3221225472;
          v37[2] = __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke_5;
          v37[3] = &unk_24C81C900;
          v39 = v8;
          v38 = v7;
          objc_msgSend(v30, "cdpContext:showError:withCompletion:", v32, v28, v37);

          v33 = v39;
        }
        else
        {
          _CDPStateError();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v33);
        }

      }
      else
      {
        -[CDPDBackupInfoRecoveryFlowController errorProvider](self, "errorProvider");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "globalHardLimitErrorWithRecord:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = v18;
        v40[1] = 3221225472;
        v40[2] = __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke_4;
        v40[3] = &unk_24C81C0D0;
        v41 = v8;
        objc_msgSend(v26, "handleHardLimitError:completion:", v36, v40);

        v28 = v41;
      }

    }
    else
    {
      _CDPStateError();
      v22 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, uint64_t, id))v8 + 2))(v8, 1, v22);
    }

  }
}

uint64_t __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "recordID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)_updateRecordRecoveryStatusForRecordDictionary:(id)a3
{
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_27);
}

void __87__CDPDBackupInfoRecoveryFlowController__updateRecordRecoveryStatusForRecordDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE1A368]) & 1) != 0)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v4;
  }

  if ((objc_msgSend(v7, "isICSCRecoveryHardLimitError") & 1) != 0)
  {
    v8 = 2;
  }
  else if (objc_msgSend(v7, "isRecoveryPETHardLimitError"))
  {
    v8 = 2;
  }
  else
  {
    v8 = 0;
  }
  if ((objc_msgSend(v7, "isCoolDownError") & 1) != 0 || objc_msgSend(v7, "isRecoveryPETSoftLimitError"))
    v8 = 1;
  objc_msgSend(v9, "setRecoveryStatus:", v8);

}

- (CDPDBackupRecoveryResultsParser)resultParser
{
  return self->_resultParser;
}

- (void)setResultParser:(id)a3
{
  objc_storeStrong((id *)&self->_resultParser, a3);
}

- (CDPDBackupRecoveryErrorProvider)errorProvider
{
  return self->_errorProvider;
}

- (void)setErrorProvider:(id)a3
{
  objc_storeStrong((id *)&self->_errorProvider, a3);
}

- (NSArray)recoveryRecords
{
  return self->_recoveryRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryRecords, 0);
  objc_storeStrong((id *)&self->_errorProvider, 0);
  objc_storeStrong((id *)&self->_resultParser, 0);
}

void __68__CDPDBackupInfoRecoveryFlowController_beginRecoveryWithCompletion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "allKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_20DB2C000, v2, v3, "\"Recovered data dictionary with keys: %@\", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6();
}

void __68__CDPDBackupInfoRecoveryFlowController_beginRecoveryWithCompletion___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "recoveredInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_20DB2C000, v2, v3, "\"Parsing recovered data: %@\", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6();
}

void __68__CDPDBackupInfoRecoveryFlowController_beginRecoveryWithCompletion___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_ERROR, "\"Failed to recover data dictionary: %@\", (uint8_t *)&v2, 0xCu);
}

@end
