@implementation GEOPlacePhotoLookupTicket

void __64___GEOPlacePhotoLookupTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(a2, "resultsWithResultType:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64___GEOPlacePhotoLookupTicket_submitWithHandler_networkActivity___block_invoke_2;
    v7[3] = &unk_1E1C06A60;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    +[GEOPlacePhotoLookupResult buildVendorLookupResultForPlaceWithCaptionedPhotos:mapItemIdentifier:originalRange:completion:](GEOPlacePhotoLookupResult, "buildVendorLookupResultForPlaceWithCaptionedPhotos:mapItemIdentifier:originalRange:completion:", v5, v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v7);

  }
}

uint64_t __64___GEOPlacePhotoLookupTicket_submitWithHandler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
