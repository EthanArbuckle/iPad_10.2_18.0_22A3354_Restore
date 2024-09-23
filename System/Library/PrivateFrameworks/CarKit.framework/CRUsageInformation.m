@implementation CRUsageInformation

- (CRUsageInformation)init
{
  CRUsageInformation *v2;
  CRCarKitServiceClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRUsageInformation;
  v2 = -[CRUsageInformation init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CRCarKitServiceClient);
    -[CRUsageInformation setServiceClient:](v2, "setServiceClient:", v3);

  }
  return v2;
}

- (BOOL)shouldSuggestCarPlayTips
{
  NSObject *v3;
  void *v4;
  _QWORD v6[5];
  uint8_t buf[16];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A83A2000, v3, OS_LOG_TYPE_DEFAULT, "Checking vehicle storage for CarPlay tips.", buf, 2u);
  }

  -[CRUsageInformation serviceClient](self, "serviceClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__CRUsageInformation_shouldSuggestCarPlayTips__block_invoke;
  v6[3] = &unk_1E5427EF0;
  v6[4] = &v8;
  objc_msgSend(v4, "performSynchronousServiceBlock:errorHandler:", v6, 0);

  LOBYTE(v4) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

uint64_t __46__CRUsageInformation_shouldSuggestCarPlayTips__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__CRUsageInformation_shouldSuggestCarPlayTips__block_invoke_2;
  v3[3] = &unk_1E5427EC8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "hasVehiclesWithReply:", v3);
}

void __46__CRUsageInformation_shouldSuggestCarPlayTips__block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  CarGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (a2)
      v5 = CFSTR("YES");
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1A83A2000, v4, OS_LOG_TYPE_DEFAULT, "CarPlay Tips vehicle storage indicates %@", (uint8_t *)&v6, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
}

- (CRCarKitServiceClient)serviceClient
{
  return self->_serviceClient;
}

- (void)setServiceClient:(id)a3
{
  objc_storeStrong((id *)&self->_serviceClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceClient, 0);
}

@end
