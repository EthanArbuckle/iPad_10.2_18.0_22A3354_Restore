@implementation AVURLAsset(MPCModelPlaybackAssetCacheProvidingInternalAdditions)

- (void)mpc_addDownloadCompletionHandler:()MPCModelPlaybackAssetCacheProvidingInternalAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _MPCURLAssetDownloadCompletionObserver *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_getAssociatedObject(a1, (const void *)_MPCAVURLAssetAssociatedKeyModelPlaybackDownloadCompletionObserver);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "completionHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __101__AVURLAsset_MPCModelPlaybackAssetCacheProvidingInternalAdditions__mpc_addDownloadCompletionHandler___block_invoke_2;
      v9[3] = &unk_24CAB1980;
      v10 = v7;
      v11 = v4;
      v8 = v7;
      objc_msgSend(v6, "setCompletionHandler:", v9);

    }
    else
    {
      v8 = -[_MPCURLAssetDownloadCompletionObserver initWithAsset:]([_MPCURLAssetDownloadCompletionObserver alloc], "initWithAsset:", a1);
      objc_initWeak(&location, a1);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __101__AVURLAsset_MPCModelPlaybackAssetCacheProvidingInternalAdditions__mpc_addDownloadCompletionHandler___block_invoke;
      v12[3] = &unk_24CAB1958;
      objc_copyWeak(&v14, &location);
      v13 = v4;
      -[_MPCURLAssetDownloadCompletionObserver setCompletionHandler:](v8, "setCompletionHandler:", v12);
      objc_setAssociatedObject(a1, (const void *)_MPCAVURLAssetAssociatedKeyModelPlaybackDownloadCompletionObserver, v8, (void *)1);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }

  }
}

@end
