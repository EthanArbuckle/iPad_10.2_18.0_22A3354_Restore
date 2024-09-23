@implementation DRContextSetOnCommitComplete

void __DRContextSetOnCommitComplete_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)(a3 + 8);
  if (!a3)
    v5 = 0;
  v6 = v5;
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

}

@end
