@implementation AFRecordCoreDuetContext

void __AFRecordCoreDuetContext_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(get_CDContextualKeyPathClass(), "keyPathWithKey:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_CDClientContextClass(), "userContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forContextualKeyPath:", *(_QWORD *)(a1 + 40), v3);

}

@end
