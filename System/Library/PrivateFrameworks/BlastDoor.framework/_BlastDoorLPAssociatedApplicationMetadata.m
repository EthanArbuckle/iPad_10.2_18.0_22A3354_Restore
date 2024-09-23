@implementation _BlastDoorLPAssociatedApplicationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPAssociatedApplicationMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPAssociatedApplicationMetadata *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  _BlastDoorLPImage *icon;
  uint64_t v10;
  NSString *caption;
  uint64_t v12;
  NSString *action;
  _BlastDoorLPAssociatedApplicationMetadata *v14;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_BlastDoorLPAssociatedApplicationMetadata;
  v5 = -[_BlastDoorLPAssociatedApplicationMetadata init](&v16, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("bundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v8 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (_BlastDoorLPImage *)v8;

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
  NSString *bundleIdentifier;
  id v5;

  bundleIdentifier = self->_bundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_caption, CFSTR("caption"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_action, CFSTR("action"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_clipAction, CFSTR("clipAction"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPAssociatedApplicationMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BlastDoorLPAssociatedApplicationMetadata *v9;

  v4 = +[_BlastDoorLPAssociatedApplicationMetadata allocWithZone:](_BlastDoorLPAssociatedApplicationMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPAssociatedApplicationMetadata bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPAssociatedApplicationMetadata setBundleIdentifier:](v4, "setBundleIdentifier:", v5);

    -[_BlastDoorLPAssociatedApplicationMetadata icon](self, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPAssociatedApplicationMetadata setIcon:](v4, "setIcon:", v6);

    -[_BlastDoorLPAssociatedApplicationMetadata caption](self, "caption");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPAssociatedApplicationMetadata setCaption:](v4, "setCaption:", v7);

    -[_BlastDoorLPAssociatedApplicationMetadata action](self, "action");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPAssociatedApplicationMetadata setAction:](v4, "setAction:", v8);

    -[_BlastDoorLPAssociatedApplicationMetadata setClipAction:](v4, "setClipAction:", -[_BlastDoorLPAssociatedApplicationMetadata clipAction](self, "clipAction"));
    v9 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_BlastDoorLPAssociatedApplicationMetadata;
  if (-[_BlastDoorLPAssociatedApplicationMetadata isEqual:](&v12, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6[2];
      v5 = (!(v7 | (unint64_t)self->_bundleIdentifier) || objc_msgSend((id)v7, "isEqual:"))
        && ((v8 = v6[3], !(v8 | (unint64_t)self->_icon)) || objc_msgSend((id)v8, "isEqual:"))
        && ((v9 = v6[4], !(v9 | (unint64_t)self->_caption)) || objc_msgSend((id)v9, "isEqual:"))
        && ((v10 = v6[5], !(v10 | (unint64_t)self->_action)) || objc_msgSend((id)v10, "isEqual:"))
        && v6[6] == self->_clipAction;

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (_BlastDoorLPImage)icon
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
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
