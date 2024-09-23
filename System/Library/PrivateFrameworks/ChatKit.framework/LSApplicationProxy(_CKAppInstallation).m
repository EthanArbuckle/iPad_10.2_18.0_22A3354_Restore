@implementation LSApplicationProxy(_CKAppInstallation)

- (id)__ck_messagesPluginKitProxy
{
  void *v1;
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__68;
  v9 = __Block_byref_object_dispose__68;
  v10 = 0;
  objc_msgSend(a1, "plugInKitPlugins");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__LSApplicationProxy__CKAppInstallation____ck_messagesPluginKitProxy__block_invoke;
  v4[3] = &unk_1E2759240;
  v4[4] = &v5;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v4);

  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

@end
