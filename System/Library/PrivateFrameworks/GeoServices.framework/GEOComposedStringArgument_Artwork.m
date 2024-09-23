@implementation GEOComposedStringArgument_Artwork

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOComposedStringArgument_Artwork;
  v5 = -[GEOComposedStringArgument _initWithGeoFormatArgument:](&v16, sel__initWithGeoFormatArgument_, v4);
  if (v5)
  {
    objc_msgSend(v4, "artwork");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v6;

    objc_msgSend(v4, "valString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(*((id *)v5 + 4), "shield");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shieldText");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    v12 = objc_msgSend(v10, "copy");
    v13 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v12;

    v14 = v5;
  }

  return v5;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  if (a3 && *((_BYTE *)a3 + 9))
    return self->_fallbackStringValue;
  else
    return 0;
}

- (id)_attributedStringReplacementWithOptions:(id)a3
{
  id v4;
  void *v5;
  GEOPBTransitArtwork *artwork;
  void (**attributedStringHandler)(id, GEOPBTransitArtwork *, id, NSString *);
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSString *v12;
  NSString *fallbackStringValue;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  int v18;
  GEOComposedStringArgument_Artwork *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  artwork = self->_artwork;
  if (!artwork
    || (attributedStringHandler = (void (**)(id, GEOPBTransitArtwork *, id, NSString *))self->_attributedStringHandler) == 0)
  {
    GEOGetGEOComposedStringLog_1();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      fallbackStringValue = self->_fallbackStringValue;
      v18 = 138412290;
      v19 = (GEOComposedStringArgument_Artwork *)fallbackStringValue;
      v14 = "Artwork string \"%@\" was built without attributedStringHandler set.";
      v15 = v11;
      v16 = OS_LOG_TYPE_ERROR;
LABEL_11:
      _os_log_impl(&dword_1885A9000, v15, v16, v14, (uint8_t *)&v18, 0xCu);
    }
LABEL_12:
    v10 = 0;
LABEL_13:

    goto LABEL_14;
  }
  if (v4)
    v8 = (void *)*((_QWORD *)v4 + 2);
  else
    v8 = 0;
  v9 = v8;
  attributedStringHandler[2](attributedStringHandler, artwork, v9, self->_fallbackStringValue);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (self->_fallbackStringValue)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", self->_fallbackStringValue);
      GEOGetGEOComposedStringLog_1();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = self->_fallbackStringValue;
        v18 = 138412290;
        v19 = (GEOComposedStringArgument_Artwork *)v12;
        _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "Did not get valid string replacement from attributedStringHandler, using fallback string: \"%@\", (uint8_t *)&v18, 0xCu);
      }
      goto LABEL_13;
    }
    GEOGetGEOComposedStringLog_1();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v18 = 138412290;
      v19 = self;
      v14 = "Did not get valid string replacement from attributedStringHandler and no fallback string is available: %@";
      v15 = v11;
      v16 = OS_LOG_TYPE_FAULT;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
LABEL_14:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOComposedStringArgument_Artwork;
  v4 = -[GEOComposedStringArgument copyWithZone:](&v8, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 4, self->_artwork);
  v5 = -[NSString copy](self->_fallbackStringValue, "copy");
  v6 = v4[5];
  v4[5] = (id)v5;

  return v4;
}

- (GEOComposedStringArgument_Artwork)initWithCoder:(id)a3
{
  id v4;
  GEOComposedStringArgument_Artwork *v5;
  uint64_t v6;
  GEOPBTransitArtwork *artwork;
  uint64_t v8;
  NSString *fallbackStringValue;
  GEOComposedStringArgument_Artwork *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedStringArgument_Artwork;
  v5 = -[GEOComposedStringArgument initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_artwork"));
    v6 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (GEOPBTransitArtwork *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fallbackStringValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    fallbackStringValue = v5->_fallbackStringValue;
    v5->_fallbackStringValue = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Artwork;
  v4 = a3;
  -[GEOComposedStringArgument encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_artwork, CFSTR("_artwork"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_fallbackStringValue, CFSTR("_fallbackStringValue"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  _BOOL4 v10;
  NSString *fallbackStringValue;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;
  objc_super v17;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v17.receiver = self;
    v17.super_class = (Class)GEOComposedStringArgument_Artwork;
    if (-[GEOComposedStringArgument isEqual:](&v17, sel_isEqual_, v5)
      && ((v6 = (void *)v5[4], v7 = self->_artwork, v8 = v6, !(v7 | v8))
       || (v9 = (void *)v8, v10 = objc_msgSend((id)v7, "isEqual:", v8), v9, (id)v7, v10)))
    {
      fallbackStringValue = self->_fallbackStringValue;
      v12 = v5[5];
      v13 = fallbackStringValue;
      v14 = v13;
      if ((unint64_t)v13 | v12)
        v15 = objc_msgSend(v13, "isEqual:", v12);
      else
        v15 = 1;

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)attributedStringHandler
{
  return self->_attributedStringHandler;
}

- (void)setAttributedStringHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_attributedStringHandler, 0);
  objc_storeStrong((id *)&self->_fallbackStringValue, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
}

@end
