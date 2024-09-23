@implementation MOSuggestionAssetMediaItem

- (id)initTitle:(id)a3 albumTitle:(id)a4 artistName:(id)a5 albumArt:(id)a6 trackIdentifier:(id)a7 previewURL:(id)a8 mediaType:(unint64_t)a9
{
  return -[MOSuggestionAssetMediaItem initTitle:albumTitle:artistName:albumArt:trackIdentifier:previewURL:mediaType:imageURL:](self, "initTitle:albumTitle:artistName:albumArt:trackIdentifier:previewURL:mediaType:imageURL:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (id)initTitle:(id)a3 albumTitle:(id)a4 artistName:(id)a5 albumArt:(id)a6 trackIdentifier:(id)a7 previewURL:(id)a8 mediaType:(unint64_t)a9 imageURL:(id)a10
{
  return -[MOSuggestionAssetMediaItem initTitle:albumTitle:artistName:albumArt:trackIdentifier:previewURL:mediaType:imageURL:bgColor:bgColorVariant:](self, "initTitle:albumTitle:artistName:albumArt:trackIdentifier:previewURL:mediaType:imageURL:bgColor:bgColorVariant:", a3, a4, a5, a6, a7, a8, a9, a10, 0, 0);
}

- (id)initTitle:(id)a3 albumTitle:(id)a4 artistName:(id)a5 albumArt:(id)a6 trackIdentifier:(id)a7 previewURL:(id)a8 mediaType:(unint64_t)a9 imageURL:(id)a10 bgColor:(id)a11 bgColorVariant:(unint64_t)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  MOSuggestionAssetMediaItem *v24;
  MOSuggestionAssetMediaItem *v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v30 = a3;
  v19 = a4;
  v29 = a5;
  v20 = a5;
  v32 = a6;
  v27 = a7;
  v31 = a7;
  v28 = a8;
  v21 = a8;
  v22 = a10;
  v23 = a11;
  v33.receiver = self;
  v33.super_class = (Class)MOSuggestionAssetMediaItem;
  v24 = -[MOSuggestionAssetMediaItem init](&v33, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_title, a3);
    objc_storeStrong((id *)&v25->_albumTitle, a4);
    objc_storeStrong((id *)&v25->_albumArt, a6);
    objc_storeStrong((id *)&v25->_trackIdentifier, v27);
    objc_storeStrong((id *)&v25->_previewURL, v28);
    v25->_mediaType = a9;
    objc_storeStrong((id *)&v25->_artistName, v29);
    objc_storeStrong((id *)&v25->_imageURL, a10);
    objc_storeStrong((id *)&v25->_bgColor, a11);
    v25->_bgColorVariant = a12;
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;
  void *v6;
  id v7;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("kCoderKeyMediaAssetTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_albumTitle, CFSTR("kCoderKeyMediaAssetAlbumTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artistName, CFSTR("kCoderKeyMediaAssetArtistName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_albumArt, CFSTR("kCoderKeyMediaAssetAlbumArt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trackIdentifier, CFSTR("kCoderKeyMediaAssetTrackIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_previewURL, CFSTR("kCoderKeyMediaAssetPreviewURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageURL, CFSTR("kCoderKeyMediaAssetImageURL"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_mediaType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("kCoderKeyMediaAssetMediaType"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_bgColor, CFSTR("kCoderKeyMediaAssetBgColor"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bgColorVariant);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("kCoderKeyMediaAssetBgColorVariant"));

}

- (MOSuggestionAssetMediaItem)initWithCoder:(id)a3
{
  id v4;
  MOSuggestionAssetMediaItem *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *albumTitle;
  uint64_t v10;
  NSString *artistName;
  uint64_t v12;
  UIImage *albumArt;
  uint64_t v14;
  NSString *trackIdentifier;
  uint64_t v16;
  NSURL *previewURL;
  uint64_t v18;
  NSURL *imageURL;
  void *v20;
  uint64_t v21;
  UIColor *bgColor;
  void *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MOSuggestionAssetMediaItem;
  v5 = -[MOSuggestionAssetMediaItem init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCoderKeyMediaAssetTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCoderKeyMediaAssetAlbumTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    albumTitle = v5->_albumTitle;
    v5->_albumTitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCoderKeyMediaAssetArtistName"));
    v10 = objc_claimAutoreleasedReturnValue();
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCoderKeyMediaAssetAlbumArt"));
    v12 = objc_claimAutoreleasedReturnValue();
    albumArt = v5->_albumArt;
    v5->_albumArt = (UIImage *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCoderKeyMediaAssetTrackIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    trackIdentifier = v5->_trackIdentifier;
    v5->_trackIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCoderKeyMediaAssetPreviewURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    previewURL = v5->_previewURL;
    v5->_previewURL = (NSURL *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCoderKeyMediaAssetImageURL"));
    v18 = objc_claimAutoreleasedReturnValue();
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCoderKeyMediaAssetMediaType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mediaType = (int)objc_msgSend(v20, "intValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCoderKeyMediaAssetBgColor"));
    v21 = objc_claimAutoreleasedReturnValue();
    bgColor = v5->_bgColor;
    v5->_bgColor = (UIColor *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCoderKeyMediaAssetBgColorVariant"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_bgColorVariant = (int)objc_msgSend(v23, "intValue");

  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (UIImage)albumArt
{
  return self->_albumArt;
}

- (NSString)trackIdentifier
{
  return self->_trackIdentifier;
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (UIColor)bgColor
{
  return self->_bgColor;
}

- (unint64_t)bgColorVariant
{
  return self->_bgColorVariant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bgColor, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_trackIdentifier, 0);
  objc_storeStrong((id *)&self->_albumArt, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
