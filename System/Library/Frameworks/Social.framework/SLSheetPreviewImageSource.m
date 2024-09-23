@implementation SLSheetPreviewImageSource

- (ALAssetsLibrary)assetsLibrary
{
  ALAssetsLibrary *assetsLibrary;
  ALAssetsLibrary *v4;
  ALAssetsLibrary *v5;

  assetsLibrary = self->_assetsLibrary;
  if (!assetsLibrary)
  {
    v4 = (ALAssetsLibrary *)objc_alloc_init(MEMORY[0x1E0C91DB8]);
    v5 = self->_assetsLibrary;
    self->_assetsLibrary = v4;

    assetsLibrary = self->_assetsLibrary;
  }
  return assetsLibrary;
}

- (void)previewImageForAttachment:(id)a3 queueToBlockWhileDownsampling:(id)a4 resultBlock:(id)a5
{
  uint64_t v5;
  id v9;
  void (**v10)(id, uint64_t, double);
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  int v26;
  uint64_t v27;
  id v28;

  v28 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, double))a5;
  objc_msgSend(v28, "previewImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    _SLLog(v5, 6, CFSTR("previewImageForAttachment: previewImage for attachment is not nil so returning"));
    objc_msgSend(v28, "previewImage");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v13 = (void *)v12;
    v10[2](v10, v12, 0.0);

    goto LABEL_4;
  }
  if (objc_msgSend(v28, "type"))
  {
    if (SLAttachmentPayloadIsAssetLibraryURL(v28))
    {
      _SLLog(v5, 6, CFSTR("previewImageForAttachment: creating preview for asset URL"));
      objc_msgSend(v28, "payload");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "scheme");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("assets-library"));

      if (v16)
      {
        objc_msgSend(v28, "payload");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLSheetPreviewImageSource _fetchPreviewImageForAssetURL:resultBlock:](self, "_fetchPreviewImageForAssetURL:resultBlock:", v17, v10);
LABEL_24:

        goto LABEL_4;
      }
    }
    else
    {
      if ((SLAttachmentPayloadIsVideoFileURL(v28) & 1) != 0
        || objc_msgSend(v28, "type") == 8
        && (objc_msgSend(v28, "payloadSourceFileURL"),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            v26 = objc_msgSend(v25, "isFileURL"),
            v25,
            v26))
      {
        _SLLog(v5, 6, CFSTR("previewImageForAttachment: creating preview for video file URL"));
        if ((SLAttachmentPayloadIsVideoFileURL(v28) & 1) != 0)
          objc_msgSend(v28, "payload");
        else
          objc_msgSend(v28, "payloadSourceFileURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLSheetPreviewImageSource _generatePreviewImageForVideoFileURL:resultBlock:](self, "_generatePreviewImageForVideoFileURL:resultBlock:", v17, v10);
        goto LABEL_24;
      }
      v27 = objc_msgSend(v28, "type");
      _SLLog(v5, 3, CFSTR("previewImageForAttachment: Cannot create preview for attachment of type %i,returning fallback preview"));
    }
    +[SLSheetImagePreviewView fallbackPreviewImage](SLSheetImagePreviewView, "fallbackPreviewImage", v27);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  objc_msgSend(v28, "payload");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(v28, "payload");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageWithData:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "size");
    v23 = v22;
    objc_msgSend(v21, "size");
    if (v23 * v24 >= 262144.0)
    {
      _SLLog(v5, 6, CFSTR("previewImageForAttachment: Generating preview from downsampled payload"));
      -[SLSheetPreviewImageSource _generatePreviewImageForAttachment:queueToBlockWhileDownsampling:resultBlock:](self, "_generatePreviewImageForAttachment:queueToBlockWhileDownsampling:resultBlock:", v28, v9, v10);
    }
    else
    {
      _SLLog(v5, 6, CFSTR("previewImageForAttachment: Using payload as preview"));
      v10[2](v10, (uint64_t)v21, 0.0);
    }

  }
  else
  {
    _SLLog(v5, 6, CFSTR("previewImageForAttachment: No payload. Guess we need to wait until it loads."));
    v10[2](v10, 0, 0.0);
  }
