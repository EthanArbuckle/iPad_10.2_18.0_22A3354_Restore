@implementation GCWebKitUserIntentRecognizer

void __68___GCWebKitUserIntentRecognizer_processChangedElements_atTimestamp___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *((_QWORD *)WeakRetained + 8);
    v5 = WeakRetained;
    v4 = objc_loadWeakRetained((id *)WeakRetained + 1);
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
    WeakRetained = v5;
  }

}

@end
