@implementation AXMVisionFeatureAssetMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionFeatureAssetMetadata)initWithCoder:(id)a3
{
  id v4;
  AXMVisionFeatureAssetMetadata *v5;
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
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AXMVisionFeatureAssetMetadata;
  v5 = -[AXMVisionFeatureAssetMetadata init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureAssetMetadataCodingKeyAssetURL);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureAssetMetadata setAssetURL:](v5, "setAssetURL:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureAssetMetadataCodingKeyName);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureAssetMetadata setName:](v5, "setName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureAssetMetadataCodingKeyCreationDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureAssetMetadata setCreationDate:](v5, "setCreationDate:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureAssetMetadataCodingKeyUTI);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureAssetMetadata setUti:](v5, "setUti:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureAssetMetadataCodingKeyLocalizedTypeDescription);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureAssetMetadata setLocalizedTypeDescription:](v5, "setLocalizedTypeDescription:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureAssetMetadataCodingKeyTIFFImageDescription);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureAssetMetadata setTIFFImageDescription:](v5, "setTIFFImageDescription:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureAssetMetadataCodingKeyIPTCCaptionAbstract);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureAssetMetadata setIPTCCaptionAbstract:](v5, "setIPTCCaptionAbstract:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureAssetMetadataCodingKeyEXIFUserComment);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureAssetMetadata setEXIFUserComment:](v5, "setEXIFUserComment:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureAssetMetadataCodingKeyPNGImageDescription);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureAssetMetadata setPNGImageDescription:](v5, "setPNGImageDescription:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureAssetMetadataCodingKeyLocalIdentifier);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureAssetMetadata setImageAssetLocalIdentifier:](v5, "setImageAssetLocalIdentifier:", v15);

    -[AXMVisionFeatureAssetMetadata setImageAssetLocallyAvailable:](v5, "setImageAssetLocallyAvailable:", objc_msgSend(v4, "decodeBoolForKey:", AXMVisionFeatureAssetMetadataCodingKeyAssetLocallyAvailableIdentifier));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureAssetMetadataCodingkeyPhotoLibraryURL);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureAssetMetadata setImageAssetPhotoLibraryURL:](v5, "setImageAssetPhotoLibraryURL:", v16);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  _BOOL8 v15;
  id v16;

  v4 = a3;
  -[AXMVisionFeatureAssetMetadata assetURL](self, "assetURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, AXMVisionFeatureAssetMetadataCodingKeyAssetURL);

  -[AXMVisionFeatureAssetMetadata name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, AXMVisionFeatureAssetMetadataCodingKeyName);

  -[AXMVisionFeatureAssetMetadata creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, AXMVisionFeatureAssetMetadataCodingKeyCreationDate);

  -[AXMVisionFeatureAssetMetadata uti](self, "uti");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, AXMVisionFeatureAssetMetadataCodingKeyUTI);

  -[AXMVisionFeatureAssetMetadata localizedTypeDescription](self, "localizedTypeDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, AXMVisionFeatureAssetMetadataCodingKeyLocalizedTypeDescription);

  -[AXMVisionFeatureAssetMetadata TIFFImageDescription](self, "TIFFImageDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, AXMVisionFeatureAssetMetadataCodingKeyTIFFImageDescription);

  -[AXMVisionFeatureAssetMetadata IPTCCaptionAbstract](self, "IPTCCaptionAbstract");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, AXMVisionFeatureAssetMetadataCodingKeyIPTCCaptionAbstract);

  -[AXMVisionFeatureAssetMetadata EXIFUserComment](self, "EXIFUserComment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, AXMVisionFeatureAssetMetadataCodingKeyEXIFUserComment);

  -[AXMVisionFeatureAssetMetadata PNGImageDescription](self, "PNGImageDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, AXMVisionFeatureAssetMetadataCodingKeyPNGImageDescription);

  -[AXMVisionFeatureAssetMetadata imageAssetLocalIdentifier](self, "imageAssetLocalIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, AXMVisionFeatureAssetMetadataCodingKeyLocalIdentifier);

  v15 = -[AXMVisionFeatureAssetMetadata imageAssetLocallyAvailable](self, "imageAssetLocallyAvailable");
  objc_msgSend(v4, "encodeBool:forKey:", v15, AXMVisionFeatureAssetMetadataCodingKeyAssetLocallyAvailableIdentifier);
  -[AXMVisionFeatureAssetMetadata imageAssetPhotoLibraryURL](self, "imageAssetPhotoLibraryURL");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, AXMVisionFeatureAssetMetadataCodingkeyPhotoLibraryURL);

}

- (BOOL)isEqual:(id)a3
{
  AXMVisionFeatureAssetMetadata *v4;
  AXMVisionFeatureAssetMetadata *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  void *v11;

  v4 = (AXMVisionFeatureAssetMetadata *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AXMVisionFeatureAssetMetadata localIdentifier](self, "localIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeatureAssetMetadata localIdentifier](v5, "localIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        -[AXMVisionFeatureAssetMetadata url](self, "url");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMVisionFeatureAssetMetadata url](v5, "url");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v10, "isEqual:", v11);

      }
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[AXMVisionFeatureAssetMetadata url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AXMVisionFeatureAssetMetadata localIdentifier](self, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXMVisionFeatureAssetMetadata name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionFeatureAssetMetadata creationDate](self, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionFeatureAssetMetadata uti](self, "uti");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionFeatureAssetMetadata localizedTypeDescription](self, "localizedTypeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionFeatureAssetMetadata imageAssetLocalIdentifier](self, "imageAssetLocalIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AXMVisionFeatureAssetMetadata imageAssetLocallyAvailable](self, "imageAssetLocallyAvailable");
  -[AXMVisionFeatureAssetMetadata imageAssetPhotoLibraryURL](self, "imageAssetPhotoLibraryURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("name:%@ created:%@ UTI:%@ typeDesc:%@ assetLocalIdentifier:%@ isAssetLocallyAvailable:%d photoLibraryURL:%@"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)assetMetadataFromURL:(id)a3
{
  id v3;
  AXMVisionFeatureAssetMetadata *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CGImageSource *v17;
  CGImageSource *v18;
  CFDictionaryRef v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[6];

  v32[5] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(AXMVisionFeatureAssetMetadata);
  -[AXMVisionFeatureAssetMetadata setAssetURL:](v4, "setAssetURL:", v3);
  if (v3)
  {
    v5 = *MEMORY[0x1E0C99A90];
    v6 = *MEMORY[0x1E0C998E8];
    v32[0] = *MEMORY[0x1E0C99A90];
    v32[1] = v6;
    v7 = *MEMORY[0x1E0C99AD0];
    v8 = *MEMORY[0x1E0C99A78];
    v32[2] = *MEMORY[0x1E0C99AD0];
    v32[3] = v8;
    v32[4] = *MEMORY[0x1E0C99968];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v3, "resourceValuesForKeys:error:", v9, &v31);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v31;
    if (v11)
    {
      AXMediaLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[AXMModelDetectorNode evaluate:metrics:].cold.5((uint64_t)v11, v12);

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureAssetMetadata setName:](v4, "setName:", v13);

    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureAssetMetadata setCreationDate:](v4, "setCreationDate:", v14);

    objc_msgSend(v10, "objectForKeyedSubscript:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureAssetMetadata setUti:](v4, "setUti:", v15);

    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureAssetMetadata setLocalizedTypeDescription:](v4, "setLocalizedTypeDescription:", v16);

    v17 = CGImageSourceCreateWithURL((CFURLRef)v3, 0);
    if (v17)
    {
      v18 = v17;
      v19 = CGImageSourceCopyPropertiesAtIndex(v17, 0, 0);
      -[__CFDictionary objectForKey:](v19, "objectForKey:", *MEMORY[0x1E0CBD090]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKey:", *MEMORY[0x1E0CBD0A8]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeatureAssetMetadata setTIFFImageDescription:](v4, "setTIFFImageDescription:", v20);

      -[__CFDictionary objectForKey:](v19, "objectForKey:", *MEMORY[0x1E0CBCED8]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKey:", *MEMORY[0x1E0CBCEB8]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeatureAssetMetadata setIPTCCaptionAbstract:](v4, "setIPTCCaptionAbstract:", v21);

      -[__CFDictionary objectForKey:](v19, "objectForKey:", *MEMORY[0x1E0CBCB50]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0CBCCB0]);
      v23 = v9;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeatureAssetMetadata setEXIFUserComment:](v4, "setEXIFUserComment:", v24);

      -[__CFDictionary objectForKey:](v19, "objectForKey:", *MEMORY[0x1E0CBD028]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKey:", *MEMORY[0x1E0CBD018]);
      v26 = v11;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeatureAssetMetadata setPNGImageDescription:](v4, "setPNGImageDescription:", v27);

      v11 = v26;
      CFRelease(v18);

      v9 = v23;
    }

  }
  return v4;
}

