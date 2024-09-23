@implementation VCPRealTimeAnalysisService

- (VCPRealTimeAnalysisService)init
{
  VCPRealTimeAnalysisService *v2;
  NSLock *v3;
  NSLock *connectionLock;
  NSXPCConnection *connection;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VCPRealTimeAnalysisService;
  v2 = -[VCPRealTimeAnalysisService init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    connectionLock = v2->_connectionLock;
    v2->_connectionLock = v3;

    connection = v2->_connection;
    v2->_connection = 0;

  }
  return v2;
}

+ (id)analysisService
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (void)dealloc
{
  objc_super v3;

  -[VCPRealTimeAnalysisService invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)VCPRealTimeAnalysisService;
  -[VCPRealTimeAnalysisService dealloc](&v3, sel_dealloc);
}

+ (id)errorWithStatus:(int)a3 andDescription:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB2D50];
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  NSXPCConnection *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  -[NSLock lock](self->_connectionLock, "lock");
  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mediaanalysisd.realtime"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    v6 = self->_connection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A2890);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    v8 = self->_connection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF164410);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v8, "setExportedInterface:", v9);

    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_30);
    objc_initWeak(&location, self);
    v10 = self->_connection;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __40__VCPRealTimeAnalysisService_connection__block_invoke_10;
    v16 = &unk_1E6B16988;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", &v13);
    -[NSXPCConnection resume](self->_connection, "resume", v13, v14, v15, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  v11 = connection;
  -[NSLock unlock](self->_connectionLock, "unlock");
  return v11;
}

void __40__VCPRealTimeAnalysisService_connection__block_invoke()
{
  uint8_t v0[16];

  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Real-time analysis client XPC connection interrupted", v0, 2u);
  }
}

void __40__VCPRealTimeAnalysisService_connection__block_invoke_10(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  __int16 v5[8];

  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Real-time analysis client XPC connection invalidated", (uint8_t *)v5, 2u);
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "lock");
    v4 = v3[2];
    v3[2] = 0;

    objc_msgSend(v3[1], "unlock");
  }

}

- (void)requestAnalysis:(unint64_t)a3 ofPixelBuffer:(__CVBuffer *)a4 withProperties:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[16];

  v10 = a5;
  v11 = a6;
  CVPixelBufferGetIOSurface(a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[VCPRealTimeAnalysisService connection](self, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __97__VCPRealTimeAnalysisService_requestAnalysis_ofPixelBuffer_withProperties_withCompletionHandler___block_invoke;
    v20[3] = &unk_1E6B16158;
    v15 = v11;
    v21 = v15;
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __97__VCPRealTimeAnalysisService_requestAnalysis_ofPixelBuffer_withProperties_withCompletionHandler___block_invoke_13;
    v18[3] = &unk_1E6B15F88;
    v19 = v15;
    objc_msgSend(v16, "requestAnalysis:ofIOSurface:withProperties:withReply:", a3, v12, v10, v18);

    v17 = v21;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Pixel buffer not IOSurface-backed; dropping analysis request",
        buf,
        2u);
    }
    objc_msgSend((id)objc_opt_class(), "errorWithStatus:andDescription:", 4294967246, CFSTR("CVPixelbuffer not IOSurface backed"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v17);
  }

}

void __97__VCPRealTimeAnalysisService_requestAnalysis_ofPixelBuffer_withProperties_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint8_t v4[16];

  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Real-time analysis client XPC connection error", v4, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __97__VCPRealTimeAnalysisService_requestAnalysis_ofPixelBuffer_withProperties_withCompletionHandler___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
}

@end
