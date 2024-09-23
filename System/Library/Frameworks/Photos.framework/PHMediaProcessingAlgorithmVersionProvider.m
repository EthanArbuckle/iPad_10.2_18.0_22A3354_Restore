@implementation PHMediaProcessingAlgorithmVersionProvider

- (PHMediaProcessingAlgorithmVersionProvider)initWithSceneAnalysisVersion:(signed __int16)a3 faceAnalysisVersion:(signed __int16)a4 characterRecognitionAlgorithmVersion:(signed __int16)a5 visualSearchAlgorithmVersion:(signed __int16)a6 stickerConfidenceAlgorithmVersion:(signed __int16)a7 vaAnalysisVersion:(signed __int16)a8 mediaAnalysisVersion:(unint64_t)a9
{
  uint64_t v10;
  uint64_t v11;

  WORD1(v11) = a9;
  LOWORD(v11) = a9;
  LODWORD(v10) = (unsigned __int16)a8;
  return -[PHMediaProcessingAlgorithmVersionProvider initWithSceneAnalysisVersion:imageEmbeddingVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:](self, "initWithSceneAnalysisVersion:imageEmbeddingVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:", a3, 0, a4, a5, a6, a7, v10, a9, v11);
}

- (PHMediaProcessingAlgorithmVersionProvider)initWithSceneAnalysisVersion:(signed __int16)a3 faceAnalysisVersion:(signed __int16)a4 characterRecognitionAlgorithmVersion:(signed __int16)a5 visualSearchAlgorithmVersion:(signed __int16)a6 stickerConfidenceAlgorithmVersion:(signed __int16)a7 vaAnalysisVersion:(signed __int16)a8 mediaAnalysisVersion:(unint64_t)a9 mediaAnalysisImageVersion:(signed __int16)a10
{
  uint64_t v11;
  unsigned int v12;

  HIWORD(v12) = a10;
  LOWORD(v12) = a10;
  LOWORD(v11) = 0;
  return -[PHMediaProcessingAlgorithmVersionProvider initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:](self, "initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:", a3, a4, a5, a6, a7, a8, v11, a9, v12);
}

- (PHMediaProcessingAlgorithmVersionProvider)initWithSceneAnalysisVersion:(signed __int16)a3 imageEmbeddingVersion:(signed __int16)a4 faceAnalysisVersion:(signed __int16)a5 characterRecognitionAlgorithmVersion:(signed __int16)a6 visualSearchAlgorithmVersion:(signed __int16)a7 stickerConfidenceAlgorithmVersion:(signed __int16)a8 vaAnalysisVersion:(signed __int16)a9 vaLocationAnalysisVersion:(signed __int16)a10 mediaAnalysisVersion:(unint64_t)a11 mediaAnalysisImageVersion:(signed __int16)a12
{
  uint64_t v13;
  uint64_t v14;

  HIWORD(v14) = a4;
  WORD2(v14) = a4;
  WORD1(v14) = a12;
  LOWORD(v14) = a12;
  LOWORD(v13) = a10;
  return -[PHMediaProcessingAlgorithmVersionProvider initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:](self, "initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:", a3, a5, a6, a7, a8, a9, v13, a11, v14);
}

- (PHMediaProcessingAlgorithmVersionProvider)initWithSceneAnalysisVersion:(signed __int16)a3 imageEmbeddingVersion:(signed __int16)a4 faceAnalysisVersion:(signed __int16)a5 characterRecognitionAlgorithmVersion:(signed __int16)a6 visualSearchAlgorithmVersion:(signed __int16)a7 stickerConfidenceAlgorithmVersion:(signed __int16)a8 vaAnalysisVersion:(signed __int16)a9 vaLocationAnalysisVersion:(signed __int16)a10 mediaAnalysisVersion:(unint64_t)a11 mediaAnalysisImageVersion:(signed __int16)a12 captionGenerationVersion:(signed __int16)a13
{
  uint64_t v14;
  uint64_t v15;

  HIWORD(v15) = a4;
  WORD2(v15) = a4;
  LODWORD(v15) = __PAIR32__(a13, a12);
  LOWORD(v14) = a10;
  return -[PHMediaProcessingAlgorithmVersionProvider initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:](self, "initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:", a3, a5, a6, a7, a8, a9, v14, a11, v15);
}

