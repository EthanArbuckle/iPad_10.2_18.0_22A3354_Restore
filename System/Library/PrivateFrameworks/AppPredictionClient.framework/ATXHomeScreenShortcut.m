@implementation ATXHomeScreenShortcut

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHomeScreenShortcut)initWithIdentifier:(id)a3 name:(id)a4 bundleIdentifierForDisplay:(id)a5
{
  return -[ATXHomeScreenShortcut initWithIdentifier:name:bundleIdentifierForDisplay:isAppLaunchWorkflow:](self, "initWithIdentifier:name:bundleIdentifierForDisplay:isAppLaunchWorkflow:", a3, a4, a5, 0);
}

- (ATXHomeScreenShortcut)initWithIdentifier:(id)a3 name:(id)a4 bundleIdentifierForDisplay:(id)a5 isAppLaunchWorkflow:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  ATXHomeScreenShortcut *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  NSString *name;
  uint64_t v18;
  NSString *bundleIdentifierForDisplay;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ATXHomeScreenShortcut;
  v13 = -[ATXHomeScreenShortcut init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    name = v13->_name;
    v13->_name = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    bundleIdentifierForDisplay = v13->_bundleIdentifierForDisplay;
    v13->_bundleIdentifierForDisplay = (NSString *)v18;

    v13->_isAppLaunchWorkflow = a6;
  }

  return v13;
}

- (void)setIcon:(CGImage *)a3
{
  CGImage *icon;

  icon = self->_icon;
  if (icon != a3)
  {
    if (icon)
    {
      CGImageRelease(icon);
      self->_icon = 0;
    }
    self->_icon = CGImageRetain(a3);
  }
}

- (void)dealloc
{
  CGImage *icon;
  objc_super v4;

  icon = self->_icon;
  if (icon)
  {
    CGImageRelease(icon);
    self->_icon = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ATXHomeScreenShortcut;
  -[ATXHomeScreenShortcut dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  __CFData *v4;
  CGImageDestination *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bundleIdentifierForDisplay, CFSTR("bundleId"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_identifier, CFSTR("uuid"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isAppLaunchWorkflow, CFSTR("isAppLaunchWorkflow"));
  if (self->_icon)
  {
    v4 = (__CFData *)objc_opt_new();
    v5 = CGImageDestinationCreateWithData(v4, (CFStringRef)objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier"), 1uLL, 0);
    CGImageDestinationAddImage(v5, self->_icon, 0);
    CGImageDestinationFinalize(v5);
    CFRelease(v5);
    if (-[__CFData length](v4, "length"))
      objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("icon"));

  }
}

- (ATXHomeScreenShortcut)initWithCoder:(id)a3
{
  id v4;
  ATXHomeScreenShortcut *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *bundleIdentifierForDisplay;
  uint64_t v10;
  NSString *identifier;
  const __CFData *v12;
  CGDataProvider *v13;
  CGDataProvider *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATXHomeScreenShortcut;
  v5 = -[ATXHomeScreenShortcut init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleId"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifierForDisplay = v5->_bundleIdentifierForDisplay;
    v5->_bundleIdentifierForDisplay = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    v5->_isAppLaunchWorkflow = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAppLaunchWorkflow"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
    v12 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    if (-[__CFData length](v12, "length"))
    {
      v13 = CGDataProviderCreateWithCFData(v12);
      if (v13)
      {
        v14 = v13;
        v5->_icon = CGImageCreateWithPNGDataProvider(v13, 0, 0, kCGRenderingIntentDefault);
        CGDataProviderRelease(v14);
      }
    }

  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_identifier, "hash") - v3 + 32 * v3;
  return -[NSString hash](self->_bundleIdentifierForDisplay, "hash") - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  ATXHomeScreenShortcut *v4;
  ATXHomeScreenShortcut *v5;
  BOOL v6;

  v4 = (ATXHomeScreenShortcut *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXHomeScreenShortcut isEqualToATXHomeScreenShortcut:](self, "isEqualToATXHomeScreenShortcut:", v5);

  return v6;
}

- (BOOL)isEqualToATXHomeScreenShortcut:(id)a3
{
  id *v4;
  NSString *identifier;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *name;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  char v15;
  NSString *v16;
  NSString *v17;

  v4 = (id *)a3;
  identifier = self->_identifier;
  v6 = (NSString *)v4[2];
  if (identifier == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = identifier;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_7;
  }
  name = self->_name;
  v11 = (NSString *)v4[3];
  if (name == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = name;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
    {
LABEL_7:
      v15 = 0;
      goto LABEL_13;
    }
  }
  v16 = self->_bundleIdentifierForDisplay;
  v17 = v16;
  if (v16 == v4[4])
    v15 = 1;
  else
    v15 = -[NSString isEqual:](v16, "isEqual:");

LABEL_13:
  return v15;
}

- (id)dictionaryRepresentationForIntrospection
{
  const __CFString *name;
  NSString *identifier;
  const __CFString *bundleIdentifierForDisplay;
  const __CFString *v5;
  const __CFString *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  identifier = self->_identifier;
  name = (const __CFString *)self->_name;
  if (!name)
    name = CFSTR("<nil>");
  v8[0] = CFSTR("name");
  v8[1] = CFSTR("bundleId");
  bundleIdentifierForDisplay = (const __CFString *)self->_bundleIdentifierForDisplay;
  if (!bundleIdentifierForDisplay)
    bundleIdentifierForDisplay = CFSTR("<nil>");
  v9[0] = name;
  v9[1] = bundleIdentifierForDisplay;
  if (identifier)
    v5 = (const __CFString *)identifier;
  else
    v5 = CFSTR("<nil>");
  v8[2] = CFSTR("uuid");
  v8[3] = CFSTR("isAppLaunchWorkflow");
  if (self->_isAppLaunchWorkflow)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v9[2] = v5;
  v9[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleIdentifierForDisplay
{
  return self->_bundleIdentifierForDisplay;
}

- (BOOL)isAppLaunchWorkflow
{
  return self->_isAppLaunchWorkflow;
}

- (CGImage)icon
{
  return self->_icon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifierForDisplay, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
