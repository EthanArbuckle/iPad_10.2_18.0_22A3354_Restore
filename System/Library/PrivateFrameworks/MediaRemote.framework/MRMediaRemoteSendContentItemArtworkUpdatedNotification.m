@implementation MRMediaRemoteSendContentItemArtworkUpdatedNotification

void ___onQueue_MRMediaRemoteSendContentItemArtworkUpdatedNotification_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "match:", a3))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

@end
