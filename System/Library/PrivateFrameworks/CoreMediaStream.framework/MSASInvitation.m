@implementation MSASInvitation

- (id)copyWithZone:(_NSZone *)a3
{
  MSASInvitation *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_alloc_init(MSASInvitation);
  -[MSASSharingRelationship GUID](self, "GUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASSharingRelationship setGUID:](v4, "setGUID:", v5);

  -[MSASSharingRelationship albumGUID](self, "albumGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASSharingRelationship setAlbumGUID:](v4, "setAlbumGUID:", v6);

  -[MSASSharingRelationship email](self, "email");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASSharingRelationship setEmail:](v4, "setEmail:", v7);

  -[MSASSharingRelationship firstName](self, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASSharingRelationship setFirstName:](v4, "setFirstName:", v8);

  -[MSASSharingRelationship lastName](self, "lastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASSharingRelationship setLastName:](v4, "setLastName:", v9);

  -[MSASSharingRelationship personID](self, "personID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASSharingRelationship setPersonID:](v4, "setPersonID:", v10);

  -[MSASSharingRelationship setState:](v4, "setState:", -[MSASSharingRelationship state](self, "state"));
  return v4;
}

+ (id)MSASPInvitationFromProtocolDictionary:(id)a3
{
  id v3;
  MSASInvitation *v4;
  int v5;
  MSASInvitation *v6;
  MSASInvitation *v7;

  v3 = a3;
  v4 = objc_alloc_init(MSASInvitation);
  v5 = _setFieldsInSharingRelationship(v4, v3);

  if (v5)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

@end
