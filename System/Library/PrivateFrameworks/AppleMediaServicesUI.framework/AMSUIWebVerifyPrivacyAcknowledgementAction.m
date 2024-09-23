@implementation AMSUIWebVerifyPrivacyAcknowledgementAction

- (AMSUIWebVerifyPrivacyAcknowledgementAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebVerifyPrivacyAcknowledgementAction *v7;
  void *v8;
  NSString *v9;
  NSString *privacyIdentifier;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebVerifyPrivacyAcknowledgementAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v12, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("privacyIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    privacyIdentifier = v7->_privacyIdentifier;
    v7->_privacyIdentifier = v9;

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebVerifyPrivacyAcknowledgementAction;
  v3 = -[AMSUIWebAction runAction](&v12, sel_runAction);
  v4 = (void *)MEMORY[0x24BE08000];
  -[AMSUIWebVerifyPrivacyAcknowledgementAction privacyIdentifier](self, "privacyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "acknowledgementNeededForPrivacyIdentifier:", v5) ^ 1;

  v7 = (void *)MEMORY[0x24BE08340];
  v13 = CFSTR("acknowledged");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "promiseWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)privacyIdentifier
{
  return self->_privacyIdentifier;
}

- (void)setPrivacyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_privacyIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyIdentifier, 0);
}

@end
