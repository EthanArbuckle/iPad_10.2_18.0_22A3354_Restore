@implementation LPMapCollectionMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPMapCollectionMetadata)initWithCoder:(id)a3
{
  id v4;
  LPMapCollectionMetadata *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  LPImage *icon;
  uint64_t v13;
  LPImage *image;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  LPImage *darkImage;
  uint64_t v20;
  NSArray *addresses;
  uint64_t v22;
  NSString *publisherName;
  LPMapCollectionMetadata *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)LPMapCollectionMetadata;
  v5 = -[LPMapCollectionMetadata init](&v26, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)&v5->_numberOfItems;
    *(_QWORD *)&v5->_numberOfItems = v6;

    decodeNumberForKey(v4, CFSTR("numberOfItems"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(&v5->super.__disallowsURLOverrideByDelegate + 2) = objc_msgSend(v8, "unsignedIntValue");

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v9 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v9;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("image"));
    v11 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (LPImage *)v11;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("darkImage"));
    v13 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (LPImage *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_lp_strictlyDecodeArrayOfObjectsOfClasses:forKey:", v17, CFSTR("addresses"));
    v18 = objc_claimAutoreleasedReturnValue();
    darkImage = v5->_darkImage;
    v5->_darkImage = (LPImage *)v18;

    decodeStringForKey(v4, (uint64_t)CFSTR("publisherName"));
    v20 = objc_claimAutoreleasedReturnValue();
    addresses = v5->_addresses;
    v5->_addresses = (NSArray *)v20;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("publisherIcon"));
    v22 = objc_claimAutoreleasedReturnValue();
    publisherName = v5->_publisherName;
    v5->_publisherName = (NSString *)v22;

    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "_lp_encodeStringIfNotNil:forKey:", *(_QWORD *)&self->_numberOfItems, CFSTR("name"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(&self->super.__disallowsURLOverrideByDelegate + 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", v4, CFSTR("numberOfItems"));

  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_name, CFSTR("icon"));
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("image"));
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_image, CFSTR("darkImage"));
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_darkImage, CFSTR("addresses"));
  objc_msgSend(v5, "_lp_encodeStringIfNotNil:forKey:", self->_addresses, CFSTR("publisherName"));
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_publisherName, CFSTR("publisherIcon"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPMapCollectionMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  LPMapCollectionMetadata *v12;

  v4 = +[LPMapCollectionMetadata allocWithZone:](LPMapCollectionMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPMapCollectionMetadata name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapCollectionMetadata setName:](v4, "setName:", v5);

    -[LPMapCollectionMetadata setNumberOfItems:](v4, "setNumberOfItems:", -[LPMapCollectionMetadata numberOfItems](self, "numberOfItems"));
    -[LPMapCollectionMetadata icon](self, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapCollectionMetadata setIcon:](v4, "setIcon:", v6);

    -[LPMapCollectionMetadata image](self, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapCollectionMetadata setImage:](v4, "setImage:", v7);

    -[LPMapCollectionMetadata darkImage](self, "darkImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapCollectionMetadata setDarkImage:](v4, "setDarkImage:", v8);

    -[LPMapCollectionMetadata addresses](self, "addresses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapCollectionMetadata setAddresses:](v4, "setAddresses:", v9);

    -[LPMapCollectionMetadata publisherName](self, "publisherName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapCollectionMetadata setPublisherName:](v4, "setPublisherName:", v10);

    -[LPMapCollectionMetadata publisherIcon](self, "publisherIcon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapCollectionMetadata setPublisherIcon:](v4, "setPublisherIcon:", v11);

    v12 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPMapCollectionMetadata;
  if (-[LPMapCollectionMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], *(void **)&self->_numberOfItems) & 1) != 0
        && *((_DWORD *)v6 + 3) == *(_DWORD *)(&self->super.__disallowsURLOverrideByDelegate + 2)
        && objectsAreEqual_0(v6[3], self->_name)
        && objectsAreEqual_0(v6[6], self->_darkImage)
        && objectsAreEqual_0(v6[4], self->_icon)
        && objectsAreEqual_0(v6[5], self->_image)
        && objectsAreEqual_0(v6[7], self->_addresses))
      {
        v5 = objectsAreEqual_0(v6[8], self->_publisherName);
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return objc_msgSend(*(id *)&self->_numberOfItems, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  void (**v3)(id, const __CFString *);

  v3 = (void (**)(id, const __CFString *))a3;
  v3[2](v3, CFSTR("image"));
  v3[2](v3, CFSTR("darkImage"));
  v3[2](v3, CFSTR("icon"));
  v3[2](v3, CFSTR("publisherIcon"));

}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("name"), CFSTR("numberOfItems"), CFSTR("icon"), CFSTR("image"), CFSTR("darkImage"), CFSTR("addresses"), CFSTR("publisherName"), CFSTR("publisherIcon"), 0);
}

- (NSString)name
{
  return *(NSString **)&self->_numberOfItems;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)numberOfItems
{
  return *(_DWORD *)(&self->super.__disallowsURLOverrideByDelegate + 2);
}

- (void)setNumberOfItems:(unsigned int)a3
{
  *(_DWORD *)(&self->super.__disallowsURLOverrideByDelegate + 2) = a3;
}

- (LPImage)icon
{
  return (LPImage *)self->_name;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (LPImage)image
{
  return self->_icon;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (LPImage)darkImage
{
  return self->_image;
}

- (void)setDarkImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSArray)addresses
{
  return (NSArray *)self->_darkImage;
}

- (void)setAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)publisherName
{
  return (NSString *)&self->_addresses->super.isa;
}

- (void)setPublisherName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (LPImage)publisherIcon
{
  return (LPImage *)self->_publisherName;
}

- (void)setPublisherIcon:(id)a3
{
  objc_storeStrong((id *)&self->_publisherName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherName, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_darkImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_numberOfItems, 0);
}

- (id)_resolvedImage
{
  void *v3;
  id v4;
  LPImage *v5;
  void *v6;
  void *v7;

  -[LPMapCollectionMetadata image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "platformImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [LPImage alloc];
    -[LPMapCollectionMetadata image](self, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[LPImage _initWithImage:](v5, "_initWithImage:", v6);

    -[LPMapCollectionMetadata darkImage](self, "darkImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setDarkInterfaceAlternativeImage:", v7);

  }
  return v4;
}

- (id)_bottomLine
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("%d Place(s)"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, -[LPMapCollectionMetadata numberOfItems](self, "numberOfItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[LPMapCollectionMetadata publisherName](self, "publisherName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[LPMapCollectionMetadata publisherName](self, "publisherName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    joinedByDot(v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[LPMapCollectionMetadata addresses](self, "addresses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      -[LPMapCollectionMetadata addresses](self, "addresses");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v16, "city");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              objc_msgSend(v16, "city");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObject:", v18);

            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v13);
      }

      if (objc_msgSend(v11, "count"))
      {
        v19 = (void *)MEMORY[0x1E0CB3738];
        objc_msgSend(v11, "allObjects");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringByJoiningStrings:", v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = 0;
      }

    }
    joinedByDot(v5, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  void *v5;
  LPCaptionBarPresentationProperties *v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  objc_msgSend(v4, "commonPresentationPropertiesForStyle:", 31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v5, "setCaptionBar:", v6);

  if (objc_msgSend(v4, "effectiveSizeClass") == 2
    && (-[LPMapCollectionMetadata icon](self, "icon"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[LPMapCollectionMetadata image](self, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[LPMapCollectionMetadata _resolvedImage](self, "_resolvedImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_populateProperties:withPrimaryImage:", v5, v9);
      goto LABEL_7;
    }
  }
  -[LPMapCollectionMetadata icon](self, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_populateProperties:withPrimaryIcon:", v5, v9);
LABEL_7:

  objc_msgSend(v5, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[LPMapCollectionMetadata publisherIcon](self, "publisherIcon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTrailingIcon:", v11);

  }
  else
  {
    if (!sizeClassRequiresLargeMedia(objc_msgSend(v4, "effectiveSizeClass")))
      goto LABEL_12;
    +[LPResources mapIcon](LPResources, "mapIcon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v11);
  }

LABEL_12:
  v13 = objc_msgSend(v4, "_rowConfigurationForStyle:", objc_msgSend(v5, "style"));
  if ((unint64_t)(v13 - 2) < 2)
  {
    -[LPMapCollectionMetadata name](self, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "top");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "leading");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setText:", v18);

    -[LPMapCollectionMetadata _bottomLine](self, "_bottomLine");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottom");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leading");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", v22);

    LPLocalizedString(CFSTR(" Maps"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "belowBottom");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leading");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v14);
    goto LABEL_18;
  }
  if (v13 == 1)
  {
    -[LPMapCollectionMetadata name](self, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "top");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leading");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", v26);

    -[LPMapCollectionMetadata _bottomLine](self, "_bottomLine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottom");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leading");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v14);
    goto LABEL_18;
  }
  if (!v13)
  {
    -[LPMapCollectionMetadata name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "top");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leading");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v14);
LABEL_18:

  }
  objc_msgSend(v4, "effectiveSizeClass");
  populatePropertiesForVisualRefresh(v5);

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isAppleMapsCollectionURL:](LPPresentationSpecializations, "isAppleMapsCollectionURL:", a3);
}

- (id)previewSummaryForTransformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("Maps Guide: %@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPMapCollectionMetadata name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)previewImageForTransformer:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[LPMapCollectionMetadata image](self, "image", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[LPMapCollectionMetadata icon](self, "icon");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)fallbackIconForTransformer:(id)a3
{
  +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("mappin"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[LPMapCollectionMetadata name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v4);

  -[LPMapCollectionMetadata icon](self, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIcon:", v5);

  -[LPMapCollectionMetadata image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

}

@end
