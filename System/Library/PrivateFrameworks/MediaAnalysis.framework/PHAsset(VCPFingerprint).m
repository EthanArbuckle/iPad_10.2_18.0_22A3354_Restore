@implementation PHAsset(VCPFingerprint)

- (id)vcp_fingerprint:()VCPFingerprint
{
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  dispatch_semaphore_t v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!v4)
      v4 = dispatch_semaphore_create(0);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__43;
    v16 = __Block_byref_object_dispose__43;
    v17 = 0;
    v6 = (void *)MEMORY[0x1E0CD1398];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__PHAsset_VCPFingerprint__vcp_fingerprint___block_invoke;
    v10[3] = &unk_1E6B1A580;
    p_buf = &buf;
    v10[4] = a1;
    v4 = v4;
    v11 = v4;
    objc_msgSend(v6, "_computeFingerPrintsOfAsset:completionHandler:", a1, v10);
    dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
    v7 = *(id *)(*((_QWORD *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  [%@] Fingerprint requested for asset with no objectID", (uint8_t *)&buf, 0xCu);

    }
    v7 = 0;
  }

  return v7;
}

@end
