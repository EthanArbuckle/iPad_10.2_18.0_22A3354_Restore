@implementation AMSSigningSecurityService

- (AMSSigningSecurityService)init
{
  void *v3;
  AMSSigningSecurityService *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[AMSSigningSecurityService initWithServiceBroker:](self, "initWithServiceBroker:", v3);

  return v4;
}

- (AMSSigningSecurityService)initWithServiceBroker:(id)a3
{
  id v5;
  AMSSigningSecurityService *v6;
  AMSSigningSecurityService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSSigningSecurityService;
  v6 = -[AMSSigningSecurityService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serviceBroker, a3);

  return v7;
}

+ (AMSSigningSecurityService)sharedService
{
  if (_MergedGlobals_140 != -1)
    dispatch_once(&_MergedGlobals_140, &__block_literal_global_117);
  return (AMSSigningSecurityService *)(id)qword_1ECEAD858;
}

void __42__AMSSigningSecurityService_sharedService__block_invoke()
{
  AMSSigningSecurityService *v0;
  void *v1;

  v0 = objc_alloc_init(AMSSigningSecurityService);
  v1 = (void *)qword_1ECEAD858;
  qword_1ECEAD858 = (uint64_t)v0;

}

- (id)handleResponse:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[AMSSigningSecurityService serviceBroker](self, "serviceBroker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "securityServiceProxyWithDelegate:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__AMSSigningSecurityService_handleResponse_bag___block_invoke;
  v14[3] = &unk_1E2545810;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  -[AMSSigningSecurityService _handleResponse:bag:securityServicePromise:onDenied:](self, "_handleResponse:bag:securityServicePromise:onDenied:", v11, v10, v9, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __48__AMSSigningSecurityService_handleResponse_bag___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  +[AMSAbsinthe handleResponse:bag:](AMSAbsinthe, "handleResponse:bag:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseFinishedWithDefaultErrorOrResult:](AMSPromise, "promiseFinishedWithDefaultErrorOrResult:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)headersForRequest:(id)a3 buyParams:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[AMSSigningSecurityService serviceBroker](self, "serviceBroker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "securityServiceProxyWithDelegate:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__AMSSigningSecurityService_headersForRequest_buyParams_bag___block_invoke;
  v18[3] = &unk_1E2545838;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  -[AMSSigningSecurityService _headersForRequest:buyParams:securityServicePromise:onDenied:](self, "_headersForRequest:buyParams:securityServicePromise:onDenied:", v15, v14, v12, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __61__AMSSigningSecurityService_headersForRequest_buyParams_bag___block_invoke(_QWORD *a1)
{
  return +[AMSAbsinthe headersForRequest:buyParams:bag:](AMSAbsinthe, "headersForRequest:buyParams:bag:", a1[4], a1[5], a1[6]);
}

- (id)signatureForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[AMSSigningSecurityService serviceBroker](self, "serviceBroker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSSigningSecurityService serviceBroker](self, "serviceBroker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "securityServiceProxyWithDelegate:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__AMSSigningSecurityService_signatureForRequest___block_invoke;
  v11[3] = &unk_1E2540118;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v5, "callService:then:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

AMSPromise *__49__AMSSigningSecurityService_signatureForRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSPromise *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = objc_alloc_init(AMSPromise);
  v5 = *(_QWORD *)(a1 + 32);
  -[AMSPromise completionHandlerAdapter](v4, "completionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "signChallengeForRequest:completion:", v5, v6);

  return v4;
}

- (id)_handleResponse:(id)a3 bag:(id)a4 securityServicePromise:(id)a5 onDenied:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = (void *)objc_opt_new();
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __81__AMSSigningSecurityService__handleResponse_bag_securityServicePromise_onDenied___block_invoke;
  v25[3] = &unk_1E2545888;
  v26 = v9;
  v27 = v12;
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __81__AMSSigningSecurityService__handleResponse_bag_securityServicePromise_onDenied___block_invoke_3;
  v22[3] = &unk_1E253DC28;
  v23 = v27;
  v24 = v10;
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __81__AMSSigningSecurityService__handleResponse_bag_securityServicePromise_onDenied___block_invoke_4;
  v20[3] = &unk_1E253E120;
  v14 = v23;
  v21 = v14;
  v15 = v10;
  v16 = v9;
  -[AMSSigningSecurityService _handleSecurityServicePromise:onConnected:onDenied:onError:](self, "_handleSecurityServicePromise:onConnected:onDenied:onError:", v11, v25, v22, v20);

  v17 = v21;
  v18 = v14;

  return v18;
}

void __81__AMSSigningSecurityService__handleResponse_bag_securityServicePromise_onDenied___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__AMSSigningSecurityService__handleResponse_bag_securityServicePromise_onDenied___block_invoke_2;
  v4[3] = &unk_1E2545860;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "handleResponse:completion:", v3, v4);

}

void __81__AMSSigningSecurityService__handleResponse_bag_securityServicePromise_onDenied___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[AMSPromise promiseFinishedWithDefaultErrorOrResult:](AMSPromise, "promiseFinishedWithDefaultErrorOrResult:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithPromise:", v3);

}

void __81__AMSSigningSecurityService__handleResponse_bag_securityServicePromise_onDenied___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithPromise:", v2);

}

