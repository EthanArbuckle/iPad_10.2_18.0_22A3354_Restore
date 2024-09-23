@implementation MOAssetProperty

- (MOAssetProperty)initWithLocalToPhotoLibraryIdentifier:(id)a3 location:(id)a4 mediaType:(int64_t)a5 mediaSubtypes:(unint64_t)a6 favorite:(BOOL)a7
{
  id v12;
  id v13;
  MOAssetProperty *v14;
  uint64_t v15;
  NSString *localToPhotoLibraryIdentifier;
  uint64_t v17;
  CLLocation *location;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MOAssetProperty;
  v14 = -[MOAssetProperty init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    localToPhotoLibraryIdentifier = v14->_localToPhotoLibraryIdentifier;
    v14->_localToPhotoLibraryIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v13, "copy");
    location = v14->_location;
    v14->_location = (CLLocation *)v17;

    v14->_mediaType = a5;
    v14->_mediaSubtypes = a6;
    v14->_favorite = a7;
  }

  return v14;
}

- (id)description
{
  const __CFString *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  const __CFString *v11;
  void *v12;

  if (-[MOAssetProperty mediaType](self, "mediaType"))
  {
    if (-[MOAssetProperty mediaType](self, "mediaType") == 1)
    {
      v3 = CFSTR("image");
    }
    else if (-[MOAssetProperty mediaType](self, "mediaType") == 2)
    {
      v3 = CFSTR("video");
    }
    else if (-[MOAssetProperty mediaType](self, "mediaType") == 3)
    {
      v3 = CFSTR("audio");
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = CFSTR("unknown");
  }
  if (!-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes"))
  {
    v6 = CFSTR("SubtypeNone");
    goto LABEL_39;
  }
  v4 = (void *)objc_opt_new();
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 1) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("PhotoPanorama"));
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 2) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("PhotoHDR"));
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 4) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("PhotoScreenshot"));
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 8) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("PhotoLive"));
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 0x10) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("PhotoDepthEffect"));
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 0x20) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("SpatialOverCapture"));
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 0x10000) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("VideoStreamed"));
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 0x20000) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("VideoHighFrameRate"));
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 0x40000) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("VideoTimelapse"));
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 0x200000) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("VideoCinematic"));
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    if (objc_msgSend(v4, "count") != 1)
    {
      v6 = CFSTR("SubtypeUnknown");
      goto LABEL_38;
    }
    objc_msgSend(v4, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("_"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (__CFString *)v5;
LABEL_38:

LABEL_39:
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[MOAssetProperty localToPhotoLibraryIdentifier](self, "localToPhotoLibraryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOAssetProperty location](self, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MOAssetProperty favorite](self, "favorite");
  v11 = CFSTR("NO");
  if (v10)
    v11 = CFSTR("YES");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<MOAssetProperty localToPhotoLibraryIdentifier: %@, location: %@, mediaType: %@, mediaSubtypes: %@, favorite: %@>"), v8, v9, v3, v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *localToPhotoLibraryIdentifier;
  void *v5;
  void *v6;
  id v7;

  localToPhotoLibraryIdentifier = self->_localToPhotoLibraryIdentifier;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", localToPhotoLibraryIdentifier, CFSTR("localToPhotoLibraryIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_mediaType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("mediaType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_mediaSubtypes);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("mediaSubtypes"));

  objc_msgSend(v7, "encodeBool:forKey:", self->_favorite, CFSTR("favorite"));
}

- (MOAssetProperty)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  MOAssetProperty *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localToPhotoLibraryIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaSubtypes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("favorite"));
  v12 = -[MOAssetProperty initWithLocalToPhotoLibraryIdentifier:location:mediaType:mediaSubtypes:favorite:](self, "initWithLocalToPhotoLibraryIdentifier:location:mediaType:mediaSubtypes:favorite:", v5, v6, v8, v10, v11);

  return v12;
}

- (NSString)localToPhotoLibraryIdentifier
{
  return self->_localToPhotoLibraryIdentifier;
}

- (void)setLocalToPhotoLibraryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localToPhotoLibraryIdentifier, a3);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
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

- (BOOL)favorite
{
  return self->_favorite;
}

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_localToPhotoLibraryIdentifier, 0);
}

@end
