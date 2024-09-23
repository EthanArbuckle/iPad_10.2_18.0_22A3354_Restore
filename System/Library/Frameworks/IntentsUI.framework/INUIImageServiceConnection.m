@implementation INUIImageServiceConnection

- (void)loadUIImageForINImage:(id)a3 traitCollection:(id)a4 reply:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a5;
  v7 = (void *)MEMORY[0x1E0CBD960];
  v8 = a3;
  objc_msgSend(v7, "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__INUIImageServiceConnection_loadUIImageForINImage_traitCollection_reply___block_invoke;
  v11[3] = &unk_1EA43A488;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "loadImageDataAndSizeForImage:reply:", v8, v11);

}

void __74__INUIImageServiceConnection_loadUIImageForINImage_traitCollection_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CEA638];
  v6 = a3;
  objc_msgSend(a2, "_imageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithData:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1)
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_237);
  return (id)sharedConnection_sImageServiceConnection;
}

void __46__INUIImageServiceConnection_sharedConnection__block_invoke()
{
  INUIImageServiceConnection *v0;
  void *v1;

  v0 = objc_alloc_init(INUIImageServiceConnection);
  v1 = (void *)sharedConnection_sImageServiceConnection;
  sharedConnection_sImageServiceConnection = (uint64_t)v0;

}

@end
