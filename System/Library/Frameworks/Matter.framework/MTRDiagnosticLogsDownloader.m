@implementation MTRDiagnosticLogsDownloader

- (MTRDiagnosticLogsDownloader)init
{
  MTRDiagnosticLogsDownloader *v3;
  MTRDownloads *v4;
  MTRDownloads *downloads;
  uint64_t v6;
  objc_super v8;

  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDiagnosticLogsDownloader.mm", 362);
  v8.receiver = self;
  v8.super_class = (Class)MTRDiagnosticLogsDownloader;
  v3 = -[MTRDiagnosticLogsDownloader init](&v8, sel_init);
  if (v3)
  {
    v4 = objc_alloc_init(MTRDownloads);
    downloads = v3->_downloads;
    v3->_downloads = v4;

    v6 = operator new();
    v3->_bridge = (DiagnosticLogsDownloaderBridge *)sub_233CBF000(v6, v3);
  }
  return v3;
}

- (void)dealloc
{
  DiagnosticLogsDownloaderBridge *bridge;
  MTRDownloads *downloads;
  objc_super v5;

  bridge = self->_bridge;
  if (bridge)
  {
    (*((void (**)(DiagnosticLogsDownloaderBridge *, SEL))bridge->var0 + 1))(bridge, a2);
    self->_bridge = 0;
  }
  downloads = self->_downloads;
  self->_downloads = 0;

  v5.receiver = self;
  v5.super_class = (Class)MTRDiagnosticLogsDownloader;
  -[MTRDiagnosticLogsDownloader dealloc](&v5, sel_dealloc);
}

- (BDXTransferServerDelegate)getBridge
{
  return (BDXTransferServerDelegate *)self->_bridge;
}

- (void)downloadLogFromNodeWithID:(id)a3 controller:(id)a4 type:(int64_t)a5 timeout:(double)a6 queue:(id)a7 completion:(id)a8
{
  id v14;
  NSObject *v15;
  NSObject *v16;
  unsigned int v17;
  uint64_t v18;
  id v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  MTRDownloads *downloads;
  void *v27;
  const char *v28;
  void *v29;
  void *v30;
  id v31;
  const char *v32;
  void *v33;
  MTRClusterDiagnosticLogs *v34;
  const char *v35;
  void *v36;
  MTRDiagnosticLogsClusterRetrieveLogsRequestParams *v37;
  const char *v38;
  void *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t LogsRequestWithParams_expectedValues_expectedValueInterval_completion;
  void *v48;
  const char *v49;
  id *v50;
  NSObject *v51;
  void *v52;
  id v53;
  void *v54;
  NSObject *queue;
  id v56;
  void *v57;
  id v58;
  __int128 v59;
  uint64_t v60;
  uint8_t buf[16];
  uint64_t v62;
  _QWORD v63[4];
  id v64;
  _QWORD block[4];
  id v66;
  _QWORD v67[4];
  id v68;
  MTRDiagnosticLogsDownloader *v69;
  __int16 v70;

  v56 = a3;
  v14 = a4;
  v15 = a7;
  queue = v15;
  v58 = a8;
  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDiagnosticLogsDownloader.mm", 396);
  if (a6 <= 0.0)
  {
    v17 = 0;
  }
  else if (a6 <= 65535.0)
  {
    v17 = (int)a6;
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_233BF3000, v16, OS_LOG_TYPE_DEFAULT, "Warning: timeout is too large. It will be truncated to UINT16_MAX.", buf, 2u);
    }

    if (sub_234114844(2u))
      sub_2341147D0(0, 2);
    v17 = 0xFFFF;
  }
  v18 = MEMORY[0x24BDAC760];
  v67[0] = MEMORY[0x24BDAC760];
  v67[1] = 3221225472;
  v67[2] = sub_233CBE768;
  v67[3] = &unk_2504F01E0;
  v19 = v14;
  v68 = v19;
  v69 = self;
  v70 = v17;
  v57 = (void *)MEMORY[0x23493EEA8](v67);
  v20 = (void *)MEMORY[0x24BDD16E0];
  v23 = objc_msgSend_fabricIndex(v19, v21, v22);
  objc_msgSend_numberWithUnsignedChar_(v20, v24, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  downloads = self->_downloads;
  v27 = v56;
  objc_msgSend_add_fabricIndex_nodeID_queue_completion_done_(downloads, v28, a5, v25, v56, v15, v58, v57);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    v53 = v14;
    v63[0] = v18;
    v63[1] = 3221225472;
    v63[2] = sub_233CBE934;
    v63[3] = &unk_2504F0230;
    v31 = v29;
    v64 = v31;
    v54 = (void *)MEMORY[0x23493EEA8](v63);
    objc_msgSend_deviceForNodeID_(v19, v32, (uint64_t)v56, v53);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = [MTRClusterDiagnosticLogs alloc];
    v36 = (void *)objc_msgSend_initWithDevice_endpointID_queue_(v34, v35, (uint64_t)v33, &unk_250591B00, queue);
    v37 = objc_alloc_init(MTRDiagnosticLogsClusterRetrieveLogsRequestParams);
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v38, a5);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setIntent_(v37, v40, (uint64_t)v39);

    objc_msgSend_setRequestedProtocol_(v37, v41, (uint64_t)&unk_250591AD0);
    objc_msgSend_fileDesignator(v31, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTransferFileDesignator_(v37, v45, (uint64_t)v44);

    LogsRequestWithParams_expectedValues_expectedValueInterval_completion = objc_msgSend_retrieveLogsRequestWithParams_expectedValues_expectedValueInterval_completion_(v36, v46, (uint64_t)v37, 0, 0, v54);
    if (v17)
    {
      memset(buf, 0, sizeof(buf));
      v62 = 0;
      sub_233CBE944(LogsRequestWithParams_expectedValues_expectedValueInterval_completion, v31, v17);
      if (*(_DWORD *)buf)
      {
        v59 = *(_OWORD *)buf;
        v60 = v62;
        sub_2340017F0((uint64_t)MTRError, &v59);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_failure_(v31, v49, (uint64_t)v48);

      }
    }
    v50 = &v64;

    v51 = queue;
    v27 = v56;
    v52 = v58;
  }
  else
  {
    block[0] = v18;
    block[1] = 3221225472;
    block[2] = sub_233CBE8B4;
    block[3] = &unk_2504F0208;
    v50 = &v66;
    v52 = v58;
    v66 = v58;
    v51 = queue;
    dispatch_async(queue, block);
  }

}

