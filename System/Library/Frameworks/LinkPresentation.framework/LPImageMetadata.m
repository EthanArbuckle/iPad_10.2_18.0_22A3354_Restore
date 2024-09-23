@implementation LPImageMetadata

- (LPImageMetadata)init
{
  LPImageMetadata *v2;
  LPImageMetadata *v3;
  LPImageMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPImageMetadata;
  v2 = -[LPImageMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    v4 = v2;
  }

  return v3;
}

- (id)_initWithDictionary:(id)a3
{
  id v4;
  LPImageMetadata *v5;
  uint64_t v6;
  NSURL *URL;
  uint64_t v8;
  NSString *type;
  uint64_t v10;
  NSString *accessibilityText;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  LPImageMetadata *v18;

  v4 = a3;
  v5 = -[LPImageMetadata init](self, "init");
  if (v5
    && (URLForKey(v4, (uint64_t)CFSTR("LPMetadataImageURL")),
        v6 = objc_claimAutoreleasedReturnValue(),
        URL = v5->_URL,
        v5->_URL = (NSURL *)v6,
        URL,
        v5->_URL))
  {
    stringForKey(v4, CFSTR("LPMetadataImageType"));
    v8 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v8;

    stringForKey(v4, CFSTR("LPMetadataImageAccessibilityText"));
    v10 = objc_claimAutoreleasedReturnValue();
    accessibilityText = v5->_accessibilityText;
    v5->_accessibilityText = (NSString *)v10;

    numberForKey(v4, (uint64_t)CFSTR("LPMetadataImageWidth"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    numberForKey(v4, (uint64_t)CFSTR("LPMetadataImageHeight"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v12 && v13)
    {
      objc_msgSend(v12, "doubleValue");
      v16 = v15;
      objc_msgSend(v14, "doubleValue");
      v5->_size.width = v16;
      v5->_size.height = v17;
    }
    v18 = v5;

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPImageMetadata)initWithCoder:(id)a3
{
  id v4;
  LPImageMetadata *v5;
  uint64_t v6;
  NSURL *URL;
  uint64_t v8;
  NSString *type;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  NSString *accessibilityText;
  LPImageMetadata *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)LPImageMetadata;
  v5 = -[LPImageMetadata init](&v16, sel_init);
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("version"));
    decodeURLForKey(v4, CFSTR("URL"));
    v6 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("type"));
    v8 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v8;

    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("size"));
    v5->_size.width = v10;
    v5->_size.height = v11;
    decodeStringForKey(v4, (uint64_t)CFSTR("accessibilityText"));
    v12 = objc_claimAutoreleasedReturnValue();
    accessibilityText = v5->_accessibilityText;
    v5->_accessibilityText = (NSString *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_URL, CFSTR("URL"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("size"), self->_size.width, self->_size.height);
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_accessibilityText, CFSTR("accessibilityText"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void **v6;
  void **v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPImageMetadata;
  if (-[LPImageMetadata isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      v7 = v6;
      if (*((_DWORD *)v6 + 2) == self->_version
        && (objectsAreEqual_0(v6[2], self->_URL) & 1) != 0
        && objectsAreEqual_0(v7[3], self->_type))
      {
        v5 = 0;
        if (*((double *)v7 + 5) == self->_size.width && *((double *)v7 + 6) == self->_size.height)
          v5 = objectsAreEqual_0(v7[4], self->_accessibilityText);
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
  return -[NSURL hash](self->_URL, "hash");
}

- (unsigned)version
{
  return self->_version;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (void)setAccessibilityText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityText, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
