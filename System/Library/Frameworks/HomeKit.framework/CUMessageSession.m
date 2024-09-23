@implementation CUMessageSession

void __89__CUMessageSession_HMCUMessageSession__sendRequestData_qualityOfService_responseHandler___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], a2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v10, "dataForKey:", CFSTR("da"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorForKey:", CFSTR("err"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = v8;
  else
    v9 = v6;
  (*(void (**)(_QWORD, void *, void *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v9, v7);

}

@end
