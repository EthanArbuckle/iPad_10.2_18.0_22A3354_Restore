@implementation DRContextSetChangeObserver

void __DRContextSetChangeObserver_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v6 = *(_QWORD *)(a1 + 32);
  re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)(a4 + 8);
  if (!a4)
    v7 = 0;
  v8 = v7;
  (*(void (**)(uint64_t, id, uint64_t, id))(v6 + 16))(v6, v9, a3, v8);

}

@end
