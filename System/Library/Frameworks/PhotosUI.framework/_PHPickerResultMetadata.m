@implementation _PHPickerResultMetadata

- (BOOL)isEqual:(id)a3
{
  NSString *suggestedName;
  _PHPickerResultMetadata *v5;
  _PHPickerResultMetadata *v6;
  objc_class *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  int v11;
  char v12;
  objc_class *v13;
  objc_class *v14;
  NSOrderedSet *typeIdentifiers;
  NSOrderedSet *v16;
  NSOrderedSet *v17;
  NSOrderedSet *v18;
  int v19;
  NSDictionary *filePromiseURLs;
  NSDictionary *v21;
  NSDictionary *v22;
  NSDictionary *v23;
  int v24;
  NSDictionary *sandboxExtensionTokens;
  NSDictionary *v27;
  NSDictionary *v28;
  NSDictionary *v29;

  v5 = (_PHPickerResultMetadata *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = (objc_class *)objc_opt_class();
      if (v6)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (self->_pixelWidth != v6->_pixelWidth
            || self->_pixelHeight != v6->_pixelHeight
            || vabdd_f64(self->_preferredCropRect.origin.x, v6->_preferredCropRect.origin.x) > 0.00000999999975
            || vabdd_f64(self->_preferredCropRect.origin.y, v6->_preferredCropRect.origin.y) > 0.00000999999975
            || vabdd_f64(self->_preferredCropRect.size.width, v6->_preferredCropRect.size.width) > 0.00000999999975
            || vabdd_f64(self->_preferredCropRect.size.height, v6->_preferredCropRect.size.height) > 0.00000999999975
            || vabdd_f64(self->_acceptableCropRect.origin.x, v6->_acceptableCropRect.origin.x) > 0.00000999999975
            || vabdd_f64(self->_acceptableCropRect.origin.y, v6->_acceptableCropRect.origin.y) > 0.00000999999975
            || vabdd_f64(self->_acceptableCropRect.size.width, v6->_acceptableCropRect.size.width) > 0.00000999999975
            || vabdd_f64(self->_acceptableCropRect.size.height, v6->_acceptableCropRect.size.height) > 0.00000999999975
            || vabdd_f64(self->_normalizedFaceAreaRect.origin.x, v6->_normalizedFaceAreaRect.origin.x) > 0.00000999999975
            || vabdd_f64(self->_normalizedFaceAreaRect.origin.y, v6->_normalizedFaceAreaRect.origin.y) > 0.00000999999975
            || vabdd_f64(self->_normalizedFaceAreaRect.size.width, v6->_normalizedFaceAreaRect.size.width) > 0.00000999999975
            || vabdd_f64(self->_normalizedFaceAreaRect.size.height, v6->_normalizedFaceAreaRect.size.height) > 0.00000999999975
            || self->_allowsItemProviderOpenInPlace != v6->_allowsItemProviderOpenInPlace)
          {
            goto LABEL_35;
          }
          suggestedName = self->_suggestedName;
          v8 = v6->_suggestedName;
          if (suggestedName != v8)
          {
            v9 = v8;
            v10 = suggestedName;
            v11 = -[NSString isEqual:](v10, "isEqual:", v9);

            if (!v11)
              goto LABEL_35;
LABEL_29:
            typeIdentifiers = self->_typeIdentifiers;
            v16 = v6->_typeIdentifiers;
            if (typeIdentifiers == v16)
            {

            }
            else
            {
              v17 = v16;
              v18 = typeIdentifiers;
              v19 = -[NSOrderedSet isEqual:](v18, "isEqual:", v17);

              if (!v19)
                goto LABEL_35;
            }
            filePromiseURLs = self->_filePromiseURLs;
            v21 = v6->_filePromiseURLs;
            if (filePromiseURLs == v21)
            {

            }
            else
            {
              v22 = v21;
              v23 = filePromiseURLs;
              v24 = -[NSDictionary isEqual:](v23, "isEqual:", v22);

              if (!v24)
              {
LABEL_35:
                v12 = 0;
LABEL_36:

                goto LABEL_37;
              }
            }
            sandboxExtensionTokens = self->_sandboxExtensionTokens;
            v27 = v6->_sandboxExtensionTokens;
            v28 = sandboxExtensionTokens;
            v29 = v28;
            if (v28 == v27)
              v12 = 1;
            else
              v12 = -[NSDictionary isEqual:](v28, "isEqual:", v27);

            goto LABEL_36;
          }
LABEL_28:

          goto LABEL_29;
        }
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v5 = (_PHPickerResultMetadata *)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        objc_claimAutoreleasedReturnValue();
      }
      else
      {
        NSStringFromClass(v7);
        objc_claimAutoreleasedReturnValue();
      }
      _PFAssertFailHandler();
      goto LABEL_28;
    }
    v12 = 0;
  }
