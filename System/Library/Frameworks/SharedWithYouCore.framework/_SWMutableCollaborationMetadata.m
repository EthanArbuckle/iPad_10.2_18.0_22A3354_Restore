@implementation _SWMutableCollaborationMetadata

- (_SWMutableCollaborationMetadata)initWithCollaborationIdentifier:(id)a3
{
  return -[SWCollaborationMetadata initWithCollaborationIdentifier:title:defaultShareOptions:initiatorHandle:initiatorNameComponents:](self, "initWithCollaborationIdentifier:title:defaultShareOptions:initiatorHandle:initiatorNameComponents:", a3, 0, 0, 0, 0);
}

- (_SWMutableCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4
{
  return -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:initiatorHandle:initiatorNameComponents:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:initiatorHandle:initiatorNameComponents:", a3, a4, 0, 0, 0, 0);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SWMutableCollaborationMetadata;
  if (-[SWCollaborationMetadata isEqual:](&v11, sel_isEqual_, v5))
  {
    -[SWCollaborationMetadata ckAppBundleIDs](self, "ckAppBundleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 || (objc_msgSend(v5, "ckAppBundleIDs"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SWCollaborationMetadata ckAppBundleIDs](self, "ckAppBundleIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ckAppBundleIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

      if (v6)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v9 = 1;
    }

    goto LABEL_9;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SWMutableCollaborationMetadata;
  v3 = -[SWCollaborationMetadata hash](&v7, sel_hash);
  -[SWCollaborationMetadata ckAppBundleIDs](self, "ckAppBundleIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SWMutableCollaborationMetadata;
  v4 = -[SWCollaborationMetadata copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SWCollaborationMetadata ckAppBundleIDs](self, "ckAppBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SWCollaborationMetadata ckAppBundleIDs](self, "ckAppBundleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCkAppBundleIDs:", v6);

  }
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SWMutableCollaborationMetadata;
  v4 = -[SWCollaborationMetadata mutableCopyWithZone:](&v8, sel_mutableCopyWithZone_, a3);
  -[SWCollaborationMetadata ckAppBundleIDs](self, "ckAppBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SWCollaborationMetadata ckAppBundleIDs](self, "ckAppBundleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCkAppBundleIDs:", v6);

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SWMutableCollaborationMetadata)initWithCoder:(id)a3
{
  id v4;
  _SWMutableCollaborationMetadata *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SWMutableCollaborationMetadata;
  v5 = -[SWCollaborationMetadata initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_ckAppBundleIDs);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWCollaborationMetadata setCkAppBundleIDs:](v5, "setCkAppBundleIDs:", v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SWMutableCollaborationMetadata;
  v4 = a3;
  -[SWCollaborationMetadata encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[SWCollaborationMetadata ckAppBundleIDs](self, "ckAppBundleIDs", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_ckAppBundleIDs);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

}

@end
