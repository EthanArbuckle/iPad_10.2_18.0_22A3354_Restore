@implementation FAMegadomePerson

- (FAMegadomePerson)initWithVisualIdentifierViewPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  FAMegadomePerson *v9;

  v4 = a3;
  objc_msgSend(v4, "emails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "names");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[FAMegadomePerson initWithEmails:phoneNumbers:names:contactIdentifiers:](self, "initWithEmails:phoneNumbers:names:contactIdentifiers:", v5, v6, v7, v8);
  return v9;
}

- (FAMegadomePerson)initWithEmails:(id)a3 phoneNumbers:(id)a4 names:(id)a5 contactIdentifiers:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  FAMegadomePerson *v15;
  FAMegadomePerson *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)FAMegadomePerson;
  v15 = -[FAMegadomePerson init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_emails, a3);
    objc_storeStrong((id *)&v16->_phoneNumbers, a4);
    objc_storeStrong((id *)&v16->_names, a5);
    objc_storeStrong((id *)&v16->_contactIdentifiers, a6);
  }

  return v16;
}

- (NSArray)emails
{
  return self->_emails;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)names
{
  return self->_names;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emails, 0);
}

@end
