@implementation GDGraphOrganization

- (GDGraphOrganization)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 phoneticNameField:(id)a5 allNameField:(id)a6 allPhoneticNameField:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  GDGraphOrganization *v17;
  GDGraphOrganization *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)GDGraphOrganization;
  v17 = -[GDGraphOrganization init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_entityIdentifier, a3);
    objc_storeStrong((id *)&v18->_name, a4);
    objc_storeStrong((id *)&v18->_phoneticName, a5);
    objc_storeStrong((id *)&v18->_allName, a6);
    objc_storeStrong((id *)&v18->_allPhoneticName, a7);
  }

  return v18;
}

- (GDGraphOrganizationEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)phoneticName
{
  return self->_phoneticName;
}

- (NSArray)allName
{
  return self->_allName;
}

- (NSArray)allPhoneticName
{
  return self->_allPhoneticName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allPhoneticName, 0);
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_phoneticName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end
