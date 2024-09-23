@implementation AVAssetDownloadDefaultAuxiliaryContentConfiguration

- (void)_setupContentConfigWithDownloadConfig:(FigStreamingAssetDownloadConfig *)a3 asset:(id)a4
{
  void *v6;
  uint64_t v7;
  NSPredicate *v8;
  AVAssetVariantQualifier *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(a4, "preferredMediaSelection", a3);
  v7 = objc_msgSend(v6, "selectedMediaOptionInMediaSelectionGroup:", objc_msgSend(a4, "mediaSelectionGroupForMediaCharacteristic:", CFSTR("AVMediaCharacteristicAudible")));
  if (v7)
  {
    v8 = +[AVAssetVariantQualifier predicateForChannelCount:mediaSelectionOption:operatorType:](AVAssetVariantQualifier, "predicateForChannelCount:mediaSelectionOption:operatorType:", 2, v7, 2);
    if (v8)
    {
      v9 = +[AVAssetVariantQualifier assetVariantQualifierWithPredicate:](AVAssetVariantQualifier, "assetVariantQualifierWithPredicate:", v8);
      if (v9)
      {
        v11[0] = v9;
        -[AVAssetDownloadContentConfiguration setVariantQualifiers:](self, "setVariantQualifiers:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1));
      }
    }
    if (!-[NSArray count](-[AVAssetDownloadContentConfiguration mediaSelections](self, "mediaSelections"), "count"))
    {
      v10 = v6;
      -[AVAssetDownloadContentConfiguration setMediaSelections:](self, "setMediaSelections:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1));
    }
  }
}

- (void)_serializeIntoDownloadConfig:(FigStreamingAssetDownloadConfig *)a3 asset:(id)a4
{
  NSObject *v7;
  objc_super v8;
  _QWORD v9[8];

  if (!-[NSArray count](-[AVAssetDownloadContentConfiguration variantQualifiers](self, "variantQualifiers"), "count"))
  {
    v7 = dispatch_semaphore_create(0);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __90__AVAssetDownloadDefaultAuxiliaryContentConfiguration__serializeIntoDownloadConfig_asset___block_invoke;
    v9[3] = &unk_1E3031940;
    v9[4] = a4;
    v9[5] = self;
    v9[6] = v7;
    v9[7] = a3;
    objc_msgSend(a4, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E3093BF8, v9);
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v7);
  }
  v8.receiver = self;
  v8.super_class = (Class)AVAssetDownloadDefaultAuxiliaryContentConfiguration;
  -[AVAssetDownloadContentConfiguration _serializeIntoDownloadConfig:asset:](&v8, sel__serializeIntoDownloadConfig_asset_, a3, a4);
}

intptr_t __90__AVAssetDownloadDefaultAuxiliaryContentConfiguration__serializeIntoDownloadConfig_asset___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", CFSTR("preferredMediaSelection"), 0) == 2)
    objc_msgSend(*(id *)(a1 + 40), "_setupContentConfigWithDownloadConfig:asset:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
