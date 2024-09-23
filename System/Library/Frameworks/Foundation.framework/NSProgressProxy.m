@implementation NSProgressProxy

void __51___NSProgressProxy__setRemoteUserInfoValue_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x186DA8F78]();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 48);
  v5.super_class = (Class)_NSProgressProxy;
  objc_msgSendSuper2(&v5, sel__setRemoteUserInfoValue_forKey_, v4, v3);
  objc_autoreleasePoolPop(v2);
}

void __46___NSProgressProxy__invokeUnpublishingHandler__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x186DA8F78]();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = 0;
  }
  objc_autoreleasePoolPop(v2);
}

void __45___NSProgressProxy__invokePublishingHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x186DA8F78]();
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if ((void *)v3 != v4)
  {
    v5 = (void *)v3;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = objc_msgSend(v5, "copy");
  }
  objc_autoreleasePoolPop(v2);
}

void __45___NSProgressProxy__setRemoteValues_forKeys___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x186DA8F78]();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 48);
  v5.super_class = (Class)_NSProgressProxy;
  objc_msgSendSuper2(&v5, sel__setRemoteValues_forKeys_, v4, v3);
  objc_autoreleasePoolPop(v2);
}

@end