LABEL_37:

  return v12;
}

- (unint64_t)hash
{
  double width;
  double height;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  uint64_t v21;
  uint64_t v22;

  width = self->_preferredCropRect.size.width;
  if (width == 0.0
    || (height = self->_preferredCropRect.size.height, height == 0.0)
    || (height == *(double *)(MEMORY[0x24BE71BF0] + 8) ? (v5 = width == *MEMORY[0x24BE71BF0]) : (v5 = 0), v5))
  {
    v6 = 0.0;
  }
  else
  {
    v6 = width * height;
  }
  v7 = self->_acceptableCropRect.size.width;
  if (v7 == 0.0
    || (v8 = self->_acceptableCropRect.size.height, v8 == 0.0)
    || (v8 == *(double *)(MEMORY[0x24BE71BF0] + 8) ? (v9 = v7 == *MEMORY[0x24BE71BF0]) : (v9 = 0), v9))
  {
    v10 = 0.0;
  }
  else
  {
    v10 = v7 * v8;
  }
  v11 = self->_normalizedFaceAreaRect.size.width;
  if (v11 == 0.0
    || (v12 = self->_normalizedFaceAreaRect.size.height, v12 == 0.0)
    || (v12 == *(double *)(MEMORY[0x24BE71BF0] + 8) ? (v13 = v11 == *MEMORY[0x24BE71BF0]) : (v13 = 0), v13))
  {
    v14 = 0.0;
  }
  else
  {
    v14 = v11 * v12;
  }
  v15 = self->_pixelHeight - self->_pixelWidth + 32 * self->_pixelWidth;
  v16 = vcvtmd_u64_f64(v6) - v15 + 32 * v15;
  v17 = vcvtmd_u64_f64(v10) - v16 + 32 * v16;
  v18 = vcvtmd_u64_f64(v14) - v17 + 32 * v17;
  v19 = self->_allowsItemProviderOpenInPlace - v18 + 32 * v18;
  v20 = -[NSString hash](self->_suggestedName, "hash") - v19 + 32 * v19;
  v21 = -[NSOrderedSet hash](self->_typeIdentifiers, "hash") - v20 + 32 * v20;
  v22 = -[NSDictionary hash](self->_filePromiseURLs, "hash") - v21 + 32 * v21;
  return -[NSDictionary hash](self->_sandboxExtensionTokens, "hash") - v22 + 32 * v22 + 0x2E97294E4B2C1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _PHPickerResultMetadata *v4;
  CGSize size;
  CGSize v6;
  CGSize v7;
  uint64_t v8;
  NSString *suggestedName;
  uint64_t v10;
  NSOrderedSet *typeIdentifiers;
  uint64_t v12;
  NSDictionary *filePromiseURLs;
  uint64_t v14;
  NSDictionary *sandboxExtensionTokens;

  v4 = objc_alloc_init(_PHPickerResultMetadata);
  v4->_pixelWidth = self->_pixelWidth;
  v4->_pixelHeight = self->_pixelHeight;
  size = self->_preferredCropRect.size;
  v4->_preferredCropRect.origin = self->_preferredCropRect.origin;
  v4->_preferredCropRect.size = size;
  v6 = self->_acceptableCropRect.size;
  v4->_acceptableCropRect.origin = self->_acceptableCropRect.origin;
  v4->_acceptableCropRect.size = v6;
  v7 = self->_normalizedFaceAreaRect.size;
  v4->_normalizedFaceAreaRect.origin = self->_normalizedFaceAreaRect.origin;
  v4->_normalizedFaceAreaRect.size = v7;
  v4->_allowsItemProviderOpenInPlace = self->_allowsItemProviderOpenInPlace;
  v8 = -[NSString copy](self->_suggestedName, "copy");
  suggestedName = v4->_suggestedName;
  v4->_suggestedName = (NSString *)v8;

  v10 = -[NSOrderedSet copy](self->_typeIdentifiers, "copy");
  typeIdentifiers = v4->_typeIdentifiers;
  v4->_typeIdentifiers = (NSOrderedSet *)v10;

  v12 = -[NSDictionary copy](self->_filePromiseURLs, "copy");
  filePromiseURLs = v4->_filePromiseURLs;
  v4->_filePromiseURLs = (NSDictionary *)v12;

  v14 = -[NSDictionary copy](self->_sandboxExtensionTokens, "copy");
  sandboxExtensionTokens = v4->_sandboxExtensionTokens;
  v4->_sandboxExtensionTokens = (NSDictionary *)v14;

  return v4;
}

