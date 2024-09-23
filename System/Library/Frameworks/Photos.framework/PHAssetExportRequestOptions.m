@implementation PHAssetExportRequestOptions

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t variant;
  __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  variant = self->_variant;
  if (variant > 3)
    v6 = 0;
  else
    v6 = off_1E35D6468[variant];
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, variant: \"%@\", livePhotoAsStill: %d, allowRaw: %d, flattenSlomo: %d, stripLocation: %d, stripCaption: %d, stripAXDescription: %d, assetBundle: %d, disableMetadataCorrections: %d, unmodifiedOriginals: %d>"), v4, self, v6, self->_treatLivePhotoAsStill, !self->_dontAllowRAW, self->_flattenSlomoVideos, self->_shouldStripLocation, self->_shouldStripCaption, self->_shouldStripAccessibilityDescription, self->_includeAllAssetResources, self->_disableMetadataCorrections, self->_shouldExportUnmodifiedOriginalResources);
}

- (OS_dispatch_queue)resultHandlerQueue
{
  OS_dispatch_queue *resultHandlerQueue;
  OS_dispatch_queue *v3;
  id v4;

  resultHandlerQueue = self->_resultHandlerQueue;
  if (resultHandlerQueue)
  {
    v3 = resultHandlerQueue;
  }
  else
  {
    v3 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
    v4 = MEMORY[0x1E0C80D38];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PHAssetExportRequestOptions *v4;
  PHAssetExportRequestOptions *v5;
  BOOL v6;

  v4 = (PHAssetExportRequestOptions *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[PHAssetExportRequestOptions isEqualToAssetExportRequestOptions:](self, "isEqualToAssetExportRequestOptions:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToAssetExportRequestOptions:(id)a3
{
  id v4;
  int v5;
  int64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int64_t v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  _BOOL4 v37;

  v4 = a3;
  v5 = -[PHAssetExportRequestOptions includeAllAssetResources](self, "includeAllAssetResources");
  if (v5 != objc_msgSend(v4, "includeAllAssetResources"))
    goto LABEL_24;
  v6 = -[PHAssetExportRequestOptions variant](self, "variant");
  if (v6 != objc_msgSend(v4, "variant"))
    goto LABEL_24;
  v7 = -[PHAssetExportRequestOptions treatLivePhotoAsStill](self, "treatLivePhotoAsStill");
  if (v7 != objc_msgSend(v4, "treatLivePhotoAsStill"))
    goto LABEL_24;
  v8 = -[PHAssetExportRequestOptions flattenSlomoVideos](self, "flattenSlomoVideos");
  if (v8 != objc_msgSend(v4, "flattenSlomoVideos"))
    goto LABEL_24;
  v9 = -[PHAssetExportRequestOptions dontAllowRAW](self, "dontAllowRAW");
  if (v9 != objc_msgSend(v4, "dontAllowRAW"))
    goto LABEL_24;
  v10 = -[PHAssetExportRequestOptions shouldStripLocation](self, "shouldStripLocation");
  if (v10 != objc_msgSend(v4, "shouldStripLocation"))
    goto LABEL_24;
  v11 = -[PHAssetExportRequestOptions shouldStripCaption](self, "shouldStripCaption");
  if (v11 != objc_msgSend(v4, "shouldStripCaption"))
    goto LABEL_24;
  v12 = -[PHAssetExportRequestOptions shouldStripAccessibilityDescription](self, "shouldStripAccessibilityDescription");
  if (v12 != objc_msgSend(v4, "shouldStripAccessibilityDescription"))
    goto LABEL_24;
  -[PHAssetExportRequestOptions videoExportPreset](self, "videoExportPreset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PHAssetExportRequestOptions videoExportPreset](self, "videoExportPreset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoExportPreset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if (!v16)
      goto LABEL_24;
  }
  -[PHAssetExportRequestOptions videoExportFileType](self, "videoExportFileType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[PHAssetExportRequestOptions videoExportFileType](self, "videoExportFileType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoExportFileType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqualToString:", v19);

    if (!v20)
      goto LABEL_24;
  }
  v21 = -[PHAssetExportRequestOptions disableMetadataCorrections](self, "disableMetadataCorrections");
  if (v21 != objc_msgSend(v4, "disableMetadataCorrections"))
    goto LABEL_24;
  v22 = -[PHAssetExportRequestOptions shouldExportUnmodifiedOriginalResources](self, "shouldExportUnmodifiedOriginalResources");
  if (v22 != objc_msgSend(v4, "shouldExportUnmodifiedOriginalResources"))
    goto LABEL_24;
  v23 = -[PHAssetExportRequestOptions shouldBundleComplexAssetResources](self, "shouldBundleComplexAssetResources");
  if (v23 != objc_msgSend(v4, "shouldBundleComplexAssetResources"))
    goto LABEL_24;
  -[PHAssetExportRequestOptions customFilenameBase](self, "customFilenameBase");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[PHAssetExportRequestOptions customFilenameBase](self, "customFilenameBase");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "customFilenameBase");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqualToString:", v26);

    if (!v27)
      goto LABEL_24;
  }
  -[PHAssetExportRequestOptions resultHandlerQueue](self, "resultHandlerQueue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultHandlerQueue");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28 != v29)
    goto LABEL_24;
  v30 = -[PHAssetExportRequestOptions locationComparisonStrategy](self, "locationComparisonStrategy");
  if (v30 == objc_msgSend(v4, "locationComparisonStrategy")
    && (v31 = -[PHAssetExportRequestOptions forceDateTimeMetadataBaking](self, "forceDateTimeMetadataBaking"),
        v31 == objc_msgSend(v4, "forceDateTimeMetadataBaking"))
    && (v32 = -[PHAssetExportRequestOptions forceLocationMetadataBaking](self, "forceLocationMetadataBaking"),
        v32 == objc_msgSend(v4, "forceLocationMetadataBaking"))
    && (v33 = -[PHAssetExportRequestOptions forceCaptionMetadataBaking](self, "forceCaptionMetadataBaking"),
        v33 == objc_msgSend(v4, "forceCaptionMetadataBaking"))
    && (v34 = -[PHAssetExportRequestOptions forceAccessibilityDescriptionMetadataBaking](self, "forceAccessibilityDescriptionMetadataBaking"), v34 == objc_msgSend(v4, "forceAccessibilityDescriptionMetadataBaking")))
  {
    v37 = -[PHAssetExportRequestOptions disableUpdatingFileCreationDatesOnExportedFileURLs](self, "disableUpdatingFileCreationDatesOnExportedFileURLs");
    v35 = v37 ^ objc_msgSend(v4, "disableUpdatingFileCreationDatesOnExportedFileURLs") ^ 1;
  }
  else
  {
LABEL_24:
    LOBYTE(v35) = 0;
  }

  return v35;
}

- (BOOL)includeAllAssetResources
{
  return self->_includeAllAssetResources;
}

- (void)setIncludeAllAssetResources:(BOOL)a3
{
  self->_includeAllAssetResources = a3;
}

- (int64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(int64_t)a3
{
  self->_variant = a3;
}

- (BOOL)treatLivePhotoAsStill
{
  return self->_treatLivePhotoAsStill;
}

- (void)setTreatLivePhotoAsStill:(BOOL)a3
{
  self->_treatLivePhotoAsStill = a3;
}

- (BOOL)flattenSlomoVideos
{
  return self->_flattenSlomoVideos;
}

- (void)setFlattenSlomoVideos:(BOOL)a3
{
  self->_flattenSlomoVideos = a3;
}

- (BOOL)dontAllowRAW
{
  return self->_dontAllowRAW;
}

- (void)setDontAllowRAW:(BOOL)a3
{
  self->_dontAllowRAW = a3;
}

- (BOOL)shouldStripLocation
{
  return self->_shouldStripLocation;
}

- (void)setShouldStripLocation:(BOOL)a3
{
  self->_shouldStripLocation = a3;
}

- (BOOL)shouldStripCaption
{
  return self->_shouldStripCaption;
}

- (void)setShouldStripCaption:(BOOL)a3
{
  self->_shouldStripCaption = a3;
}

- (BOOL)shouldStripAccessibilityDescription
{
  return self->_shouldStripAccessibilityDescription;
}

- (void)setShouldStripAccessibilityDescription:(BOOL)a3
{
  self->_shouldStripAccessibilityDescription = a3;
}

- (NSString)videoExportPreset
{
  return self->_videoExportPreset;
}

- (void)setVideoExportPreset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)videoExportFileType
{
  return self->_videoExportFileType;
}

- (void)setVideoExportFileType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)disableMetadataCorrections
{
  return self->_disableMetadataCorrections;
}