+ (id)assetMetadataFromURL:(id)a3 localIdentifier:(id)a4 photoLibraryURL:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "assetMetadataFromURL:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImageAssetLocalIdentifier:", v9);

  objc_msgSend(v10, "setImageAssetLocallyAvailable:", 0);
  objc_msgSend(v10, "setImageAssetPhotoLibraryURL:", v8);

  return v10;
}

+ (id)assetMetadataWithLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 creationDate:(id)a5 UTI:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  AXMVisionFeatureAssetMetadata *v13;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = a3;
  v13 = objc_alloc_init(AXMVisionFeatureAssetMetadata);
  -[AXMVisionFeatureAssetMetadata setImageAssetLocalIdentifier:](v13, "setImageAssetLocalIdentifier:", v12);

  -[AXMVisionFeatureAssetMetadata setImageAssetLocallyAvailable:](v13, "setImageAssetLocallyAvailable:", 1);
  if (v12)
  {
    -[AXMVisionFeatureAssetMetadata setCreationDate:](v13, "setCreationDate:", v10);
    -[AXMVisionFeatureAssetMetadata setUti:](v13, "setUti:", v11);
    -[AXMVisionFeatureAssetMetadata setImageAssetPhotoLibraryURL:](v13, "setImageAssetPhotoLibraryURL:", v9);
  }

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSString)uti
{
  return self->_uti;
}

