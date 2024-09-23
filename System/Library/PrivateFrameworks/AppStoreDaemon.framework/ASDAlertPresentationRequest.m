@implementation ASDAlertPresentationRequest

+ (id)requestWithTitle:(id)a3 message:(id)a4
{
  id v5;
  id v6;
  ASDAlertPresentationRequest *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ASDAlertPresentationRequest initWithTitle:message:]([ASDAlertPresentationRequest alloc], "initWithTitle:message:", v6, v5);

  return v7;
}

- (ASDAlertPresentationRequest)initWithTitle:(id)a3 message:(id)a4
{
  id v7;
  id v8;
  ASDAlertPresentationRequest *v9;
  ASDAlertPresentationRequest *v10;
  uint64_t v11;
  NSMutableArray *actions;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASDAlertPresentationRequest;
  v9 = -[ASDAlertPresentationRequest init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_message, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    actions = v10->_actions;
    v10->_actions = (NSMutableArray *)v11;

  }
  return v10;
}

- (id)addActionWithTitle:(id)a3
{
  return -[ASDAlertPresentationRequest addActionWithTitle:style:](self, "addActionWithTitle:style:", a3, 0);
}

- (id)addActionWithTitle:(id)a3 style:(int64_t)a4
{
  id v6;
  ASDAlertAction *v7;

  v6 = a3;
  v7 = -[ASDAlertAction initWithTitle:style:]([ASDAlertAction alloc], "initWithTitle:style:", v6, a4);

  -[NSMutableArray addObject:](self->_actions, "addObject:", v7);
  return v7;
}

- (NSArray)actions
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_actions, "copy");
}

- (void)setActions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *actions;

  v4 = (NSMutableArray *)objc_msgSend(a3, "copy");
  actions = self->_actions;
  self->_actions = v4;

}

- (NSString)iconBundlePath
{
  NSString *iconBundlePath;

  if (self->_icon != 1)
  {
    iconBundlePath = self->_iconBundlePath;
    self->_iconBundlePath = 0;

  }
  return self->_iconBundlePath;
}

- (void)setIconBundlePath:(id)a3
{
  objc_storeStrong((id *)&self->_iconBundlePath, a3);
  self->_icon = a3 != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDAlertPresentationRequest)initWithCoder:(id)a3
{
  id v4;
  ASDAlertPresentationRequest *v5;
  void *v6;
  uint64_t v7;
  NSMutableArray *actions;
  uint64_t v9;
  NSString *iconBundlePath;
  uint64_t v11;
  NSString *title;
  uint64_t v13;
  NSString *message;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASDAlertPresentationRequest;
  v5 = -[ASDAlertPresentationRequest init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("actions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");
    actions = v5->_actions;
    v5->_actions = (NSMutableArray *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconBundlePath"));
    v9 = objc_claimAutoreleasedReturnValue();
    iconBundlePath = v5->_iconBundlePath;
    v5->_iconBundlePath = (NSString *)v9;

    v5->_icon = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("icon"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v11 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v13 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v13;

    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *actions;
  id v5;

  actions = self->_actions;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", actions, CFSTR("actions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconBundlePath, CFSTR("iconBundlePath"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_message, CFSTR("message"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_style, CFSTR("style"));

}

- (int64_t)icon
{
  return self->_icon;
}

- (void)setIcon:(int64_t)a3
{
  self->_icon = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconBundlePath, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
