@implementation IMBalloonPluginManager

void __93__IMBalloonPluginManager_ChatKitAdditions__balloonControllerForIMChatItem_contextIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "message");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKSnapshotUtilities cacheSnapshot:guid:postChangeNotification:](CKSnapshotUtilities, "cacheSnapshot:guid:postChangeNotification:", v3, v4, 1);

}

@end
