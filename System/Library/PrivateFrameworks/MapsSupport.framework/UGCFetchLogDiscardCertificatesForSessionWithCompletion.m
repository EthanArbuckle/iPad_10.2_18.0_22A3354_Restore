@implementation UGCFetchLogDiscardCertificatesForSessionWithCompletion

void __UGCFetchLogDiscardCertificatesForSessionWithCompletion_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    MSPGetUGCBAAUtilitiesLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_ERROR, "Failed to receive BAA certificate and signature with error %@", buf, 0xCu);
    }

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __UGCFetchLogDiscardCertificatesForSessionWithCompletion_block_invoke_54;
  v16[3] = &unk_1E66521F0;
  v11 = *(NSObject **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v17 = v7;
  v18 = v8;
  v19 = v9;
  v20 = v12;
  v13 = v9;
  v14 = v8;
  v15 = v7;
  dispatch_async(v11, v16);

}

uint64_t __UGCFetchLogDiscardCertificatesForSessionWithCompletion_block_invoke_54(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

@end
