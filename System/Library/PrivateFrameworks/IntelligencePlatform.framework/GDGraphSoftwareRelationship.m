@implementation GDGraphSoftwareRelationship

- (GDGraphSoftwareRelationship)initWithSoftwareIdField:(id)a3 allSoftwareIdField:(id)a4
{
  id v7;
  id v8;
  GDGraphSoftwareRelationship *v9;
  GDGraphSoftwareRelationship *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GDGraphSoftwareRelationship;
  v9 = -[GDGraphSoftwareRelationship init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_softwareId, a3);
    objc_storeStrong((id *)&v10->_allSoftwareId, a4);
  }

  return v10;
}

- (GDGraphEntityIdentifier)softwareId
{
  return self->_softwareId;
}

- (NSArray)allSoftwareId
{
  return self->_allSoftwareId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSoftwareId, 0);
  objc_storeStrong((id *)&self->_softwareId, 0);
}

@end
