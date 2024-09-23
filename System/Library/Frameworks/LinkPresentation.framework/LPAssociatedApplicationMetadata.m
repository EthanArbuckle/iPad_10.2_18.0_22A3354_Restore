@implementation LPAssociatedApplicationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPAssociatedApplicationMetadata)initWithCoder:(id)a3
{
  id v4;
  LPAssociatedApplicationMetadata *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  LPImage *icon;
  uint64_t v10;
  NSString *caption;
  uint64_t v12;
  NSString *action;
  LPAssociatedApplicationMetadata *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)LPAssociatedApplicationMetadata;
  v5 = -[LPAssociatedApplicationMetadata init](&v16, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("bundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v8 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (LPImage *)v8;

    decodeStringForKey(v4, (uint64_t)CFSTR("caption"));
    v10 = objc_claimAutoreleasedReturnValue();
    caption = v5->_caption;
    v5->_caption = (NSString *)v10;

    decodeStringForKey(v4, (uint64_t)CFSTR("action"));
    v12 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (NSString *)v12;

    v5->_clipAction = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("clipAction"));
    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_caption, CFSTR("caption"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_action, CFSTR("action"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_clipAction, CFSTR("clipAction"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPAssociatedApplicationMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  LPAssociatedApplicationMetadata *v9;

  v4 = +[LPAssociatedApplicationMetadata allocWithZone:](LPAssociatedApplicationMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPAssociatedApplicationMetadata bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPAssociatedApplicationMetadata setBundleIdentifier:](v4, "setBundleIdentifier:", v5);

    -[LPAssociatedApplicationMetadata icon](self, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPAssociatedApplicationMetadata setIcon:](v4, "setIcon:", v6);

    -[LPAssociatedApplicationMetadata caption](self, "caption");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPAssociatedApplicationMetadata setCaption:](v4, "setCaption:", v7);

    -[LPAssociatedApplicationMetadata action](self, "action");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPAssociatedApplicationMetadata setAction:](v4, "setAction:", v8);

    -[LPAssociatedApplicationMetadata setClipAction:](v4, "setClipAction:", -[LPAssociatedApplicationMetadata clipAction](self, "clipAction"));
    v9 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPAssociatedApplicationMetadata;
  if (-[LPAssociatedApplicationMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      v5 = (objectsAreEqual_0(v6[1], self->_bundleIdentifier) & 1) != 0
        && objectsAreEqual_0(v6[2], self->_icon)
        && objectsAreEqual_0(v6[3], self->_caption)
        && objectsAreEqual_0(v6[4], self->_action)
        && v6[5] == (void *)self->_clipAction;

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

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("bundleIdentifier"), CFSTR("icon"), CFSTR("caption"), CFSTR("action"), CFSTR("clipAction"), 0);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)clipAction
{
  return self->_clipAction;
}

- (void)setClipAction:(int64_t)a3
{
  self->_clipAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
