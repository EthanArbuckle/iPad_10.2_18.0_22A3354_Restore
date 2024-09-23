@implementation MSPUGCPerformLogDiscardForSessionEntityWithCompletion

void __MSPUGCPerformLogDiscardForSessionEntityWithCompletion_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _BYTE v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(id *)(a1 + 32);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 64);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v11, OS_SIGNPOST_INTERVAL_END, v12, "BAACertificateRequest", (const char *)&unk_1B3A3EAC5, v22, 2u);
  }

  v13 = *(NSObject **)(a1 + 32);
  if (v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v22 = 138412290;
      *(_QWORD *)&v22[4] = v9;
      _os_log_error_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_ERROR, "Failed BAA authentication with error %@", v22, 0xCu);
      v13 = *(NSObject **)(a1 + 32);
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v22 = 138412546;
      *(_QWORD *)&v22[4] = v14;
      *(_WORD *)&v22[12] = 2112;
      *(_QWORD *)&v22[14] = v9;
      v15 = "%@ - LogDiscard error during BAA authentication: %@";
      v16 = v13;
      v17 = 22;
LABEL_11:
      _os_log_impl(&dword_1B39C0000, v16, OS_LOG_TYPE_INFO, v15, v22, v17);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v18 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v22 = 138412290;
    *(_QWORD *)&v22[4] = v18;
    v15 = "%@ - LogDiscard succeeded";
    v16 = v13;
    v17 = 12;
    goto LABEL_11;
  }
  v19 = (void *)MEMORY[0x1E0D263E8];
  v20 = (void *)objc_msgSend(v8, "copy", *(_OWORD *)v22, *(_QWORD *)&v22[16], v23);
  v21 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v19, "captureUgcDeleteWithSignature:certificates:trigger:queue:completion:", v20, v21, *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

@end
