@implementation FPPathComponentDisplayMetadata

- (FPPathComponentDisplayMetadata)initWithURL:(id)a3 displayName:(id)a4 suffix:(id)a5 bundleID:(id)a6 bundleURL:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  FPPathComponentDisplayMetadata *v17;
  FPPathComponentDisplayMetadata *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)FPPathComponentDisplayMetadata;
  v17 = -[FPPathComponentDisplayMetadata init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_URL, a3);
    objc_storeStrong((id *)&v18->_displayName, a4);
    objc_storeStrong((id *)&v18->_suffix, a5);
    objc_storeStrong((id *)&v18->_bundleID, a6);
    objc_storeStrong((id *)&v18->_bundleURL, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *URL;
  id v5;

  URL = self->_URL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", URL, CFSTR("URL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suffix, CFSTR("suffix"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleURL, CFSTR("bundleURL"));

}

- (FPPathComponentDisplayMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FPPathComponentDisplayMetadata *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suffix"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[FPPathComponentDisplayMetadata initWithURL:displayName:suffix:bundleID:bundleURL:](self, "initWithURL:displayName:suffix:bundleID:bundleURL:", v5, v7, v8, v9, v6);
  return v10;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)suffix
{
  return self->_suffix;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
