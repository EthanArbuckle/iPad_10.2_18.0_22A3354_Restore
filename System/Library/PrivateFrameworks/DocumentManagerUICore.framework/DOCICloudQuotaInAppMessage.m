@implementation DOCICloudQuotaInAppMessage

- (DOCICloudQuotaInAppMessage)initWithICQInAppMessage:(id)a3
{
  id v4;
  DOCICloudQuotaInAppMessage *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subTitle;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UIImage *icon;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *actions;
  NSArray *v19;
  _QWORD v21[4];
  NSArray *v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DOCICloudQuotaInAppMessage;
  v5 = -[DOCICloudQuotaInAppMessage init](&v23, sel_init);
  v5->_contentType = -[DOCICloudQuotaInAppMessage contentTypeWithMessage:](v5, "contentTypeWithMessage:", v4);
  objc_msgSend(v4, "title");
  v6 = objc_claimAutoreleasedReturnValue();
  title = v5->_title;
  v5->_title = (NSString *)v6;

  objc_msgSend(v4, "subTitle");
  v8 = objc_claimAutoreleasedReturnValue();
  subTitle = v5->_subTitle;
  v5->_subTitle = (NSString *)v8;

  objc_msgSend(v4, "sfSymbolName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(v4, "sfSymbolName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemImageNamed:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (UIImage *)v13;

  }
  else
  {
    v12 = v5->_icon;
    v5->_icon = 0;
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __54__DOCICloudQuotaInAppMessage_initWithICQInAppMessage___block_invoke;
  v21[3] = &unk_24D72AE18;
  v17 = v15;
  v22 = v17;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v21);

  actions = v5->_actions;
  v5->_actions = v17;
  v19 = v17;

  return v5;
}

void __54__DOCICloudQuotaInAppMessage_initWithICQInAppMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  DOCICloudQuotaInAppAction *v4;

  v3 = a2;
  v4 = -[DOCICloudQuotaInAppAction initWithICQInAppAction:]([DOCICloudQuotaInAppAction alloc], "initWithICQInAppAction:", v3);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

- (DOCICloudQuotaInAppMessage)initWithContentType:(unint64_t)a3 title:(id)a4 subTitle:(id)a5 icon:(id)a6 actions:(id)a7
{
  NSString *v12;
  NSString *v13;
  UIImage *v14;
  NSArray *v15;
  DOCICloudQuotaInAppMessage *v16;
  NSString *title;
  NSString *v18;
  NSString *subTitle;
  NSString *v20;
  UIImage *icon;
  UIImage *v22;
  NSArray *actions;
  objc_super v25;

  v12 = (NSString *)a4;
  v13 = (NSString *)a5;
  v14 = (UIImage *)a6;
  v15 = (NSArray *)a7;
  v25.receiver = self;
  v25.super_class = (Class)DOCICloudQuotaInAppMessage;
  v16 = -[DOCICloudQuotaInAppMessage init](&v25, sel_init);
  title = v16->_title;
  v16->_contentType = a3;
  v16->_title = v12;
  v18 = v12;

  subTitle = v16->_subTitle;
  v16->_subTitle = v13;
  v20 = v13;

  icon = v16->_icon;
  v16->_icon = v14;
  v22 = v14;

  actions = v16->_actions;
  v16->_actions = v15;

  return v16;
}

- (unint64_t)contentTypeWithMessage:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "contentType");
  if (v3 > 4)
    return 0;
  else
    return qword_2172D3B80[v3];
}

- (id)contentTypeDescription
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[DOCICloudQuotaInAppMessage contentType](self, "contentType");
  v3 = CFSTR("Error");
  if (v2 == 1)
    v3 = CFSTR("Error with Sync Status");
  if (v2 == 2)
    return CFSTR("Warning");
  else
    return (id)v3;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
