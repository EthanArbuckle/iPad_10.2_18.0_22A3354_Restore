@implementation ISIconTypeResourceLocator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISIconTypeResourceLocator)initWithType:(id)a3
{
  id v5;
  ISIconTypeResourceLocator *v6;
  ISIconTypeResourceLocator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISIconTypeResourceLocator;
  v6 = -[ISIconTypeResourceLocator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_type, a3);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_type, CFSTR("_type"));
}

- (ISIconTypeResourceLocator)initWithCoder:(id)a3
{
  id v4;
  ISIconTypeResourceLocator *v5;
  uint64_t v6;
  NSString *type;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISIconTypeResourceLocator;
  v5 = -[ISIconTypeResourceLocator init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_type"));
    v6 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v6;

  }
  return v5;
}

- (id)resourceDirectoryURL
{
  return UTTypeCopyDeclaringBundleURL((CFStringRef)self->_type);
}

- (id)bundleIdentifier
{
  CFURLRef v2;
  __CFBundle *Unique;
  __CFBundle *v4;
  void *v5;

  v2 = UTTypeCopyDeclaringBundleURL((CFStringRef)self->_type);
  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (Unique)
  {
    v4 = Unique;
    CFBundleGetIdentifier(Unique);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)preferedResourceName
{
  return (id)_UTTypeCopyIconName();
}

- (BOOL)allowLocalizedIcon
{
  return 0;
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
}

@end
