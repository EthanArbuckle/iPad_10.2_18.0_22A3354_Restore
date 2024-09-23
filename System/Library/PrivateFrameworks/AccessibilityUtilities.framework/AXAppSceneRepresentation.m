@implementation AXAppSceneRepresentation

- (AXAppSceneRepresentation)init
{
  return -[AXAppSceneRepresentation initWithBundleIdentifier:fbSceneIdentifier:](self, "initWithBundleIdentifier:fbSceneIdentifier:", 0, 0);
}

- (AXAppSceneRepresentation)initWithBundleIdentifier:(id)a3 fbSceneIdentifier:(id)a4
{
  id v7;
  id v8;
  AXAppSceneRepresentation *v9;
  AXAppSceneRepresentation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXAppSceneRepresentation;
  v9 = -[AXAppSceneRepresentation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v10->_fbSceneIdentifier, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXAppSceneRepresentation bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAppSceneRepresentation fbSceneIdentifier](self, "fbSceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXAppScene<%p>: bundleIdentifier:%@ fbSceneIdentifier:%@"), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  -[AXAppSceneRepresentation bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  -[AXAppSceneRepresentation fbSceneIdentifier](self, "fbSceneIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("fbSceneIdentifier"));

}

- (AXAppSceneRepresentation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AXAppSceneRepresentation *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fbSceneIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AXAppSceneRepresentation initWithBundleIdentifier:fbSceneIdentifier:](self, "initWithBundleIdentifier:fbSceneIdentifier:", v5, v6);
  return v7;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)fbSceneIdentifier
{
  return self->_fbSceneIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fbSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
