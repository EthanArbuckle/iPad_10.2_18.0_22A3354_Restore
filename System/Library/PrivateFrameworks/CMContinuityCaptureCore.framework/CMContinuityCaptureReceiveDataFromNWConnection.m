@implementation CMContinuityCaptureReceiveDataFromNWConnection

void __CMContinuityCaptureReceiveDataFromNWConnection_block_invoke(_QWORD *a1, void *a2, void *a3, int a4, void *a5)
{
  id v9;
  NSObject *v10;
  id v11;
  int v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (v10)
    v12 = nw_content_context_get_is_final(v10) & a4;
  else
    v12 = 0;
  CMContinuityCaptureLog(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = "No";
    v15 = a1[4];
    if (v12)
      v14 = "Yes";
    v24 = 138412546;
    v25 = v15;
    v26 = 2080;
    v27 = (uint64_t)v14;
    _os_log_impl(&dword_227C5D000, v13, OS_LOG_TYPE_DEFAULT, "%@ receiveData isFinal %s", (uint8_t *)&v24, 0x16u);
  }

  if (v9 && !v11)
  {
    v16 = (void *)NWCreateNSDataFromDispatchData();
    CMContinuityCaptureLog(0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        v19 = a1[4];
        v20 = objc_msgSend(v16, "length");
        v24 = 138412546;
        v25 = v19;
        v26 = 2048;
        v27 = v20;
        _os_log_impl(&dword_227C5D000, v17, OS_LOG_TYPE_DEFAULT, "%@ Current data length %lu", (uint8_t *)&v24, 0x16u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "appendData:", v16);
    }
    else
    {
      if (v18)
      {
        v21 = a1[4];
        v24 = 138412546;
        v25 = v21;
        v26 = 2112;
        v27 = (uint64_t)v9;
        _os_log_impl(&dword_227C5D000, v17, OS_LOG_TYPE_DEFAULT, "%@ receiveData NWCreateNSDataFromDispatchData for %@", (uint8_t *)&v24, 0x16u);
      }

    }
  }
  v22 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
  if (v22 && (unint64_t)objc_msgSend(v22, "length") >= 8)
  {
    v23 = objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "length");
    LOBYTE(v12) = v23 >= *(_QWORD *)objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(a1[7] + 8) + 40)), "bytes");
  }
  if (v11 || (v12 & 1) != 0 || a4)
    (*(void (**)(void))(a1[6] + 16))();
  else
    CMContinuityCaptureReceiveDataFromNWConnection(a1[5], *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), a1[4], a1[6]);

}

@end
