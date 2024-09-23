@implementation DSMe

- (DSMe)init
{
  DSMe *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DSMe;
  v2 = -[DSMe init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBACF8], "ds_meContactIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSMe setMeCardIdentifier:](v2, "setMeCardIdentifier:", v3);

    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "ds_deviceOwnerEmails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSMe setEmails:](v2, "setEmails:", v5);

    objc_msgSend(v4, "ds_deviceOwnerPhoneNumbers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSMe setPhoneNumbers:](v2, "setPhoneNumbers:", v6);

  }
  return v2;
}

- (NSString)meCardIdentifier
{
  return self->_meCardIdentifier;
}

- (void)setMeCardIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)emails
{
  return self->_emails;
}

- (void)setEmails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)phoneNumbers
{
  return self->_phoneNumbers;
}

- (void)setPhoneNumbers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emails, 0);
  objc_storeStrong((id *)&self->_meCardIdentifier, 0);
}

@end
