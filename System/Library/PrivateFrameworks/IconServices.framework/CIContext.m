@implementation CIContext

void __67__CIContext_IconServicesAdditions___IS_sharedIconCompositorContext__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C9DF88];
  v7[0] = *MEMORY[0x1E0C9DF58];
  v7[1] = v0;
  v8[0] = MEMORY[0x1E0C9AAA0];
  v8[1] = CFSTR("IconServices-Compositor");
  v1 = *MEMORY[0x1E0C9DF68];
  v7[2] = *MEMORY[0x1E0C9DF78];
  v7[3] = v1;
  v8[2] = &unk_1E5816188;
  v8[3] = MEMORY[0x1E0C9AAB0];
  v8[4] = &unk_1E58161A0;
  v2 = *MEMORY[0x1E0C9DFC0];
  v7[4] = *MEMORY[0x1E0C9DFB8];
  v7[5] = v2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[5] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD90]), "initWithOptions:", v4);
  v6 = (void *)_IS_sharedIconCompositorContext_sharedContext;
  _IS_sharedIconCompositorContext_sharedContext = v5;

}

@end
