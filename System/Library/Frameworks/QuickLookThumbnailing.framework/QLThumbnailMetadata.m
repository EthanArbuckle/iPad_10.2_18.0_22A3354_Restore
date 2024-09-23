@implementation QLThumbnailMetadata

- (QLThumbnailMetadata)init
{
  QLThumbnailMetadata *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)QLThumbnailMetadata;
  result = -[QLThumbnailMetadata init](&v3, sel_init);
  if (result)
  {
    result->_inlinePreviewMode = 1;
    result->_baseline = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

+ (id)thumbnailMetadataFromPropertiesDictionary:(id)a3
{
  id v3;
  QLThumbnailMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(QLThumbnailMetadata);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("inlinePreviewMode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      -[QLThumbnailMetadata setInlinePreviewMode:](v4, "setInlinePreviewMode:", objc_msgSend(v5, "intValue"));
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("yBaseline"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      -[QLThumbnailMetadata setBaseline:](v4, "setBaseline:", objc_msgSend(v7, "integerValue"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)propertiesDict
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[2];
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (-[QLThumbnailMetadata baseline](self, "baseline") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = CFSTR("inlinePreviewMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[QLThumbnailMetadata inlinePreviewMode](self, "inlinePreviewMode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7[0] = CFSTR("inlinePreviewMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[QLThumbnailMetadata inlinePreviewMode](self, "inlinePreviewMode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v7[1] = CFSTR("yBaseline");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[QLThumbnailMetadata baseline](self, "baseline"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[QLThumbnailMetadata inlinePreviewMode](self, "inlinePreviewMode"), CFSTR("inlinePreviewMode"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[QLThumbnailMetadata baseline](self, "baseline"), CFSTR("baseline"));
  objc_msgSend(v4, "encodeInt:forKey:", -[QLThumbnailMetadata iconFlavor](self, "iconFlavor"), CFSTR("iconFlavor"));
  -[QLThumbnailMetadata extensionBadge](self, "extensionBadge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("extensionBadge"));

  objc_msgSend(v4, "encodeBool:forKey:", -[QLThumbnailMetadata isLowQuality](self, "isLowQuality"), CFSTR("isLowQuality"));
  objc_msgSend(v4, "encodeBool:forKey:", -[QLThumbnailMetadata hasIconModeApplied](self, "hasIconModeApplied"), CFSTR("hasIconModeApplied"));
  -[QLThumbnailMetadata additionalProperties](self, "additionalProperties");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("additionalProperties"));

}

- (QLThumbnailMetadata)initWithCoder:(id)a3
{
  id v4;
  QLThumbnailMetadata *v5;
  uint64_t v6;
  NSString *extensionBadge;
  uint64_t v8;
  NSDictionary *additionalProperties;

  v4 = a3;
  v5 = -[QLThumbnailMetadata init](self, "init");
  if (v5)
  {
    v5->_inlinePreviewMode = objc_msgSend(v4, "decodeIntForKey:", CFSTR("inlinePreviewMode"));
    v5->_baseline = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("baseline"));
    v5->_iconFlavor = objc_msgSend(v4, "decodeIntForKey:", CFSTR("iconFlavor"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionBadge"));
    v6 = objc_claimAutoreleasedReturnValue();
    extensionBadge = v5->_extensionBadge;
    v5->_extensionBadge = (NSString *)v6;

    v5->_isLowQuality = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLowQuality"));
    v5->_hasIconModeApplied = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasIconModeApplied"));
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("additionalProperties"));
    v8 = objc_claimAutoreleasedReturnValue();
    additionalProperties = v5->_additionalProperties;
    v5->_additionalProperties = (NSDictionary *)v8;

  }
  return v5;
}

- (id)description
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("inlinePreviewMode: %d; baseline %ld; props = %@"),
                                           -[QLThumbnailMetadata inlinePreviewMode](self, "inlinePreviewMode"),
                                           -[QLThumbnailMetadata baseline](self, "baseline"),
                                           self->_additionalProperties));
}

- (int)inlinePreviewMode
{
  return self->_inlinePreviewMode;
}

- (void)setInlinePreviewMode:(int)a3
{
  self->_inlinePreviewMode = a3;
}

- (int64_t)baseline
{
  return self->_baseline;
}

- (void)setBaseline:(int64_t)a3
{
  self->_baseline = a3;
}

- (int)iconFlavor
{
  return self->_iconFlavor;
}

- (void)setIconFlavor:(int)a3
{
  self->_iconFlavor = a3;
}

- (NSString)extensionBadge
{
  return self->_extensionBadge;
}

- (void)setExtensionBadge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isLowQuality
{
  return self->_isLowQuality;
}

- (void)setIsLowQuality:(BOOL)a3
{
  self->_isLowQuality = a3;
}

- (BOOL)hasIconModeApplied
{
  return self->_hasIconModeApplied;
}

- (void)setHasIconModeApplied:(BOOL)a3
{
  self->_hasIconModeApplied = a3;
}

- (NSDictionary)additionalProperties
{
  return self->_additionalProperties;
}

- (void)setAdditionalProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalProperties, 0);
  objc_storeStrong((id *)&self->_extensionBadge, 0);
}

@end
