@implementation ASDExternalManifestRequest

- (ASDExternalManifestRequest)initWithOptions:(id)a3
{
  return (ASDExternalManifestRequest *)-[ASDEphemeralRequest _initWithOptions:](self, a3);
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD newValue[4];
  id v7;

  v4 = a3;
  newValue[0] = MEMORY[0x1E0C809B0];
  newValue[1] = 3221225472;
  newValue[2] = __55__ASDExternalManifestRequest_startWithCompletionBlock___block_invoke;
  newValue[3] = &unk_1E37BDF88;
  v7 = v4;
  v5 = v4;
  -[ASDEphemeralRequest _startWithCompletionHandler:](self, (char *)newValue);

}

void __55__ASDExternalManifestRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v7 = a4;
    v8 = objc_msgSend(v10, "success");
    objc_msgSend(v10, "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *, id))(v6 + 16))(v6, v8, v9, v7);

  }
}

+ (int64_t)requestType
{
  return 3;
}

@end
