@implementation _BlastDoorLPImageMetadata

- (_BlastDoorLPImageMetadata)init
{
  _BlastDoorLPImageMetadata *v2;
  _BlastDoorLPImageMetadata *v3;
  _BlastDoorLPImageMetadata *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)_BlastDoorLPImageMetadata;
  v2 = -[_BlastDoorLPImageMetadata init](&v6, sel_init);
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
  _BlastDoorLPImageMetadata *v5;
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
  _BlastDoorLPImageMetadata *v18;

  v4 = a3;
  v5 = -[_BlastDoorLPImageMetadata init](self, "init");
  if (v5
    && (URLForKey(v4, CFSTR("LPMetadataImageURL")),
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

    numberForKey(v4, CFSTR("LPMetadataImageWidth"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    numberForKey(v4, CFSTR("LPMetadataImageHeight"));
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

- (_BlastDoorLPImageMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPImageMetadata *v5;
  uint64_t v6;
  NSURL *URL;
  uint64_t v8;
  NSString *type;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  NSString *accessibilityText;
  _BlastDoorLPImageMetadata *v14;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_BlastDoorLPImageMetadata;
  v5 = -[_BlastDoorLPImageMetadata init](&v16, sel_init);
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

    objc_msgSend(v4, "decodeSizeForKey:", CFSTR("size"));
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
  uint64_t version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", version, CFSTR("version"));
  objc_msgSend(v5, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_URL, CFSTR("URL"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeSize:forKey:", CFSTR("size"), self->_size.width, self->_size.height);
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_accessibilityText, CFSTR("accessibilityText"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  unint64_t *v6;
  double *v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v12;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_BlastDoorLPImageMetadata;
  if (-[_BlastDoorLPImageMetadata isEqual:](&v13, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (unint64_t *)v4;
      v7 = (double *)v6;
      if (*((_DWORD *)v6 + 2) == self->_version
        && ((v8 = v6[2], !(v8 | (unint64_t)self->_URL)) || objc_msgSend((id)v8, "isEqual:"))
        && ((v9 = *((_QWORD *)v7 + 3), !(v9 | (unint64_t)self->_type))
         || objc_msgSend((id)v9, "isEqual:"))
        && (v7[5] == self->_size.width ? (v10 = v7[6] == self->_size.height) : (v10 = 0), v10))
      {
        v12 = *((_QWORD *)v7 + 4);
        if (v12 | (unint64_t)self->_accessibilityText)
          v5 = objc_msgSend((id)v12, "isEqual:");
        else
          v5 = 1;
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