- (void)setDisableMetadataCorrections:(BOOL)a3
{
  self->_disableMetadataCorrections = a3;
}

- (BOOL)allowMetadataConversionsForPNG
{
  return self->_allowMetadataConversionsForPNG;
}

- (void)setAllowMetadataConversionsForPNG:(BOOL)a3
{
  self->_allowMetadataConversionsForPNG = a3;
}

- (BOOL)shouldExportUnmodifiedOriginalResources
{
  return self->_shouldExportUnmodifiedOriginalResources;
}

- (void)setShouldExportUnmodifiedOriginalResources:(BOOL)a3
{
  self->_shouldExportUnmodifiedOriginalResources = a3;
}

- (BOOL)shouldBundleComplexAssetResources
{
  return self->_shouldBundleComplexAssetResources;
}

- (void)setShouldBundleComplexAssetResources:(BOOL)a3
{
  self->_shouldBundleComplexAssetResources = a3;
}

- (NSString)customFilenameBase
{
  return self->_customFilenameBase;
}

- (void)setCustomFilenameBase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setResultHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resultHandlerQueue, a3);
}

- (int64_t)locationComparisonStrategy
{
  return self->_locationComparisonStrategy;
}

- (void)setLocationComparisonStrategy:(int64_t)a3
{
  self->_locationComparisonStrategy = a3;
}

