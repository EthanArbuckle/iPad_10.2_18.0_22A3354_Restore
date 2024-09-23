@implementation INImageBundle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  INImageBundle *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(INImageBundle);
  -[INImageBundle bundlePath](self, "bundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INImageBundle setBundlePath:](v4, "setBundlePath:", v5);

  -[INImageBundle setBundleType:](v4, "setBundleType:", -[INImageBundle bundleType](self, "bundleType"));
  -[INImageBundle bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INImageBundle setBundleIdentifier:](v4, "setBundleIdentifier:", v6);

  return v4;
}

- (void)setBundleType:(unint64_t)a3
{
  self->_bundleType = a3;
}

- (INImageBundle)init
{
  INImageBundle *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INImageBundle;
  result = -[INImageBundle init](&v3, sel_init);
  if (result)
    result->_bundleType = 1;
  return result;
}

- (unint64_t)bundleType
{
  return self->_bundleType;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundlePath:(id)a3
{
  NSString *v4;
  NSString *bundlePath;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_bundlePath, "isEqualToString:"))
  {
    objc_msgSend(v6, "stringByStandardizingPath");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundlePath = self->_bundlePath;
    self->_bundlePath = v4;

  }
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundlePath;
  id v5;

  bundlePath = self->_bundlePath;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundlePath, CFSTR("bundlePath"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_bundleType, CFSTR("bundleType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));

}

- (INImageBundle)initWithCoder:(id)a3
{
  id v4;
  INImageBundle *v5;
  uint64_t v6;
  NSString *bundlePath;
  uint64_t v8;
  NSString *bundleIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INImageBundle;
  v5 = -[INImageBundle init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundlePath"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundlePath = v5->_bundlePath;
    v5->_bundlePath = (NSString *)v6;

    v5->_bundleType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bundleType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
