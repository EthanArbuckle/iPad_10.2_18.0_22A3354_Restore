@implementation GDGraphLocationRelationship

- (GDGraphLocationRelationship)initWithLabelField:(id)a3 locationIdField:(id)a4 allLabelField:(id)a5 allLocationIdField:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  GDGraphLocationRelationship *v15;
  GDGraphLocationRelationship *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GDGraphLocationRelationship;
  v15 = -[GDGraphLocationRelationship init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_label, a3);
    objc_storeStrong((id *)&v16->_locationId, a4);
    objc_storeStrong((id *)&v16->_allLabel, a5);
    objc_storeStrong((id *)&v16->_allLocationId, a6);
  }

  return v16;
}

- (NSString)label
{
  return self->_label;
}

- (GDGraphEntityIdentifier)locationId
{
  return self->_locationId;
}

- (NSArray)allLabel
{
  return self->_allLabel;
}

- (NSArray)allLocationId
{
  return self->_allLocationId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allLocationId, 0);
  objc_storeStrong((id *)&self->_allLabel, 0);
  objc_storeStrong((id *)&self->_locationId, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
