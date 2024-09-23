@implementation PHMediaFormatConversionSource

- (BOOL)containsHEIFImage
{
  return self->_containsHEIFImage;
}

- (NSString)renderOriginatingSignature
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)markLivePhotoPairingIdentifierAsCheckedWithValue:(id)a3
{
  id v4;

  v4 = a3;
  -[PHMediaFormatConversionSource setDidCheckForLivePhotoPairingIdentifier:](self, "setDidCheckForLivePhotoPairingIdentifier:", 1);
  -[PHMediaFormatConversionSource setLivePhotoPairingIdentifier:](self, "setLivePhotoPairingIdentifier:", v4);

}

- (void)setLivePhotoPairingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_livePhotoPairingIdentifier, a3);
}

- (void)setDidCheckForLivePhotoPairingIdentifier:(BOOL)a3
{
  self->_didCheckForLivePhotoPairingIdentifier = a3;
}

+ (Class)requestClass
{
  return (Class)objc_opt_class();
}

+ (id)sourceForFileURL:(id)a3 mediaType:(int64_t)a4 imageDimensions:(CGSize)a5
{
  double height;
  double width;
  id v10;
  void *v11;
  void *v13;

  height = a5.height;
  width = a5.width;
  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHMediaFormatConversion.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURL"));

  }
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setFileURL:", v10);
  objc_msgSend(v11, "setMediaType:", a4);
  objc_msgSend(v11, "setImageDimensions:", width, height);

  return v11;
}

- (void)setImageDimensions:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_imageDimensions, &v3, 16, 1, 0);
}

- (BOOL)preflightWithError:(id *)a3
{
  _BOOL4 v6;
  void *v7;

  if (-[PHMediaFormatConversionSource preflighted](self, "preflighted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 299, CFSTR("Preflight of already preflighted source"));

  }
  -[PHMediaFormatConversionSource setPreflighted:](self, "setPreflighted:", 1);
  if (-[PHMediaFormatConversionContent mediaType](self, "mediaType")
    || (v6 = -[PHMediaFormatConversionSource determineMediaTypeFromPathExtensionWithError:](self, "determineMediaTypeFromPathExtensionWithError:", a3)))
  {
    if (-[PHMediaFormatConversionContent mediaType](self, "mediaType") == 2)
    {
      -[PHMediaFormatConversionSource checkForImageEligibleForTranscoding](self, "checkForImageEligibleForTranscoding");
    }
    else if (-[PHMediaFormatConversionContent mediaType](self, "mediaType") == 1)
    {
      -[PHMediaFormatConversionSource checkForVideoEligibleForTranscoding](self, "checkForVideoEligibleForTranscoding");
    }
    -[PHMediaFormatConversionSource checkForLivePhotoPairingIdentifier](self, "checkForLivePhotoPairingIdentifier");
    -[PHMediaFormatConversionSource checkForLocationData](self, "checkForLocationData");
    -[PHMediaFormatConversionSource checkForCaptionData](self, "checkForCaptionData");
    -[PHMediaFormatConversionSource checkForAccessibilityDescriptionData](self, "checkForAccessibilityDescriptionData");
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (void)checkForLivePhotoPairingIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!-[PHMediaFormatConversionSource didCheckForLivePhotoPairingIdentifier](self, "didCheckForLivePhotoPairingIdentifier"))
  {
    -[PHMediaFormatConversionSource metadata](self, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "livePhotoPairingIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        -[PHMediaFormatConversionContent fileURL](self, "fileURL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412546;
        v9 = v5;
        v10 = 2112;
        v11 = v6;
        _os_log_debug_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Read pairing identifier: %@ from file: %@", (uint8_t *)&v8, 0x16u);

      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[PHMediaFormatConversionContent fileURL](self, "fileURL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412290;
        v9 = v7;
        _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to read pairing identifier from %@", (uint8_t *)&v8, 0xCu);

      }
      v5 = 0;
    }
    -[PHMediaFormatConversionSource markLivePhotoPairingIdentifierAsCheckedWithValue:](self, "markLivePhotoPairingIdentifierAsCheckedWithValue:", v5);

  }
}

- (BOOL)didCheckForLivePhotoPairingIdentifier
{
  return self->_didCheckForLivePhotoPairingIdentifier;
}

- (void)checkForLocationData
{
  int64_t v3;
  void *v4;
  int v5;
  int64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_locationMetadataStatus)
  {
    v3 = -[PHMediaFormatConversionSource sourceLocationMetadataStatus](self, "sourceLocationMetadataStatus");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[PHMediaFormatConversionContent fileURL](self, "fileURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 134218242;
      v6 = v3;
      v7 = 2112;
      v8 = v4;
      _os_log_debug_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Read location metadata status: %ld from file: %@", (uint8_t *)&v5, 0x16u);

    }
    -[PHMediaFormatConversionSource markLocationMetadataAsCheckedWithStatus:](self, "markLocationMetadataAsCheckedWithStatus:", v3);
  }
}

