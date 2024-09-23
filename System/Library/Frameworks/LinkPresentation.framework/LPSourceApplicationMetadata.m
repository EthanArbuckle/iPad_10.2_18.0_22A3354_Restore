@implementation LPSourceApplicationMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  LPSourceApplicationMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  LPSourceApplicationMetadata *v8;

  v4 = +[LPSourceApplicationMetadata allocWithZone:](LPSourceApplicationMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPSourceApplicationMetadata name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPSourceApplicationMetadata setName:](v4, "setName:", v5);

    -[LPSourceApplicationMetadata bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPSourceApplicationMetadata setBundleIdentifier:](v4, "setBundleIdentifier:", v6);

    -[LPSourceApplicationMetadata icon](self, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPSourceApplicationMetadata setIcon:](v4, "setIcon:", v7);

    v8 = v4;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPSourceApplicationMetadata)initWithCoder:(id)a3
{
  id v4;
  LPSourceApplicationMetadata *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *bundleIdentifier;
  uint64_t v10;
  LPImage *icon;
  LPSourceApplicationMetadata *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LPSourceApplicationMetadata;
  v5 = -[LPSourceApplicationMetadata init](&v14, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("bundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v10 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (LPImage *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("icon"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPSourceApplicationMetadata;
  if (-[LPSourceApplicationMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[1], self->_name) & 1) != 0
        && objectsAreEqual_0(v6[2], self->_bundleIdentifier))
      {
        v5 = objectsAreEqual_0(v6[3], self->_icon);
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
  return -[NSString hash](self->_bundleIdentifier, "hash");
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
