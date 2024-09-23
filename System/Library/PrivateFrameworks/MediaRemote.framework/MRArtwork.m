@implementation MRArtwork

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
}

- (MRArtwork)initWithProtobuf:(id)a3
{
  id v4;
  MRArtwork *v5;
  MRArtwork *v6;
  void *v7;
  uint64_t v8;
  NSData *imageData;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  objc_msgSend(v4, "artworkData");
  v5 = (MRArtwork *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)MRArtwork;
    v6 = -[MRArtwork init](&v17, sel_init);
    if (v6)
    {
      objc_msgSend(v4, "artworkData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      imageData = v6->_imageData;
      v6->_imageData = (NSData *)v8;

      objc_msgSend(v4, "metadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasArtworkDataWidthDeprecated");

      if (v11)
      {
        objc_msgSend(v4, "metadata");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6->_width = (int)objc_msgSend(v12, "artworkDataWidthDeprecated");

      }
      else
      {
        v6->_width = (int)objc_msgSend(v4, "artworkDataWidth");
      }
      objc_msgSend(v4, "metadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hasArtworkDataHeightDeprecated");

      if (v14)
      {
        objc_msgSend(v4, "metadata");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v6->_height = (int)objc_msgSend(v15, "artworkDataHeightDeprecated");

      }
      else
      {
        v6->_height = (int)objc_msgSend(v4, "artworkDataHeight");
      }
    }
    self = v6;
    v5 = self;
  }

  return v5;
}

- (MRArtwork)initWithImageData:(id)a3 height:(int64_t)a4 width:(int64_t)a5
{
  id v6;
  MRArtwork *v7;
  MRArtwork *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRArtwork;
  v7 = -[MRArtwork init](&v10, sel_init);
  v8 = v7;
  if (v7)
    -[MRArtwork setImageData:](v7, "setImageData:", v6);

  return v8;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *StringRepresentation;
  void *v7;
  void *v8;
  void *v9;
  const __CFData *v10;
  __CFString *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MRArtwork imageData](self, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRArtwork imageData](self, "imageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    StringRepresentation = (void *)MRDataCreateStringRepresentation(v5);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", StringRepresentation, CFSTR("imageData"));

  }
  if (-[MRArtwork height](self, "height") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRArtwork height](self, "height"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("height"));

  }
  if (-[MRArtwork width](self, "width") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRArtwork width](self, "width"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("width"));

  }
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "shouldLogArtwork"))
  {
    -[MRArtwork imageData](self, "imageData");
    v10 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v11 = (__CFString *)MRCreateASCIIRepresentationFromImageData(v10);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("image"));

  }
  return (NSDictionary *)v3;
}

- (void)setImageData:(id)a3
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSData *imageData;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v5 = a3;
  if (v5)
  {
    if (+[MRArtwork processRequestsExternalArtworkValidation](MRArtwork, "processRequestsExternalArtworkValidation"))
    {
      MRGetSharedService();
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageDimensionsForArtworkData:", v5);
      v9 = v8;
      v10 = v7;
      if (v8 != *MEMORY[0x1E0C9D820] || v7 != *(double *)(MEMORY[0x1E0C9D820] + 8))
        goto LABEL_15;
      _MRLogForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[MRArtwork setImageData:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    else
    {
      v30 = 0;
      +[MRImageUtilities imageDimensionsForImageData:error:](MRImageUtilities, "imageDimensionsForImageData:error:", v5, &v30);
      v9 = v21;
      v10 = v22;
      v6 = v30;
      if (!v6)
      {
LABEL_15:
        objc_storeStrong((id *)&self->_imageData, a3);
        self->_height = (uint64_t)v10;
        self->_width = (uint64_t)v9;
        goto LABEL_16;
      }
      _MRLogForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[MRArtwork setImageData:].cold.1(v12, v23, v24, v25, v26, v27, v28, v29);
    }

LABEL_16:
    goto LABEL_17;
  }
  imageData = self->_imageData;
  self->_imageData = 0;

  self->_height = 0;
  self->_width = 0;
LABEL_17:

}

- (BOOL)isEqual:(id)a3
{
  MRArtwork *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;

  v4 = (MRArtwork *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
    -[MRArtwork imageData](v4, "imageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRArtwork imageData](self, "imageData");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 == (void *)v6)
    {

    }
    else
    {
      v7 = (void *)v6;
      -[MRArtwork imageData](v4, "imageData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRArtwork imageData](self, "imageData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToData:", v9);

      if (!v10)
        goto LABEL_10;
    }
    v12 = -[MRArtwork height](v4, "height");
    if (v12 != -[MRArtwork height](self, "height"))
    {
LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
    v13 = -[MRArtwork width](v4, "width");
    v11 = v13 == -[MRArtwork width](self, "width");
  }
LABEL_11:

  return v11;
}

- (id)description
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  v5 = -[MRArtwork width](self, "width");
  v6 = -[MRArtwork height](self, "height");
  -[MRArtwork imageData](self, "imageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> %ld x %ld (%ld bytes)"), v4, self, v5, v6, objc_msgSend(v7, "length"));

  return v8;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFData *v8;
  __CFString *v9;
  void *v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p> {\n"), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("  width = %ld\n"), -[MRArtwork width](self, "width"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  height = %ld\n"), -[MRArtwork height](self, "height"));
  -[MRArtwork imageData](self, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  imageData = %@\n"), v6);

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "shouldLogArtwork");

  if ((_DWORD)v5)
  {
    -[MRArtwork imageData](self, "imageData");
    v8 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v9 = (__CFString *)MRCreateASCIIRepresentationFromImageData(v8);
    MRCreateIndentedDebugDescriptionFromObject(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("artwork = %@\n"), v10);

  }
  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MRArtwork imageData](self, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D50]);
    -[MRArtwork imageData](self, "imageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithData:", v7);
    objc_msgSend(v4, "setImageData:", v8);

  }
  else
  {
    objc_msgSend(v4, "setImageData:", 0);
  }

  objc_msgSend(v4, "setHeight:", -[MRArtwork height](self, "height"));
  objc_msgSend(v4, "setWidth:", -[MRArtwork width](self, "width"));
  return v4;
}

