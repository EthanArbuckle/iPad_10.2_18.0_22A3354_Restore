@implementation PUEditingInitialPayload

- (PUEditingInitialPayload)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  CMTime v29;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PUEditingInitialPayload;
  v5 = -[PUEditingInitialPayload init](&v30, sel_init);
  if (v5)
  {
    *((_QWORD *)v5 + 2) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mediaType"));
    *((_QWORD *)v5 + 3) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mediaSubtypes"));
    *((_QWORD *)v5 + 4) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("playbackStyle"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("adjustmentData"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v10;

    *((_QWORD *)v5 + 8) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("adjustmentBaseVersion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeholderImageData"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v5 + 9);
    *((_QWORD *)v5 + 9) = v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displaySizeImageData"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("videoURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v5 + 11);
    *((_QWORD *)v5 + 11) = v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("videoPathSandboxExtensionToken"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v5 + 12);
    *((_QWORD *)v5 + 12) = v18;

    CMTimeMake(&v29, objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("livePhotoStillDisplayTime.value")), objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("livePhotoStillDisplayTime.timescale")));
    *(CMTime *)(v5 + 136) = v29;
    *((_DWORD *)v5 + 37) = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("livePhotoStillDisplayTime.flags"));
    *((_QWORD *)v5 + 19) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("livePhotoStillDisplayTime.epoch"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniformTypeIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v5 + 16);
    *((_QWORD *)v5 + 16) = v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullSizeImageURL"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v5 + 13);
    *((_QWORD *)v5 + 13) = v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullSizeImageURLSandboxExtensionToken"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)*((_QWORD *)v5 + 14);
    *((_QWORD *)v5 + 14) = v24;

    *((_DWORD *)v5 + 2) = objc_msgSend(v4, "decodeIntForKey:", CFSTR("fullSizeImageExifOrientation"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilityDescription"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)*((_QWORD *)v5 + 15);
    *((_QWORD *)v5 + 15) = v26;

  }
  return (PUEditingInitialPayload *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t mediaType;
  id v5;

  mediaType = self->_mediaType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", mediaType, CFSTR("mediaType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_mediaSubtypes, CFSTR("mediaSubtypes"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_playbackStyle, CFSTR("playbackStyle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_adjustmentData, CFSTR("adjustmentData"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_adjustmentBaseVersion, CFSTR("adjustmentBaseVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_placeholderImageData, CFSTR("placeholderImageData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displaySizeImageData, CFSTR("displaySizeImageData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_videoURL, CFSTR("videoURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_videoPathSandboxExtensionToken, CFSTR("videoPathSandboxExtensionToken"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_livePhotoStillDisplayTime.value, CFSTR("livePhotoStillDisplayTime.value"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_livePhotoStillDisplayTime.timescale, CFSTR("livePhotoStillDisplayTime.timescale"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_livePhotoStillDisplayTime.flags, CFSTR("livePhotoStillDisplayTime.flags"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_livePhotoStillDisplayTime.epoch, CFSTR("livePhotoStillDisplayTime.epoch"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniformTypeIdentifier, CFSTR("uniformTypeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fullSizeImageURL, CFSTR("fullSizeImageURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fullSizeImageURLSandboxExtensionToken, CFSTR("fullSizeImageURLSandboxExtensionToken"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_fullSizeImageExifOrientation, CFSTR("fullSizeImageExifOrientation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessibilityDescription, CFSTR("accessibilityDescription"));

}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (unint64_t)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (void)setMediaSubtypes:(unint64_t)a3
{
  self->_mediaSubtypes = a3;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (void)setPlaybackStyle:(int64_t)a3
{
  self->_playbackStyle = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (PHAdjustmentData)adjustmentData
{
  return self->_adjustmentData;
}

- (void)setAdjustmentData:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentData, a3);
}

- (int64_t)adjustmentBaseVersion
{
  return self->_adjustmentBaseVersion;
}

- (void)setAdjustmentBaseVersion:(int64_t)a3
{
  self->_adjustmentBaseVersion = a3;
}

- (NSData)placeholderImageData
{
  return self->_placeholderImageData;
}

- (void)setPlaceholderImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)displaySizeImageData
{
  return self->_displaySizeImageData;
}

- (void)setDisplaySizeImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setVideoURL:(id)a3
{
  objc_storeStrong((id *)&self->_videoURL, a3);
}

- (NSString)videoPathSandboxExtensionToken
{
  return self->_videoPathSandboxExtensionToken;
}

- (void)setVideoPathSandboxExtensionToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoStillDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 136);
  return self;
}

- (void)setLivePhotoStillDisplayTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_livePhotoStillDisplayTime.epoch = a3->var3;
  *(_OWORD *)&self->_livePhotoStillDisplayTime.value = v3;
}

- (NSURL)fullSizeImageURL
{
  return self->_fullSizeImageURL;
}

- (void)setFullSizeImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_fullSizeImageURL, a3);
}

- (NSString)fullSizeImageURLSandboxExtensionToken
{
  return self->_fullSizeImageURLSandboxExtensionToken;
}

- (void)setFullSizeImageURLSandboxExtensionToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int)fullSizeImageExifOrientation
{
  return self->_fullSizeImageExifOrientation;
}

- (void)setFullSizeImageExifOrientation:(int)a3
{
  self->_fullSizeImageExifOrientation = a3;
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setAccessibilityDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (void)setUniformTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_fullSizeImageURLSandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_fullSizeImageURL, 0);
  objc_storeStrong((id *)&self->_videoPathSandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_displaySizeImageData, 0);
  objc_storeStrong((id *)&self->_placeholderImageData, 0);
  objc_storeStrong((id *)&self->_adjustmentData, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
