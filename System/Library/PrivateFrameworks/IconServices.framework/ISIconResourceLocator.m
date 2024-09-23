@implementation ISIconResourceLocator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)resourceLocatorWithLSIconResourceLocator:(id)a3
{
  id v3;
  ISIconResourceLocator *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(ISIconResourceLocator);
  objc_msgSend(v3, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISIconResourceLocator setBundleIdentifier:](v4, "setBundleIdentifier:", v5);

  objc_msgSend(v3, "bundleIconsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISIconResourceLocator setIconsDictionary:](v4, "setIconsDictionary:", v6);

  -[ISIconResourceLocator setPreferedResourceName:](v4, "setPreferedResourceName:", 0);
  objc_msgSend(v3, "resourcesDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ISIconResourceLocator setResourceDirectoryURL:](v4, "setResourceDirectoryURL:", v7);
  return v4;
}

+ (id)resourceLocatorWithType:(id)a3
{
  id v3;
  ISIconTypeResourceLocator *v4;

  v3 = a3;
  v4 = -[ISIconTypeResourceLocator initWithType:]([ISIconTypeResourceLocator alloc], "initWithType:", v3);

  return v4;
}

+ (id)genericIconrResourceLocator
{
  if (genericIconrResourceLocator_onceToken != -1)
    dispatch_once(&genericIconrResourceLocator_onceToken, &__block_literal_global_21);
  return (id)genericIconrResourceLocator_locator;
}

uint64_t __52__ISIconResourceLocator_genericIconrResourceLocator__block_invoke()
{
  ISIconResourceLocator *v0;
  void *v1;

  v0 = objc_alloc_init(ISIconResourceLocator);
  v1 = (void *)genericIconrResourceLocator_locator;
  genericIconrResourceLocator_locator = (uint64_t)v0;

  objc_msgSend((id)genericIconrResourceLocator_locator, "setBundleIdentifier:", CFSTR("com.apple.coretypes"));
  objc_msgSend((id)genericIconrResourceLocator_locator, "setIconsDictionary:", 0);
  return objc_msgSend((id)genericIconrResourceLocator_locator, "setPreferedResourceName:", 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *resourceDirectoryURL;
  id v5;

  resourceDirectoryURL = self->_resourceDirectoryURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", resourceDirectoryURL, CFSTR("_resourceDirectoryURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("_bundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconsDictionary, CFSTR("_iconsDictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preferedResourceName, CFSTR("_preferedResourceName"));

}

- (ISIconResourceLocator)initWithCoder:(id)a3
{
  id v4;
  ISIconResourceLocator *v5;
  uint64_t v6;
  NSURL *resourceDirectoryURL;
  uint64_t v8;
  NSString *bundleIdentifier;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *iconsDictionary;
  uint64_t v15;
  NSString *preferedResourceName;
  objc_super v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ISIconResourceLocator;
  v5 = -[ISIconResourceLocator init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_resourceDirectoryURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    resourceDirectoryURL = v5->_resourceDirectoryURL;
    v5->_resourceDirectoryURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_iconsDictionary"));
    v13 = objc_claimAutoreleasedReturnValue();
    iconsDictionary = v5->_iconsDictionary;
    v5->_iconsDictionary = (NSDictionary *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_preferedResourceName"));
    v15 = objc_claimAutoreleasedReturnValue();
    preferedResourceName = v5->_preferedResourceName;
    v5->_preferedResourceName = (NSString *)v15;

  }
  return v5;
}

- (id)description
{
  const __CFString *preferedResourceName;

  preferedResourceName = (const __CFString *)self->_preferedResourceName;
  if (!preferedResourceName)
    preferedResourceName = CFSTR("DEFAULT");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Resources Bundle URL: %@ , icons dict: %@, prefered name: %@"), self->_resourceDirectoryURL, self->_iconsDictionary, preferedResourceName);
}

- (BOOL)allowLocalizedIcon
{
  void *v2;
  char v3;

  -[ISIconResourceLocator bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple."));

  return v3;
}

- (NSURL)resourceDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResourceDirectoryURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSDictionary)iconsDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIconsDictionary:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)preferedResourceName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPreferedResourceName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferedResourceName, 0);
  objc_storeStrong((id *)&self->_iconsDictionary, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_resourceDirectoryURL, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1AA928000, a2, a3, "Failed to decode ISIconResourceLocator with exception: %@", a5, a6, a7, a8, 2u);
}

@end
