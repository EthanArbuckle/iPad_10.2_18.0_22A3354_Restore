@implementation HMHomeManager(HFApplicationData)

- (void)hf_updateApplicationData:()HFApplicationData handleError:completionHandler:
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  char v12;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__HMHomeManager_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke;
  v10[3] = &unk_1EA73ABE0;
  v12 = a4;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a1, "updateApplicationData:completionHandler:", a3, v10);

}

@end
