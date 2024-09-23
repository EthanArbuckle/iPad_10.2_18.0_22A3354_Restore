@implementation MSASAlbumChange

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)MSASAlbumChange;
  -[MSASAlbumChange description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAlbumChange GUID](self, "GUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAlbumChange name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAlbumChange ownerFullName](self, "ownerFullName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAlbumChange ownerEmail](self, "ownerEmail");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAlbumChange ownerPersonID](self, "ownerPersonID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "MSStringWithBool:", -[MSASAlbumChange wasDeleted](self, "wasDeleted"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAlbumChange invitation](self, "invitation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: GUID : %@, name: %@, owner: %@ (%@ %@) was deleted: %@, share: %@"), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)ownerFullName
{
  NSString *ownerFullName;

  ownerFullName = self->_ownerFullName;
  if (ownerFullName)
    return ownerFullName;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), self->_ownerFirstName, self->_ownerLastName);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)GUID
{
  return self->_GUID;
}

- (void)setGUID:(id)a3
{
  objc_storeStrong((id *)&self->_GUID, a3);
}

- (NSString)ownerEmail
{
  return self->_ownerEmail;
}

- (void)setOwnerEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)ownerPersonID
{
  return self->_ownerPersonID;
}

- (void)setOwnerPersonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setOwnerFullName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)ownerFirstName
{
  return self->_ownerFirstName;
}

- (void)setOwnerFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)ownerLastName
{
  return self->_ownerLastName;
}

- (void)setOwnerLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)URLString
{
  return self->_URLString;
}

- (void)setURLString:(id)a3
{
  objc_storeStrong((id *)&self->_URLString, a3);
}

- (MSASInvitation)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_invitation, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (BOOL)wasDeleted
{
  return self->_wasDeleted;
}

- (void)setWasDeleted:(BOOL)a3
{
  self->_wasDeleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_URLString, 0);
  objc_storeStrong((id *)&self->_ownerLastName, 0);
  objc_storeStrong((id *)&self->_ownerFirstName, 0);
  objc_storeStrong((id *)&self->_ownerFullName, 0);
  objc_storeStrong((id *)&self->_ownerPersonID, 0);
  objc_storeStrong((id *)&self->_ownerEmail, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
}

@end
