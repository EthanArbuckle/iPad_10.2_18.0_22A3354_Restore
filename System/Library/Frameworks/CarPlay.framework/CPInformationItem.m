@implementation CPInformationItem

- (CPInformationItem)initWithTitle:(NSString *)title detail:(NSString *)detail
{
  NSString *v6;
  NSString *v7;
  CPInformationItem *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  objc_super v14;

  v6 = title;
  v7 = detail;
  v14.receiver = self;
  v14.super_class = (Class)CPInformationItem;
  v8 = -[CPInformationItem init](&v14, sel_init);
  if (v8)
  {
    v9 = -[NSString copy](v6, "copy");
    v10 = v8->_title;
    v8->_title = (NSString *)v9;

    v11 = -[NSString copy](v7, "copy");
    v12 = v8->_detail;
    v8->_detail = (NSString *)v11;

  }
  return v8;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPInformationItem;
  return -[CPInformationItem init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPInformationItem)initWithCoder:(id)a3
{
  id v4;
  CPInformationItem *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *detail;

  v4 = a3;
  v5 = -[CPInformationItem _init](self, "_init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPInformationItemTitleKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPInformationItemDetailKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    detail = v5->_detail;
    v5->_detail = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CPInformationItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPInformationItemTitleKey"));

  -[CPInformationItem detail](self, "detail");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCPInformationItemDetailKey"));

}

- (NSString)title
{
  return self->_title;
}

- (NSString)detail
{
  return self->_detail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
