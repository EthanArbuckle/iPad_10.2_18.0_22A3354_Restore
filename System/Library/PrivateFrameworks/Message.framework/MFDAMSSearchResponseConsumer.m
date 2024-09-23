@implementation MFDAMSSearchResponseConsumer

id __45___MFDAMSSearchResponseConsumer_handleItems___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "mailbox");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __45___MFDAMSSearchResponseConsumer_handleItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 64);
  objc_msgSend(*(id *)(v6 + 56), "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) += insertDAMessages(v5, v7, v8, v9, 1, 0);

}

@end
