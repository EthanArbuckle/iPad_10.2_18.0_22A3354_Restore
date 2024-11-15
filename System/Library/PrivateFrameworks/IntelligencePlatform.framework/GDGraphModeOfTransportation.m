@implementation GDGraphModeOfTransportation

- (GDGraphModeOfTransportation)initWithEntityIdentifierField:(id)a3 transportationTypeField:(id)a4 allTransportationTypeField:(id)a5
{
  id v9;
  id v10;
  id v11;
  GDGraphModeOfTransportation *v12;
  GDGraphModeOfTransportation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)GDGraphModeOfTransportation;
  v12 = -[GDGraphModeOfTransportation init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entityIdentifier, a3);
    objc_storeStrong((id *)&v13->_transportationType, a4);
    objc_storeStrong((id *)&v13->_allTransportationType, a5);
  }

  return v13;
}

- (GDGraphModeOfTransportationEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSNumber)transportationType
{
  return self->_transportationType;
}

- (NSArray)allTransportationType
{
  return self->_allTransportationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allTransportationType, 0);
  objc_storeStrong((id *)&self->_transportationType, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end
