@implementation ICExtensionSafeAPIShims

+ (int64_t)applicationState
{
  if ((_UIApplicationIsExtension() & 1) != 0)
    return 0;
  else
    return objc_msgSend((id)*MEMORY[0x1E0DC4730], "applicationState");
}

+ (BOOL)canOpenURL:(id)a3
{
  return objc_msgSend((id)*MEMORY[0x1E0DC4730], "canOpenURL:", a3);
}

+ (void)openURL:(id)a3 originatingView:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "openURLHandler");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v9, v8);
  else
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "_openURL:originatingView:completionHandler:", v9, v12, v8);

}

+ (id)openURLHandler
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *(*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__12;
  v9 = __Block_byref_object_dispose__12;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__ICExtensionSafeAPIShims_openURLHandler__block_invoke;
  v4[3] = &unk_1EA7DECF8;
  v4[4] = &v5;
  ICWithOpenURLHandlerLock(v4);
  v2 = _Block_copy((const void *)v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __41__ICExtensionSafeAPIShims_openURLHandler__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = _Block_copy((const void *)_openURLHandler);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (void)setOpenURLHandler:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__ICExtensionSafeAPIShims_setOpenURLHandler___block_invoke;
  v5[3] = &unk_1EA7DDE08;
  v6 = v3;
  v4 = v3;
  ICWithOpenURLHandlerLock(v5);

}

void __45__ICExtensionSafeAPIShims_setOpenURLHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = _Block_copy(*(const void **)(a1 + 32));
  v2 = (void *)_openURLHandler;
  _openURLHandler = (uint64_t)v1;

}

@end
