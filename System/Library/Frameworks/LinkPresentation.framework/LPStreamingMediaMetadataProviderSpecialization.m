@implementation LPStreamingMediaMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 16;
}

+ (id)specializedMetadataProviderForResourceWithContext:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  LPStreamingMediaMetadataProviderSpecialization *v6;

  v3 = a3;
  objc_msgSend(v3, "MIMEType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[LPMIMETypeRegistry isMediaType:](LPMIMETypeRegistry, "isMediaType:", v4);

  if (v5)
    v6 = -[LPMetadataProviderSpecialization initWithContext:]([LPStreamingMediaMetadataProviderSpecialization alloc], "initWithContext:", v3);
  else
    v6 = 0;

  return v6;
}

- (void)start
{
  LPFetcherConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  LPMediaAssetFetcher *v7;
  LPMediaAssetFetcher *fetcher;
  void *v9;
  LPMediaAssetFetcher *v10;
  _QWORD v11[5];

  v3 = objc_alloc_init(LPFetcherConfiguration);
  -[LPMetadataProviderSpecialization context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPFetcherConfiguration setWebViewForProcessSharing:](v3, "setWebViewForProcessSharing:", v5);

  -[LPMetadataProviderSpecialization context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPFetcherConfiguration setFetchIsNotUserInitiated:](v3, "setFetchIsNotUserInitiated:", objc_msgSend(v6, "fetchIsNotUserInitiated"));

  v7 = objc_alloc_init(LPMediaAssetFetcher);
  fetcher = self->_fetcher;
  self->_fetcher = v7;

  -[LPMetadataProviderSpecialization URL](self, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPMediaAssetFetcher setURL:](self->_fetcher, "setURL:", v9);

  v10 = self->_fetcher;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__LPStreamingMediaMetadataProviderSpecialization_start__block_invoke;
  v11[3] = &unk_1E44A7E28;
  v11[4] = self;
  -[LPMediaAssetFetcher fetchWithConfiguration:completionHandler:](v10, "fetchWithConfiguration:completionHandler:", v3, v11);

}

void __55__LPStreamingMediaMetadataProviderSpecialization_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *v4;
  void *v5;
  id v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  __int128 v20;
  uint64_t v21;
  _QWORD block[5];
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_BYTE **)(a1 + 32);
  if (!v4[24])
  {
    if (!v3)
    {
LABEL_5:
      objc_msgSend(v4, "fail");
      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = *(_BYTE **)(a1 + 32);
      goto LABEL_5;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "audio");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __55__LPStreamingMediaMetadataProviderSpecialization_start__block_invoke_2;
        block[3] = &unk_1E44A7D10;
        block[4] = *(_QWORD *)(a1 + 32);
        v7 = &v23;
        v6 = v5;
        v23 = v6;
        dispatch_async(MEMORY[0x1E0C80D38], block);
LABEL_11:

LABEL_13:
        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(v3, "video");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v8;
      if (v8)
      {
        v9 = (void *)MEMORY[0x1E0C8AFC8];
        objc_msgSend(v8, "_asset");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "assetImageGeneratorWithAsset:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setMaximumSize:", 900.0, 900.0);
        v14 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
        v20 = *MEMORY[0x1E0CA2E68];
        v21 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __55__LPStreamingMediaMetadataProviderSpecialization_start__block_invoke_3;
        v18[3] = &unk_1E44A7E00;
        v18[4] = *(_QWORD *)(a1 + 32);
        v17 = v6;
        v19 = v17;
        objc_msgSend(v14, "generateCGImagesAsynchronouslyForTimes:completionHandler:", v16, v18);

        v7 = &v19;
        v6 = v17;
        goto LABEL_11;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "fail");
    goto LABEL_13;
  }
LABEL_14:

}

void __55__LPStreamingMediaMetadataProviderSpecialization_start__block_invoke_2(uint64_t a1)
{
  LPLinkMetadata *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  LPAudioMetadata *v15;
  id v16;
  id v17;
  LPFileMetadata *v18;

  v2 = objc_alloc_init(LPLinkMetadata);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

  objc_msgSend(*(id *)(a1 + 32), "URL");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setURL:");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setAudio:", *(_QWORD *)(a1 + 40));
  v15 = objc_alloc_init(LPAudioMetadata);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setAudioMetadata:");

  objc_msgSend(*(id *)(a1 + 32), "URL");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "audioMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setURL:", v16);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "MIMEType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "audioMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setType:", v6);

  v18 = objc_alloc_init(LPFileMetadata);
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByDeletingPathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPFileMetadata setName:](v18, "setName:", v10);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "MIMEType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[LPMIMETypeRegistry UTIForMIMEType:](LPMIMETypeRegistry, "UTIForMIMEType:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPFileMetadata setType:](v18, "setType:", v13);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setSpecialization:", v18);
  objc_msgSend(*(id *)(a1 + 32), "done");

}

void __55__LPStreamingMediaMetadataProviderSpecialization_start__block_invoke_3(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8;
  void *v9;
  _QWORD block[5];
  id v11;
  const void *v12;

  v8 = a6;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    if (a3)
      CFRetain(a3);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__LPStreamingMediaMetadataProviderSpecialization_start__block_invoke_4;
    block[3] = &unk_1E44A7DD8;
    v9 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    v12 = a3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __55__LPStreamingMediaMetadataProviderSpecialization_start__block_invoke_4(uint64_t a1)
{
  LPLinkMetadata *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  LPVideoMetadata *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = objc_alloc_init(LPLinkMetadata);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

  objc_msgSend(*(id *)(a1 + 32), "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setURL:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setVideo:", *(_QWORD *)(a1 + 40));
  v6 = objc_alloc_init(LPVideoMetadata);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setVideoMetadata:", v6);

  objc_msgSend(*(id *)(a1 + 32), "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "videoMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setURL:", v7);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "MIMEType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "videoMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setType:", v10);

  if (*(_QWORD *)(a1 + 48))
  {
    v12 = -[LPImage _initWithCGImage:]([LPImage alloc], "_initWithCGImage:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setImage:", v12);

    CFRelease(*(CFTypeRef *)(a1 + 48));
  }
  return objc_msgSend(*(id *)(a1 + 32), "done");
}

- (void)cancel
{
  self->_cancelled = 1;
  -[LPMediaAssetFetcher cancel](self->_fetcher, "cancel");
  -[AVAssetImageGenerator cancelAllCGImageGeneration](self->_videoImageGenerator, "cancelAllCGImageGeneration");
}

- (void)fail
{
  void *v3;

  -[LPMetadataProviderSpecialization delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataProviderSpecializationDidFail:", self);

  -[LPStreamingMediaMetadataProviderSpecialization cancel](self, "cancel");
}

- (void)done
{
  id v3;

  -[LPMetadataProviderSpecialization delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataProviderSpecialization:didCompleteWithMetadata:", self, self->_metadata);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_videoImageGenerator, 0);
  objc_storeStrong((id *)&self->_fetcher, 0);
}

@end
