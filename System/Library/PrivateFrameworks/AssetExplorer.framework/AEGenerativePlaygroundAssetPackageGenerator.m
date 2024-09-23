@implementation AEGenerativePlaygroundAssetPackageGenerator

- (id)generatePackageFromGenerativePlaygroundAsset:(id)a3
{
  id v3;
  AEMutableAssetPackage *v4;
  void *v5;
  AEMutableAssetPackage *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  v4 = [AEMutableAssetPackage alloc];
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AEMutableAssetPackage initWithAssetIdentifier:](v4, "initWithAssetIdentifier:", v5);

  objc_msgSend(v3, "imageURLWrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF8410], "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEMutableAssetPackage storeURL:forType:](v6, "storeURL:forType:", v8, v9);

  objc_msgSend(v3, "previewImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEMutableAssetPackage setSidecarObject:forKey:](v6, "setSidecarObject:forKey:", v10, CFSTR("com.apple.assetexplorer.asset-preview-image"));

  objc_msgSend(v3, "recipeData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "underlyingData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEMutableAssetPackage setSidecarObject:forKey:](v6, "setSidecarObject:forKey:", v12, CFSTR("com.apple.assetexplorer.generatedimagerecipe"));

  v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "pixelWidth");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forKey:", v14, CFSTR("AEAssetPackageDisplayPixelWidth"));

  objc_msgSend(v3, "pixelHeight");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forKey:", v15, CFSTR("AEAssetPackageDisplayPixelHeight"));

  objc_msgSend(v3, "creationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setValue:forKey:", v16, CFSTR("AEAssetPackageDisplayCreationDate"));
  objc_msgSend(v13, "setValue:forKey:", &unk_24E244168, CFSTR("AEAssetPackageDisplayMediaType"));
  objc_msgSend(v13, "setValue:forKey:", &unk_24E244180, CFSTR("AEAssetPackageDisplayPlaybackStyle"));
  -[AEMutableAssetPackage addSidecarEntriesFromDictionary:](v6, "addSidecarEntriesFromDictionary:", v13);

  return v6;
}

@end
