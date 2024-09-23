@implementation AMSFraudReport

+ (NSString)bagSubProfile
{
  return (NSString *)CFSTR("FraudScoreReport");
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)CFSTR("1");
}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

+ (id)handleResponse:(id)a3 account:(id)a4 bag:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  AMSFraudReportHandleResponse(v10, v9, v8, v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "resultWithError:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (BOOL)isFeatureSupportedForBag:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  AMSFraudReportIsFeatureSupportedForBag(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

+ (id)addDeviceIdentityCertificateAndSignatureToRequest:(id)a3 parameters:(id)a4 bag:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  AMSFraudReportAddDeviceIdentityCertificateAndSignatureToRequest(v7, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__AMSFraudReport_Deprecated__addDeviceIdentityCertificateAndSignatureToRequest_parameters_bag___block_invoke;
  v12[3] = &unk_1E253DAE0;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "thenWithBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

AMSPromise *__95__AMSFraudReport_Deprecated__addDeviceIdentityCertificateAndSignatureToRequest_parameters_bag___block_invoke(uint64_t a1)
{
  return +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", *(_QWORD *)(a1 + 32));
}

@end
