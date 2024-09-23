@implementation INDaemonConnectionProvider

- (void)renewCredentialsWithCompletion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v4 = (void *)getINDaemonConnectionClass_softClass;
  v15 = getINDaemonConnectionClass_softClass;
  v5 = MEMORY[0x24BDAC760];
  if (!getINDaemonConnectionClass_softClass)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __getINDaemonConnectionClass_block_invoke;
    v11[3] = &unk_2509E0700;
    v11[4] = &v12;
    __getINDaemonConnectionClass_block_invoke((uint64_t)v11);
    v4 = (void *)v13[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v12, 8);
  v7 = objc_alloc_init(v6);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __61__INDaemonConnectionProvider_renewCredentialsWithCompletion___block_invoke;
  v9[3] = &unk_2509E06D8;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "renewCredentialsWithCompletion:", v9);

}

uint64_t __61__INDaemonConnectionProvider_renewCredentialsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
