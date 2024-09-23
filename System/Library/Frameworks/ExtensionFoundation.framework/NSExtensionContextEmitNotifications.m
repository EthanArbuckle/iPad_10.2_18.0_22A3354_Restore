@implementation NSExtensionContextEmitNotifications

void ___NSExtensionContextEmitNotifications_block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_extensionContextForUUID:");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (_NSExtensionDummyExtensionContext_onceToken != -1)
      dispatch_once(&_NSExtensionDummyExtensionContext_onceToken, &__block_literal_global_160);
    v2 = (id)_NSExtensionDummyExtensionContext_context;
  }
  v3 = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ___NSExtensionContextEmitNotifications_block_invoke_2;
  v5[3] = &unk_1E2CFC778;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = v3;
  v9 = *(id *)(a1 + 64);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t ___NSExtensionContextEmitNotifications_block_invoke_2(_QWORD *a1)
{
  Class Class;
  void *v3;
  void *v4;
  void *v5;

  Class = objc_getClass("UIApplication");
  if (Class)
  {
    -[objc_class performSelector:](Class, "performSelector:", sel_sharedApplication);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", a1[4], v3, 0);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", a1[5], a1[6], 0);

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

@end
