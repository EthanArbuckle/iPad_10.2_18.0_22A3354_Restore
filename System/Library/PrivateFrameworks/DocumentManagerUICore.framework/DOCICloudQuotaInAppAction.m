@implementation DOCICloudQuotaInAppAction

- (DOCICloudQuotaInAppAction)initWithICQInAppAction:(id)a3
{
  ICQInAppAction *v4;
  DOCICloudQuotaInAppAction *v5;
  ICQInAppAction *action;
  ICQInAppAction *v7;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *type;
  objc_super v13;

  v4 = (ICQInAppAction *)a3;
  v13.receiver = self;
  v13.super_class = (Class)DOCICloudQuotaInAppAction;
  v5 = -[DOCICloudQuotaInAppAction init](&v13, sel_init);
  action = v5->_action;
  v5->_action = v4;
  v7 = v4;

  -[ICQInAppAction title](v7, "title");
  v8 = objc_claimAutoreleasedReturnValue();
  title = v5->_title;
  v5->_title = (NSString *)v8;

  -[ICQInAppAction type](v7, "type");
  v10 = objc_claimAutoreleasedReturnValue();
  type = v5->_type;
  v5->_type = (NSString *)v10;

  return v5;
}

- (DOCICloudQuotaInAppAction)initWithTitle:(id)a3 type:(id)a4
{
  NSString *v6;
  NSString *v7;
  DOCICloudQuotaInAppAction *v8;
  NSString *title;
  NSString *v10;
  NSString *type;
  objc_super v13;

  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)DOCICloudQuotaInAppAction;
  v8 = -[DOCICloudQuotaInAppAction init](&v13, sel_init);
  title = v8->_title;
  v8->_title = v6;
  v10 = v6;

  type = v8->_type;
  v8->_type = v7;

  return v8;
}

- (void)performAction
{
  id v2;

  -[DOCICloudQuotaInAppAction action](self, "action");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performActionWithContext:", MEMORY[0x24BDBD1B8]);

}

- (NSString)title
{
  return self->_title;
}

- (NSString)type
{
  return self->_type;
}

- (ICQInAppAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
