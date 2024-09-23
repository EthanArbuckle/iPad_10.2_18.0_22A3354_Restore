@implementation WFWindow

+ (id)allWindows
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)allWindowsForBundleIdentifiers:(id)a3
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (NSString)bundleIdentifier
{
  return 0;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (!self->_boundsLoaded)
    self->_boundsLoaded = 1;
  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBoundsNeedReloading
{
  self->_boundsLoaded = 0;
}

- (CGSize)size
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[WFWindow bounds](self, "bounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (BOOL)isOnScreen
{
  return 1;
}

- (BOOL)isHidden
{
  return 0;
}

- (WFImage)image
{
  return self->_image;
}

- (WFWindow)initWithCoder:(id)a3
{
  id v4;
  WFWindow *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *applicationName;
  void *v10;
  uint64_t v11;
  NSNumber *windowIndex;
  WFWindow *v13;

  v4 = a3;
  v5 = -[WFWindow init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationName"));
    v8 = objc_claimAutoreleasedReturnValue();
    applicationName = v5->_applicationName;
    v5->_applicationName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("processIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_processIdentifier = objc_msgSend(v10, "unsignedIntValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("windowIndex"));
    v11 = objc_claimAutoreleasedReturnValue();
    windowIndex = v5->_windowIndex;
    v5->_windowIndex = (NSNumber *)v11;

    v13 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFWindow name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[WFWindow applicationName](self, "applicationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("applicationName"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[WFWindow processIdentifier](self, "processIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("processIdentifier"));

  -[WFWindow windowIndex](self, "windowIndex");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("windowIndex"));

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WFWindow;
  -[WFWindow dealloc](&v2, sel_dealloc);
}

- (NSString)name
{
  return self->_name;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (NSNumber)windowIndex
{
  return self->_windowIndex;
}

- (void)setWindowIndex:(id)a3
{
  objc_storeStrong((id *)&self->_windowIndex, a3);
}

- (BOOL)boundsLoaded
{
  return self->_boundsLoaded;
}

- (void)setBoundsLoaded:(BOOL)a3
{
  self->_boundsLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowIndex, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
