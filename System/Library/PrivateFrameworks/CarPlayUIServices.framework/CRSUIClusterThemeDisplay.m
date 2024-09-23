@implementation CRSUIClusterThemeDisplay

- (CRSUIClusterThemeDisplay)initWithIdentifier:(id)a3 displayType:(unint64_t)a4 size:(CGSize)a5 requiresDarkAppearance:(BOOL)a6 layouts:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v14;
  id v15;
  CRSUIClusterThemeDisplay *v16;
  CRSUIClusterThemeDisplay *v17;
  objc_super v19;

  height = a5.height;
  width = a5.width;
  v14 = a3;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)CRSUIClusterThemeDisplay;
  v16 = -[CRSUIClusterThemeDisplay init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    v17->_displayType = a4;
    v17->_size.width = width;
    v17->_size.height = height;
    v17->_requiresDarkAppearance = a6;
    objc_storeStrong((id *)&v17->_layouts, a7);
  }

  return v17;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CRSUIClusterThemeDisplay identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v4, "encodeUInt64:forKey:", -[CRSUIClusterThemeDisplay displayType](self, "displayType"), CFSTR("displayType"));
  -[CRSUIClusterThemeDisplay size](self, "size");
  objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("size"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CRSUIClusterThemeDisplay requiresDarkAppearance](self, "requiresDarkAppearance"), CFSTR("requiresDarkAppearance"));
  -[CRSUIClusterThemeDisplay layouts](self, "layouts");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v6, CFSTR("layouts"));

}

- (CRSUIClusterThemeDisplay)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  CRSUIClusterThemeDisplay *v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("displayType"));
  objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("size"));
  v8 = v7;
  v10 = v9;
  v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresDarkAppearance"));
  v12 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v12, objc_opt_class(), CFSTR("layouts"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v14 = v6 == 0;
  else
    v14 = 1;
  if (v14 || v13 == 0)
  {
    v16 = 0;
  }
  else
  {
    self = -[CRSUIClusterThemeDisplay initWithIdentifier:displayType:size:requiresDarkAppearance:layouts:](self, "initWithIdentifier:displayType:size:requiresDarkAppearance:layouts:", v5, v6, v11, v13, v8, v10);
    v16 = self;
  }

  return v16;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)requiresDarkAppearance
{
  return self->_requiresDarkAppearance;
}

- (NSArray)layouts
{
  return self->_layouts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
