@implementation AVTUICapabilities

- (void)requestAccessForCameraWithCompletionHandler:(id)a3
{
  void (**v3)(id, BOOL);
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  void (**v8)(id, BOOL);

  v3 = (void (**)(id, BOOL))a3;
  v4 = *MEMORY[0x1E0C8A808];
  v5 = objc_msgSend(MEMORY[0x1E0C8B0A0], "authorizationStatusForMediaType:", *MEMORY[0x1E0C8A808]);
  if (v5)
  {
    v3[2](v3, v5 == 3);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C8B0A0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__AVTUICapabilities_requestAccessForCameraWithCompletionHandler___block_invoke;
    v7[3] = &unk_1EA51D3F0;
    v8 = v3;
    objc_msgSend(v6, "requestAccessForMediaType:completionHandler:", v4, v7);

  }
}

uint64_t __65__AVTUICapabilities_requestAccessForCameraWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
