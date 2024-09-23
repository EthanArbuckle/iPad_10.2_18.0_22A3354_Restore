@implementation GDGraphSoftware

- (GDGraphSoftware)initWithEntityIdentifierField:(id)a3 bundleIdField:(id)a4 nameField:(id)a5 allBundleIdField:(id)a6 allNameField:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  GDGraphSoftware *v17;
  GDGraphSoftware *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)GDGraphSoftware;
  v17 = -[GDGraphSoftware init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_entityIdentifier, a3);
    objc_storeStrong((id *)&v18->_bundleId, a4);
    objc_storeStrong((id *)&v18->_name, a5);
    objc_storeStrong((id *)&v18->_allBundleId, a6);
    objc_storeStrong((id *)&v18->_allName, a7);
  }

  return v18;
}

- (GDGraphSoftwareEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)allBundleId
{
  return self->_allBundleId;
}

- (NSArray)allName
{
  return self->_allName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_allBundleId, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end
