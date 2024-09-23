@implementation AMSPaymentRequest

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[AMSPaymentRequest paymentContentItems](self, "paymentContentItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("paymentContentItems"));

  -[AMSPaymentRequest localizedNavigationTitle](self, "localizedNavigationTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("localizedNavigationTitle"));

  -[AMSPaymentRequest salableInfo](self, "salableInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("salableInfo"));

  -[AMSPaymentRequest secondaryContentItems](self, "secondaryContentItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("secondaryContentItems"));

  -[AMSPaymentRequest secondarySalableInfo](self, "secondarySalableInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("secondarySalableInfo"));

}

- (AMSPaymentRequest)initWithCoder:(id)a3
{
  id v4;
  AMSPaymentRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *paymentContentItems;
  uint64_t v11;
  NSString *localizedNavigationTitle;
  uint64_t v13;
  AMSPaymentContentItem *salableInfo;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *secondaryContentItems;
  uint64_t v20;
  AMSPaymentContentItem *secondarySalableInfo;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AMSPaymentRequest;
  v5 = -[AMSPaymentRequest init](&v23, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("paymentContentItems"));
    v9 = objc_claimAutoreleasedReturnValue();
    paymentContentItems = v5->_paymentContentItems;
    v5->_paymentContentItems = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedNavigationTitle"));
    v11 = objc_claimAutoreleasedReturnValue();
    localizedNavigationTitle = v5->_localizedNavigationTitle;
    v5->_localizedNavigationTitle = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("salableInfo"));
    v13 = objc_claimAutoreleasedReturnValue();
    salableInfo = v5->_salableInfo;
    v5->_salableInfo = (AMSPaymentContentItem *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("secondaryContentItems"));
    v18 = objc_claimAutoreleasedReturnValue();
    secondaryContentItems = v5->_secondaryContentItems;
    v5->_secondaryContentItems = (NSArray *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondarySalableInfo"));
    v20 = objc_claimAutoreleasedReturnValue();
    secondarySalableInfo = v5->_secondarySalableInfo;
    v5->_secondarySalableInfo = (AMSPaymentContentItem *)v20;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)dialogCancelButtonLabel
{
  return self->_dialogCancelButtonLabel;
}

- (void)setDialogCancelButtonLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dialogCancelButtonLabel, a3);
}

- (NSString)dialogDefaultButtonLabel
{
  return self->_dialogDefaultButtonLabel;
}

- (void)setDialogDefaultButtonLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dialogDefaultButtonLabel, a3);
}

- (NSString)dialogOtherButtonLabel
{
  return self->_dialogOtherButtonLabel;
}

- (void)setDialogOtherButtonLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dialogOtherButtonLabel, a3);
}

- (AMSPaymentContentItem)salableInfo
{
  return self->_salableInfo;
}

- (void)setSalableInfo:(id)a3
{
  objc_storeStrong((id *)&self->_salableInfo, a3);
}

- (AMSPaymentContentItem)secondarySalableInfo
{
  return self->_secondarySalableInfo;
}

- (void)setSecondarySalableInfo:(id)a3
{
  objc_storeStrong((id *)&self->_secondarySalableInfo, a3);
}

- (NSArray)paymentContentItems
{
  return self->_paymentContentItems;
}

- (void)setPaymentContentItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)secondaryContentItems
{
  return self->_secondaryContentItems;
}

- (void)setSecondaryContentItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)localizedNavigationTitle
{
  return self->_localizedNavigationTitle;
}

- (void)setLocalizedNavigationTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedNavigationTitle, 0);
  objc_storeStrong((id *)&self->_secondaryContentItems, 0);
  objc_storeStrong((id *)&self->_paymentContentItems, 0);
  objc_storeStrong((id *)&self->_secondarySalableInfo, 0);
  objc_storeStrong((id *)&self->_salableInfo, 0);
  objc_storeStrong((id *)&self->_dialogOtherButtonLabel, 0);
  objc_storeStrong((id *)&self->_dialogDefaultButtonLabel, 0);
  objc_storeStrong((id *)&self->_dialogCancelButtonLabel, 0);
}

@end
