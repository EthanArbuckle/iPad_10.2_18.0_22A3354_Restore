@implementation HMService(HFApplicationData)

- (void)_hf_applicationDataUpdated:()HFApplicationData
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  objc_msgSend(a1, "applicationData");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__HMService_HFApplicationData___hf_applicationDataUpdated___block_invoke;
    v7[3] = &unk_1EA7263F0;
    v7[4] = a1;
    objc_msgSend(v6, "dispatchAccessoryObserverMessage:sender:", v7, 0);

  }
}

- (void)hf_updateApplicationData:()HFApplicationData handleError:completionHandler:
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  char v16;
  id location;

  v8 = a3;
  v9 = a5;
  objc_msgSend(a1, "_hf_applicationDataUpdated:", v8);
  objc_initWeak(&location, a1);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__HMService_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke;
  v12[3] = &unk_1EA73AC08;
  v12[4] = a1;
  v16 = a4;
  objc_copyWeak(&v15, &location);
  v10 = v8;
  v13 = v10;
  v11 = v9;
  v14 = v11;
  objc_msgSend(a1, "updateApplicationData:completionHandler:", v10, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

@end