- (BOOL)forceDateTimeMetadataBaking
{
  return self->_forceDateTimeMetadataBaking;
}

- (void)setForceDateTimeMetadataBaking:(BOOL)a3
{
  self->_forceDateTimeMetadataBaking = a3;
}

- (BOOL)forceLocationMetadataBaking
{
  return self->_forceLocationMetadataBaking;
}

- (void)setForceLocationMetadataBaking:(BOOL)a3
{
  self->_forceLocationMetadataBaking = a3;
}

- (BOOL)forceCaptionMetadataBaking
{
  return self->_forceCaptionMetadataBaking;
}

- (void)setForceCaptionMetadataBaking:(BOOL)a3
{
  self->_forceCaptionMetadataBaking = a3;
}

- (BOOL)forceAccessibilityDescriptionMetadataBaking
{
  return self->_forceAccessibilityDescriptionMetadataBaking;
}

- (void)setForceAccessibilityDescriptionMetadataBaking:(BOOL)a3
{
  self->_forceAccessibilityDescriptionMetadataBaking = a3;
}

- (BOOL)disableUpdatingFileCreationDatesOnExportedFileURLs
{
  return self->_disableUpdatingFileCreationDatesOnExportedFileURLs;
}

- (void)setDisableUpdatingFileCreationDatesOnExportedFileURLs:(BOOL)a3
{
  self->_disableUpdatingFileCreationDatesOnExportedFileURLs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHandlerQueue, 0);
  objc_storeStrong((id *)&self->_customFilenameBase, 0);
  objc_storeStrong((id *)&self->_videoExportFileType, 0);
  objc_storeStrong((id *)&self->_videoExportPreset, 0);
}

@end