- (void)setUti:(id)a3
{
  objc_storeStrong((id *)&self->_uti, a3);
}

- (NSString)localizedTypeDescription
{
  return self->_localizedTypeDescription;
}

- (void)setLocalizedTypeDescription:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTypeDescription, a3);
}

- (NSString)TIFFImageDescription
{
  return self->_TIFFImageDescription;
}

- (void)setTIFFImageDescription:(id)a3
{
  objc_storeStrong((id *)&self->_TIFFImageDescription, a3);
}

- (NSString)IPTCCaptionAbstract
{
  return self->_IPTCCaptionAbstract;
}

- (void)setIPTCCaptionAbstract:(id)a3
{
  objc_storeStrong((id *)&self->_IPTCCaptionAbstract, a3);
}

- (NSString)EXIFUserComment
{
  return self->_EXIFUserComment;
}

- (void)setEXIFUserComment:(id)a3
{
  objc_storeStrong((id *)&self->_EXIFUserComment, a3);
}

- (NSString)PNGImageDescription
{
  return self->_PNGImageDescription;
}

- (void)setPNGImageDescription:(id)a3
{
  objc_storeStrong((id *)&self->_PNGImageDescription, a3);
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)setAssetURL:(id)a3
{
  objc_storeStrong((id *)&self->_assetURL, a3);
}

- (NSString)imageAssetLocalIdentifier
{
  return self->_imageAssetLocalIdentifier;
}

- (void)setImageAssetLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_imageAssetLocalIdentifier, a3);
}

- (BOOL)imageAssetLocallyAvailable
{
  return self->_imageAssetLocallyAvailable;
}

- (void)setImageAssetLocallyAvailable:(BOOL)a3
{
  self->_imageAssetLocallyAvailable = a3;
}

- (NSURL)imageAssetPhotoLibraryURL
{
  return self->_imageAssetPhotoLibraryURL;
}

- (void)setImageAssetPhotoLibraryURL:(id)a3
{
  objc_storeStrong((id *)&self->_imageAssetPhotoLibraryURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAssetPhotoLibraryURL, 0);
  objc_storeStrong((id *)&self->_imageAssetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_PNGImageDescription, 0);
  objc_storeStrong((id *)&self->_EXIFUserComment, 0);
  objc_storeStrong((id *)&self->_IPTCCaptionAbstract, 0);
  objc_storeStrong((id *)&self->_TIFFImageDescription, 0);
  objc_storeStrong((id *)&self->_localizedTypeDescription, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