LABEL_4:

}

- (void)_fetchPreviewImageForAssetURL:(id)a3 resultBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  -[SLSheetPreviewImageSource assetsLibrary](self, "assetsLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__SLSheetPreviewImageSource__fetchPreviewImageForAssetURL_resultBlock___block_invoke;
  v15[3] = &unk_1E7590588;
  v16 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __71__SLSheetPreviewImageSource__fetchPreviewImageForAssetURL_resultBlock___block_invoke_2;
  v12[3] = &unk_1E75905B0;
  v13 = v6;
  v14 = v16;
  v10 = v16;
  v11 = v6;
  objc_msgSend(v8, "assetForURL:resultBlock:failureBlock:", v11, v15, v12);

}

void __71__SLSheetPreviewImageSource__fetchPreviewImageForAssetURL_resultBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  v11 = a2;
  _SLLog(v2, 6, CFSTR("Fetched asset for asset URL, fetching preview"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:", objc_msgSend(v11, "aspectRatioThumbnail"));
  v5 = *MEMORY[0x1E0C91DA0];
  objc_msgSend(v11, "valueForProperty:", *MEMORY[0x1E0C91DA0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0C91DA8];

  if (v6 == v7)
  {
    v10 = 0.0;
  }
  else
  {
    objc_msgSend(v11, "valueForProperty:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

  }
  (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v10);

}

uint64_t __71__SLSheetPreviewImageSource__fetchPreviewImageForAssetURL_resultBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  _SLLog(v1, 6, CFSTR("Failed to fetch asset URL %@ with error %{public}@"));
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 40) + 16))(0.0);
}