- (void)handleBDXTransferSessionBeginForFileDesignator:(id)a3 fabricIndex:(id)a4 nodeID:(id)a5 completion:(id)a6 abortHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  id v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  int v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, _QWORD))a6;
  v16 = a7;
  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDiagnosticLogsDownloader.mm", 450);
  sub_234117B80(0, "NotSpecified");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v12;
    _os_log_impl(&dword_233BF3000, v17, OS_LOG_TYPE_DEFAULT, "BDX Transfer Session Begin: %@", buf, 0xCu);
  }

  if (sub_234114844(2u))
  {
    v23 = v12;
    sub_2341147D0(0, 2);
  }
  objc_msgSend_get_fabricIndex_nodeID_(self->_downloads, v18, (uint64_t)v12, v13, v14, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19;
  if (v19)
  {
    objc_msgSend_setAbortHandler_(v19, v20, (uint64_t)v16);
    v15[2](v15, 0);
  }
  else
  {
    LODWORD(v24) = 216;
    *((_QWORD *)&v24 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRDiagnosticLogsDownloader.mm";
    v25 = 454;
    sub_2340017F0((uint64_t)MTRError, &v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v15)[2](v15, v22);

  }
}

- (void)handleBDXTransferSessionDataForFileDesignator:(id)a3 fabricIndex:(id)a4 nodeID:(id)a5 data:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  NSObject *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  int v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD))a7;
  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDiagnosticLogsDownloader.mm", 466);
  sub_234117B80(0, "NotSpecified");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v12;
    v30 = 2112;
    v31 = v15;
    _os_log_impl(&dword_233BF3000, v17, OS_LOG_TYPE_DEFAULT, "BDX Transfer Session Data: %@: %@", buf, 0x16u);
  }

  if (sub_234114844(2u))
  {
    v23 = v12;
    v24 = v15;
    sub_2341147D0(0, 2);
  }
  objc_msgSend_get_fabricIndex_nodeID_(self->_downloads, v18, (uint64_t)v12, v13, v14, v23, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19;
  if (v19)
  {
    v25 = 0;
    objc_msgSend_writeToFile_error_(v19, v20, (uint64_t)v15, &v25);
    v22 = v25;
    v16[2](v16, 0);
  }
  else
  {
    LODWORD(v26) = 216;
    *((_QWORD *)&v26 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRDiagnosticLogsDownloader.mm";
    v27 = 470;
    sub_2340017F0((uint64_t)MTRError, &v26);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id))v16)[2](v16, v22);
  }

}

- (void)handleBDXTransferSessionEndForFileDesignator:(id)a3 fabricIndex:(id)a4 nodeID:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDiagnosticLogsDownloader.mm", 484);
  sub_234117B80(0, "NotSpecified");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v10;
    v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_233BF3000, v14, OS_LOG_TYPE_DEFAULT, "BDX Transfer Session End: %@: %@", buf, 0x16u);
  }

  if (sub_234114844(2u))
  {
    v20 = v10;
    v21 = v13;
    sub_2341147D0(0, 2);
  }
  objc_msgSend_get_fabricIndex_nodeID_(self->_downloads, v15, (uint64_t)v10, v11, v12, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v16;
  if (v16)
  {
    if (v13)
      objc_msgSend_failure_(v16, v17, (uint64_t)v13);
    else
      objc_msgSend_success(v16, v17, v18);
  }

}

- (DiagnosticLogsDownloaderBridge)bridge
{
  return self->_bridge;
}

- (MTRDownloads)downloads
{
  return self->_downloads;
}

- (void)setDownloads:(id)a3
{
  objc_storeStrong((id *)&self->_downloads, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloads, 0);
}

@end
