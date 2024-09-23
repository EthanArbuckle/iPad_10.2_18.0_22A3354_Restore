@implementation CUMessageSession(HMCUMessageSession)

- (void)sendRequestData:()HMCUMessageSession qualityOfService:responseHandler:
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v16[0] = CFSTR("da");
  v16[1] = CFSTR("qos");
  v17[0] = a3;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a3;
  objc_msgSend(v9, "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__CUMessageSession_HMCUMessageSession__sendRequestData_qualityOfService_responseHandler___block_invoke;
  v14[3] = &unk_1E3AB0558;
  v15 = v8;
  v13 = v8;
  objc_msgSend(a1, "sendRequestID:options:request:responseHandler:", CFSTR("HMDSS.cu.rq"), 0, v12, v14);

}

@end
