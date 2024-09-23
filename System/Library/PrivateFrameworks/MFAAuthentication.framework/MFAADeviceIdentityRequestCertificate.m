@implementation MFAADeviceIdentityRequestCertificate

void __MFAADeviceIdentityRequestCertificate_block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  double v9;
  double v10;
  uint64_t v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  CFDataRef v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  const void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  _BYTE v28[24];
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a4);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObjectsFromArray:", v7);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v10 = v9;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 80);
    *(_DWORD *)buf = 136316162;
    v26 = "MFAADeviceIdentityRequestCertificate_block_invoke";
    v27 = 1024;
    *(_DWORD *)v28 = 132;
    *(_WORD *)&v28[4] = 2112;
    *(_QWORD *)&v28[6] = v11;
    *(_WORD *)&v28[14] = 2048;
    *(double *)&v28[16] = v10;
    v29 = 2112;
    v30 = (uint64_t)v8;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d %@, got IssueClientCertificate response in %f seconds. error %@", buf, 0x30u);
  }
  v24 = v8;
  if (v10 > 0.05 && *(_BYTE *)(a1 + 88) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    __MFAADeviceIdentityRequestCertificate_block_invoke_cold_1(a1, v10);
    if (!v7)
      goto LABEL_17;
  }
  else if (!v7)
  {
    goto LABEL_17;
  }
  if (objc_msgSend(v7, "count") == 2 && objc_msgSend(v7, "count"))
  {
    v12 = 0;
    v13 = MEMORY[0x24BDACB70];
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "description");
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v17 = objc_msgSend(v16, "UTF8String");
        *(_DWORD *)buf = 136315650;
        v26 = "MFAADeviceIdentityRequestCertificate_block_invoke";
        v27 = 2048;
        *(_QWORD *)v28 = v12;
        *(_WORD *)&v28[8] = 2080;
        *(_QWORD *)&v28[10] = v17;
        _os_log_impl(&dword_212836000, v13, OS_LOG_TYPE_DEFAULT, "%s[%lu]: desc: %s\n\n", buf, 0x20u);

      }
      v18 = SecCertificateCopyData((SecCertificateRef)v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v19 = -[__CFData length](v18, "length");
        v20 = -[__CFData length](v18, "length");
        v21 = -[__CFData bytes](objc_retainAutorelease(v18), "bytes");
        *(_DWORD *)buf = 136316162;
        v26 = "MFAADeviceIdentityRequestCertificate_block_invoke";
        v27 = 2048;
        *(_QWORD *)v28 = v12;
        *(_WORD *)&v28[8] = 2048;
        *(_QWORD *)&v28[10] = v19;
        *(_WORD *)&v28[18] = 1040;
        *(_DWORD *)&v28[20] = v20;
        v29 = 2096;
        v30 = v21;
        _os_log_impl(&dword_212836000, v13, OS_LOG_TYPE_DEFAULT, "%s[%lu]: data: (%zu bytes)\n%{coreacc:bytes}.*P", buf, 0x30u);
      }
      if (v12 == objc_msgSend(v7, "count") - 1)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;

      ++v12;
    }
    while (v12 < objc_msgSend(v7, "count"));
  }
LABEL_17:
  v22 = *(const void **)(a1 + 80);
  if (v22)
    CFRelease(v22);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __MFAADeviceIdentityRequestCertificate_block_invoke_cold_1(uint64_t a1, double a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 80);
  v3 = 136315906;
  v4 = "MFAADeviceIdentityRequestCertificate_block_invoke";
  v5 = 1024;
  v6 = 137;
  v7 = 2112;
  v8 = v2;
  v9 = 2048;
  v10 = a2;
  _os_log_fault_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "%s:%d %@, IssueClientCertificate response took too long!!! %f seconds.", (uint8_t *)&v3, 0x26u);
}

@end
