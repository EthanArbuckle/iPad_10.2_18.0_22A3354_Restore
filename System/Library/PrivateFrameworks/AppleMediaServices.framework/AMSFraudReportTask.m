@implementation AMSFraudReportTask

+ (id)performFraudReportRefreshWithAccount:(id)a3 transactionID:(id)a4 nameSpace:(id)a5 fsrData:(id)a6 keyID:(id)a7
{
  return +[AMSFraudReportTask ams_performFraudReportRefreshWithAccount:transactionID:nameSpace:fsrData:keyID:](AMSFraudReportTask, "ams_performFraudReportRefreshWithAccount:transactionID:nameSpace:fsrData:keyID:", a3, a4, a5, a6, a7);
}

+ (id)ams_performFraudReportRefreshWithAccount:(id)a3 transactionID:(id)a4 nameSpace:(id)a5 fsrData:(id)a6 keyID:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  AMSDaemonConnection *v36;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__35;
  v35 = __Block_byref_object_dispose__35;
  v36 = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend((id)v32[5], "fraudReportServiceProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __101__AMSFraudReportTask_ams_performFraudReportRefreshWithAccount_transactionID_nameSpace_fsrData_keyID___block_invoke;
  v24[3] = &unk_1E2542548;
  v17 = v11;
  v25 = v17;
  v18 = v12;
  v26 = v18;
  v19 = v13;
  v27 = v19;
  v20 = v14;
  v28 = v20;
  v21 = v15;
  v29 = v21;
  v30 = &v31;
  objc_msgSend(v16, "thenWithBlock:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v31, 8);
  return v22;
}

AMSMutablePromise *__101__AMSFraudReportTask_ams_performFraudReportRefreshWithAccount_transactionID_nameSpace_fsrData_keyID___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  AMSMutablePromise *v10;
  uint64_t v11;
  _QWORD v13[4];
  AMSMutablePromise *v14;
  uint64_t v15;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  v9 = a1[8];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __101__AMSFraudReportTask_ams_performFraudReportRefreshWithAccount_transactionID_nameSpace_fsrData_keyID___block_invoke_2;
  v13[3] = &unk_1E2542520;
  v10 = v4;
  v11 = a1[9];
  v14 = v10;
  v15 = v11;
  objc_msgSend(v3, "performFraudReportRefreshWithAccount:transactionID:nameSpace:fsrData:keyID:completion:", v5, v6, v7, v8, v9, v13);

  return v10;
}

void __101__AMSFraudReportTask_ams_performFraudReportRefreshWithAccount_transactionID_nameSpace_fsrData_keyID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (!v5)
  {
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "finishWithResult:");
      goto LABEL_5;
    }
    AMSError(0, CFSTR("Refresh Fraud Report Score failed"), CFSTR("Finished without response or error"), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

LABEL_5:
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

@end
