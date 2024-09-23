@implementation MPModelShimRequestMiddlewareOperation

void __49___MPModelShimRequestMiddlewareOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  MPNotificationObserver *v8;
  id v9;
  MPNotificationObserver *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && (objc_msgSend(v5, "isValid") & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) + 16))();
  }
  else
  {
    v7 = (void *)MEMORY[0x19403A810](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280));
    v8 = [MPNotificationObserver alloc];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __49___MPModelShimRequestMiddlewareOperation_execute__block_invoke_2;
    v14[3] = &unk_1E3154970;
    v15 = v7;
    v9 = v7;
    v10 = -[MPNotificationObserver initWithName:object:handler:](v8, "initWithName:object:handler:", CFSTR("MPModelResponseDidInvalidateNotification"), v5, v14);
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 272);
    *(_QWORD *)(v12 + 272) = v11;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "setModelResponse:", v5);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);

}

uint64_t __49___MPModelShimRequestMiddlewareOperation_execute__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
