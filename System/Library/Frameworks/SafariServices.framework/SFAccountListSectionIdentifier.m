@implementation SFAccountListSectionIdentifier

- (SFAccountListSectionIdentifier)initWithType:(unint64_t)a3
{
  return -[SFAccountListSectionIdentifier initWithType:headerText:footerText:](self, "initWithType:headerText:footerText:", a3, 0, 0);
}

- (SFAccountListSectionIdentifier)initWithType:(unint64_t)a3 headerText:(id)a4 footerText:(id)a5
{
  id v8;
  id v9;
  SFAccountListSectionIdentifier *v10;
  SFAccountListSectionIdentifier *v11;
  uint64_t v12;
  NSString *headerText;
  uint64_t v14;
  NSString *footerText;
  SFAccountListSectionIdentifier *v16;
  objc_super v18;

  v8 = a4;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SFAccountListSectionIdentifier;
  v10 = -[SFAccountListSectionIdentifier init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v12 = objc_msgSend(v8, "copy");
    headerText = v11->_headerText;
    v11->_headerText = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    footerText = v11->_footerText;
    v11->_footerText = (NSString *)v14;

    v16 = v11;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  SFAccountListSectionIdentifier *v4;
  SFAccountListSectionIdentifier *v5;
  NSString *headerText;
  char v7;
  char v8;
  NSString *footerText;
  char v10;

  v4 = (SFAccountListSectionIdentifier *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      headerText = self->_headerText;
      if ((unint64_t)headerText | (unint64_t)v5->_headerText)
        v7 = -[NSString isEqualToString:](headerText, "isEqualToString:");
      else
        v7 = 1;
      footerText = self->_footerText;
      if ((unint64_t)footerText | (unint64_t)v5->_footerText)
        v10 = -[NSString isEqualToString:](footerText, "isEqualToString:");
      else
        v10 = 1;
      if (self->_type == v5->_type)
        v8 = v7 & v10;
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t type;
  NSUInteger v4;

  type = self->_type;
  v4 = -[NSString hash](self->_headerText, "hash") ^ type;
  return v4 ^ -[NSString hash](self->_footerText, "hash");
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)headerText
{
  return self->_headerText;
}

- (void)setHeaderText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
}

@end
