@implementation CATransaction(CoreMaterialAdditions)

+ (void)mt_addCompletionBlock:()CoreMaterialAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1AF42541C](v4);
    objc_msgSend(a1, "completionBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v10 = MEMORY[0x1E0C809B0];
      v11 = 3221225472;
      v12 = __62__CATransaction_CoreMaterialAdditions__mt_addCompletionBlock___block_invoke;
      v13 = &unk_1E58796F8;
      v14 = v7;
      v15 = v5;
      v9 = MEMORY[0x1AF42541C](&v10);

      v6 = (void *)v9;
    }
    objc_msgSend(a1, "setCompletionBlock:", v6, v10, v11, v12, v13);

  }
}

@end
