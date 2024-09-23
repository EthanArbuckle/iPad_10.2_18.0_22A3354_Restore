@implementation CAMAssetTransportController

- (CAMAssetTransportController)initWithConversation:(id)a3 packageGeneratorClass:(Class)a4 statisticsManagerClass:(Class)a5 previewImageKey:(id)a6
{
  id v11;
  id v12;
  CAMAssetTransportController *v13;
  CAMAssetTransportController *v14;
  AECameraAssetPackageGenerator *v15;
  AECameraAssetPackageGenerator *assetPackageGenerator;
  AEChatKitStatisticsManager *v17;
  AEChatKitStatisticsManager *statisticsManager;
  CAMAssetTransportController *v19;
  objc_super v21;

  v11 = a3;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CAMAssetTransportController;
  v13 = -[CAMAssetTransportController init](&v21, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->__activeConversation, a3);
    v15 = (AECameraAssetPackageGenerator *)objc_alloc_init(a4);
    assetPackageGenerator = v14->__assetPackageGenerator;
    v14->__assetPackageGenerator = v15;

    objc_storeStrong((id *)&v14->__previewImageKey, a6);
    v17 = (AEChatKitStatisticsManager *)objc_alloc_init(a5);
    statisticsManager = v14->__statisticsManager;
    v14->__statisticsManager = v17;

    v19 = v14;
  }

  return v14;
}

- (void)stageAsset:(id)a3 suppressLivePhoto:(BOOL)a4 mediaOrigin:(int64_t)a5 completion:(id)a6
{
  -[CAMAssetTransportController _transportAsset:toShelf:suppressLivePhoto:mediaOrigin:completion:](self, "_transportAsset:toShelf:suppressLivePhoto:mediaOrigin:completion:", a3, 1, a4, a5, a6);
}

- (void)sendAsset:(id)a3 suppressLivePhoto:(BOOL)a4 mediaOrigin:(int64_t)a5 completion:(id)a6
{
  -[CAMAssetTransportController _transportAsset:toShelf:suppressLivePhoto:mediaOrigin:completion:](self, "_transportAsset:toShelf:suppressLivePhoto:mediaOrigin:completion:", a3, 0, a4, a5, a6);
}

- (void)_transportAsset:(id)a3 toShelf:(BOOL)a4 suppressLivePhoto:(BOOL)a5 mediaOrigin:(int64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  AECameraAssetPackageGenerator *assetPackageGenerator;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  int64_t v29;
  BOOL v30;
  BOOL v31;

  v12 = a3;
  v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CAMAssetTransportController _activeConversation](self, "_activeConversation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CAMAssetTransportController _previewImageKey](self, "_previewImageKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CAMAssetTransportController _statisticsManager](self, "_statisticsManager"));
  assetPackageGenerator = self->__assetPackageGenerator;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100002EE4;
  v23[3] = &unk_1000145A0;
  v30 = a5;
  v24 = v15;
  v25 = v12;
  v31 = a4;
  v26 = v14;
  v27 = v16;
  v28 = v13;
  v29 = a6;
  v18 = v13;
  v19 = v16;
  v20 = v14;
  v21 = v12;
  v22 = v15;
  -[AECameraAssetPackageGenerator generatePackageFromReviewAsset:withCompletionHandler:](assetPackageGenerator, "generatePackageFromReviewAsset:withCompletionHandler:", v21, v23);

}

- (MSConversation)_activeConversation
{
  return self->__activeConversation;
}

- (AECameraAssetPackageGenerator)_assetPackageGenerator
{
  return self->__assetPackageGenerator;
}

- (AEChatKitStatisticsManager)_statisticsManager
{
  return self->__statisticsManager;
}

- (NSString)_previewImageKey
{
  return self->__previewImageKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__previewImageKey, 0);
  objc_storeStrong((id *)&self->__statisticsManager, 0);
  objc_storeStrong((id *)&self->__assetPackageGenerator, 0);
  objc_storeStrong((id *)&self->__activeConversation, 0);
}

@end