- (id)artworkByResizingWithWidth:(int64_t)a3 height:(int64_t)a4
{
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  MRArtwork *v22;
  id v24;

  v7 = (double)a3;
  v8 = (double)a4;
  v9 = (double)-[MRArtwork width](self, "width");
  v10 = -[MRArtwork height](self, "height");
  v11 = (double)v10;
  if (v7 + 0.5 >= v9 && v8 + 0.5 >= v11)
  {
LABEL_22:
    v22 = 0;
    return v22;
  }
  v13 = v9;
  v14 = (double)v10;
  if ((a4 & a3) != 0xFFFFFFFFFFFFFFFFLL)
  {
    v15 = v9 / v11;
    if (a3 == -1)
    {
      v13 = v15 * v8;
      goto LABEL_11;
    }
    if (a4 != -1)
    {
      v13 = v7;
LABEL_11:
      v14 = v8;
      goto LABEL_13;
    }
    v13 = v7;
    v14 = v7 / v15;
  }
LABEL_13:
  v16 = v14 + 0.5;
  if (v13 + 0.5 >= v9 && v16 >= v11)
    goto LABEL_22;
  -[MRArtwork imageData](self, "imageData", v11, v16, v13 + 0.5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  +[MRImageUtilities resizeImageData:forFittingSize:error:](MRImageUtilities, "resizeImageData:forFittingSize:error:", v18, &v24, v13, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v24;

  if (v20)
  {
    _MRLogForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[MRArtwork artworkByResizingWithWidth:height:].cold.1((uint64_t)v20, v21);

    v22 = 0;
  }
  else
  {
    v22 = -[MRArtwork initWithImageData:height:width:]([MRArtwork alloc], "initWithImageData:height:width:", v19, (uint64_t)v14, (uint64_t)v13);
  }

  return v22;
}

+ (BOOL)processRequestsExternalArtworkValidation
{
  if (processRequestsExternalArtworkValidation_onceToken != -1)
    dispatch_once(&processRequestsExternalArtworkValidation_onceToken, &__block_literal_global_28);
  return processRequestsExternalArtworkValidation___entitled;
}

uint64_t __53__MRArtwork_processRequestsExternalArtworkValidation__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D4D070], "hasBoolEntitlement:", CFSTR("com.apple.mediaremote.external-artwork-validation"));
  processRequestsExternalArtworkValidation___entitled = result;
  return result;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (int64_t)height
{
  return self->_height;
}

- (int64_t)width
{
  return self->_width;
}

- (void)setImageData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_193827000, a1, a3, "[MRArtwork] Failed to determine dimensions for provided image data.", a5, a6, a7, a8, 0);
}

- (void)artworkByResizingWithWidth:(uint64_t)a1 height:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_193827000, a2, OS_LOG_TYPE_ERROR, "[MRArtwork] resize failed with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
