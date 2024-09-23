@implementation FCMescalSignature

+ (void)signatureFromData:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  const void *v9;
  CC_LONG v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  unsigned __int8 md[20];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  +[FCAMSBag bag](FCAMSBag, "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease(v6);
  v9 = (const void *)objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");

  CC_SHA1(v9, v10, md);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFDB58], "signaturePromiseFromData:type:bag:", v11, 1, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__FCMescalSignature_signatureFromData_completion___block_invoke;
  v14[3] = &unk_1E46431A0;
  v15 = v5;
  v13 = v5;
  objc_msgSend(v12, "addFinishBlock:", v14);

}

void __50__FCMescalSignature_signatureFromData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[6];

  v10 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__FCMescalSignature_signatureFromData_completion___block_invoke_2;
    v11[3] = &unk_1E463B790;
    v7 = *(_QWORD *)(a1 + 32);
    v11[4] = v5;
    v11[5] = v7;
    __50__FCMescalSignature_signatureFromData_completion___block_invoke_2((uint64_t)v11);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

    }
  }

}

uint64_t __50__FCMescalSignature_signatureFromData_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Mescal signing failed to sign data with error: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

@end
