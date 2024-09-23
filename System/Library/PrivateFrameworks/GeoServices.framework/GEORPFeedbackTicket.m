@implementation GEORPFeedbackTicket

void __58___GEORPFeedbackTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v6 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
    v7 = v6;
    if (v5 && !v6)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

@end
