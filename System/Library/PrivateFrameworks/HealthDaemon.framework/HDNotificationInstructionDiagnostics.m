@implementation HDNotificationInstructionDiagnostics

- (HDNotificationInstructionDiagnostics)initWithProfile:(id)a3
{
  id v5;
  HDNotificationInstructionDiagnostics *v6;
  HDNotificationInstructionDiagnostics *v7;
  NSISO8601DateFormatter *v8;
  NSISO8601DateFormatter *formatter;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDNotificationInstructionDiagnostics;
  v6 = -[HDNotificationInstructionDiagnostics init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    v8 = (NSISO8601DateFormatter *)objc_alloc_init(MEMORY[0x1E0CB36A8]);
    formatter = v7->_formatter;
    v7->_formatter = v8;

  }
  return v7;
}

- (BOOL)enumerateAllNotificationInstructionsWithError:(id *)a3 enumerationHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  -[HDProfile database](self->_profile, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __105__HDNotificationInstructionDiagnostics_enumerateAllNotificationInstructionsWithError_enumerationHandler___block_invoke;
  v10[3] = &unk_1E6CE97A0;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  LOBYTE(a3) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDNotificationInstructionEntity, "performReadTransactionWithHealthDatabase:error:block:", v7, a3, v10);

  return (char)a3;
}

BOOL __105__HDNotificationInstructionDiagnostics_enumerateAllNotificationInstructionsWithError_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  _BOOL8 v7;
  _QWORD v9[5];
  id v10;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __105__HDNotificationInstructionDiagnostics_enumerateAllNotificationInstructionsWithError_enumerationHandler___block_invoke_2;
  v9[3] = &unk_1E6CE9778;
  v6 = *(id *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v7 = +[HDNotificationInstructionEntity enumerateAllNotificationInstructionsWithTransaction:predicate:limit:ascending:error:enumerationHandler:](HDNotificationInstructionEntity, "enumerateAllNotificationInstructionsWithTransaction:predicate:limit:ascending:error:enumerationHandler:", a2, 0, 0, 0, a3, v9);

  return v7;
}

uint64_t __105__HDNotificationInstructionDiagnostics_enumerateAllNotificationInstructionsWithError_enumerationHandler___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44[2];

  v4 = a2;
  v5 = MEMORY[0x1BCCACAC4]();
  v6 = *(_QWORD *)(a1 + 32);
  v40 = *(_QWORD *)(a1 + 40);
  v41 = (void *)v5;
  v42 = v4;
  if (v6)
  {
    v7 = (objc_class *)MEMORY[0x1E0CB6928];
    v8 = v4;
    v38 = [v7 alloc];
    objc_msgSend(v8, "messageIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(v6 + 16);
    objc_msgSend(v8, "creationDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromDate:", v37);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(v6 + 16);
    objc_msgSend(v8, "receivedDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromDate:", v36);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(v6 + 16);
    objc_msgSend(v8, "modificationDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringFromDate:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendingDeviceName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendingDeviceInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "action");
    NSStringFromHKNotificationInstructionAction();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "categoryIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(v6 + 16);
    objc_msgSend(v8, "expirationDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringFromDate:", v30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "criteria");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB3940];
    v20 = objc_msgSend(v8, "isInvalid");

    objc_msgSend(v19, "stringWithFormat:", CFSTR("%d"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v38, "initWithMessageIdentifier:creationDate:receivedDate:modificationDate:sendingDeviceName:sendingDeviceInfo:action:clientIdentifier:categoryIdentifier:expirationDate:criteria:isInvalid:", v43, v33, v11, v34, v32, v31, v29, v28, v13, v15, v18, v21);

  }
  else
  {
    v39 = 0;
  }
  v44[0] = 0;
  v22 = (*(uint64_t (**)(uint64_t, void *, id *))(v40 + 16))(v40, v39, v44);
  v23 = v44[0];

  objc_autoreleasePoolPop(v41);
  if ((v22 & 1) == 0)
  {
    v24 = v23;
    v25 = v24;
    if (v24)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v24);
      else
        _HKLogDroppedError();
    }

  }
  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
