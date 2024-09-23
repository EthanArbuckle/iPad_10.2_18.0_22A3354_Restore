@implementation CKMomentShareURLForMediaObjects

void __CKMomentShareURLForMediaObjects_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  uint64_t v15;

  objc_msgSend(a2, "transfer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributionInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D37F38]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = 1;
  }
  else
  {
    v9 = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v10 != v9)
    {
      objc_msgSend(v10, "absoluteString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "absoluteString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if ((v13 & 1) == 0)
      {
        IMLogHandleForCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          __CKMomentShareURLForMediaObjects_block_invoke_cold_1(v14);

      }
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v9);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_BYTE *)(v15 + 24))
    *(_BYTE *)(v15 + 24) = 1;

}

void __CKMomentShareURLForMediaObjects_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "CKMomentShareURLForMediaObjects: media objects have different moment URLs", v1, 2u);
}

@end
