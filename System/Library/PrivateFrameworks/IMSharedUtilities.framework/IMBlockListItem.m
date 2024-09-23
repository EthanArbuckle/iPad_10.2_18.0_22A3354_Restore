@implementation IMBlockListItem

- (IMBlockListItem)initWithPerson:(id)a3 address:(id)a4 cmfItemRef:(void *)a5
{
  id v9;
  id v10;
  IMBlockListItem *v11;
  IMBlockListItem *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMBlockListItem;
  v11 = -[IMBlockListItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_person, a3);
    objc_storeStrong((id *)&v12->_address, a4);
    v12->_cmfItem = (void *)CFRetain(a5);
    -[IMBlockListItem lookupPerson](v12, "lookupPerson");
  }

  return v12;
}

- (IMBlockListItem)initWithCNContact:(id)a3 address:(id)a4 cmfItemRef:(void *)a5
{
  id v8;
  IMBlockListItem *v9;

  v8 = a4;
  if (a3)
  {
    +[IMBlockListPerson personWithCNContact:](IMBlockListPerson, "personWithCNContact:", a3);
    a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = -[IMBlockListItem initWithPerson:address:cmfItemRef:](self, "initWithPerson:address:cmfItemRef:", a3, v8, a5);

  return v9;
}

- (CNContact)cnPerson
{
  return -[IMBlockListPerson cnPerson](self->_person, "cnPerson");
}

- (void)dealloc
{
  void *cmfItem;
  objc_super v4;

  cmfItem = self->_cmfItem;
  if (cmfItem)
    CFRelease(cmfItem);
  v4.receiver = self;
  v4.super_class = (Class)IMBlockListItem;
  -[IMBlockListItem dealloc](&v4, sel_dealloc);
}

- (void)lookupPerson
{
  IMBlockListPerson **p_person;
  void *v4;
  void *v5;

  p_person = &self->_person;
  if (!self->_person && -[NSString length](self->_address, "length"))
  {
    -[NSString associatedPerson](self->_address, "associatedPerson");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_storeStrong((id *)p_person, v4);
      v4 = v5;
    }

  }
}

- (id)fullName
{
  void *v3;
  void *v4;
  void *v5;

  -[IMBlockListItem person](self, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IMBlockListItem person](self, "person");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)formattedHandle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  -[IMBlockListItem cachedFormattedHandle](self, "cachedFormattedHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[IMBlockListItem person](self, "person");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4
      && (v5 = (void *)v4,
          -[IMBlockListItem address](self, "address"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = MEMORY[0x1A1AE7D10](),
          v6,
          v5,
          v7))
    {
      -[IMBlockListItem address](self, "address");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMBlockListItem person](self, "person");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cnLabelForPerson:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMBlockListItem formattedAddress](self, "formattedAddress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 && objc_msgSend(v10, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) %@"), v10, v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = v11;
      }
      v13 = v12;
      -[IMBlockListItem setCachedFormattedHandle:](self, "setCachedFormattedHandle:", v12);

    }
    else
    {
      -[IMBlockListItem formattedAddress](self, "formattedAddress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMBlockListItem setCachedFormattedHandle:](self, "setCachedFormattedHandle:", v10);
    }

  }
  return -[IMBlockListItem cachedFormattedHandle](self, "cachedFormattedHandle");
}

- (id)formattedAddress
{
  NSString *v3;

  if (-[NSString length](self->_address, "length")
    && -[NSString _appearsToBePhoneNumber](self->_address, "_appearsToBePhoneNumber"))
  {
    -[NSString formattedPhoneNumber](self->_address, "formattedPhoneNumber");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_address;
  }
  return v3;
}

- (BOOL)isEqualToBlockListItem:(id)a3
{
  void *v3;
  IMBlockListItem *v5;
  IMBlockListItem *v6;
  IMBlockListPerson *person;
  IMBlockListPerson *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  char v14;

  v5 = (IMBlockListItem *)a3;
  v6 = v5;
  if (self != v5)
  {
    person = self->_person;
    v8 = person;
    if (!person)
    {
      -[IMBlockListItem person](v5, "person");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        v10 = 1;
        goto LABEL_9;
      }
      v8 = self->_person;
    }
    -[IMBlockListItem person](v6, "person");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[IMBlockListPerson isEqualToPerson:](v8, "isEqualToPerson:", v9);

    if (person)
    {
LABEL_10:
      -[IMBlockListItem address](self, "address");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMBlockListItem address](v6, "address");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToBlockListAddress:", v13);

      v11 = v10 & v14;
      goto LABEL_11;
    }
LABEL_9:

    goto LABEL_10;
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (void)cmfItem
{
  return self->_cmfItem;
}

- (void)setCmfItem:(void *)a3
{
  self->_cmfItem = a3;
}

- (IMBlockListPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (NSString)cachedFormattedHandle
{
  return self->_cachedFormattedHandle;
}

- (void)setCachedFormattedHandle:(id)a3
{
  objc_storeStrong((id *)&self->_cachedFormattedHandle, a3);
}

- (NSString)cachedFormattedPersonName
{
  return self->_cachedFormattedPersonName;
}

- (void)setCachedFormattedPersonName:(id)a3
{
  objc_storeStrong((id *)&self->_cachedFormattedPersonName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFormattedPersonName, 0);
  objc_storeStrong((id *)&self->_cachedFormattedHandle, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