- (void)checkForCaptionData
{
  int64_t v3;
  void *v4;
  int v5;
  int64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_captionMetadataStatus)
  {
    v3 = -[PHMediaFormatConversionSource sourceCaptionMetadataStatus](self, "sourceCaptionMetadataStatus");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[PHMediaFormatConversionContent fileURL](self, "fileURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 134218242;
      v6 = v3;
      v7 = 2112;
      v8 = v4;
      _os_log_debug_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Read caption metadata status: %ld from file: %@", (uint8_t *)&v5, 0x16u);

    }
    -[PHMediaFormatConversionSource markCaptionMetadataAsCheckedWithStatus:](self, "markCaptionMetadataAsCheckedWithStatus:", v3);
  }
}

- (void)checkForAccessibilityDescriptionData
{
  int64_t v3;
  void *v4;
  int v5;
  int64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_accessibilityDescriptionMetadataStatus)
  {
    v3 = -[PHMediaFormatConversionSource sourceAccessibilityDescriptionMetadataStatus](self, "sourceAccessibilityDescriptionMetadataStatus");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[PHMediaFormatConversionContent fileURL](self, "fileURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 134218242;
      v6 = v3;
      v7 = 2112;
      v8 = v4;
      _os_log_debug_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Read accessibility description metadata status: %ld from file: %@", (uint8_t *)&v5, 0x16u);

    }
    -[PHMediaFormatConversionSource markAccessibilityDescriptionMetadataAsCheckedWithStatus:](self, "markAccessibilityDescriptionMetadataAsCheckedWithStatus:", v3);
  }
}

- (void)setPreflighted:(BOOL)a3
{
  self->_preflighted = a3;
}

- (BOOL)preflighted
{
  return self->_preflighted;
}

- (void)markLocationMetadataAsCheckedWithStatus:(int64_t)a3
{
  self->_locationMetadataStatus = a3;
}

- (void)markCaptionMetadataAsCheckedWithStatus:(int64_t)a3
{
  self->_captionMetadataStatus = a3;
}

- (void)markAccessibilityDescriptionMetadataAsCheckedWithStatus:(int64_t)a3
{
  self->_accessibilityDescriptionMetadataStatus = a3;
}

- (BOOL)determineMediaTypeFromPathExtensionWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PHMediaFormatConversionContent typeFromFileExtensionWithError:](self, "typeFromFileExtensionWithError:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_9;
  if (!objc_msgSend(v5, "conformsToType:", *MEMORY[0x1E0CEC520]))
  {
    if (objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC568]))
    {
      LOBYTE(a3) = 1;
      -[PHMediaFormatConversionContent setMediaType:](self, "setMediaType:", 1);
      goto LABEL_10;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[NSURL path](self->super._fileURL, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v14 = v10;
      v15 = 2114;
      v16 = v6;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to determine image/video type for %{private}@ from UTI %{public}@", buf, 0x16u);

      if (!a3)
        goto LABEL_10;
    }
    else if (!a3)
    {
      goto LABEL_10;
    }
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    v12 = CFSTR("Unable to determine source media type from type identifier. Use videoSourceForFileURL/imageSourceForFileURL instead");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("PHMediaFormatConversionErrorDomain"), 2, v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
    LOBYTE(a3) = 0;
    goto LABEL_10;
  }
  -[PHMediaFormatConversionContent setMediaType:](self, "setMediaType:", 2);
  LOBYTE(a3) = 1;
LABEL_10:

  return (char)a3;
}

