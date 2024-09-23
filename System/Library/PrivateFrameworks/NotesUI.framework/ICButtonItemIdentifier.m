@implementation ICButtonItemIdentifier

- (ICButtonItemIdentifier)initWithType:(int64_t)a3 parentIdentifier:(id)a4
{
  id v7;
  ICButtonItemIdentifier *v8;
  ICButtonItemIdentifier *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICButtonItemIdentifier;
  v8 = -[ICButtonItemIdentifier init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_parentIdentifier, a4);
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ICButtonItemIdentifier type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICButtonItemIdentifier parentIdentifier](self, "parentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICButtonItemIdentifier displayText](self, "displayText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, type: %@, parentIdentifier: %@, displayText: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  BOOL v15;
  char v16;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (v6 = -[ICButtonItemIdentifier type](self, "type"), v6 == objc_msgSend(v5, "type")))
  {
    -[ICButtonItemIdentifier parentIdentifier](self, "parentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parentIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v7)
      v10 = 0;
    else
      v10 = v7;
    v11 = v10;
    if (v9 == v8)
      v12 = 0;
    else
      v12 = v8;
    v13 = v12;
    v14 = (void *)v13;
    if (v11 | v13)
    {
      if (v11)
        v15 = v13 == 0;
      else
        v15 = 1;
      if (v15)
        v16 = 0;
      else
        v16 = objc_msgSend((id)v11, "isEqual:", v13);
    }
    else
    {
      v16 = 1;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  unint64_t result;
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = self->_hash;
  if (!result)
  {
    v4 = -[ICButtonItemIdentifier type](self, "type");
    -[ICButtonItemIdentifier parentIdentifier](self, "parentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash");
    self->_hash = ICHashWithHashKeys(v4, v7, v8, v9, v10, v11, v12, v13, v6);

    return self->_hash;
  }
  return result;
}

- (NSString)displayText
{
  int64_t v2;
  __CFString *v3;

  v2 = -[ICButtonItemIdentifier type](self, "type");
  if (v2 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D63B10], "localizedTitleForDefaultFolder");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICButtonItemIdentifier displayText]", 1, 0, CFSTR("Unknown button type"));
    v3 = &stru_1E5C2F8C0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("New Folder"), CFSTR("New Folder"), 0, 1);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)systemImageName
{
  int64_t v2;

  v2 = -[ICButtonItemIdentifier type](self, "type");
  if (!v2)
    return (NSString *)CFSTR("folder.badge.plus");
  if (v2 == 1)
    return (NSString *)CFSTR("folder");
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICButtonItemIdentifier systemImageName]", 1, 0, CFSTR("Unknown button type"));
  return (NSString *)&stru_1E5C2F8C0;
}

- (int64_t)style
{
  int64_t v2;

  v2 = -[ICButtonItemIdentifier type](self, "type");
  if (!v2)
    return 1;
  if (v2 != 1)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICButtonItemIdentifier style]", 1, 0, CFSTR("Unknown button type"));
  return 0;
}

- (int64_t)type
{
  return self->_type;
}

- (ICItemIdentifier)parentIdentifier
{
  return self->_parentIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
}

@end
