@implementation MRRequestPlaybackQueue

void ___MRRequestPlaybackQueue_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "subscriptionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subscribeToPlaybackQueue:forRequest:", v7, *(_QWORD *)(a1 + 40));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
