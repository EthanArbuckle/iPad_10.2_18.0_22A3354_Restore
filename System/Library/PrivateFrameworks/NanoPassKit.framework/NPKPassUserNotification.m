@implementation NPKPassUserNotification

- (NPKPassUserNotification)initWithPass:(id)a3
{
  id v5;
  NPKPassUserNotification *v6;
  NPKPassUserNotification *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKPassUserNotification;
  v6 = -[NPKPassUserNotification init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pass, a3);

  return v7;
}

- (NSArray)identifierHashComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NPKPassUserNotification;
  -[NPKUserNotification identifierHashComponents](&v8, sel_identifierHashComponents);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NPKPassUserNotification pass](self, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safelyAddObject:", v6);

  return (NSArray *)v4;
}

- (PKPass)pass
{
  return self->_pass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