- (void)checkForVideoEligibleForTranscoding
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id transcodingEligibleVideoTrackFormatDescription;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!self->_didCheckForVideoWithFormatEligibleForTranscoding)
  {
    self->_didCheckForVideoWithFormatEligibleForTranscoding = 1;
    -[PHMediaFormatConversionSource metadata](self, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = objc_msgSend(v3, "firstVideoTrackCodec");
      v6 = v5;
      if (!self->_firstVideoTrackCodec)
        self->_firstVideoTrackCodec = v5;
      if (objc_msgSend(MEMORY[0x1E0D75128], "videoCodecIsProResEligibleForBackwardsCompatibilityTranscoding:", v5))self->_containsProResVideoWithFormatEligibleForTranscoding = 1;
      if (objc_msgSend(MEMORY[0x1E0D75128], "videoCodecIsEligibleForBackwardsCompatibilityTranscoding:", v6))
      {
        self->_containsVideoWithFormatEligibleForTranscoding = 1;
        objc_msgSend(v4, "videoTrackFormatDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        transcodingEligibleVideoTrackFormatDescription = self->_transcodingEligibleVideoTrackFormatDescription;
        self->_transcodingEligibleVideoTrackFormatDescription = v7;

      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[PHMediaFormatConversionContent fileURL](self, "fileURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to get metadata for URL: %@", (uint8_t *)&v10, 0xCu);

    }
  }
}

- (void)markContainsVideoEligibleForTranscodingAsCheckedWithValue:(BOOL)a3 codec:(unsigned int)a4
{
  -[PHMediaFormatConversionSource markContainsVideoEligibleForTranscodingAsCheckedWithValue:codec:isProRes:](self, "markContainsVideoEligibleForTranscodingAsCheckedWithValue:codec:isProRes:", a3, *(_QWORD *)&a4, 0);
}

- (void)markContainsVideoEligibleForTranscodingAsCheckedWithValue:(BOOL)a3 codec:(unsigned int)a4 isProRes:(BOOL)a5
{
  self->_didCheckForVideoWithFormatEligibleForTranscoding = 1;
  self->_containsVideoWithFormatEligibleForTranscoding = a3;
  self->_firstVideoTrackCodec = a4;
  self->_containsProResVideoWithFormatEligibleForTranscoding = a5;
}

- (BOOL)containsHEVCVideo
{
  void *v5;

  if (!-[PHMediaFormatConversionSource preflighted](self, "preflighted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 247, CFSTR("Must preflight source before calling this method"));

  }
  return self->_containsVideoWithFormatEligibleForTranscoding;
}

- (BOOL)checkForIsHDR
{
  uint64_t v4;
  void *v5;
  void *v7;

  if (self->_didCheckForIsHDR)
    return self->_isHDR;
  if (!self->_preflighted)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 255, CFSTR("Must preflight source before calling this method"));

  }
  if (!self->_containsVideoWithFormatEligibleForTranscoding
    || self->_didCheckForLivePhotoPairingIdentifier && self->_livePhotoPairingIdentifier)
  {
    v4 = 0;
  }
  else
  {
    -[PHMediaFormatConversionSource metadata](self, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isHDR");

  }
  -[PHMediaFormatConversionSource markIsHDRAsCheckedWithValue:](self, "markIsHDRAsCheckedWithValue:", v4);
  return -[PHMediaFormatConversionSource isHDR](self, "isHDR");
}

- (void)markIsHDRAsCheckedWithValue:(BOOL)a3
{
  self->_isHDR = a3;
  self->_didCheckForIsHDR = 1;
}

- (void)checkForImageEligibleForTranscoding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  BOOL v14;
  id v15;
  _QWORD v16[4];
  id v17;

  -[PFMetadata contentType](self->_cachedMetadata, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PFMetadata contentType](self->_cachedMetadata, "contentType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_containsHEIFImage = objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC698]);
  }
  else
  {
    -[PHMediaFormatConversionContent fileURL](self, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_containsHEIFImage = objc_msgSend(&unk_1E995BDC0, "containsObject:", v6);

  }
  -[PFMetadata contentType](self->_cachedMetadata, "contentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0CEC3F8];
    -[PHMediaFormatConversionContent fileURL](self, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "typeWithFilenameExtension:conformingToType:", v10, *MEMORY[0x1E0CEC520]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0D752F0], "imageTypesNotWellSupportedForSharing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__PHMediaFormatConversionSource_checkForImageEligibleForTranscoding__block_invoke;
  v16[3] = &unk_1E9953760;
  v15 = v7;
  v17 = v15;
  v12 = objc_msgSend(v11, "indexOfObjectPassingTest:", v16);
  if ((-[PFMetadata isHDR_TS22028](self->_cachedMetadata, "isHDR_TS22028") & 1) != 0)
    v13 = 1;
  else
    v13 = -[PFMetadata isHDR_ExtendedRange](self->_cachedMetadata, "isHDR_ExtendedRange");
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    v14 = v13;
  else
    v14 = 1;
  self->_containsImageWithFormatEligibleForTranscoding = v14;

}

- (PFMetadata)metadata
{
  PFMetadata *cachedMetadata;
  id v4;
  void *v5;
  PFMetadata *v6;
  PFMetadata *v7;

  cachedMetadata = self->_cachedMetadata;
  if (!cachedMetadata)
  {
    v4 = objc_alloc(MEMORY[0x1E0D75140]);
    -[PHMediaFormatConversionContent fileURL](self, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (PFMetadata *)objc_msgSend(v4, "initWithMediaURL:options:timeZoneLookup:shouldCache:", v5, 13, 0, 1);
    v7 = self->_cachedMetadata;
    self->_cachedMetadata = v6;

    cachedMetadata = self->_cachedMetadata;
  }
  return cachedMetadata;
}

- (int64_t)sourceLocationMetadataStatus
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[PHMediaFormatConversionSource metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "gpsLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = 2;
    else
      v5 = 3;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (int64_t)sourceCaptionMetadataStatus
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[PHMediaFormatConversionSource metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "captionAbstract");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = 2;
    else
      v5 = 3;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (int64_t)sourceAccessibilityDescriptionMetadataStatus
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[PHMediaFormatConversionSource metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "artworkContentDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = 2;
    else
      v5 = 3;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (NSString)livePhotoPairingIdentifier
{
  void *v5;
  void *v6;

  if (!-[PHMediaFormatConversionSource preflighted](self, "preflighted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 444, CFSTR("Source must be preflighted or marked as checked before accessing %@"), v6);

  }
  return self->_livePhotoPairingIdentifier;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMetadata, a3);
}

- (void)setRenderOriginatingSignature:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (CGSize)imageDimensions
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_imageDimensions, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (unsigned)firstVideoTrackCodec
{
  return self->_firstVideoTrackCodec;
}

- (void)setFirstVideoTrackCodec:(unsigned int)a3
{
  self->_firstVideoTrackCodec = a3;
}

- (BOOL)containsVideoWithFormatEligibleForTranscoding
{
  return self->_containsVideoWithFormatEligibleForTranscoding;
}

- (void)setContainsVideoWithFormatEligibleForTranscoding:(BOOL)a3
{
  self->_containsVideoWithFormatEligibleForTranscoding = a3;
}

- (BOOL)containsProResVideoWithFormatEligibleForTranscoding
{
  return self->_containsProResVideoWithFormatEligibleForTranscoding;
}

- (BOOL)containsImageWithFormatEligibleForTranscoding
{
  return self->_containsImageWithFormatEligibleForTranscoding;
}

- (BOOL)didCheckForVideoWithFormatEligibleForTranscoding
{
  return self->_didCheckForVideoWithFormatEligibleForTranscoding;
}

- (void)setDidCheckForVideoWithFormatEligibleForTranscoding:(BOOL)a3
{
  self->_didCheckForVideoWithFormatEligibleForTranscoding = a3;
}

- (int64_t)locationMetadataStatus
{
  return self->_locationMetadataStatus;
}

- (void)setLocationMetadataStatus:(int64_t)a3
{
  self->_locationMetadataStatus = a3;
}

- (int64_t)captionMetadataStatus
{
  return self->_captionMetadataStatus;
}

- (void)setCaptionMetadataStatus:(int64_t)a3
{
  self->_captionMetadataStatus = a3;
}

- (int64_t)accessibilityDescriptionMetadataStatus
{
  return self->_accessibilityDescriptionMetadataStatus;
}

- (void)setAccessibilityDescriptionMetadataStatus:(int64_t)a3
{
  self->_accessibilityDescriptionMetadataStatus = a3;
}

- (id)transcodingEligibleVideoTrackFormatDescription
{
  return self->_transcodingEligibleVideoTrackFormatDescription;
}

- (BOOL)isHDR
{
  return self->_isHDR;
}

- (void)setIsHDR:(BOOL)a3
{
  self->_isHDR = a3;
}

- (BOOL)didCheckForIsHDR
{
  return self->_didCheckForIsHDR;
}

- (void)setDidCheckForIsHDR:(BOOL)a3
{
  self->_didCheckForIsHDR = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transcodingEligibleVideoTrackFormatDescription, 0);
  objc_storeStrong((id *)&self->_livePhotoPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_renderOriginatingSignature, 0);
  objc_storeStrong((id *)&self->_cachedMetadata, 0);
}

uint64_t __68__PHMediaFormatConversionSource_checkForImageEligibleForTranscoding__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "conformsToType:", a2);
}

+ (id)videoSourceForFileURL:(id)a3
{
  return (id)objc_msgSend(a1, "sourceForFileURL:mediaType:imageDimensions:", a3, 1, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

+ (id)imageSourceForFileURL:(id)a3
{
  return (id)objc_msgSend(a1, "sourceForFileURL:mediaType:imageDimensions:", a3, 2, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

+ (id)imageSourceForFileURL:(id)a3 dimensions:(CGSize)a4
{
  return (id)objc_msgSend(a1, "sourceForFileURL:mediaType:imageDimensions:", a3, 2, a4.width, a4.height);
}

+ (id)sourceForFileURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __objc2_class *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", CFSTR("pvt")))
  {
    v7 = PHMediaFormatConversionLivePhotoBundleSource;
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("photosasset")))
    {
      objc_msgSend(a1, "sourceForFileURL:mediaType:imageDimensions:", v4, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v7 = PHMediaFormatConversionAssetBundleSource;
  }
  -[__objc2_class sourceForFileURL:](v7, "sourceForFileURL:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v9 = (void *)v8;

  return v9;
}

@end
