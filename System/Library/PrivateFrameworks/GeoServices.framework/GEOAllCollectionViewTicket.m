@implementation GEOAllCollectionViewTicket

void __65___GEOAllCollectionViewTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65___GEOAllCollectionViewTicket_submitWithHandler_networkActivity___block_invoke_2;
  v6[3] = &unk_1E1C06C78;
  v5 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v5, "parseAllCollectionViewResponse:usingError:onCompletionHandler:", a2, a3, v6);

}

uint64_t __65___GEOAllCollectionViewTicket_submitWithHandler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __93___GEOAllCollectionViewTicket_parseAllCollectionViewResponse_usingError_onCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "resultType") == 1)
  {
    if (objc_msgSend(v7, "hasPlace"))
    {
      objc_msgSend(v7, "place");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "status");

      if (!v4)
      {
        v5 = *(void **)(a1 + 32);
        objc_msgSend(v7, "place");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v6);

      }
    }
  }

}

@end
