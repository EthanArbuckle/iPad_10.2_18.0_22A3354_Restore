@implementation AECameraAssetPackageGenerator

- (AECameraAssetPackageGenerator)init
{
  AECameraAssetPackageGenerator *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *generationQueue;
  AECameraAssetPackageGenerator *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AECameraAssetPackageGenerator;
  v2 = -[AECameraAssetPackageGenerator init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(MEMORY[0x24BDAC9C0], QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.asset-explorer.camera-package-generation", v3);
    generationQueue = v2->__generationQueue;
    v2->__generationQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)_populatePackage:(id)a3 fromReviewAsset:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, id, void *);
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, id, void *))a5;
  v10 = objc_msgSend(v8, "playbackStyle");
  if ((unint64_t)(v10 - 1) <= 1)
  {
    objc_msgSend(v8, "providedFullsizeImageURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "providedFullsizeRenderImageURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BDF8410], "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    if (v12)
    {
      objc_msgSend(v7, "storeURL:forType:", v12, v13);

      objc_msgSend(v7, "storeURL:forType:", v11, CFSTR("com.apple.assetexplorer.editedoriginalimage"));
LABEL_28:

      if (v7)
      {
        objc_msgSend(v8, "providedPreviewImage");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
          objc_msgSend(v7, "setSidecarObject:forKey:", v26, CFSTR("com.apple.assetexplorer.asset-preview-image"));

      }
      v25 = 0;
      goto LABEL_33;
    }
    goto LABEL_12;
  }
  if (v10 == 3)
  {
    objc_msgSend(v8, "providedFullsizeImageURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "providedFullsizeRenderImageURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && v11)
    {
      objc_msgSend(v7, "storeURL:forType:", v11, CFSTR("com.apple.assetexplorer.editedoriginalimage"));
      objc_msgSend((id)*MEMORY[0x24BDF8410], "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v7;
      v17 = v12;
    }
    else
    {
      if (!v11)
      {
        PLAssetExplorerGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v29 = 138543362;
          v30 = 0;
          _os_log_impl(&dword_21E23A000, v27, OS_LOG_TYPE_ERROR, "<Camera> Failed to store live photo image URL %{public}@ into live photo asset package!", (uint8_t *)&v29, 0xCu);
        }

        v7 = 0;
LABEL_17:
        objc_msgSend(v8, "providedVideoURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "providedFullsizeRenderVideoURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20 && v13)
        {
          objc_msgSend(v7, "storeURL:forType:", v13, CFSTR("com.apple.assetexplorer.editedoriginalvideo"));
          objc_msgSend((id)*MEMORY[0x24BDF84B8], "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v7;
          v23 = v20;
        }
        else
        {
          if (!v13)
          {
            PLAssetExplorerGetLog();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              v29 = 138543362;
              v30 = 0;
              _os_log_impl(&dword_21E23A000, v28, OS_LOG_TYPE_ERROR, "<Camera> Failed to store live photo video URL %{public}@ into live photo asset package!", (uint8_t *)&v29, 0xCu);
            }

            v21 = v7;
            v7 = 0;
            goto LABEL_26;
          }
          objc_msgSend((id)*MEMORY[0x24BDF84B8], "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v7;
          v23 = v13;
        }
        objc_msgSend(v22, "storeURL:forType:", v23, v21);
LABEL_26:

        goto LABEL_27;
      }
      objc_msgSend((id)*MEMORY[0x24BDF8410], "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v7;
      v17 = v11;
    }
    objc_msgSend(v16, "storeURL:forType:", v17, v15);

    goto LABEL_17;
  }
  if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    objc_msgSend(v8, "providedVideoURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "providedFullsizeRenderVideoURL");
    v18 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v18;
    if (!v11 || v18)
    {
      if (!v11 || !v18)
        goto LABEL_28;
      objc_msgSend(v7, "storeURL:forType:", v11, CFSTR("com.apple.assetexplorer.editedoriginalvideo"));
      objc_msgSend((id)*MEMORY[0x24BDF84B8], "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v7;
      v19 = v12;
      goto LABEL_13;
    }
    objc_msgSend((id)*MEMORY[0x24BDF84B8], "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
LABEL_12:
    v19 = v11;
LABEL_13:
    objc_msgSend(v14, "storeURL:forType:", v19, v13);
LABEL_27:

    goto LABEL_28;
  }
  PLAssetExplorerGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_21E23A000, v24, OS_LOG_TYPE_ERROR, "<Camera> Failed to generate an asset package – no suitable data is available", (uint8_t *)&v29, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("AECameraAssetPackageGeneratorErrorDomain"), -47201, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
LABEL_33:
  objc_msgSend(v7, "storeMetadataFromReviewAsset:", v8);
  if (v9)
    v9[2](v9, v7, v25);

}

- (void)generatePackageFromReviewAsset:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  AECameraAssetPackageGenerator *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[AECameraAssetPackageGenerator _generationQueue](self, "_generationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__AECameraAssetPackageGenerator_generatePackageFromReviewAsset_withCompletionHandler___block_invoke;
  block[3] = &unk_24E23BB08;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (OS_dispatch_queue)_generationQueue
{
  return self->__generationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__generationQueue, 0);
}

void __86__AECameraAssetPackageGenerator_generatePackageFromReviewAsset_withCompletionHandler___block_invoke(uint64_t a1)
{
  AEMutableAssetPackage *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[AEMutableAssetPackage initWithAssetIdentifier:]([AEMutableAssetPackage alloc], "initWithAssetIdentifier:", v3);
  objc_msgSend(*(id *)(a1 + 40), "_populatePackage:fromReviewAsset:withCompletionHandler:", v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

@end
