@implementation GDGraphVisualIdentifierRelationship

- (GDGraphVisualIdentifierRelationship)initWithVisualIdentifierField:(id)a3 associationReasonField:(id)a4 suggestedNameField:(id)a5 suggestedRelationshipToDeviceOwnerField:(id)a6 allVisualIdentifierField:(id)a7 allAssociationReasonField:(id)a8 allSuggestedNameField:(id)a9 allSuggestedRelationshipToDeviceOwnerField:(id)a10
{
  id v17;
  GDGraphVisualIdentifierRelationship *v18;
  GDGraphVisualIdentifierRelationship *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)GDGraphVisualIdentifierRelationship;
  v18 = -[GDGraphVisualIdentifierRelationship init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_visualIdentifier, a3);
    objc_storeStrong((id *)&v19->_associationReason, a4);
    objc_storeStrong((id *)&v19->_suggestedName, a5);
    objc_storeStrong((id *)&v19->_suggestedRelationshipToDeviceOwner, a6);
    objc_storeStrong((id *)&v19->_allVisualIdentifier, a7);
    objc_storeStrong((id *)&v19->_allAssociationReason, a8);
    objc_storeStrong((id *)&v19->_allSuggestedName, a9);
    objc_storeStrong((id *)&v19->_allSuggestedRelationshipToDeviceOwner, a10);
  }

  return v19;
}

- (NSString)visualIdentifier
{
  return self->_visualIdentifier;
}

- (NSString)associationReason
{
  return self->_associationReason;
}

- (NSString)suggestedName
{
  return self->_suggestedName;
}

- (NSString)suggestedRelationshipToDeviceOwner
{
  return self->_suggestedRelationshipToDeviceOwner;
}

- (NSArray)allVisualIdentifier
{
  return self->_allVisualIdentifier;
}

- (NSArray)allAssociationReason
{
  return self->_allAssociationReason;
}

- (NSArray)allSuggestedName
{
  return self->_allSuggestedName;
}

- (NSArray)allSuggestedRelationshipToDeviceOwner
{
  return self->_allSuggestedRelationshipToDeviceOwner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSuggestedRelationshipToDeviceOwner, 0);
  objc_storeStrong((id *)&self->_allSuggestedName, 0);
  objc_storeStrong((id *)&self->_allAssociationReason, 0);
  objc_storeStrong((id *)&self->_allVisualIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestedRelationshipToDeviceOwner, 0);
  objc_storeStrong((id *)&self->_suggestedName, 0);
  objc_storeStrong((id *)&self->_associationReason, 0);
  objc_storeStrong((id *)&self->_visualIdentifier, 0);
}

@end
