@implementation IMSMSSpamChatItem

- (id)_initWithItem:(id)a3 withExtensionName:(id)a4
{
  id v7;
  id *v8;
  id *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IMSMSSpamChatItem;
  v8 = -[IMChatItem _initWithItem:](&v11, sel__initWithItem_, a3);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "_setGUID:", CFSTR("ss:"));
    objc_storeStrong(v9 + 7, a4);
  }

  return v9;
}

- (NSString)extensionName
{
  return self->_extensionName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionName, 0);
}

@end
