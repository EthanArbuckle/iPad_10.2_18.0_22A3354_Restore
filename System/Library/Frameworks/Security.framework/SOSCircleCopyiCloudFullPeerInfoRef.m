@implementation SOSCircleCopyiCloudFullPeerInfoRef

void __SOSCircleCopyiCloudFullPeerInfoRef_block_invoke(_QWORD *a1, void *a2)
{
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  NSObject *v9;
  uint64_t v10;
  const void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (SOSPeerInfoIsCloudIdentity((uint64_t)a2))
  {
    if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
    {
      v4 = secLogObjForScope("SecError");
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        return;
      v5 = a1[6];
      v15 = 138412290;
      v16 = v5;
      v6 = "Additional cloud identity found in circle after successful creation: %@";
      v7 = v4;
      v8 = 12;
      goto LABEL_5;
    }
    if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
    {
      v9 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_18A900000, v9, OS_LOG_TYPE_DEFAULT, "More than one cloud identity found, first had error, trying new one.", (uint8_t *)&v15, 2u);
      }
    }
    v10 = *(_QWORD *)(a1[5] + 8);
    v11 = *(const void **)(v10 + 24);
    if (v11)
    {
      *(_QWORD *)(v10 + 24) = 0;
      CFRelease(v11);
      v10 = *(_QWORD *)(a1[5] + 8);
    }
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = SOSFullPeerInfoCreateCloudIdentity(*MEMORY[0x1E0C9AE00], a2, (CFTypeRef *)(v10 + 24));
    if (!*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
    {
      v12 = secLogObjForScope("icloud-identity");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
        v14 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
        v15 = 138412546;
        v16 = v13;
        v17 = 2112;
        v18 = v14;
        v6 = "Failed to make FullPeer for iCloud Identity: %@ (%@)";
        v7 = v12;
        v8 = 22;
LABEL_5:
        _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v15, v8);
      }
    }
  }
}

@end
