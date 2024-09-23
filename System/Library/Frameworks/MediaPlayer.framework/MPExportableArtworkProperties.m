@implementation MPExportableArtworkProperties

- (MPExportableArtworkProperties)initWithJSONRepresentation:(id)a3
{
  id v4;
  MPExportableArtworkProperties *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSArray *artworkTemplateItems;
  NSString *v10;
  MPExportableArtworkProperties *v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPExportableArtworkProperties;
  v5 = -[MPExportableArtworkProperties init](&v13, sel_init);
  if (v5)
  {
    if (_NSIsNSDictionary())
    {
      v6 = v4;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
      {
        if (objc_msgSend(v7, "containsString:", CFSTR("{"))
          && objc_msgSend(v7, "containsString:", CFSTR("}")))
        {
          v14[0] = v6;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
          v8 = objc_claimAutoreleasedReturnValue();
          artworkTemplateItems = v5->_artworkTemplateItems;
          v5->_artworkTemplateItems = (NSArray *)v8;
        }
        else
        {
          v10 = v7;
          artworkTemplateItems = (NSArray *)v5->_resolvedURLString;
          v5->_resolvedURLString = v10;
        }

        goto LABEL_9;
      }

    }
    v11 = 0;
    goto LABEL_12;
  }
LABEL_9:
  v11 = v5;
LABEL_12:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPExportableArtworkProperties *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(MPExportableArtworkProperties);
  -[MPExportableArtworkProperties resolvedURLString](self, "resolvedURLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPExportableArtworkProperties setResolvedURLString:](v4, "setResolvedURLString:", v5);

  -[MPExportableArtworkProperties artworkTemplateItems](self, "artworkTemplateItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPExportableArtworkProperties setArtworkTemplateItems:](v4, "setArtworkTemplateItems:", v6);

  -[MPExportableArtworkProperties setMediaType:](v4, "setMediaType:", -[MPExportableArtworkProperties mediaType](self, "mediaType"));
  -[MPExportableArtworkProperties setMediaLibraryArtworkType:](v4, "setMediaLibraryArtworkType:", -[MPExportableArtworkProperties mediaLibraryArtworkType](self, "mediaLibraryArtworkType"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  MPExportableArtworkProperties *v4;
  MPExportableArtworkProperties *v5;
  BOOL v6;

  v4 = (MPExportableArtworkProperties *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NSString isEqualToString:](self->_resolvedURLString, "isEqualToString:", v5->_resolvedURLString)
        && -[NSArray isEqual:](self->_artworkTemplateItems, "isEqual:", v5->_artworkTemplateItems)
        && self->_mediaType == v5->_mediaType
        && self->_mediaLibraryArtworkType == v5->_mediaLibraryArtworkType;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p resolvedURL:%@ artworkTemplateItems:%@ mediaType:%ld artworkType:%ld>"), v5, self, self->_resolvedURLString, self->_artworkTemplateItems, self->_mediaType, self->_mediaLibraryArtworkType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isValid
{
  return -[NSArray count](self->_artworkTemplateItems, "count")
      || -[NSString length](self->_resolvedURLString, "length") != 0;
}

- (ICStoreArtworkInfo)artworkInfo
{
  void *v3;
  unint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;

  -[MPExportableArtworkProperties artworkTemplateItems](self, "artworkTemplateItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 < 2)
  {
    -[MPExportableArtworkProperties artworkTemplateItems](self, "artworkTemplateItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = objc_alloc(MEMORY[0x1E0DDC070]);
      -[MPExportableArtworkProperties artworkTemplateItems](self, "artworkTemplateItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "initWithArtworkResponseDictionary:", v11);
    }
    else
    {
      -[MPExportableArtworkProperties resolvedURLString](self, "resolvedURLString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (!v14)
      {
        v7 = 0;
        return (ICStoreArtworkInfo *)v7;
      }
      v15 = objc_alloc(MEMORY[0x1E0DDC070]);
      v16 = (void *)MEMORY[0x1E0C99E98];
      -[MPExportableArtworkProperties resolvedURLString](self, "resolvedURLString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLWithString:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v15, "initWithArtworkURL:", v11);
    }
    v7 = (void *)v12;

  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0DDC070]);
    -[MPExportableArtworkProperties artworkTemplateItems](self, "artworkTemplateItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithArtworkResponseArray:", v6);
  }

  return (ICStoreArtworkInfo *)v7;
}

- (id)jsonRepresentation
{
  void *v3;
  NSString *resolvedURLString;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_artworkTemplateItems, "count"))
  {
    -[NSArray firstObject](self->_artworkTemplateItems, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[NSString length](self->_resolvedURLString, "length"))
  {
    resolvedURLString = self->_resolvedURLString;
    v6 = CFSTR("url");
    v7[0] = resolvedURLString;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v3;
}

- (NSString)resolvedURLString
{
  return self->_resolvedURLString;
}

- (void)setResolvedURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)artworkTemplateItems
{
  return self->_artworkTemplateItems;
}

- (void)setArtworkTemplateItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(unint64_t)a3
{
  self->_mediaType = a3;
}

- (int64_t)mediaLibraryArtworkType
{
  return self->_mediaLibraryArtworkType;
}

- (void)setMediaLibraryArtworkType:(int64_t)a3
{
  self->_mediaLibraryArtworkType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkTemplateItems, 0);
  objc_storeStrong((id *)&self->_resolvedURLString, 0);
}

@end
