@implementation FCCoreConfigurationPromise

uint64_t __FCCoreConfigurationPromise_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __FCCoreConfigurationPromise_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __FCCoreConfigurationPromise_block_invoke_2;
  v10[3] = &unk_1E463EF38;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  FCCoreConfigurationFetch(v7, v10);

}

@end