- (_PHPickerResultMetadata)initWithCoder:(id)a3
{
  id v4;
  _PHPickerResultMetadata *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  uint64_t v20;
  NSString *suggestedName;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSOrderedSet *typeIdentifiers;
  uint64_t v27;
  uint64_t v28;
  NSDictionary *filePromiseURLs;
  uint64_t v30;
  uint64_t v31;
  NSDictionary *sandboxExtensionTokens;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_PHPickerResultMetadata;
  v5 = -[_PHPickerResultMetadata init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerResultMetadataPixelWidthKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pixelWidth = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerResultMetadataPixelHeightKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pixelHeight = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("PHPickerResultMetadataPreferredCropRectKey"));
    v5->_preferredCropRect.origin.x = v8;
    v5->_preferredCropRect.origin.y = v9;
    v5->_preferredCropRect.size.width = v10;
    v5->_preferredCropRect.size.height = v11;
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("PHPickerResultMetadataAcceptableCropRectKey"));
    v5->_acceptableCropRect.origin.x = v12;
    v5->_acceptableCropRect.origin.y = v13;
    v5->_acceptableCropRect.size.width = v14;
    v5->_acceptableCropRect.size.height = v15;
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("PHPickerResultMetadataNormalizedFaceAreaRectKey"));
    v5->_normalizedFaceAreaRect.origin.x = v16;
    v5->_normalizedFaceAreaRect.origin.y = v17;
    v5->_normalizedFaceAreaRect.size.width = v18;
    v5->_normalizedFaceAreaRect.size.height = v19;
    v5->_allowsItemProviderOpenInPlace = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PHPickerResultMetadataAllowsItemProviderOpenInPlaceKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerResultMetadataSuggestedNameKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    suggestedName = v5->_suggestedName;
    v5->_suggestedName = (NSString *)v20;

    v22 = (void *)MEMORY[0x24BDBCF20];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("PHPickerResultMetadataTypeIdentifiersKey"));
    v25 = objc_claimAutoreleasedReturnValue();
    typeIdentifiers = v5->_typeIdentifiers;
    v5->_typeIdentifiers = (NSOrderedSet *)v25;

    v27 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v27, objc_opt_class(), CFSTR("PHPickerResultMetadataFilePromiseURLsKey"));
    v28 = objc_claimAutoreleasedReturnValue();
    filePromiseURLs = v5->_filePromiseURLs;
    v5->_filePromiseURLs = (NSDictionary *)v28;

    v30 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v30, objc_opt_class(), CFSTR("PHPickerResultMetadataSandboxExtensionTokensKey"));
    v31 = objc_claimAutoreleasedReturnValue();
    sandboxExtensionTokens = v5->_sandboxExtensionTokens;
    v5->_sandboxExtensionTokens = (NSDictionary *)v31;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t pixelWidth;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD16E0];
  pixelWidth = self->_pixelWidth;
  v8 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", pixelWidth);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("PHPickerResultMetadataPixelWidthKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_pixelHeight);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("PHPickerResultMetadataPixelHeightKey"));

  objc_msgSend(v8, "encodeCGRect:forKey:", CFSTR("PHPickerResultMetadataPreferredCropRectKey"), self->_preferredCropRect.origin.x, self->_preferredCropRect.origin.y, self->_preferredCropRect.size.width, self->_preferredCropRect.size.height);
  objc_msgSend(v8, "encodeCGRect:forKey:", CFSTR("PHPickerResultMetadataAcceptableCropRectKey"), self->_acceptableCropRect.origin.x, self->_acceptableCropRect.origin.y, self->_acceptableCropRect.size.width, self->_acceptableCropRect.size.height);
  objc_msgSend(v8, "encodeCGRect:forKey:", CFSTR("PHPickerResultMetadataNormalizedFaceAreaRectKey"), self->_normalizedFaceAreaRect.origin.x, self->_normalizedFaceAreaRect.origin.y, self->_normalizedFaceAreaRect.size.width, self->_normalizedFaceAreaRect.size.height);
  objc_msgSend(v8, "encodeBool:forKey:", self->_allowsItemProviderOpenInPlace, CFSTR("PHPickerResultMetadataAllowsItemProviderOpenInPlaceKey"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_suggestedName, CFSTR("PHPickerResultMetadataSuggestedNameKey"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_typeIdentifiers, CFSTR("PHPickerResultMetadataTypeIdentifiersKey"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_filePromiseURLs, CFSTR("PHPickerResultMetadataFilePromiseURLsKey"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_sandboxExtensionTokens, CFSTR("PHPickerResultMetadataSandboxExtensionTokensKey"));

}

- (unint64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (void)setPixelWidth:(unint64_t)a3
{
  self->_pixelWidth = a3;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (void)setPixelHeight:(unint64_t)a3
{
  self->_pixelHeight = a3;
}

- (CGRect)preferredCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_preferredCropRect.origin.x;
  y = self->_preferredCropRect.origin.y;
  width = self->_preferredCropRect.size.width;
  height = self->_preferredCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreferredCropRect:(CGRect)a3
{
  self->_preferredCropRect = a3;
}

- (CGRect)acceptableCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_acceptableCropRect.origin.x;
  y = self->_acceptableCropRect.origin.y;
  width = self->_acceptableCropRect.size.width;
  height = self->_acceptableCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAcceptableCropRect:(CGRect)a3
{
  self->_acceptableCropRect = a3;
}

- (CGRect)normalizedFaceAreaRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedFaceAreaRect.origin.x;
  y = self->_normalizedFaceAreaRect.origin.y;
  width = self->_normalizedFaceAreaRect.size.width;
  height = self->_normalizedFaceAreaRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNormalizedFaceAreaRect:(CGRect)a3
{
  self->_normalizedFaceAreaRect = a3;
}

- (BOOL)allowsItemProviderOpenInPlace
{
  return self->_allowsItemProviderOpenInPlace;
}

- (void)setAllowsItemProviderOpenInPlace:(BOOL)a3
{
  self->_allowsItemProviderOpenInPlace = a3;
}

- (NSString)suggestedName
{
  return self->_suggestedName;
}

- (void)setSuggestedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSOrderedSet)typeIdentifiers
{
  return self->_typeIdentifiers;
}

- (void)setTypeIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)filePromiseURLs
{
  return self->_filePromiseURLs;
}

- (void)setFilePromiseURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)sandboxExtensionTokens
{
  return self->_sandboxExtensionTokens;
}

- (void)setSandboxExtensionTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionTokens, 0);
  objc_storeStrong((id *)&self->_filePromiseURLs, 0);
  objc_storeStrong((id *)&self->_typeIdentifiers, 0);
  objc_storeStrong((id *)&self->_suggestedName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
