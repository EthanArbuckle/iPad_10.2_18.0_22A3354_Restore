@implementation WFContentItem

uint64_t __87__WFContentItem_ShareableObjects__getShareableObjectOfTypes_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__WFContentItem_ShareableObjects__getShareableObjectOfTypes_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a4;
  objc_msgSend(a2, "platformImage");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v7, v6);

}

@end