uint64_t __81__AMSSigningSecurityService__handleResponse_bag_securityServicePromise_onDenied___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (id)_headersForRequest:(id)a3 buyParams:(id)a4 securityServicePromise:(id)a5 onDenied:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  v14 = (void *)objc_opt_new();
  v15 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __90__AMSSigningSecurityService__headersForRequest_buyParams_securityServicePromise_onDenied___block_invoke;
  v28[3] = &unk_1E25458B0;
  v29 = v10;
  v30 = v11;
  v31 = v14;
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __90__AMSSigningSecurityService__headersForRequest_buyParams_securityServicePromise_onDenied___block_invoke_3;
  v25[3] = &unk_1E253DC28;
  v26 = v31;
  v27 = v12;
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __90__AMSSigningSecurityService__headersForRequest_buyParams_securityServicePromise_onDenied___block_invoke_4;
  v23[3] = &unk_1E253E120;
  v16 = v26;
  v24 = v16;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  -[AMSSigningSecurityService _handleSecurityServicePromise:onConnected:onDenied:onError:](self, "_handleSecurityServicePromise:onConnected:onDenied:onError:", v13, v28, v25, v23);

  v20 = v24;
  v21 = v16;

  return v21;
}

void __90__AMSSigningSecurityService__headersForRequest_buyParams_securityServicePromise_onDenied___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __90__AMSSigningSecurityService__headersForRequest_buyParams_securityServicePromise_onDenied___block_invoke_2;
  v5[3] = &unk_1E2540008;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "signedHeadersForRequest:buyParams:completion:", v3, v4, v5);

}

uint64_t __90__AMSSigningSecurityService__headersForRequest_buyParams_securityServicePromise_onDenied___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

void __90__AMSSigningSecurityService__headersForRequest_buyParams_securityServicePromise_onDenied___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithPromise:", v2);

}

uint64_t __90__AMSSigningSecurityService__headersForRequest_buyParams_securityServicePromise_onDenied___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (id)_defaultSecurityServiceWithDelegate:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "securityServiceProxyWithDelegate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_handleSecurityServicePromise:(id)a3 onConnected:(id)a4 onDenied:(id)a5 onError:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__AMSSigningSecurityService__handleSecurityServicePromise_onConnected_onDenied_onError___block_invoke;
  v15[3] = &unk_1E25458D8;
  v16 = v9;
  v17 = v10;
  v18 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  objc_msgSend(a3, "addFinishBlock:", v15);

}

void __88__AMSSigningSecurityService__handleSecurityServicePromise_onConnected_onDenied_onError___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (*v12)(void);
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  v5 = a3;
  v11 = v5;
  if (v15)
  {
    v12 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    if (!v5)
    {
      AMSErrorWithFormat(0, CFSTR("AMSSigningSecurityService Error"), CFSTR("Connection request was unresponsive"), v6, v7, v8, v9, v10, v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(a1[6] + 16))();

      goto LABEL_4;
    }
    if (objc_msgSend(v5, "code") == 11)
    {
      (*(void (**)(void))(a1[5] + 16))();
      goto LABEL_4;
    }
    v12 = *(void (**)(void))(a1[6] + 16);
  }
  v12();
LABEL_4:

}

- (AMSDServiceBrokerProtocol)serviceBroker
{
  return self->_serviceBroker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBroker, 0);
}

@end
