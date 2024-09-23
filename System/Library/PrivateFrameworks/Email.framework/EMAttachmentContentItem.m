@implementation EMAttachmentContentItem

void __88___EMAttachmentContentItem_requestRepresentationWithOptions_delegate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(v7, "contentURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setIsAvailableLocally:", v6 != 0);

  objc_msgSend(v7, "setContentItem:", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
