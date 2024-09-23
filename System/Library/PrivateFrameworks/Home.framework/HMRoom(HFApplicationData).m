@implementation HMRoom(HFApplicationData)

- (void)_hf_updateApplicationData:()HFApplicationData
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  objc_msgSend(a1, "applicationData");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__HMRoom_HFApplicationData___hf_updateApplicationData___block_invoke;
    v7[3] = &unk_1EA726918;
    v7[4] = a1;
    objc_msgSend(v6, "dispatchHomeObserverMessage:sender:", v7, 0);

  }
}

- (void)hf_updateApplicationData:()HFApplicationData handleError:completionHandler:
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  char v14;
  id location;

  v8 = a3;
  v9 = a5;
  objc_msgSend(a1, "_hf_updateApplicationData:", v8);
  objc_initWeak(&location, a1);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__HMRoom_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke;
  v11[3] = &unk_1EA73ABB8;
  v11[4] = a1;
  v14 = a4;
  objc_copyWeak(&v13, &location);
  v10 = v9;
  v12 = v10;
  objc_msgSend(a1, "updateApplicationData:completionHandler:", v8, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

@end
