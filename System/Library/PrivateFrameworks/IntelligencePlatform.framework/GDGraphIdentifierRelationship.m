@implementation GDGraphIdentifierRelationship

- (GDGraphIdentifierRelationship)initWithTypeField:(id)a3 idField:(id)a4 hasProfileImageField:(id)a5 allTypeField:(id)a6 allIdField:(id)a7 allHasProfileImageField:(id)a8
{
  id v15;
  id v16;
  id v17;
  GDGraphIdentifierRelationship *v18;
  GDGraphIdentifierRelationship *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)GDGraphIdentifierRelationship;
  v18 = -[GDGraphIdentifierRelationship init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_type, a3);
    objc_storeStrong((id *)&v19->_id, a4);
    objc_storeStrong((id *)&v19->_hasProfileImage, a5);
    objc_storeStrong((id *)&v19->_allType, a6);
    objc_storeStrong((id *)&v19->_allId, a7);
    objc_storeStrong((id *)&v19->_allHasProfileImage, a8);
  }

  return v19;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)id
{
  return self->_id;
}

- (NSString)hasProfileImage
{
  return self->_hasProfileImage;
}

- (NSArray)allType
{
  return self->_allType;
}

- (NSArray)allId
{
  return self->_allId;
}

- (NSArray)allHasProfileImage
{
  return self->_allHasProfileImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allHasProfileImage, 0);
  objc_storeStrong((id *)&self->_allId, 0);
  objc_storeStrong((id *)&self->_allType, 0);
  objc_storeStrong((id *)&self->_hasProfileImage, 0);
  objc_storeStrong((id *)&self->_id, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
