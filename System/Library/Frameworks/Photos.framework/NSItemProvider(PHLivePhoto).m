@implementation NSItemProvider(PHLivePhoto)

- (void)initWithLivePhoto:()PHLivePhoto
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  char v13;
  _QWORD v14[4];
  id v15;
  char v16;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "init");
  if (v5)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __49__NSItemProvider_PHLivePhoto__initWithLivePhoto___block_invoke;
    v14[3] = &unk_1E35DB688;
    v8 = v4;
    v15 = v8;
    v16 = 1;
    objc_msgSend(v5, "registerItemForTypeIdentifier:loadHandler:", v6, v14);

    objc_msgSend((id)*MEMORY[0x1E0CEC540], "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __49__NSItemProvider_PHLivePhoto__initWithLivePhoto___block_invoke_3;
    v11[3] = &unk_1E35DB688;
    v12 = v8;
    v13 = 1;
    objc_msgSend(v5, "registerItemForTypeIdentifier:loadHandler:", v9, v11);

  }
  return v5;
}

@end