- (PHMediaProcessingAlgorithmVersionProvider)initWithSceneAnalysisVersion:(signed __int16)a3 faceAnalysisVersion:(signed __int16)a4 characterRecognitionAlgorithmVersion:(signed __int16)a5 visualSearchAlgorithmVersion:(signed __int16)a6 stickerConfidenceAlgorithmVersion:(signed __int16)a7 vaAnalysisVersion:(signed __int16)a8 vaLocationAnalysisVersion:(signed __int16)a9 mediaAnalysisVersion:(unint64_t)a10 mediaAnalysisImageVersion:(signed __int16)a11 captionGenerationVersion:(signed __int16)a12 imageEmbeddingVersion:(signed __int16)a13 videoEmbeddingVersion:(signed __int16)a14
{
  PHMediaProcessingAlgorithmVersionProvider *result;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PHMediaProcessingAlgorithmVersionProvider;
  result = -[PHMediaProcessingAlgorithmVersionProvider init](&v21, sel_init);
  if (result)
  {
    result->_sceneAnalysisVersion = a3;
    result->_faceAnalysisVersion = a4;
    result->_characterRecognitionAlgorithmVersion = a5;
    result->_visualSearchAlgorithmVersion = a6;
    result->_stickerConfidenceAlgorithmVersion = a7;
    result->_vaAnalysisVersion = a8;
    result->_vaLocationAnalysisVersion = a9;
    result->_mediaAnalysisVersion = a10;
    result->_mediaAnalysisImageVersion = a11;
    result->_captionGenerationVersion = a12;
    result->_imageEmbeddingVersion = a13;
    result->_videoEmbeddingVersion = a14;
  }
  return result;
}

- (PHMediaProcessingAlgorithmVersionProvider)initWithProvider:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  PHMediaProcessingAlgorithmVersionProvider *v15;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;

  v3 = a3;
  v21 = objc_msgSend(v3, "sceneAnalysisVersion");
  v20 = objc_msgSend(v3, "faceAnalysisVersion");
  v19 = objc_msgSend(v3, "characterRecognitionAlgorithmVersion");
  v4 = objc_msgSend(v3, "visualSearchAlgorithmVersion");
  v5 = objc_msgSend(v3, "stickerConfidenceAlgorithmVersion");
  v6 = objc_msgSend(v3, "vaAnalysisVersion");
  v7 = PHOptionalVALocationAnalysisVersion(v3);
  v8 = objc_msgSend(v3, "mediaAnalysisVersion");
  v9 = PHMediaAnalysisImageVersionUsingFallback(v3);
  v10 = PHOptionalCaptionGenerationVersion(v3);
  v11 = v3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = objc_msgSend(v11, "imageEmbeddingVersion");
  else
    v12 = 0;

  v13 = v11;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = objc_msgSend(v13, "videoEmbeddingVersion");
  else
    v14 = 0;

  HIWORD(v18) = v14;
  WORD2(v18) = v12;
  WORD1(v18) = v10;
  LOWORD(v18) = v9;
  LOWORD(v17) = v7;
  v15 = -[PHMediaProcessingAlgorithmVersionProvider initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:](self, "initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:", v21, v20, v19, v4, v5, v6, v17, v8, v18);

  return v15;
}

- (signed)sceneAnalysisVersion
{
  return self->_sceneAnalysisVersion;
}

- (void)setSceneAnalysisVersion:(signed __int16)a3
{
  self->_sceneAnalysisVersion = a3;
}

- (signed)faceAnalysisVersion
{
  return self->_faceAnalysisVersion;
}

- (void)setFaceAnalysisVersion:(signed __int16)a3
{
  self->_faceAnalysisVersion = a3;
}

- (signed)characterRecognitionAlgorithmVersion
{
  return self->_characterRecognitionAlgorithmVersion;
}

- (void)setCharacterRecognitionAlgorithmVersion:(signed __int16)a3
{
  self->_characterRecognitionAlgorithmVersion = a3;
}

- (signed)visualSearchAlgorithmVersion
{
  return self->_visualSearchAlgorithmVersion;
}

- (void)setVisualSearchAlgorithmVersion:(signed __int16)a3
{
  self->_visualSearchAlgorithmVersion = a3;
}

- (signed)stickerConfidenceAlgorithmVersion
{
  return self->_stickerConfidenceAlgorithmVersion;
}

- (void)setStickerConfidenceAlgorithmVersion:(signed __int16)a3
{
  self->_stickerConfidenceAlgorithmVersion = a3;
}

- (signed)vaAnalysisVersion
{
  return self->_vaAnalysisVersion;
}

- (void)setVaAnalysisVersion:(signed __int16)a3
{
  self->_vaAnalysisVersion = a3;
}

- (signed)vaLocationAnalysisVersion
{
  return self->_vaLocationAnalysisVersion;
}

- (void)setVaLocationAnalysisVersion:(signed __int16)a3
{
  self->_vaLocationAnalysisVersion = a3;
}

- (unint64_t)mediaAnalysisVersion
{
  return self->_mediaAnalysisVersion;
}

- (void)setMediaAnalysisVersion:(unint64_t)a3
{
  self->_mediaAnalysisVersion = a3;
}

- (signed)mediaAnalysisImageVersion
{
  return self->_mediaAnalysisImageVersion;
}

