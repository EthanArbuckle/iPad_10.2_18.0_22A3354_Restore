@implementation WFEDAMNotebook

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFEDAMNotebook guid](self, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("guid"));

  -[WFEDAMNotebook name](self, "name");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

}

- (WFEDAMNotebook)initWithCoder:(id)a3
{
  id v4;
  WFEDAMNotebook *v5;
  void *v6;
  uint64_t v7;
  NSString *guid;
  void *v9;
  uint64_t v10;
  NSString *name;
  WFEDAMNotebook *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFEDAMNotebook;
  v5 = -[WFEDAMNotebook init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("guid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    guid = v5->_guid;
    v5->_guid = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