- (void)_generatePreviewImageForAttachment:(id)a3 queueToBlockWhileDownsampling:(id)a4 resultBlock:(id)a5
{
  uint64_t v5;
  id v8;
  NSObject *v9;
  void (**v10)(id, _QWORD, double);
  void *v11;
  void *v12;
  id v13;
  _QWORD block[4];
  id v15;
  void (**v16)(id, _QWORD, double);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, double))a5;
  _SLLog(v5, 6, CFSTR("SLComposeServiceViewController-_generatePreviewImageForAttachment:%@"));
  if (objc_msgSend(v8, "type", v8)
    || (objc_msgSend(v8, "previewImage"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    _SLLog(v5, 3, CFSTR("_generatePreviewImageForAttachment called for non-image payload attachment"));
    v10[2](v10, 0, 0.0);
  }
  else
  {
    _SLLog(v5, 6, CFSTR("Image attachment with nil preview - triggering thumbnail generation"));
    objc_msgSend(v8, "payload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__SLSheetPreviewImageSource__generatePreviewImageForAttachment_queueToBlockWhileDownsampling_resultBlock___block_invoke;
    block[3] = &unk_1E7590480;
    v15 = v12;
    v16 = v10;
    v13 = v12;
    dispatch_async(v9, block);

  }
}

void __106__SLSheetPreviewImageSource__generatePreviewImageForAttachment_queueToBlockWhileDownsampling_resultBlock___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  dispatch_semaphore_t v7;
  id v8;

  v2 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __106__SLSheetPreviewImageSource__generatePreviewImageForAttachment_queueToBlockWhileDownsampling_resultBlock___block_invoke_2;
  v6[3] = &unk_1E7590600;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  +[SLImageDownsampling generateThumbnailFromImageData:adjustSmallestSideToSize:resultsHandler:](SLImageDownsampling, "generateThumbnailFromImageData:adjustSmallestSideToSize:resultsHandler:", v3, 200, v6);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

}

void __106__SLSheetPreviewImageSource__generatePreviewImageForAttachment_queueToBlockWhileDownsampling_resultBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__SLSheetPreviewImageSource__generatePreviewImageForAttachment_queueToBlockWhileDownsampling_resultBlock___block_invoke_3;
  block[3] = &unk_1E75905D8;
  v6 = v3;
  v8 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __106__SLSheetPreviewImageSource__generatePreviewImageForAttachment_queueToBlockWhileDownsampling_resultBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = (id)v2;
  (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(0.0);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)_generatePreviewImageForVideoFileURL:(id)a3 resultBlock:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  AVAssetImageGenerator *assetImageGenerator;
  AVAssetImageGenerator *v14;
  AVAssetImageGenerator *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  CMTime v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _SLLog(v4, 7, CFSTR("SLSheetPreviewImageSource _generatePreviewImageForVideoFileURL: %@"));
  v9 = objc_alloc(MEMORY[0x1E0C8B3C0]);
  v10 = *MEMORY[0x1E0C8AD90];
  v25[0] = *MEMORY[0x1E0C8ADA0];
  v25[1] = v10;
  v26[0] = &unk_1E75ADDC0;
  v26[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithURL:options:", v7, v11);

  _SLLog(v4, 7, CFSTR("SLSheetPreviewImageSource _generatePreviewImageForVideoFileURL: got asset %@"));
  if (v12)
  {
    assetImageGenerator = self->_assetImageGenerator;
    if (!assetImageGenerator)
    {
      v14 = (AVAssetImageGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFC8]), "initWithAsset:", v12, v12);
      v15 = self->_assetImageGenerator;
      self->_assetImageGenerator = v14;

      -[AVAssetImageGenerator setAppliesPreferredTrackTransform:](self->_assetImageGenerator, "setAppliesPreferredTrackTransform:", 1);
      assetImageGenerator = self->_assetImageGenerator;
    }
    v16 = (void *)MEMORY[0x1E0CB3B18];
    CMTimeMakeWithSeconds(&v23, 0.0, 1);
    objc_msgSend(v16, "valueWithCMTime:", &v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __78__SLSheetPreviewImageSource__generatePreviewImageForVideoFileURL_resultBlock___block_invoke;
    v19[3] = &unk_1E7590650;
    v20 = v12;
    v22 = v8;
    v21 = v7;
    -[AVAssetImageGenerator generateCGImagesAsynchronouslyForTimes:completionHandler:](assetImageGenerator, "generateCGImagesAsynchronouslyForTimes:completionHandler:", v18, v19);

  }
  else
  {
    _SLLog(v4, 3, CFSTR("Could not create AVAsset from %@"));
    (*((void (**)(id, _QWORD, double))v8 + 2))(v8, 0, 0.0);
  }

}

void __78__SLSheetPreviewImageSource__generatePreviewImageForVideoFileURL_resultBlock___block_invoke(id *a1, uint64_t a2, CGImage *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v6;
  void *v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  CGImage *v17;

  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a6;
  objc_msgSend(v10, "numberWithInteger:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v6, 7, CFSTR("SLSheetPreviewImageSource _generatePreviewImageForVideoFileURL: did generate image %@ result %@ error %{public}@"));

  if (a3)
    CGImageRetain(a3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__SLSheetPreviewImageSource__generatePreviewImageForVideoFileURL_resultBlock___block_invoke_2;
  block[3] = &unk_1E7590628;
  v17 = a3;
  v14 = a1[4];
  v16 = a1[6];
  v15 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __78__SLSheetPreviewImageSource__generatePreviewImageForVideoFileURL_resultBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  uint64_t v5;

  if (*(_QWORD *)(a1 + 56))
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
      objc_msgSend(v3, "duration");
    _SLLog(v1, 3, CFSTR("Video duration CMTime.flags kCMTimeFlags_Valid is not set"));
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", *(_QWORD *)(a1 + 56), v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(0.0);
    CGImageRelease(*(CGImageRef *)(a1 + 56));

  }
  else
  {
    _SLLog(v1, 6, CFSTR("AVAssetImageGenerator failed for %@"));
    (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(0.0);
  }
}

- (void)cancelVideoPreviewGeneration
{
  -[AVAssetImageGenerator cancelAllCGImageGeneration](self->_assetImageGenerator, "cancelAllCGImageGeneration");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetImageGenerator, 0);
  objc_storeStrong((id *)&self->_assetsLibrary, 0);
}

@end