- (void)setMediaAnalysisImageVersion:(signed __int16)a3
{
  self->_mediaAnalysisImageVersion = a3;
}

- (signed)captionGenerationVersion
{
  return self->_captionGenerationVersion;
}

- (void)setCaptionGenerationVersion:(signed __int16)a3
{
  self->_captionGenerationVersion = a3;
}

- (signed)imageEmbeddingVersion
{
  return self->_imageEmbeddingVersion;
}

- (void)setImageEmbeddingVersion:(signed __int16)a3
{
  self->_imageEmbeddingVersion = a3;
}

- (signed)videoEmbeddingVersion
{
  return self->_videoEmbeddingVersion;
}

- (void)setVideoEmbeddingVersion:(signed __int16)a3
{
  self->_videoEmbeddingVersion = a3;
}

+ (id)providerWithCurrentVersions
{
  id v3;
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
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0D718C8], "currentSceneVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSceneAnalysisVersion:", objc_msgSend(v4, "shortValue"));

  objc_msgSend(MEMORY[0x1E0D718C8], "currentFaceVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFaceAnalysisVersion:", objc_msgSend(v5, "shortValue"));

  objc_msgSend(MEMORY[0x1E0D718C8], "currentOCRAlgorithmVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCharacterRecognitionAlgorithmVersion:", objc_msgSend(v6, "shortValue"));

  objc_msgSend(MEMORY[0x1E0D718C8], "currentVisualSearchAlgorithmVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVisualSearchAlgorithmVersion:", objc_msgSend(v7, "shortValue"));

  objc_msgSend(MEMORY[0x1E0D718C8], "currentStickerConfidenceAlgorithmVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStickerConfidenceAlgorithmVersion:", objc_msgSend(v8, "shortValue"));

  objc_msgSend(MEMORY[0x1E0D718C8], "currentVaAnalysisAlgorithmVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVaAnalysisVersion:", objc_msgSend(v9, "shortValue"));

  objc_msgSend(MEMORY[0x1E0D718C8], "currentVaLocationAnalysisAlgorithmVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVaLocationAnalysisVersion:", objc_msgSend(v10, "shortValue"));

  objc_msgSend(MEMORY[0x1E0D718C8], "currentMediaAnalysisVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMediaAnalysisVersion:", objc_msgSend(v11, "unsignedLongLongValue"));

  objc_msgSend(MEMORY[0x1E0D718C8], "currentMediaAnalysisImageVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMediaAnalysisImageVersion:", objc_msgSend(v12, "shortValue"));

  objc_msgSend(MEMORY[0x1E0D718C8], "currentCaptionGenerationVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCaptionGenerationVersion:", objc_msgSend(v13, "shortValue"));

  objc_msgSend(MEMORY[0x1E0D718C8], "currentImageEmbeddingVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImageEmbeddingVersion:", objc_msgSend(v14, "shortValue"));

  objc_msgSend(MEMORY[0x1E0D718C8], "currentVideoEmbeddingVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVideoEmbeddingVersion:", objc_msgSend(v15, "shortValue"));

  PLPhotoKitGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "descriptionForVersionProvider:", v3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v17;
    _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_INFO, "providerWithCurrentVersions: %@", (uint8_t *)&v19, 0xCu);

  }
  return v3;
}

+ (id)descriptionForVersionProvider:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[12];
  _QWORD v24[14];

  v24[12] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("scene");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a3;
  objc_msgSend(v3, "numberWithShort:", objc_msgSend(v4, "sceneAnalysisVersion"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  v23[1] = CFSTR("face");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v4, "faceAnalysisVersion"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  v23[2] = CFSTR("ocr");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v4, "characterRecognitionAlgorithmVersion"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v20;
  v23[3] = CFSTR("vsearch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v4, "visualSearchAlgorithmVersion"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v19;
  v23[4] = CFSTR("sticker");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v4, "stickerConfidenceAlgorithmVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v5;
  v23[5] = CFSTR("va");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v4, "vaAnalysisVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v6;
  v23[6] = CFSTR("valoc");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", PHOptionalVALocationAnalysisVersion(v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v7;
  v23[7] = CFSTR("media");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "mediaAnalysisVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v8;
  v23[8] = CFSTR("mediai");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", PHMediaAnalysisImageVersionUsingFallback(v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v9;
  v23[9] = CFSTR("caption");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", PHOptionalCaptionGenerationVersion(v4));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v10;
  v23[10] = CFSTR("iembed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v4, "imageEmbeddingVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[10] = v11;
  v23[11] = CFSTR("vembed");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = objc_msgSend(v4, "videoEmbeddingVersion");

  objc_msgSend(v12, "numberWithShort:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[11] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v15, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v16, 4);

  return v17;
}

@end
