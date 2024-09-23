@implementation ATXTimeFeedbackOption

- (ATXTimeFeedbackOption)initWithTitle:(id)a3 identifier:(id)a4 symbolName:(id)a5 isDestructive:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  ATXTimeFeedbackOption *v13;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  NSString *identifier;
  uint64_t v18;
  NSString *symbolName;
  ATXTimeFeedbackOption *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)ATXTimeFeedbackOption;
  v13 = -[ATXTimeFeedbackOption init](&v22, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    title = v13->_title;
    v13->_title = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    symbolName = v13->_symbolName;
    v13->_symbolName = (NSString *)v18;

    v13->_isDestructive = a6;
    v20 = v13;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXTimeFeedbackOption)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  ATXTimeFeedbackOption *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDestructive"));

  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v7 == 0)
  {
    v11 = 0;
  }
  else
  {
    self = -[ATXTimeFeedbackOption initWithTitle:identifier:symbolName:isDestructive:](self, "initWithTitle:identifier:symbolName:isDestructive:", v5, v6, v7, v8);
    v11 = self;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_symbolName, CFSTR("symbolName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDestructive, CFSTR("isDestructive"));

}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
