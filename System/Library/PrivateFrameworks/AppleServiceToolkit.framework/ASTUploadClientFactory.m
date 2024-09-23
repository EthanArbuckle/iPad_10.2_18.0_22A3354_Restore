@implementation ASTUploadClientFactory

+ (id)uploadClientWithASTSession:(id)a3 andFileMap:(id)a4 andUrlFactory:(id)a5 andDelegate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  ASTConfigurableUploadClient *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22 = v11;
  v13 = -[ASTConfigurableUploadClient initWithASTSession:withURLSession:withURLRequestFactory:withDelegate:]([ASTConfigurableUploadClient alloc], "initWithASTSession:withURLSession:withURLRequestFactory:withDelegate:", v9, 0, v11, v12);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    v18 = MEMORY[0x24BDBD1B8];
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[ASTConfigurableUploadClient queueUploadWithSourceUrl:andExtra:](v13, "queueUploadWithSourceUrl:andExtra:", v20, v18);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[ASTConfigurableUploadClient queueUploadWithSourceData:andExtra:](v13, "queueUploadWithSourceData:andExtra:", v20, v18);
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  return v13;
}

+ (id)repairToolUploadClientWithASTSession:(id)a3 withUploadRequests:(id)a4 andDelegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  RepairToolURLFactory *v10;
  ASTConfigurableUploadClient *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[RepairToolURLFactory initWithRequestItems:]([RepairToolURLFactory alloc], "initWithRequestItems:", v8);

  v11 = -[ASTConfigurableUploadClient initWithASTSession:withURLSession:withURLRequestFactory:withDelegate:]([ASTConfigurableUploadClient alloc], "initWithASTSession:withURLSession:withURLRequestFactory:withDelegate:", v9, 0, v10, v7);
  return v11;
}

+ (id)repairToolUploadClientWithUploadRequests:(id)a3 andDelegate:(id)a4
{
  id v5;
  id v6;
  RepairToolURLFactory *v7;
  ASTConfigurableUploadClient *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[RepairToolURLFactory initWithRequestItems:]([RepairToolURLFactory alloc], "initWithRequestItems:", v6);

  v8 = -[ASTConfigurableUploadClient initWithURLSession:withURLRequestFactory:withDelegate:]([ASTConfigurableUploadClient alloc], "initWithURLSession:withURLRequestFactory:withDelegate:", 0, v7, v5);
  return v8;
}

@end
