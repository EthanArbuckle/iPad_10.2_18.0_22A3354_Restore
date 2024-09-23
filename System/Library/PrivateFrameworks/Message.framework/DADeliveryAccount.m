@implementation DADeliveryAccount

- (DADeliveryAccount)initWithDAMailAccount:(id)a3
{
  id v5;
  DADeliveryAccount *v6;
  DADeliveryAccount *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DADeliveryAccount;
  v6 = -[MFAccount init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_DAMailAccount, a3);

  return v7;
}

- (Class)deliveryClass
{
  return (Class)objc_opt_class();
}

+ (id)accountTypeIdentifier
{
  return 0;
}

- (id)newDeliveryWithMessage:(id)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DADeliveryAccount;
  v4 = -[DeliveryAccount newDeliveryWithMessage:](&v6, sel_newDeliveryWithMessage_, a3);
  objc_msgSend(v4, "setDAMailAccount:", self->_DAMailAccount);
  return v4;
}

- (id)newDeliveryWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DADeliveryAccount;
  v6 = -[DeliveryAccount newDeliveryWithHeaders:mixedContent:textPartsAreHTML:](&v8, sel_newDeliveryWithHeaders_mixedContent_textPartsAreHTML_, a3, a4, a5);
  objc_msgSend(v6, "setDAMailAccount:", self->_DAMailAccount);
  return v6;
}

- (id)newDeliveryWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6
{
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DADeliveryAccount;
  v7 = -[DeliveryAccount newDeliveryWithHeaders:HTML:plainTextAlternative:other:](&v9, sel_newDeliveryWithHeaders_HTML_plainTextAlternative_other_, a3, a4, a5, a6);
  objc_msgSend(v7, "setDAMailAccount:", self->_DAMailAccount);
  return v7;
}

- (id)mailAccountIfAvailable
{
  return self->_DAMailAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DAMailAccount, 0);
}

@end
