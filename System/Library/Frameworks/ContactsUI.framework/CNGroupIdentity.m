@implementation CNGroupIdentity

- (NSArray)contacts
{
  return self->_contacts;
}

- (NSData)groupPhoto
{
  return self->_groupPhoto;
}

- (id)initGroupWithName:(id)a3 photo:(id)a4 contacts:(id)a5
{
  return -[CNGroupIdentity initGroupWithName:photo:contacts:identifier:](self, "initGroupWithName:photo:contacts:identifier:", a3, a4, a5, 0);
}

- (id)initGroupWithName:(id)a3 photo:(id)a4 contacts:(id)a5 identifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CNGroupIdentity *v15;
  id *p_isa;
  id *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CNGroupIdentity;
  v15 = -[CNGroupIdentity init](&v19, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_groupName, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    v17 = p_isa;
  }

  return p_isa;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CNGroupIdentity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = [CNGroupIdentity alloc];
  -[CNGroupIdentity groupName](self, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentity groupPhoto](self, "groupPhoto");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentity contacts](self, "contacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentity identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNGroupIdentity initGroupWithName:photo:contacts:identifier:](v4, "initGroupWithName:photo:contacts:identifier:", v5, v6, v7, v8);

  return v9;
}

- (int64_t)numberOfContacts
{
  void *v2;
  int64_t v3;

  -[CNGroupIdentity contacts](self, "contacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);
}

- (void)setGroupPhoto:(id)a3
{
  objc_storeStrong((id *)&self->_groupPhoto, a3);
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_groupPhoto, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
}

@end
