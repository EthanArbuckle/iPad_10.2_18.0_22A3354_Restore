@implementation LPIconMetadata

- (LPIconMetadata)init
{
  LPIconMetadata *v2;
  LPIconMetadata *v3;
  LPIconMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPIconMetadata;
  v2 = -[LPIconMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    v4 = v2;
  }

  return v3;
}

- (id)_initWithURL:(id)a3
{
  id v5;
  LPIconMetadata *v6;
  LPIconMetadata *v7;
  LPIconMetadata *v8;

  v5 = a3;
  v6 = -[LPIconMetadata init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URL, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPIconMetadata)initWithCoder:(id)a3
{
  id v4;
  LPIconMetadata *v5;
  uint64_t v6;
  NSURL *URL;
  uint64_t v8;
  NSString *accessibilityText;
  LPIconMetadata *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPIconMetadata;
  v5 = -[LPIconMetadata init](&v12, sel_init);
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("version"));
    decodeURLForKey(v4, CFSTR("URL"));
    v6 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("accessibilityText"));
    v8 = objc_claimAutoreleasedReturnValue();
    accessibilityText = v5->_accessibilityText;
    v5->_accessibilityText = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_URL, CFSTR("URL"));
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
  v9.super_class = (Class)LPIconMetadata;
  if (-[LPIconMetadata isEqual:](&v9, sel_isEqual_, v4))
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
      if (*((_DWORD *)v6 + 2) == self->_version && (objectsAreEqual_0(v6[2], self->_URL) & 1) != 0)
        v5 = objectsAreEqual_0(v7[3], self->_accessibilityText);
      else
        v5 = 0;

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

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (void)setAccessibilityText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityText, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
